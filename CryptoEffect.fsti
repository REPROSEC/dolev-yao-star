module CryptoEffect

open SecrecyLabels
open CryptoLib

(* The global trace is a monotonic list of entries *)
(* The type of entries is defined as follows *)
type event = string & list bytes
type session_state = bytes
type state_vec = Seq.seq session_state
type version_vec = Seq.seq nat

noeq type entry_t =
  | RandGen: b:bytes -> l:label -> u:usage -> entry_t
  | SetState: principal -> v:version_vec -> new_state:state_vec -> entry_t
  | Corrupt: corrupted_principal:principal -> session:nat -> version:nat -> entry_t
  | Event: sender:principal -> event -> entry_t
  | Message: sender:principal -> receiver:principal -> message:bytes -> entry_t

type trace = Seq.seq entry_t
let trace_len t = Seq.length t


(* To encode monotonic traces, we define a new effect called Crypto.
   The following is the machinery that F* needs to enforce the monadic rules for this effect *)

(* The trace grows monotnically *)
let grows : Preorder.preorder trace =
  fun (s1:trace) (s2:trace) ->
  trace_len s1 <= trace_len s2 /\
  (forall (i:nat).{:pattern (Seq.index s1 i) \/ (Seq.index s2 i)}
            i < trace_len s1 ==> Seq.index s1 i == Seq.index s2 i)

(* Pre-conditions for functions with the Crypto effect *)
type pre_t = trace -> Type0

(* Post-conditions for functions with the Crypto effect *)
type post_t (a:Type) = result a -> trace -> Type0

(* Weakest preconditions for functions with the Crypto effect *)
type wp_t (a:Type) =
  wp:(post_t a -> pre_t){
    forall (p q:post_t a). (
      forall (r:result a) (s:trace). p r s ==> q r s
    ) ==> (
      forall (s:trace). wp p s ==> wp q s
    )
  }

(* A concrete low-level representation of Crypto functions as a state-passing function *)
type repr (a:Type) (wp:wp_t a) =
  s0:trace ->
  PURE
  (result a & trace)
  (fun (postcond:pure_post (result a & trace)) ->
    let crypto_postcond:post_t a = fun (x:result a) s1 -> grows s0 s1 ==> postcond (x, s1) in
    let crypto_precond:pre_t = wp crypto_postcond in
    let pure_precond:pure_pre = crypto_precond s0 in
    pure_precond
  )

(* Return a value from a Crypto computation *)
unfold
let return_wp (a:Type) (x:a) : wp_t a = fun p -> p (Success x)

inline_for_extraction
let return (a:Type) (x:a)
: repr a (return_wp a x)
= fun s0 -> Success x, s0

(* Sequential composition between effectful computations *)
unfold
let bind_wp (#a:Type) (#b:Type) (wp_f:wp_t a) (wp_g:a -> wp_t b) : wp_t b =
  fun (p:post_t b) s0 -> wp_f (fun (x:result a) s1 ->
    (Error? x ==> p (Error (Error?.e x)) s1) /\
    (Success? x ==> (wp_g (Success?.v x)) p s1)) s0

inline_for_extraction
let bind_c (a:Type) (b:Type)
  (wp_f:wp_t a) (wp_g:a -> wp_t b)
  (f:repr a wp_f) (g:(x:a -> repr b (wp_g x)))
: repr b (bind_wp wp_f wp_g)
= fun s0 ->
  let x, s1 = f s0 in
  match x with
  | Error e -> Error e, s1
  | Success x -> (g x) s1

(* Sub-computations for layering pure computations within Crypto *)
inline_for_extraction
let subcomp (a:Type)
  (wp_f:wp_t a) (wp_g:wp_t a)
  (f:repr a wp_f)
: Pure (repr a wp_g)
  (requires forall (p:post_t a) s. wp_g p s ==> wp_f p s)
  (ensures fun _ -> True)
= f

(* If-then-else for effectful computations *)
unfold
let if_then_else_wp (#a:Type) (wp_then wp_else:wp_t a) (p:bool) : wp_t a =
  fun post s0 ->
    (p ==> wp_then post s0) /\
    ((~ p) ==> wp_else post s0)

inline_for_extraction
let if_then_else (a:Type)
  (wp_then:wp_t a) (wp_else:wp_t a)
  (f:repr a wp_then) (g:repr a wp_else)
  (p:bool)
: Type
= repr a (if_then_else_wp wp_then wp_else p)

(* Definition of the CRYPTO effect *)
total reifiable reflectable
layered_effect {
  CRYPTO : a:Type -> wp_t a -> Effect
  with
  repr = repr;
  return = return;
  bind = bind_c;
  subcomp = subcomp;
  if_then_else = if_then_else
}


(* A lifting of PURE computations into CRYPTO *)
unfold
let lift_pure_crypto_wp (#a:Type) (wp:pure_wp a) : wp_t a =
  FStar.Monotonic.Pure.wp_monotonic_pure ();
  fun p s0 -> wp (fun x -> p (Success x) s0)

inline_for_extraction
let lift_pure_dyerror (a:Type) (wp:pure_wp a) (f:eqtype_as_type unit -> PURE a wp)
: repr a (lift_pure_crypto_wp wp)
= FStar.Monotonic.Pure.wp_monotonic_pure ();
  fun s0 -> Success (f ()), s0

sub_effect PURE ~> CRYPTO = lift_pure_dyerror

(* An abbreviation Crypto of the CRYPTO effect with a nicer pre-post formulation *)
effect Crypto (a:Type) (req:trace -> Type0) (ens:(s0:trace{req s0} -> result a -> trace -> Type0)) =
  CRYPTO a (fun post s0 -> req s0 /\
    (forall (x:result a) (s1:trace). ens s0 x s1 ==> post x s1))

(* A predicate saying that a certain entry holds at a certain trace index *)
val trace_entry_at (trace_index:nat) (entry:entry_t) : Type0
let trace_entry_before (j:nat) (e:entry_t) =
  exists (trace_index:nat). trace_index <= j /\ trace_entry_at trace_index e


(** Property of [trace_entry_at]: If [trace_entry_at i] is true for two entries (with the same [i]), then these
two entries are equal. *)
val trace_entry_at_injective: i:nat -> e1:entry_t -> e2:entry_t ->
  Lemma (requires (trace_entry_at i e1 /\ trace_entry_at i e2))
        (ensures (e1 == e2))
        [SMTPat (trace_entry_at i e1); SMTPat (trace_entry_at i e2)]

let trace_entry_at_injective_forall n:
  Lemma (forall e1 e2. trace_entry_at n e1 /\ trace_entry_at n e2 ==> e1 == e2) = ()

val trace_entry_at_before_now: idx:nat -> et:entry_t -> Crypto unit
  (requires fun t0 -> trace_entry_at idx et)
  (ensures fun t0 _ t1 ->  t0 == t1 /\ idx < trace_len t1)

