/// NSL.SecurityProperties
/// =======================
module NSL.SecurityProperties

open SecrecyLabels
open CryptoEffect
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open AttackerAPI
open NSL.Sessions
open NSL.Messages
open NSL.Protocol
open SecurityLemmas

val is_n_b_in_b_state:
  a:principal ->
  b:principal ->
  idx_setstate:nat ->
  v_b:version_vec ->
  state_b:state_vec ->
  idx_sess:nat ->
  n_b:bytes ->
  Type0 
  
val n_b_is_secret:
  #a:principal ->
  #b:principal ->
  #idx_setstate:nat ->
  #v_b:version_vec ->
  #state_b:state_vec ->
  #idx_sess:nat ->
  n_b:bytes ->
  LCrypto unit (pki nsl)
  (requires fun t0 -> idx_setstate <= trace_len t0 /\ is_n_b_in_b_state a b idx_setstate v_b state_b idx_sess n_b)
  (ensures fun t0 _ t1 -> t0 == t1 /\
    (is_unknown_to_attacker_at (trace_len t0) n_b \/
     contains_corrupt_id cpred (trace_len t0) ([P a; P b])))

val is_n_b_in_a_state:
  a:principal ->
  b:principal ->
  idx_setstate:nat ->
  v_a:version_vec ->
  state_a:state_vec ->
  idx_sess:nat ->
  n_b:bytes ->
  Type0

val n_b_in_a_state_is_secret:
  #a:principal ->
  #b:principal ->
  #idx_setstate:nat ->
  #v_a:version_vec ->
  #state_a:state_vec ->
  #idx_sess:nat ->
  n_b:bytes ->
  LCrypto unit (pki nsl)
  (requires fun t0 -> idx_setstate <= trace_len t0 /\ is_n_b_in_a_state a b idx_setstate v_a state_a idx_sess n_b)
  (ensures fun t0 _ t1 -> t0==t1 /\
		     (is_unknown_to_attacker_at (trace_len t0) n_b \/
		      contains_corrupt_id cpred (trace_len t0) [P a; P b]))

val initiator_authentication: i:nat -> LCrypto unit (pki nsl)
    (requires fun t0 -> i < trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
	     (forall a b n_a n_b. did_event_occur_at i a (finishR a b n_a n_b) ==>
			     (corrupt_id i (P a) \/ corrupt_id i (P b) \/ did_event_occur_before i a (finishI a b n_a n_b))))

val responder_authentication: i:nat -> LCrypto unit (pki nsl)
    (requires fun t0 -> i < trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
	     (forall a b n_a n_b. did_event_occur_at i a (finishI a b n_a n_b) ==>
			     (corrupt_id i (P a) \/ corrupt_id i (P b) \/ did_event_occur_before i b (respond a b n_a n_b))))

