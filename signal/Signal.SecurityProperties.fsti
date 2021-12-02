/// Signal.SecurityProperties
/// ==========================
module Signal.SecurityProperties

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open AttackerAPI
open SecurityLemmas

open Signal.Messages
open Signal.Sessions
open Signal.Crypto
open Signal.Core

(* Message Secrecy *)
(* All messages handled by the high-level application APIs take message of the type:
     msg_at i (readers [P a; P b])
   Which means that these messages are expected to be sent on a confidential authenticated channel between a and b.
   The confidentiality guarantee for bytess of label (readers [P a; P b]) is as follows. *)

val msg_secret: i:nat -> a:principal -> b:principal -> m:lbytes signal_global_usage i (readers [P a; P b]) -> 
    LCrypto unit signal
    (requires fun t0 -> i == trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
      (is_unknown_to_attacker_at (trace_len t0) m \/
       corrupt_at (trace_len t0) (P a) \/
       corrupt_at (trace_len t0) (P b)))


(* Message Key Secrecy *)
(* The keys under which the application messages are encrypted enjoy stronger confidentiality properties,
   which encode our forward secrecy and post-compromise security guarantees *)

(* X3DH Secrecy Goals *)
(* This is the key used to encrypt Msg0 from initiator to responder.
   We consider the secrecy guarantees of this message from the viewpoint of both initiator and responder *)

let is_msg0_key_i (i:nat) (a:principal) (sid:nat) (b:principal) (k:bytes) =
  exists spk opk. is_signal_aead_key i k (x3dh_key_label_i a sid b spk opk)

let is_msg0_key_r (i:nat) (a:principal) (b:principal) (k:bytes) =
  exists sid spk opk. is_signal_aead_key i k (x3dh_key_label_r a sid b spk opk)

val x3dh_key_secret_i: i:nat -> a:principal -> sid:nat -> b:principal -> (spk:bytes)-> (opk:bytes) -> k:signal_msg0_key_i i a b sid spk opk -> LCrypto unit signal
    (requires fun t0 -> i == trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
      (is_unknown_to_attacker_at (trace_len t0) (fst k) \/
       corrupt_at (trace_len t0) (V a sid 0) \/
       corrupt_at (trace_len t0) (P b)))
val x3dh_key_secret_r: i:nat -> a:principal -> b:principal -> sid:nat -> spk:bytes -> opk:bytes -> k:signal_msg0_key_r i a b sid spk opk -> LCrypto unit signal
    (requires fun t0 -> i == trace_len t0 (*/\ is_msg0_key_r i a b k*))
    (ensures fun t0 _ t1 -> t0 == t1 /\
      (is_unknown_to_attacker_at (trace_len t0) (fst k) \/
       corrupt_at (trace_len t0) (P a) \/
       corrupt_at (trace_len t0) (P b)))

val x3dh_msg0_key_secret_r: i:nat -> a:principal -> b:principal -> sid:nat -> spk:bytes -> opk:bytes -> k:signal_msg0_key_r i a b sid spk opk -> LCrypto unit signal
    (requires fun t0 -> i == trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
      (is_unknown_to_attacker_at (trace_len t0) (fst k) \/ // if the k is known at t0
      ((corrupt_at (trace_len t0) (P a) \/         // then a \/ b must be compromised at t0
        corrupt_at (trace_len t0) (P b)) /\
       (corrupt_at i (P a) \/                      // and either a \/ b was compromised already at (i/t0) (when the key was created)
        corrupt_at i (P b) \/                      //     or either remote ephemeral key or (local onetime prekey/local signed prekey) must be compromised at t0
	(exists sid v rsid rv. corrupt_at (trace_len t0) (V a rsid rv) \/
			  corrupt_at (trace_len t0) (V b sid v))))))

(* Double Ratchet Secrecy Goals *)
(* Next we consider the key used to encrypt MsgN from one party to another.
   Notably, we need to prove the secrecy of this key for all values of N,
   which requires unbounded/inductive reasoning. In our framework, this proof
   relies on our secrecy invariants and labeled secrecy lemmas *)

let is_msg_n_key (i:nat) (r:role) (a:principal) (b:principal) (sid:nat) (v:nat) (k:bytes) =
  exists rk. is_ratcheted_root_key i r a b sid v rk false /\
	is_signal_aead_key i k (get_label signal_key_usages rk)


(* We prove that if the Nth message key is computable by the
   adversary, then the following compromise condition must hold.
   In particular, this condition says that if the Nth key is known
   to the adversary, then the following conditions hold:
   (1) some session of a or some session of b must be compromised, and
   (2) if the previous (N-1)th keys are secure, then a particular
       session and version of a or a particular session and version of b
       must have been compromised before.
   The guarantee (2) above is an encoding of forward and post-compromise security.

   Note that this compromise condition is itself recursive, and hence is
   something that again requires an inductive proof. *)

let rec ratcheted_compromise (i:nat) (j:nat) (r:role) (a:principal) (b:principal) (sid:nat) (v:nat) (recv:bool) : Tot Type0 (decreases (count (v,recv))) =
    later_than j i /\
    (
    if v = 0 && r = I then False
    else if v = 0 && r = R then
      (contains_corrupt_id cpred j [P a; P b])
    else if v = 1 && r = I then
      (contains_corrupt_id cpred j [P a; P b])
    else if recv = false then (
      (exists rsid rv. contains_corrupt_id cpred j
				[V a sid v; V b rsid rv])
    \/ (exists k. k<i /\ ratcheted_compromise k i r a b sid (v-1) true))
    else (
      (exists rsid rv. contains_corrupt_id cpred j
				[V a sid v; V b rsid rv])
    \/ (ratcheted_compromise i j r a b sid v false))
    )

val ratcheted_key_secret: i:nat -> r:role -> a:principal -> b:principal -> sid:nat -> v:nat -> k:bytes -> 
    LCrypto unit signal
    (requires fun t0 -> i == trace_len t0 /\ is_msg_n_key i r a b sid v k)
    (ensures fun t0 _ t1 -> t0 == t1 /\ 
			 (is_unknown_to_attacker_at (trace_len t0) k \/
			   ratcheted_compromise i (trace_len t0) r a b sid v false))

