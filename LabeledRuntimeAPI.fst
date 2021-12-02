/// LabeledRuntimeAPI (implementation)
/// ===================================
module LabeledRuntimeAPI

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI

#set-options "--z3rlimit 200 --max_fuel 1 --max_ifuel 1"

let valid_trace (pr:preds) (tr:trace) =
  (forall (i:timestamp) (t:bytes) (s:principal) (r:principal). i < trace_len tr ==>
    (was_message_sent_at i s r t ==> (is_publishable pr.global_usage i t))) /\
  (forall (i:timestamp) (p:principal) (v:version_vec) (s:state_vec). i < trace_len tr ==>
    (state_was_set_at i p v s ==> (state_inv pr i p v s))) /\
  (forall (i:timestamp) (s:principal) (e:event). i < trace_len tr ==>
    (did_event_occur_at i s e ==> (event_pred_at pr i s e)))

let valid_trace_event_lemma pr t i s e = ()

let valid_trace_respects_state_inv pr trace i p v s = ()

let rand_gen #pr l u =
  let t0 = get() in
  let n = global_timestamp () in
  let r = gen l u in
  assert (was_rand_generated_at n r l u);
  rand_is_secret #pr.global_usage #n #l #u r;
  assert (is_secret pr.global_usage n r l u);
  let t1 = get () in
  assert (valid_trace pr t0);
  assert (trace_len t1 == trace_len t0 + 1);
  trace_entry_at_injective_forall n;
  assert (forall e. trace_entry_at n e ==> e == RandGen r l u);
  assert (valid_trace pr t1);
  (|n,r|)

type event = CryptoEffect.event

let trigger_event #pr p ev =
  let t0 = get () in
  let now = global_timestamp() in
  trigger_event p ev;
  assert (did_event_occur_at now p ev);
  trace_entry_at_injective_forall now;
  let t1 = get () in
  assert (trace_len t1 = trace_len t0 + 1);
  assert (valid_trace pr t1)


let send #pr #i p1 p2 m =
  let t0 = get () in
  let now = global_timestamp () in
  assert (later_than now i);
  assert (is_publishable pr.global_usage now m);
  let n = send p1 p2 m in
  let t1 = get () in
  trace_entry_at_injective_forall now;
  assert (valid_trace pr t1);
  n

let receive_i #pr i p =
 let t0 = get() in
 let now = global_timestamp () in
 assert (now == trace_len t0);
 if i < now then
   let (s,t) = receive_i i p in
   assert (is_publishable pr.global_usage i t);
   can_flow_later i now (get_label pr.global_usage.key_usages t) public;
   assert (can_flow now (get_label pr.global_usage.key_usages t) public);
   assert (is_valid pr.global_usage now t);
  assert (exists s p. was_message_sent_at i s p t);
   (|now, s, t|)
 else error "given index >= trace_len"

let set_state #pr p v s =
  set_state p v s;
  let t1 = get() in
  assert (valid_trace pr t1)

val get_state_i: #pr:preds -> i:timestamp -> p:principal ->
    LCrypto (timestamp & version_vec & state_vec) pr
     (requires (fun t0 -> True))
     (ensures (fun t0 (now,v,s) t1 -> t0 == t1 /\
              i < trace_len t0 /\
              now = trace_len t0 /\
              state_was_set_at i p v s /\
              state_inv pr now p v s))


let get_state_i #pr i p =
  let tr = get() in
  let now = global_timestamp () in
  if i < now then (
    assert (later_than now i);
    let (v,s) = get_state_i i p in
    state_inv_later pr i now p v s;
    (now,v,s))
  else error "wrong set_state index"

let get_last_state #pr p =
  let now = global_timestamp () in
  if now = 0 then error "no last state found" else
  match get_last_state_before (now - 1) p with
  | None -> error "no last state found"
  | Some (i,v,st) ->
    state_inv_later pr i now p v st;
    ( now, v, st )

let new_session_number #pr p =
  let now = global_timestamp () in
  if now = 0 then 0 else
  match get_last_state_before (now - 1) p with
  | Some (i,v,st) -> Seq.length v
  | None -> 0

let new_session #pr #i p si vi ss =
  let now = global_timestamp () in
  if now > 0 then
    match get_last_state_before (now - 1) p with
    | Some (i,v,st) ->
      if si <> Seq.length v then error "incorrect new session number" else
      let new_st = Seq.snoc st ss in
      let new_v = Seq.snoc v vi in
      assert (later_than now i);
      assert (state_inv pr now p v st);
      assert (state_inv pr now p new_v new_st);
      set_state #pr p new_v new_st
    | _ ->
      if si <> 0 then error "incorrect new session number" else
      let new_st = Seq.create 1 ss in
      let new_v = Seq.create 1 vi in
      set_state #pr p new_v new_st
  else
      if si <> 0 then error "incorrect new session number" else
      let new_st = Seq.create 1 ss in
      let new_v = Seq.create 1 vi in
      set_state #pr p new_v new_st

let update_session #pr #i p si vi ss =
  let now = global_timestamp () in
  if now = 0 then error "no prior session to update" else
    match get_last_state_before (now - 1) p with
    | Some (i,v,st) ->
      if si >= Seq.length v then error "incorrect update session number" else
      let new_st = Seq.upd st si ss in
      let new_v = Seq.upd v si vi in
      assert (later_than now i);
      assert (state_inv pr now p v st);
      assert (state_inv pr now p new_v new_st);
      set_state #pr p new_v new_st
    | _ -> error "no prior session to update"


let get_session #pr #i p si =
  let now = global_timestamp () in
  if now = 0 then error "no prior session to get" else
    match get_last_state_before (now - 1) p with
    | Some (i,v,st) ->
      if si >= Seq.length v then error "incorrect get session number" else
      assert(later_than now i);
      assert(state_inv pr now p v st);
      pr.trace_preds.session_st_inv_lemma now p si v.[si] st.[si];
      (|v.[si], st.[si]|)
    | _ -> error "no prior session to update"

let rec find_session_
  (pr:preds) (pi:timestamp) (p:principal) (v:version_vec)
  (st:state_vec{state_inv pr pi p v st})
  (f:nat -> nat -> bytes -> bool) (i:nat{i <= Seq.length st}) :
  Pure (option (si:nat & vi:nat & msg pr.global_usage pi (readers [V p si vi])))
    (requires True)
    (ensures (fun r -> match r with | None -> True
                    | Some (|si,vi,st|) -> f si vi st /\
                                          pr.trace_preds.session_st_inv pi p si vi st))
    (decreases (Seq.length st - i))
=  if i = Seq.length st then None else
   if f i v.[i] st.[i] then (
     pr.trace_preds.session_st_inv_lemma pi p i v.[i] st.[i];
     Some (|i,v.[i],st.[i]|))
   else find_session_ pr pi p v st f (i+1)


let find_session #pr #i p f =
  let now = global_timestamp () in
  if now = 0 then None else
    match get_last_state_before (now - 1) p with
    | Some (i,v,st) -> (
      assert(later_than now i);
      assert(state_inv pr now p v st);
      find_session_ pr now p v st f 0 )
    | _ -> None
