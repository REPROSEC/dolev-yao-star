/// SecrecyLabels (implementation)
/// ===============================
module SecrecyLabels

let covers_is_reflexive s = ()

let covers_is_transitive () = ()

// Note that label_ (with underscore) is a type internal to this module, therefore "eqtype" is OK
// here (the exposed type "label" (w/o underscore) is not eqtype.
type label_:eqtype =
  | Public: label_
  | ReadableBy: list id -> label_
  | Join: label_ -> label_ -> label_
  | Meet: label_ -> label_ -> label_

let label = label_

(** Pretty-print an id *)
let sprint_id (i:id) : string =
  match i with
  | P p -> p
  | S p s -> p^"("^string_of_int s^")"
  | V p s v -> p^"("^string_of_int s^")"^"("^string_of_int v^")"

(** Pretty-print a label *)
let rec sprint_label l =
  match l with
  | Public -> "Public"
  | ReadableBy si -> "["^ String.concat ";" (List.Tot.map sprint_id si)^"]"
  | Join l1 l2 -> "Join "^sprint_label l1^" "^sprint_label l2
  | Meet l1 l2 -> "Meet "^sprint_label l1^" "^sprint_label l2

(** Returns a iff a>=b. *)
let max (a:nat) (b:nat) = if a >= b then a else b

(**
    Returns the depth of a label. The depth of a 'Public' and 'ReadableBy' label is 0,
    of a 'Join' or 'Meet' label the maximum depth of each label increased by one.
*)
let rec depth (l:label) =
  match l with
  | Public -> 0
  | ReadableBy _ -> 0
  | Join l1 l2 -> 1 + (max (depth l1) (depth l2))
  | Meet l1 l2 -> 1 + (max (depth l1) (depth l2))

/// LESSTHANEQ OPERATIONS
/// ---------------------
///
(* A lexicographic ordering realation on list of integers *)
let rec list_int_le (l1:list int) (l2:list int) : bool =
  match l1, l2 with
  | [], _ -> true
  | hd::tl, hd'::tl' -> hd <= hd' && (if (hd = hd') then list_int_le tl tl' else true)
  | _, _ -> false

let rec list_int_le_totality_lemma (l1:list int) (l2:list int) : Lemma (ensures (list_int_le l1 l2 \/ list_int_le l2 l1)) =
  match l1, l2 with
  | [], _ -> ()
  | hd::tl, hd'::tl' -> list_int_le_totality_lemma tl tl'
  | _ -> ()

let rec list_int_le_anti_symmetry_lemma (l1:list int) (l2:list int) : Lemma (ensures (list_int_le l1 l2 /\ list_int_le l2 l1 ==> l1 = l2)) =
  match l1, l2 with
  | [], _ -> ()
  | hd::tl, hd'::tl' -> list_int_le_anti_symmetry_lemma tl tl'
  | _ -> ()

let rec list_int_le_anti_symm_lemma (l1:list int) (l2:list int) : Lemma (ensures (list_int_le l1 l2 /\ l1 <> l2 ==> not (list_int_le l2 l1))) =
  match l1, l2 with
  | [], _ -> ()
  | hd::tl, hd'::tl' -> list_int_le_anti_symm_lemma tl tl'
  | _ -> ()

let rec list_int_le_transitivity_lemma (l1:list int) (l2:list int) (l3:list int) :
    Lemma (ensures (list_int_le l1 l2 /\ list_int_le l2 l3 ==> list_int_le l1 l3)) =
  match l1, l2, l3 with
  | [], _, _ -> ()
  | hd::tl, hd'::tl', hd''::tl'' -> list_int_le_transitivity_lemma tl tl' tl''
  | _ -> ()

