module AttackerAPI

open SecrecyLabels
open CryptoLib
open CryptoEffect
open GlobalRuntimeLib

(**
Predicate on attacker knowledge: Returns true iff the attacker can derive
a term in a given number of steps after the first i entries in the trace.
*)

let was_published_at (idx:nat) (b:bytes) =
  exists p1 p2. was_message_sent_at idx p1 p2 b

let was_published_before (idx:nat) (b:bytes) =
  exists j. later_than idx j /\ was_published_at j b

val query_result: idx_state:timestamp -> p:principal -> si:nat -> sv:nat -> res:bytes -> Type0
val attacker_can_derive: idx:timestamp -> steps:nat -> t:bytes -> Type0

/// Properties of the Attacker Knowledge
/// ------------------------------------


/// If a specific version of a session of a principal is corrupted, then the attacker can derive the state value immediately, i.e., in zero steps.

(**
If the versions ver_vec of the sessions of the principal were set to state_at_j, and if this version of the session is corrupted,
then the attacker can derive the content of the version immediately, i.e., in zero steps.
*)
val attacker_can_query_compromised_state:
    idx_state:nat -> idx_corrupt:nat -> idx_query:nat ->
    principal:principal -> sess_index:nat -> sess_ver:nat ->
    res:bytes ->
  Lemma
    (requires
      ( idx_state < idx_query /\
	idx_corrupt < idx_query /\
	query_result idx_state principal sess_index sess_ver res /\ //at idx_state, the principals state was set to state
        was_corrupted_before idx_corrupt principal sess_index sess_ver
      )
    )
    (ensures (attacker_can_derive idx_query 0 res))

/// If the attacker can derive a term in some steps, he can also derive it in more steps.

(**
If the attacker can derive a term t in position i of the trace with steps1 many steps,
then he can also derive t with a higher number of steps steps2.
*)
val attacker_can_derive_in_more_steps: i:nat -> steps1:nat -> steps2:nat ->
  Lemma (requires (steps1 <= steps2))
        (ensures (forall t. attacker_can_derive i steps1 t  ==> attacker_can_derive i steps2 t))

/// If the attacker can derive a term in some steps, he can also derive it in more steps.

(**
If the attacker can derive a term t in position i of the trace,
he can also derive t at a higher position in the trace (with the same number of steps).
*)
val attacker_can_derive_later: i:nat -> steps:nat -> j:nat ->
  Lemma (requires (i <= j))
        (ensures (forall t. attacker_can_derive i steps t ==> attacker_can_derive j steps t))
        (decreases steps)

/// Predicates
/// ----------

(**
The attacker knows a term t at the position i in the trace if
it is derivable by the attacker (for some number of steps).
*)
let attacker_knows_at (i:nat) (t:bytes) =
  exists (steps:nat). attacker_can_derive i steps t

(**
A term t is a secret at the position i in the trace if
it is not known to the attacker.
*)
let is_unknown_to_attacker_at (i:nat) (t:bytes) =
  ~ (attacker_knows_at i t)

val attacker_knows_later: i:nat -> j:nat ->
  Lemma (requires (later_than j i))
        (ensures (forall a. attacker_knows_at i a ==> attacker_knows_at j a))
	[SMTPat (later_than j i); SMTPat (attacker_knows_at i)]

/// API for Attacker
/// ----------------
///
/// These are the functions that are **at least** available to the attacker,
/// i.e., if the typecheck is successfull, we know that the attacker can perform these actions.
///
/// However, this API does not define the attacker that we are talking about in the proof, i.e., we do not show that the protocol is secure wrt. all attackers having access to exactly this API.

/// Attacker API: Manipulation of Terms:
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///
  
(**
A pub_bytes is a term that is known to the attacker (in position i of the trace).
*)
let pub_bytes (i:nat) = t:bytes{attacker_knows_at i t}

let pub_bytes_later (i:nat) (j:nat{i<=j}) (t:pub_bytes i) : pub_bytes j =
    attacker_knows_later i j;
    t

module C = CryptoLib
val literal_to_pub_bytes: l:literal -> pub_bytes 0
val literal_to_pub_bytes_lemma: l:literal ->
  Lemma (literal_to_pub_bytes l == C.literal_to_bytes l)

val pub_bytes_to_literal: #i:nat -> pub_bytes i -> result literal
val pub_bytes_to_literal_lemma: #i:nat -> p:pub_bytes i ->
  Lemma (match pub_bytes_to_literal #i p with
	 | Success r -> Success r == C.bytes_to_literal p
	 | _ -> True)

val concat: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> pub_bytes i
val concat_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i ->
  Lemma (concat t1 t2 == C.concat t1 t2)

