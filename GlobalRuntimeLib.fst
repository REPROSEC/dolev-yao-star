module GlobalRuntimeLib

open SecrecyLabels
open CryptoLib
module W = FStar.Monotonic.Witnessed
friend CryptoLib // in order to get access to mk_rand and sprint_bytes
open CryptoEffect
friend CryptoEffect //in order to get access to c_get

val discard: bool -> Crypto unit (requires (fun t0 -> True))
		   (ensures (fun t0 _ t1 -> t0 == t1))
let discard _ = ()
let tot_print_string s = IO.debug_print_string s

let print_string s = discard (IO.debug_print_string s)

let print_bytes t = print_string (sprint_bytes t)

let sprint_session_state_iv (i:nat) (v:nat) (ss:session_state) : string =
  "Session "^string_of_int i^"(v"^string_of_int v^"): ("^sprint_bytes ss^")"

let rec sprint_session_state_i (del:string) (i:nat) (vs:Seq.seq nat) (ps:state_vec) : Tot string (decreases (Seq.length ps - i))=
  if i < Seq.length ps && Seq.length ps = Seq.length vs
  then if i = Seq.length ps - 1 then sprint_session_state_iv i vs.[i] ps.[i]
       else sprint_session_state_iv i vs.[i] ps.[i]^del^sprint_session_state_i del (i+1) vs ps
  else ""

let sprint_entry (i:nat) (e:entry_t) =
  (if i < 10 then " "^string_of_int i ^ ". " else string_of_int i ^ ". ") ^
  (match e with
  | RandGen t l u -> sprint_generated_rand t
  | Corrupt p s v -> "Compromised "^sprint_id (V p s v)
  | Event p (n,tl) -> "Event "^p^": "^n^"("^String.concat "," (List.Tot.map sprint_bytes tl)^")"
  | Message s r t -> "Message "^s^"->"^r^": "^sprint_bytes t
  | SetState p v ns -> "SetState "^p^": \n    "^sprint_session_state_i "\n    " 0 v ns)

val print_seq_entry: i:nat -> s:Seq.seq entry_t -> Crypto unit
		     (requires fun t0 -> True)
		     (ensures fun t0 _ t1 -> t0 == t1)
		     (decreases (Seq.length s - i))
let rec print_seq_entry (i:nat) (s:Seq.seq entry_t) =
  if i >= Seq.length s then ()
  else (print_string (sprint_entry i s.[i]);
	print_string "\n";
        print_seq_entry (i+1) s)

let print_trace () =
  let t = c_get () in
  print_seq_entry 0 t

let error (#a:Type) (e:string) = cerror #a e
let global_timestamp () = cglobal_timestamp ()
let get () =
  let t = c_get () in
  Ghost.hide t

let corrupt_id (ts:timestamp) (x:id) : Type0 =
    exists p' s' v'. (was_corrupted_before ts p' s' v' /\ covers x (V p' s' v'))

let corrupt_id_lemma ts x = ()
let corrupt_id_covers (ts:nat) (x:id) (y:id) = () 

#push-options "--z3rlimit 200"
let gen l u =
  let t0 = c_get() in
  let n = Seq.length t0 in
  let t = mk_rand n l u in
  write_at_end (RandGen t l u);
  let t1 = c_get() in
  assert (trace_len t1 = trace_len t0 + 1);
  Seq.un_snoc_snoc t0 (RandGen t l u);
  assert (Seq.index t1 (Seq.length t0) == (RandGen t l u));
  let p = trace_entry_at_pred n (RandGen t l u) in
  assert (p t1);
  let _ = witness p in
  assert (witnessed p);
  assert (trace_entry_at n (RandGen t l u));
  assert (was_rand_generated_at n t l u);
  t
#pop-options

let trigger_event p ev =
  let t0 = c_get () in
  write_at_end (Event p ev);
  Seq.un_snoc_snoc t0 (Event p ev);
  let pr = trace_entry_at_pred (Seq.length t0) (Event p ev) in
  witness pr; assert (witnessed pr);
  assert (did_event_occur_at (Seq.length t0) p ev)

let send p1 p2 t =
  let t0 = c_get() in
  let i = Seq.length t0 in
  write_at_end (Message p1 p2 t);
  let t1 = c_get() in
  assert (t1 == Seq.snoc t0 (Message p1 p2 t));
  Seq.un_snoc_snoc t0 (Message p1 p2 t);
  let pr = trace_entry_at_pred (Seq.length t0) (Message p1 p2 t) in
  witness pr; assert (witnessed pr);
  i

let receive_i i p2 =
  let t0 = c_get() in
  match Seq.index t0 i with
  | Message p1 p' m ->
	let pr = trace_entry_at_pred i (Message p1 p' m) in
	assert (pr t0);
	witness pr; assert (witnessed pr);
        assert(trace_entry_at i (Message p1 p' m));
        assert(t0.[i] == Message p1 p' m);
        assert(was_message_sent_at i p1 p' m);
        (p1,m)
  | e -> error "message not found"

let set_state p v s =
  let t0 = c_get() in
  let i = Seq.length t0 in
  write_at_end (SetState p v s);
  let t1 = c_get() in
  assert (t1 == Seq.snoc t0 (SetState p v s));
  Seq.un_snoc_snoc t0 (SetState p v s);
  let pr = trace_entry_at_pred (Seq.length t0) (SetState p v s) in
  witness pr; assert (witnessed pr);
  assert (state_was_set_at i p v s);
  ()

let get_state_i i p =
  let t0 = c_get() in
  match Seq.index t0 i with
  | SetState p' v s ->
     let pr = trace_entry_at_pred i (SetState p' v s) in
     assert (pr t0); witness pr; assert (witnessed pr);
     assert (state_was_set_at i p' v s);
     if p = p' then (v,s)
     else error "state stored by incorrect principal"
  | e -> error "no state stored at given index"

/// get_last_state_before
/// ---------------------

let rec get_last_state_before i p =
  let t0 = c_get() in
  match Seq.index t0 i with
  | SetState p' v s ->
      let pr = trace_entry_at_pred i (SetState p' v s) in
      assert (pr t0); witness pr; assert (witnessed pr);
      assert (state_was_set_at i p' v s);
      if p = p' then ( // Check whether this is actually an update for the correct principal
        assert(state_was_set_at i p v s);
        Some (i,v,s)
      ) else if i > 0 then ( // Is wasn't an update for the correct pricipal
        let jo = get_last_state_before (i-1) p in
        match jo with
        | Some (j,v',s') -> assert (state_was_set_at j p v' s');
			   assert (forall v' s'. ~ (state_was_set_at i p v' s'));
			   Some (j,v',s')
        | None -> (assert (forall j s. j <= (i-1) ==> ~ (state_was_set_at j p v s));
		  assert (state_was_set_at i p' v s);
                  None)
      ) else (
        assert (state_was_set_at i p' v s);
        None //error "update for wrong principal"
      )
  | e ->
      let pr = trace_entry_at_pred i e in
      witness pr; assert (witnessed pr);
      assert(trace_entry_at i e);
      if i > 0 then
        get_last_state_before (i-1) p
      else
        None //error "update not found"

let compromise p s v =
  let t0 = c_get() in
  let i = Seq.length t0 in
  write_at_end (Corrupt p s v);
  let t1 = c_get() in
  assert (t1 == Seq.snoc t0 (Corrupt p s v));
  Seq.un_snoc_snoc t0 (Corrupt p s v);
  let pr = trace_entry_at_pred i (Corrupt p s v) in
  assert (pr t1); witness pr; assert (witnessed pr);
  assert (was_corrupted_at i p s v)
