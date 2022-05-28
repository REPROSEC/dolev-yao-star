/// SecrecyLabels
/// ==============

module SecrecyLabels

/// Some basic definitions needed later
type timestamp = nat
let later_than j i = i <= j

/// Helper types and functions
type result (a:Type) =
  | Success: v:a -> result a
  | Error: e:string -> result a

let bind #a #b (f:result a) (g:a -> result b) : result b =
    match f with
    | Success x -> g x
    | Error s -> Error s

let return (x:'a) : result 'a = Success x
let is_some2 x (a:'a) (b:'b) = x == Some (a,b)
let is_some x (a:'a) = x == Some a
let is_succ2 x (a:'a) (b:'b) = x == Success (a,b)
let is_succ x (a:'a) = x == Success a

/// Redefine ``a.[i]`` and ``a.[i] <- v`` to read/update sequence elements
let op_String_Access #a b i = Seq.index #a b i
let op_String_Assignment #a b i v = Seq.upd #a b i v

/// Session Identifiers
/// -------------------
type principal = string

/// The inner state of principals is subdivided into (numbered) sessions which in turn are assigned
/// a version number. A session is most of the time indeed a protocol session, but can also be used
/// in a more abstact way, e.g., to store long-term secrets.
///
/// An ``id`` describes a (set of) version(s) of a (set of) session(s) of a principal.
type id =
  | P: p:principal -> id
  | S: p:principal -> session:nat -> id
  | V: p:principal -> session:nat -> version:nat -> id

(** Get the principal from a an id [vsid] *)
let get_principal (vsid:id) : principal =
  match vsid with
  | P p -> p
  | S p s -> p
  | V p s v -> p

(** Get the session idx - if any - from a an id [vsid] *)
let get_session (vsid:id) : option nat =
  match vsid with
  | P p -> None
  | S p s -> Some s
  | V p s v -> Some s

/// Covers relation for ``id``: ``s1`` covers ``s2`` iff the set of versions described by ``s1`` is
/// equal to or a superset of the versions described by ``s2``.
let covers (s1:id) (s2:id) =
  match s1 with
  | P p1 -> p1 = get_principal s2
  | S p1 i1 -> p1 = get_principal s2 &&
              Some i1 = get_session s2
  | _ -> s1 = s2

val covers_is_reflexive: s:id ->
  Lemma (ensures (covers s s))
        [SMTPat (covers s s)]
val covers_is_transitive: unit ->
  Lemma (forall s1 s2 s3. covers s1 s2 /\ covers s2 s3 ==> covers s1 s3)

let contains_id (haystack:list id) (needle:id) = (exists v1. List.Tot.mem v1 haystack /\ covers v1 needle)

let includes_ids (haystack:list id) (needles:list id) = (forall v2. List.Tot.mem v2 needles ==> contains_id haystack v2)

/// (Secrecy) Labels
/// ----------------
///
/// A label describes the intended "audience" or "allowed knowers" for a value. For example, this
/// might be "this value is intended to be known to the following ``id``\ s"; for concatenated values
/// (pairs/tuples), the label is derived from its elements' labels (either via "join", i.e., a
/// union; or via "meet", i.e., intersection).
///
/// We maintain labels as abstract opaque values that are used only in (concrete) annotations and
/// (ghost) specifications.
///
/// Note: take care not to leak the concrete value of a label; do not allow an application to
/// concretely compare labels, otherwise TODO DOC
///
/// Abstract type and constructors for labels
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
val label:Type0

/// A list of versions allowed to read a value
val readers: list id -> label

/// A public value is allowed to be read by everyone and can, e.g., be sent over an unsecured
/// connection.
val public: label

/// Label for combined values: Union of the "intended audiences".
val join: label -> label -> label

/// Label for combined values: Intersection of the "intended audiences".
val meet: label -> label -> label

/// Label for unreadable values
let private_label = readers []
let join_opt l1 l2o = match l2o with | Some x -> join l1 x | None -> l1

val unversion: label -> label

/// Check whether a given ``id`` is in the "intended audience" of a label.
val can_read: id -> label -> Type0

/// Properties of ``can_read`` and label constructors
val can_read_readers_lemma: l:list id -> i:id -> Lemma (List.Tot.mem i l <==> i `can_read` readers l) [SMTPat (can_read i (readers l))]
val can_read_public_lemma: i:id -> Lemma (can_read i public) [SMTPat (can_read i public)]
val can_read_join_lemma: i:id -> l1:label -> l2:label -> Lemma ((can_read i l1 \/ can_read i l2) <==> can_read i (join l1 l2)) [SMTPat (can_read i (join l1 l2))]
val can_read_meet_lemma: i:id -> l1:label -> l2:label -> Lemma ((can_read i l1 /\ can_read i l2) <==> can_read i (meet l1 l2)) [SMTPat (can_read i (meet l1 l2))]
val can_read_private_lemma: i:id -> Lemma (~ (can_read i private_label)) [SMTPat (can_read i private_label)]
val readers_is_injective: a:principal -> Lemma (forall b. readers [P a] == readers [P b] ==> a == b)
val join_is_equal : l1:label -> l2:label -> Lemma (join l1 l2 == join l2 l1) [SMTPat (join l1 l2)]
val meet_is_equal : l1:label -> l2:label -> Lemma (meet l1 l2 == meet l2 l1) [SMTPat (meet l1 l2)]

/// Handling corruption w.r.t. labels
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

noeq type corrupt_pred = {
  corrupt_id: timestamp -> id -> Type0;
  corrupt_id_later: t1:timestamp -> t2:timestamp ->
                    Lemma (forall x. corrupt_id t1 x /\ later_than t2 t1 ==> corrupt_id t2 x);
/// TODO DOC: Is the following correct?
/// Intuition for this property of ``corrupt_id``: Suppose we have a principal A, a nonce n which is
/// somehow related to A (i.e., is labeled with ``readers [P A]``), and some corrupted
/// session/version in A's state. Since we don't know whether n belongs to that corrupted version or
/// not, we have to assume the worst, i.e., we have to treat n as "corrupted".
  corrupt_id_covers: ts:timestamp ->
                    Lemma(forall x y. (covers x y = true /\ corrupt_id ts y) ==> corrupt_id ts x)
}

let contains_corrupt_id (p:corrupt_pred) (ts:timestamp) (ps:list id) =
    (exists x. contains_id ps x /\ p.corrupt_id ts x)


/// Flow relation between labels
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
val can_flow_p: p:corrupt_pred -> ts:timestamp -> from:label -> to:label -> Type0

/// Properties of ``can_flow_p``
/// .............................
val can_flow_later: p:corrupt_pred -> i:timestamp -> j:timestamp -> l1:label -> l2:label ->
  Lemma ((can_flow_p p i l1 l2 /\ later_than j i) ==> can_flow_p p j l1 l2)
        [SMTPat (can_flow_p p i l1 l2); SMTPat (later_than j i)]

val can_flow_later_forall: p:corrupt_pred -> l1:label -> l2:label ->
   Lemma (forall i j. (can_flow_p p i l1 l2 /\ later_than j i) ==> can_flow_p p j l1 l2)

val can_flow_before: p: corrupt_pred -> i:timestamp -> l1:label -> l2: label ->
  Lemma ((exists j. later_than i j /\ can_flow_p p j l1 l2) ==> can_flow_p p i l1 l2)

val can_flow_before_strict: p: corrupt_pred -> i:timestamp -> l1:label -> l2: label ->
  Lemma ((exists j. j<i /\ can_flow_p p j l1 l2) ==> can_flow_p p i l1 l2)
  [SMTPat (can_flow_p p i l1 l2)]

val can_flow_before_strict_forall_label: p:corrupt_pred -> i:timestamp ->
  Lemma (forall l1 l2. (exists j. j<i /\ can_flow_p p j l1 l2) ==> can_flow_p p i l1 l2)


val flows_to_public_can_flow: p:corrupt_pred -> i:timestamp -> l1:label -> l2:label ->
  Lemma (can_flow_p p i l1 public ==> can_flow_p p i l1 l2)
        [SMTPat (can_flow_p p i l1 public); SMTPat (can_flow_p p i l1 l2)]

val flows_to_public_can_flow_forall: p:corrupt_pred  ->
  Lemma (forall i l1 l2. can_flow_p p i l1 public ==> can_flow_p p i l1 l2)

val can_flow_reflexive: p:corrupt_pred -> i:timestamp -> l:label -> Lemma (ensures (can_flow_p p i l l)) [SMTPat (can_flow_p p i l l)]
val can_flow_from_join: p:corrupt_pred -> i:timestamp -> l1:label -> l2:label ->
  Lemma (can_flow_p p i (join l1 l2) l1 /\ can_flow_p p i (join l1 l2) l2)
	[SMTPatOr [[SMTPat (can_flow_p p i (join l1 l2) l1)];
		   [SMTPat (can_flow_p p i (join l1 l2) l2)]]]
val can_flow_join_public_lemma: p:corrupt_pred -> i:timestamp -> Lemma (forall l1 l2. can_flow_p p i (join l1 l2) public <==> can_flow_p p i l1 public \/ can_flow_p p i l2 public)

val can_flow_join_public_lemma_forall_trace_index: p:corrupt_pred -> 
  Lemma (forall i l1 l2. can_flow_p p i (join l1 l2) public <==> can_flow_p p i l1 public \/ can_flow_p p i l2 public)

val can_flow_join_labels_public_lemma: p:corrupt_pred -> i:timestamp -> l1:label -> l2:label -> 
  Lemma (can_flow_p p i (join l1 l2) public <==> can_flow_p p i l1 public \/ can_flow_p p i l2 public)

val can_flow_to_join_forall: p:corrupt_pred -> i:timestamp ->
  Lemma (forall l1 l2 l3. can_flow_p p i l1 l2 /\ can_flow_p p i l1 l3 ==> can_flow_p p i l1 (join l2 l3))
val can_flow_to_join_forall_trace_index: p:corrupt_pred  ->
  Lemma (forall i l1 l2 l3. can_flow_p p i l1 l2 /\ can_flow_p p i l1 l3 ==> can_flow_p p i l1 (join l2 l3))

val can_flow_meet_public_lemma: p:corrupt_pred -> i:timestamp -> Lemma (forall l1 l2. can_flow_p p i (meet l1 l2) public <==> can_flow_p p i l1 public /\ can_flow_p p i l2 public)
val can_flow_meet_forall_public_lemma: p:corrupt_pred -> Lemma (forall i l1 l2. can_flow_p p i (meet l1 l2) public <==> can_flow_p p i l1 public /\ can_flow_p p i l2 public)
val can_flow_from_meet_lemma: p:corrupt_pred -> i:timestamp -> Lemma (forall l1 l2 l3. can_flow_p p i l1 l3 /\ can_flow_p p i l2 l3 ==> can_flow_p p i (meet l1 l2) l3)
val can_flow_to_meet_forall: p:corrupt_pred -> i:timestamp -> 
  Lemma (forall l1 l2 l3. can_flow_p p i l1 l2 \/ can_flow_p p i l1 l3 ==> can_flow_p p i l1 (meet l2 l3))
val can_flow_to_meet_forall_i: p:corrupt_pred -> 
  Lemma (forall i l1 l2 l3. can_flow_p p i l1 l2 \/ can_flow_p p i l1 l3 ==> can_flow_p p i l1 (meet l2 l3))
val can_flow_to_private: p:corrupt_pred -> i:timestamp -> l: label ->
  Lemma (can_flow_p p i l private_label)
        [SMTPat (can_flow_p p i l private_label)]
val can_flow_from_public: p:corrupt_pred -> i:timestamp -> l:label ->
  Lemma (can_flow_p p i public l)
        [SMTPat (can_flow_p p i public l)]
val can_flow_transitive: p:corrupt_pred -> i:timestamp -> l1:label -> l2:label -> l3:label ->
  Lemma (can_flow_p p i l1 l2 /\ can_flow_p p i l2 l3 ==> can_flow_p p i l1 l3)
        [SMTPat (can_flow_p p i l1 l2); SMTPat (can_flow_p p i l2 l3)]
val includes_can_flow_lemma: p:corrupt_pred -> i:timestamp -> l1:list id -> l2:list id ->
  Lemma (includes_ids l1 l2 ==> can_flow_p p i (readers l1) (readers l2))
        [SMTPat (can_flow_p p i (readers l1) (readers l2))]
val includes_corrupt_lemma: p:corrupt_pred -> i:timestamp -> l:list id ->
  Lemma (can_flow_p p i (readers l) public ==> (exists p1. can_read p1 (readers l) /\ can_flow_p p i (readers [p1]) public))
val includes_corrupt_2_lemma: p:corrupt_pred -> i:timestamp -> p1:id -> p2:id ->
  Lemma (can_flow_p p i (readers [p1; p2]) public ==> can_flow_p p i (readers [p1]) public \/ can_flow_p p i (readers [p2]) public)
val can_flow_to_public_implies_corruption: p:corrupt_pred -> i:timestamp -> l:id ->
  Lemma (ensures (can_flow_p p i (readers [l]) public  <==> p.corrupt_id i l))
        [SMTPat (can_flow_p p i (readers [l]) public)]


val includes_corrupt_2_lemma_forall_trace_index: p:corrupt_pred -> p1:id -> p2:id ->
  Lemma (forall i. can_flow_p p i (readers [p1; p2]) public ==> can_flow_p p i (readers [p1]) public \/ can_flow_p p i (readers [p2]) public)

val includes_corrupt_2_lemma_forall: p:corrupt_pred ->
  Lemma (forall i p1 p2. can_flow_p p i (readers [p1; p2]) public ==> can_flow_p p i (readers [p1]) public \/ can_flow_p p i (readers [p2]) public)
  
val can_flow_readers_to_join: p:corrupt_pred ->
  Lemma (forall i p1 p2. can_flow_p p i (readers [p1; p2]) (join (readers [p1]) (readers [p2])))