val split: #i:nat -> t:pub_bytes i -> result (pub_bytes i * pub_bytes i)
val split_lemma (#i:nat) (t:pub_bytes i) :
  Lemma (match split #i t with
	 | Success (b1,b2) -> C.split t == Success (b1,b2)
	 | _ -> True)

val pk: #i:nat -> s:pub_bytes i -> pub_bytes i
val pk_lemma: #i:nat -> s:pub_bytes i -> Lemma (pk s == C.pk s)

val pke_enc: #i:nat -> pub_bytes i -> pub_bytes i -> pub_bytes i
val pke_enc_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i ->
  Lemma (pke_enc t1 t2 == C.pke_enc t1 t2)

val pke_dec: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> result (pub_bytes i)
val pke_dec_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i ->
  Lemma (match pke_dec t1 t2 with
         | Success p -> C.pke_dec t1 t2 == Success p
         | Error s -> C.pke_dec t1 t2 == Error s)

val aead_enc: #i:nat -> pub_bytes i -> pub_bytes i -> pub_bytes i -> pub_bytes i
val aead_enc_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> t3:pub_bytes i ->
  Lemma (aead_enc t1 t2 t3 == C.aead_enc t1 t2 t3)

val aead_dec: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> t3:pub_bytes i -> result (pub_bytes i)
val aead_dec_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> t3:pub_bytes i ->
  Lemma (match aead_dec t1 t2 t3 with
	| Success p -> C.aead_dec t1 t2 t3 == Success p
        | Error s -> C.aead_dec t1 t2 t3 == Error s)

val sign: #i:nat -> pub_bytes i -> pub_bytes i -> pub_bytes i
val sign_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i ->
  Lemma (sign t1 t2 == C.sign t1 t2)
val verify: #i:nat -> pub_bytes i -> pub_bytes i -> pub_bytes i -> bool
val verify_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i -> t3:pub_bytes i ->
  Lemma (verify t1 t2 t3 == C.verify t1 t2 t3)

val mac: #i:nat -> pub_bytes i -> pub_bytes i -> pub_bytes i
val mac_lemma: #i:nat -> t1:pub_bytes i -> t2:pub_bytes i ->
  Lemma (mac t1 t2 == C.mac t1 t2)

val hash: #i:nat -> pub_bytes i -> pub_bytes i
val hash_lemma: #i:nat -> t1:pub_bytes i ->
  Lemma (hash t1 == C.hash t1)


/// Attacker API: Manipulation of Trace:
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
///

val global_timestamp: unit -> Crypto timestamp
                      (requires (fun h -> True))
                      (ensures (fun t0 r t1 -> t0 == t1 /\ r == Success (trace_len t0)))

// used for abbreviating the postconditions below
let attacker_modifies_trace (t0:trace) (t1:trace) =
  (((exists u n. trace_len t1 = trace_len t0 + 2 /\
           was_rand_generated_at (trace_len t0) n public u /\
           was_published_at (trace_len t0 + 1) n) \/
    (exists i a. trace_len t1 = trace_len t0 + 1 /\
            i <= trace_len t0 /\
            attacker_knows_at i a /\
            was_published_at (trace_len t0) a) \/
    (exists p s v.   trace_len t1 = trace_len t0 + 1 /\
           was_corrupted_at (trace_len t0) p s v)))


val pub_rand_gen: u:C.usage -> Crypto (i:nat & pub_bytes i)
                      (requires (fun t0 -> True))
                      (ensures (fun t0 s t1 ->
			match s with
			| Error _ -> True
			| Success (| i, n |) ->
                          attacker_modifies_trace t0 t1 /\
                          i = trace_len t1 /\
			  later_than (trace_len t1) (trace_len t0) /\
                          trace_len t1 = trace_len t0 + 2 /\
                          was_rand_generated_at (trace_len t0) n public u /\
                          was_published_at (trace_len t0 + 1) n))

val send: #i:nat -> p1:principal -> p2:principal -> a:pub_bytes i -> Crypto nat
                      (requires (fun t0 -> i <= trace_len t0))
                      (ensures (fun t0 n t1 ->
			match n with
			| Error _ -> t0 == t1
			| Success n ->
                          attacker_modifies_trace t0 t1 /\
                          trace_len t1 = trace_len t0 + 1 /\
			  later_than (trace_len t1) (trace_len t0) /\
			  n = trace_len t0 /\
                          was_published_at (trace_len t0) a))

val receive_i: i:nat -> p2:principal -> Crypto (j:nat & pub_bytes j)
                      (requires (fun t0 -> i < trace_len t0))
                      (ensures (fun t0 t t1 ->
                        t0 == t1 /\
			(match t with
			 | Error _ -> True
			 | Success (|j,m|) ->
			   trace_len t0 = j /\ was_published_at i m /\
                           (exists p1 p2. was_message_sent_at i p1 p2 m))))

val compromise: p:principal -> s:nat -> v:nat -> Crypto nat
                (requires (fun t0 -> True))
                (ensures (fun t0 r t1 ->
			match r with
			| Error _ -> t0 == t1
			| Success r ->
				  r == trace_len t0 /\
				  attacker_modifies_trace t0 t1 /\
				  trace_len t1 = trace_len t0 + 1 /\
				  later_than (trace_len t1) (trace_len t0) /\
				  was_corrupted_at (trace_len t0) p s v))

val query_state_i: idx_state:nat -> idx_corrupt:nat -> idx_query:nat ->
		   p:principal -> si:nat -> sv:nat ->
		   Crypto (pub_bytes idx_query)
                  (requires (fun t0 -> idx_state < idx_query /\
				    idx_corrupt < idx_query /\
				    idx_query <= trace_len t0 /\
				    was_corrupted_at idx_corrupt p si sv))
                  (ensures (fun t0 r t1 ->
                        t0 == t1 /\
			later_than (trace_len t1) (trace_len t0) /\
                        (match r with
                         | Error _ -> True
                         | Success x -> query_result idx_state p si sv x)))