val map_inj (#a:Type0) (#b:Type0) (f: a -> b) (f_inj: (x:a ->  y:a -> Lemma (f x == f y ==> x == y))) (l1 l2: list a) :
  Lemma (List.Tot.map f l1 == List.Tot.map f l2 ==> l1 == l2)
let rec map_inj #a #b f f_inj l1 l2 =
  match l1,l2 with
  | [], [] -> ()
  | h1::t1, h2::t2 -> f_inj h1 h2; map_inj f f_inj t1 t2
  | _ -> ()


inline_for_extraction
class comparable (t:Type) = {
  to_list_int: t -> list int;
  to_list_int_inj: a:t -> b:t -> Lemma (to_list_int a == to_list_int b ==> a == b)
  }

val le (#t:Type) (comp:comparable t) (a b:t) : bool
let le (#t:Type) (comp:comparable t) (a b:t) =
    list_int_le (comp.to_list_int a) (comp.to_list_int b)
val le_totality_lemma (#t:Type) (comp:comparable t) (a b:t):
    Lemma (le comp a b \/ le comp b a)
let le_totality_lemma #t comp a b =
    list_int_le_totality_lemma (comp.to_list_int a) (comp.to_list_int b);
    comp.to_list_int_inj a b
val le_anti_symmetry_lemma (#t:Type) (comp:comparable t) (a b:t):
    Lemma (le comp a b /\ le comp b a ==> a == b)
let le_anti_symmetry_lemma #t comp a b =
    list_int_le_anti_symmetry_lemma (comp.to_list_int a) (comp.to_list_int b);
    comp.to_list_int_inj a b
val le_anti_symm_lemma (#t:Type) (comp:comparable t) (a b:t):
    Lemma (le comp a b /\ a =!= b ==> not (le comp b a))
let le_anti_symm_lemma #t comp a b =
    list_int_le_anti_symm_lemma (comp.to_list_int a) (comp.to_list_int b);
    comp.to_list_int_inj a b
val le_transitivity_lemma (#t:Type) (comp:comparable t) (a:t) (b:t) (c:t):
    Lemma (le comp a b /\ le comp b c ==> le comp a c)
let le_transitivity_lemma #t comp a b c =
    list_int_le_transitivity_lemma (comp.to_list_int a) (comp.to_list_int b) (comp.to_list_int c);
    comp.to_list_int_inj a b;
    comp.to_list_int_inj b c

let uint8_v : UInt8.t -> int = UInt8.v
val seq_u8_to_list_int: Seq.seq UInt8.t -> list int
let seq_u8_to_list_int s = List.Tot.map uint8_v (Seq.seq_to_list s)
let seq_u8_to_list_int_inj (s1:Seq.seq UInt8.t) (s2:Seq.seq UInt8.t) :
  Lemma (seq_u8_to_list_int s1 == seq_u8_to_list_int s2 ==> s1 == s2) =
  let v_inj (x1 x2: UInt8.t) : Lemma (requires (uint8_v x1 == uint8_v x2))(ensures (x1 == x2)) [SMTPat (uint8_v x1); SMTPat (uint8_v x2)] = UInt8.v_inj x1 x2 in
  let v_inj' (x1 x2: UInt8.t) : Lemma (uint8_v x1 == uint8_v x2 ==> x1 == x2) [SMTPat (uint8_v x1); SMTPat (uint8_v x2)] = () in
  map_inj uint8_v v_inj' (Seq.seq_to_list s1) (Seq.seq_to_list s2);
  assert (seq_u8_to_list_int s1 == List.Tot.map uint8_v (Seq.seq_to_list s1));
  Seq.lemma_seq_list_bij s1;
  Seq.lemma_seq_list_bij s2;
  ()

instance seq_u8_comparable : comparable (Seq.seq UInt8.t) = {
  to_list_int = seq_u8_to_list_int;
  to_list_int_inj = seq_u8_to_list_int_inj
}

let seq_u8_le l1 l2 = le seq_u8_comparable l1 l2

let int_of_char (c:Char.char) : int = Char.int_of_char c
let int_of_char_inj (c1 c2: Char.char) :
  Lemma (int_of_char c1 == int_of_char c2 ==> c1 == c2) = ()
let string_to_list_int (s:string) : list int = List.Tot.map int_of_char (String.list_of_string s)
let string_to_list_int_inj (s1 s2:string):
  Lemma (string_to_list_int s1 == string_to_list_int s2 ==> s1 == s2) =
  map_inj int_of_char int_of_char_inj (String.list_of_string s1) (String.list_of_string s2);
  String.string_of_list_of_string s1;
  String.string_of_list_of_string s2;
  ()

instance string_comparable : comparable string = {
  to_list_int = string_to_list_int;
  to_list_int_inj = string_to_list_int_inj
}

let string_le l1 l2 = le string_comparable l1 l2


let id_to_list_int (v:id) =
  match v with
  | P p -> 0 :: string_to_list_int p
  | S p si -> 1 :: si::(string_to_list_int p)
  | V p si vi -> 2 :: vi::si::(string_to_list_int p)

let id_to_list_int_inj (v1 v2:id):
  Lemma (id_to_list_int v1 == id_to_list_int v2 ==> v1 == v2) =
  match v1,v2 with
  | P p1, P p2 -> string_to_list_int_inj p1 p2
  | S p1 _, S p2 _ -> string_to_list_int_inj p1 p2
  | V p1 _ _, V p2 _ _ -> string_to_list_int_inj p1 p2
  | _ -> ()

instance id_comparable : comparable id = {
  to_list_int = id_to_list_int;
  to_list_int_inj = id_to_list_int_inj
}

let id_le i1 i2 = le id_comparable i1 i2

let lconcat (l1:list int) (l2:list int) = List.Tot.length l1 :: l1 @ l2

let rec id_list_to_list_int (vl:list id) =
  match vl with
  | [] -> 0 :: []
  | h::t -> lconcat (id_to_list_int h) (id_list_to_list_int t)

let append_length_inv_head
  (#a: Type)
  (left1 right1 left2 right2: list a)
: Lemma (requires (left1 @ right1 == left2 @ right2 /\ List.Tot.length left1 == List.Tot.length left2))
        (ensures (left1 == left2 /\ right1 == right2))
         [SMTPat (left1 @ right1); SMTPat (left2 @ right2)] =
         List.Tot.append_length_inv_head left1 right1 left2 right2


let rec id_list_to_list_int_inj (vl1 vl2:list id):
  Lemma (id_list_to_list_int vl1 == id_list_to_list_int vl2 ==> vl1 == vl2) =
  match vl1, vl2 with
  | [],[] -> ()
  | h1::t1,h2::t2 -> id_to_list_int_inj h1 h2; id_list_to_list_int_inj t1 t2
  | _, _ -> ()

instance id_list_comparable : comparable (list id) = {
  to_list_int = id_list_to_list_int;
  to_list_int_inj = id_list_to_list_int_inj
}

let id_list_le = le id_list_comparable

val label_to_list_int: label -> list int
let rec label_to_list_int (l:label) : list int =
  match l with
  | Public -> [0]
  | ReadableBy a -> 1::id_list_to_list_int a
  | Join l1 l2 -> 2 :: lconcat (label_to_list_int l1) (label_to_list_int l2)
  | Meet l1 l2 -> 3 :: lconcat (label_to_list_int l1) (label_to_list_int l2)

let rec label_to_list_int_inj (l1 l2:label) :
  Lemma (label_to_list_int l1 == label_to_list_int l2 ==> l1 == l2) =
  match l1, l2 with
  | Public, Public -> ()
  | ReadableBy a, ReadableBy b -> id_list_to_list_int_inj a b
  | Join l1 l2, Join l1' l2' -> label_to_list_int_inj l1 l1'; label_to_list_int_inj l2 l2'
  | Meet l1 l2, Meet l1' l2' -> label_to_list_int_inj l1 l1'; label_to_list_int_inj l2 l2'
  | _, _ -> ()

instance label_comparable : comparable label = {
  to_list_int = label_to_list_int;
  to_list_int_inj = label_to_list_int_inj
}

let label_le = le label_comparable

let readers (ids:list id) = ReadableBy ids
let public = Public
let join l1 l2 = if label_le l1 l2 then Join l1 l2 else Join l2 l1
let meet l1 l2 = if label_le l1 l2 then Meet l1 l2 else Meet l2 l1

let rec unversion_ids (i:list id) : (list id) =
  match i with 
  | [] -> []
  | (V p si vi)::tl -> (S p si)::(unversion_ids tl)
  | hd::tl -> hd::(unversion_ids tl)

let rec unversion l = 
  match l with 
  | ReadableBy ids -> ReadableBy (unversion_ids ids)
  | Join l1 l2 -> Join (unversion l1) (unversion l2)
  | Meet l1 l2 -> Meet (unversion l1) (unversion l2)
  | Public -> Public

let rec can_read i l = 
  match l with 
  | Public -> True
  | ReadableBy ids -> List.Tot.mem i ids // TODO KB Why don't we use covers (or contains_id) here?
  | Join l1 l2 -> can_read i l1 \/ can_read i l2
  | Meet l1 l2 -> can_read i l1 /\ can_read i l2

let can_read_readers_lemma l i = ()

let can_read_public_lemma i = ()

let can_read_join_lemma i l1 l2 = ()

let can_read_meet_lemma i l1 l2 = ()

let can_read_private_lemma i = ()

let readers_is_injective a = ()

let join_is_equal l1 l2 = le_totality_lemma label_comparable l1 l2;
                          le_anti_symmetry_lemma label_comparable l1 l2
let meet_is_equal l1 l2 = le_totality_lemma label_comparable l1 l2;
                          le_anti_symmetry_lemma label_comparable l1 l2
(* Can Flow Relation *)
#set-options "--z3rlimit 100 --max_fuel 2 --max_ifuel 2"
let rec can_flow_p (p:corrupt_pred) (ts:timestamp) (l1:label) (l2:label) =
    match l1,l2 with
      // Public can flow to anything
      | Public, _ -> True
      // Labels with corrupt vsessionids flow to public
      | ReadableBy ps, Public ->  contains_corrupt_id p ts ps
      // [l1] flows to [l2] if [l1] is a superset of [l2] or some id in [l1] is corrupt
      | ReadableBy ps1, ReadableBy ps2 -> contains_corrupt_id p ts ps1 \/ includes_ids ps1 ps2
      // [ReadableBy ps] flows to [Meet a b] if [ReadableBy ps] flows to at least one of [a] or [b]
      | ReadableBy ps, Meet l21 l22 -> can_flow_p p ts l1 l21 \/ can_flow_p p ts l1 l22
      // [ReadableBy ps] flows to [Join a b] if [ReadableBy ps] flows to both [a] and [b]
      | ReadableBy ps, Join l21 l22 -> can_flow_p p ts l1 l21 /\ can_flow_p p ts l1 l22
      | Join l11 l12, Public | Join l11 l12, ReadableBy _ -> can_flow_p p ts l11 l2 \/ can_flow_p p ts l12 l2
      | Meet l11 l12, Public | Meet l11 l12, ReadableBy _ -> can_flow_p p ts l11 l2 /\ can_flow_p p ts l12 l2
      | Join l11 l12, Meet l21 l22 -> can_flow_p p ts l1 l21 \/ can_flow_p p ts l1 l22 \/ can_flow_p p ts l11 l2 \/ can_flow_p p ts l12 l2
      | Meet l11 l12, Meet l21 l22 -> can_flow_p p ts l1 l21 \/ can_flow_p p ts l1 l22 \/ (can_flow_p p ts l11 l2 /\ can_flow_p p ts l12 l2)
      | Meet l11 l12, Join l21 l22 -> can_flow_p p ts l1 l21 /\ can_flow_p p ts l1 l22 \/ (can_flow_p p ts l11 l2 /\ can_flow_p p ts l12 l2)
      | Join l11 l12, Join l21 l22 -> can_flow_p p ts l1 l21 /\ can_flow_p p ts l1 l22 \/ (can_flow_p p ts l11 l2 \/ can_flow_p p ts l12 l2)

val corrupt_can_flow_to_public: p:corrupt_pred -> i:timestamp -> vid:list id ->
    Lemma (ensures (contains_corrupt_id p i vid ==> can_flow_p p i (ReadableBy vid) public))
let corrupt_can_flow_to_public p i ps = ()

let rec can_flow_later p i j l1 l2 =
  match l1, l2 with
  | Join l11 l12, Meet l21 l22 | Meet l11 l12, Meet l21 l22 | Join l11 l12, Join l21 l22 | Meet l11 l12, Join l21 l22
    -> can_flow_later p i j l11 l2; can_flow_later p i j l12 l2; can_flow_later p i j l1 l21; can_flow_later p i j l1 l22
  | Join l11 l12, _ | Meet l11 l12, _ -> can_flow_later p i j l11 l2; can_flow_later p i j l12 l2
  | ReadableBy ps, Join l11 l12 | ReadableBy ps, Meet l11 l12  -> can_flow_later p i j l1 l11; can_flow_later p i j l1 l12
  | _ -> p.corrupt_id_later i j


let can_flow_later_forall p l1 l2 = ()

let can_flow_before p i l1 l2 = ()

let can_flow_before_strict p i l1 l2 = can_flow_before p i l1 l2

let can_flow_before_strict_forall_label p i = ()


let rec flows_to_public_can_flow p i (l1:label) (l2:label) =
    match l1, l2 with
      | Public, _ -> ()
      | ReadableBy ps1 , Public -> ()
      | ReadableBy ps1, ReadableBy ps2 -> ()
      | ReadableBy ps, Join l21 l22
      | ReadableBy ps, Meet l21 l22 -> flows_to_public_can_flow p i l1 l21; flows_to_public_can_flow p i l1 l22
      | Join l11 l12, Meet l21 l22 | Meet l11 l12, Meet l21 l22 | Join l11 l12, Join l21 l22 | Meet l11 l12, Join l21 l22
        -> flows_to_public_can_flow p i l11 l2; flows_to_public_can_flow p i l12 l2; flows_to_public_can_flow p i l1 l21; flows_to_public_can_flow p i l1 l22
      | Join l11 l12, _ | Meet l11 l12, _ ->  flows_to_public_can_flow p i l11 l2; flows_to_public_can_flow p i l12 l2

let flows_to_public_can_flow_forall p = ()


let rec can_flow_reflexive p i l : Lemma (ensures (can_flow_p p i l l)) [SMTPat (can_flow_p p i l l)] =
  match l with
  | Public
  | ReadableBy _ -> ()
  | Meet l1 l2 -> can_flow_reflexive p i l1;  can_flow_reflexive p i l2;
                 can_flow_to_meet_left p i l1 l1 l2; can_flow_to_meet_right p i l2 l1 l2
  | Join l1 l2 -> can_flow_reflexive p i l1; can_flow_reflexive p i l2;
                 can_flow_from_join_left p i l1 l2 l1; can_flow_from_join_right p i l1 l2 l2
and can_flow_to_meet_left p c l1 l2 l3 : Lemma (can_flow_p p c l1 l2 ==> can_flow_p p c l1 (meet l2 l3)) = ()
and can_flow_to_meet_right p c l1 l2 l3 : Lemma (can_flow_p p c l1 l3 ==> can_flow_p p c l1 (meet l2 l3)) = ()
and can_flow_from_join_left p c l1 l2 l3 : Lemma (can_flow_p p c l1 l3 ==> can_flow_p p c (join l1 l2) l3) = ()
and can_flow_from_join_right p c l1 l2 l3 : Lemma (can_flow_p p c l2 l3 ==> can_flow_p p c (join l1 l2) l3) = ()

let can_flow_from_join p i l1 l2 = ()
let can_flow_join_public_lemma p i = ()

let can_flow_join_public_lemma_forall_trace_index p = ()
let can_flow_join_labels_public_lemma p i l1 l2 = can_flow_join_public_lemma p i

let can_flow_to_join_forall p i = ()
let can_flow_to_join_forall_trace_index p = ()

let can_flow_meet_public_lemma p i = ()
let can_flow_meet_forall_public_lemma p = ()
let can_flow_from_meet_lemma p i = ()
let can_flow_to_meet_forall p i = ()
let can_flow_to_meet_forall_i p = ()

let rec can_flow_to_private p i l =
  match l with
  | Public | ReadableBy _ -> () | Join l1 l2 | Meet l1 l2 -> can_flow_to_private p i l1; can_flow_to_private p i l2

let rec can_flow_from_public p i l =
  match l with
  | Public | ReadableBy _ -> () | Join l1 l2 | Meet l1 l2 -> can_flow_from_public p i l1; can_flow_from_public p i l2

let rec can_flow_flows_to_public p (i:timestamp) (l1:label) (l2:label) :
    Lemma ((can_flow_p p i l2 Public /\ can_flow_p p i l1 l2) ==> can_flow_p p i l1 Public) =
    match l1, l2 with
      | Public, _ -> ()
      | ReadableBy ps1 , Public -> ()
      | ReadableBy ps1, ReadableBy ps2 -> ()
      | ReadableBy ps, Meet l21 l22
      | ReadableBy ps, Join l21 l22 -> can_flow_flows_to_public p i l1 l21; can_flow_flows_to_public p i l1 l22
      | Join l11 l12, Meet l21 l22 | Meet l11 l12, Meet l21 l22 | Join l11 l12, Join l21 l22 | Meet l11 l12, Join l21 l22
        -> can_flow_flows_to_public p i l11 l2; can_flow_flows_to_public p i l12 l2; can_flow_flows_to_public p i l1 l21; can_flow_flows_to_public p i l1 l22
      | Join l11 l12, _ | Meet l11 l12, _ -> can_flow_flows_to_public p i l11 l2;can_flow_flows_to_public p i l12 l2

let rec can_flow_transitive p i l1 l2 l3
= match l1, l2, l3 with
  | Public, _, _ -> ()
  | _, Public, _ -> flows_to_public_can_flow p i l1 l3
  | _, _, Public -> can_flow_flows_to_public p i l1 l2; flows_to_public_can_flow p i l1 l3
  | ReadableBy ps1,ReadableBy ps2,ReadableBy ps3 -> ()
  | ReadableBy ps1, ReadableBy ps2, Meet l31 l32 | ReadableBy ps1, ReadableBy ps2, Join l31 l32 ->
    can_flow_transitive p i l1 l2 l31; can_flow_transitive p i l1 l2 l32
  | ReadableBy ps1, Join l21 l22, Public | ReadableBy ps1, Join l21 l22, ReadableBy _
  | ReadableBy ps1, Meet l21 l22, Public | ReadableBy ps1, Meet l21 l22, ReadableBy _ -> can_flow_transitive p i l1 l21 l3; can_flow_transitive p i l1 l22 l3
  | ReadableBy ps1, Join l21 l22, Meet l31 l32 | ReadableBy ps1, Meet l21 l22, Meet l31 l32
  | ReadableBy ps1, Meet l21 l22, Join l31 l32 | ReadableBy ps1, Join l21 l22, Join l31 l32 ->
    can_flow_transitive p i l1 l2 l31; can_flow_transitive p i l1 l2 l32; can_flow_transitive p i l1 l21 l3; can_flow_transitive p i l1 l22 l3
  | Join l11 l12, Public, _ | Join l11 l12, ReadableBy _, Public | Join l11 l12, ReadableBy _, ReadableBy _
  | Meet l11 l12, Public, _ | Meet l11 l12, ReadableBy _, Public | Meet l11 l12, ReadableBy _, ReadableBy _ ->
    can_flow_transitive p i l11 l2 l3; can_flow_transitive p i l12 l2 l3
  | Join l11 l12, ReadableBy _, Meet l31 l32 | Join l11 l12, ReadableBy _, Join l31 l32
  | Meet l11 l12, ReadableBy _, Join l31 l32 | Meet l11 l12, ReadableBy _, Meet l31 l32 ->
    can_flow_transitive p i l1 l2 l31; can_flow_transitive p i l1 l2 l32
  | Join l11 l12, Join l21 l22, Public | Join l11 l12, Join l21 l22, ReadableBy _
  | Join l11 l12, Meet l21 l22, Public | Join l11 l12, Meet l21 l22, ReadableBy _ | Meet l11 l12, Join l21 l22, Public
  | Meet l11 l12, Join l21 l22, ReadableBy _ | Meet l11 l12, Meet l21 l22, Public | Meet l11 l12, Meet l21 l22, ReadableBy _ ->
    can_flow_transitive p i l1 l21 l3; can_flow_transitive p i l1 l22 l3; can_flow_transitive p i l11 l2 l3; can_flow_transitive p i l12 l2 l3
  | Join l11 l12, Join l21 l22, Meet l31 l32 | Join l11 l12, Join l21 l22, Join l31 l32 | Join l11 l12, Meet l21 l22, Meet l31 l32
  | Join l11 l12, Meet l21 l22, Join l31 l32 | Meet l11 l12, Join l21 l22, Meet l31 l32
  | Meet l11 l12, Join l21 l22, Join l31 l32 | Meet l11 l12, Meet l21 l22, Meet l31 l32 | Meet l11 l12, Meet l21 l22, Join l31 l32  ->
    can_flow_transitive p i l1 l2 l31; can_flow_transitive p i l1 l2 l32; can_flow_transitive p i l1 l21 l3; can_flow_transitive p i l1 l22 l3;
    can_flow_transitive p i l11 l2 l3; can_flow_transitive p i l12 l2 l3

let includes_can_flow_lemma p i l l' = ()
let includes_corrupt_lemma p i l = ()
let includes_corrupt_2_lemma p i p1 p2 = ()

let can_flow_to_public_implies_corruption p i l =
  assert (can_flow_p p i (readers [l]) public ==> contains_corrupt_id p i [l]);
  assert (contains_corrupt_id p i [l] ==> (exists x. contains_id [l] x /\ p.corrupt_id i x));
  assert (forall x. contains_id [l] x ==> covers l x);
  p.corrupt_id_covers i

let includes_corrupt_2_lemma_forall_trace_index p p1 p2 = ()

let includes_corrupt_2_lemma_forall p = ()

let can_flow_readers_to_join p = ()

