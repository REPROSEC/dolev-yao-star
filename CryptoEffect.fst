/// CryptoEffect (implementation)
/// ==============================
module CryptoEffect

module W = FStar.Monotonic.Witnessed
(** Get the current trace *)
inline_for_extraction
val c_get (_:unit)
: CRYPTO trace (fun p s -> p (Success s) s)
inline_for_extraction
let c_get ()
: CRYPTO trace
  (fun p s -> p (Success s) s)
= CRYPTO?.reflect (fun s0 -> Success s0, s0)

(** Set a new trace (which has to be an extension of the current trace) *)
inline_for_extraction
val put (s1:trace)
: CRYPTO unit (fun p s0 -> grows s0 s1 /\ p (Success ()) s1)
let put (s:trace)
: CRYPTO unit
  (fun p s0 -> grows s0 s /\ p (Success ()) s)
= CRYPTO?.reflect (fun _ -> Success (), s)

(** "Emit" an error inside of a CRYPTO function *)
inline_for_extraction
let cerror (#a:Type) (e:string)
: CRYPTO a
  (fun p s -> p (Error e) s)
= CRYPTO?.reflect (fun s0 -> Error e, s0)

(** Get the current trace length *)
inline_for_extraction
let cglobal_timestamp ()
: CRYPTO timestamp
  (fun p s -> p (Success (Seq.length s)) s)
= let s0 = c_get () in
  Seq.length s0

(** Append an entry to the trace *)
inline_for_extraction
val write_at_end (e:entry_t)
: CRYPTO unit (fun p s -> p (Success ()) (Seq.snoc s e))

inline_for_extraction
let write_at_end (e:entry_t)
: CRYPTO unit
  (fun p s -> p (Success ()) (Seq.snoc s e))
= let s0 = c_get () in
  let s1 = Seq.snoc s0 e in
  assert (forall (i:timestamp). i < Seq.length s0 ==> Seq.index s0 i == Seq.index s1 i);
  put s1

(** Get the trace entry at index i *)
inline_for_extraction
val index (i:timestamp)
:CRYPTO entry_t (fun p s -> i < trace_len s /\ p (Success (Seq.index s i)) s)
inline_for_extraction
let index (i:timestamp)
: CRYPTO entry_t
  (fun p s -> i < Seq.length s /\ p (Success (Seq.index s i)) s)
= let s0 = c_get () in
  Seq.index s0 i
/// "Monotonic" Stable Predicates over the Trace
/// --------------------------------------------
///
/// See Ahman et al.'s POPL 2018 paper "Recalling a Witness:
/// Foundations and Applications of Monotonic State".

type trace_pred = trace -> Type0


/// Stable predicates: Once they are true, they stay true => This gives us monotonic properties as
/// long as we stay within the effect/monad.
inline_for_extraction
let stable (p:trace_pred) =
  forall s0 s1. (p s0 /\ grows s0 s1) ==> p s1

/// Think about witnessed as a "token" which can be used at some point to "prove to F*" that we
/// proved p to be true before.  And if p is stable, we can use this token later (see "recall") to
/// remind F* of that fact.
val witnessed (p:trace_pred) : Type0
let witnessed p = W.witnessed grows p

// The following two cannot be implemented/proven inside F*
// (to see why they are sound, see "recalling a witness" paper)

inline_for_extraction
val witness (p:trace_pred)
: CRYPTO unit (fun post s -> p s /\ stable p /\ (witnessed p ==> post (Success ()) s))
(* An admitted definition for witness: this is sound, see Ahman et al. *)
let witness p = assume(witnessed p)

/// "Remind" F* that we witnessed p before.
inline_for_extraction
val recall (p:trace_pred)
: CRYPTO unit (fun post s -> witnessed p /\ (p s ==> post (Success ()) s))
(* An admitted definition for recall: this is sound, see Ahman et al.  *)
let recall p = let t = c_get() in assume(witnessed p ==> p t)

let witnessed_constant (p:Type0)
: Lemma (witnessed (fun _ -> p) <==> p)
= W.lemma_witnessed_constant grows p

let witnessed_nested (p:trace_pred)
: Lemma (witnessed (fun s -> witnessed p) <==> witnessed p)
= assert_norm (witnessed (fun _ -> witnessed p) ==
               W.witnessed grows (fun _ -> W.witnessed grows p));
  assert_norm (witnessed p == W.witnessed grows p);
  W.lemma_witnessed_nested grows p

let witnessed_and (p q:trace_pred)
: Lemma (witnessed (fun s -> p s /\ q s) <==> (witnessed p /\ witnessed q))
= W.lemma_witnessed_and grows p q

let witnessed_or (p q:trace_pred)
: Lemma ((witnessed p \/ witnessed q) ==> witnessed (fun s -> p s \/ q s))
= W.lemma_witnessed_or grows p q

let witnessed_impl (p q:trace_pred)
: Lemma ((witnessed (fun s -> p s ==> q s) /\ witnessed p) ==> witnessed q)
= W.lemma_witnessed_impl grows p q

let witnessed_forall (#t:Type) (p:(t -> trace_pred))
: Lemma ((witnessed (fun s -> forall x. p x s)) <==> (forall x. witnessed (p x)))
= W.lemma_witnessed_forall grows p

let witnessed_exists (#t:Type) (p:(t -> trace_pred))
: Lemma ((exists x. witnessed (p x)) ==> witnessed (fun s -> exists x. p x s))
= W.lemma_witnessed_exists grows p

/// Trace predicates

(** Checks whether [entry] can be found at [trace_index] in the trace. *)
inline_for_extraction
let trace_entry_at_pred (n:timestamp) (e:entry_t) : (p:trace_pred{stable p}) =
  fun (s:trace) ->
  trace_len s > n /\
  Seq.index s n == e

(** Checks whether [entry] can be found at [trace_index] in the trace. This is a witnessing of the
trace_entry_at_pred*)
let trace_entry_at trace_index entry = witnessed (trace_entry_at_pred trace_index entry)

val trace_entry_at_pred_injective (n:timestamp) (e1:entry_t) (e2:entry_t) :
  Lemma (forall t. (trace_entry_at_pred n e1 t /\ trace_entry_at_pred n e2 t) ==> e1 == e2)
let trace_entry_at_pred_injective n e1 e2 = ()

(** Property of [entry_at]: If [entry_at i] is true for two entries (with the same [i]), then these
two entries are equal. *)
let trace_entry_at_injective i e1 e2 =
  let p : trace_pred = fun t -> trace_entry_at_pred i e1 t /\ trace_entry_at_pred i e2 t in
  let q : trace_pred = fun t -> e1 == e2 in
  witnessed_and (trace_entry_at_pred i e1) (trace_entry_at_pred i e2);
  assert (witnessed p);
  trace_entry_at_pred_injective i e1 e2;
  W.lemma_witnessed_weakening grows p q;
  assert (witnessed (fun t -> e1 == e2));
  witnessed_constant (e1 == e2)

let trace_entry_at_before_now idx et =
  assert(witnessed (trace_entry_at_pred idx et));
  let t0 = c_get() in
  recall (trace_entry_at_pred idx et);
  assert(trace_entry_at_pred idx et t0)


