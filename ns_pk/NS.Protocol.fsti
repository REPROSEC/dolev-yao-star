/// NS.Protocol
/// =============
module NS.Protocol

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
module A = AttackerAPI
open NS.Messages
open NS.Sessions

(*
Needham-Schroeder Public Key Protocol

A -> B: {N_A, A}K_PB    msg 1
B -> A: {N_A, N_B}K_PA  msg 2 
A -> B: {N_B}K_PA       msg 3

*)

val initiator_send_msg_1:
  a:principal ->
  b:principal ->
  LCrypto (si:nat * mi:nat) (pki ns)
  (requires fun t0 -> True)
  (ensures (fun t0 (si,i) t1 ->
	    trace_len t1 > trace_len t0 /\
	    i == trace_len t1 - 1))

val responder_send_msg_2:
  b:principal ->
  msg_idx: nat -> //index of the input message in trace
  LCrypto (si:nat * mi:nat) (pki ns)
  (requires fun t0 ->  True)
  (ensures (fun t0 (si,i) t1 ->
	   trace_len t1 > trace_len t0 /\
	    i == trace_len t1 - 1 ))

val initiator_send_msg_3:
  a:principal ->
  idx_init_session:nat ->
  msg_idx: nat -> //index of the input message in trace
  LCrypto nat (pki ns)
  (requires fun t0 -> True)
  (ensures (fun t0 i t1 ->
    trace_len t1 > trace_len t0 /\
    i == trace_len t1 - 1))

val responder_receive_msg_3:
   b:principal ->
   idx_resp_session:nat ->
   msg_idx: nat -> //index of the input message in trace
   LCrypto unit (pki ns)
   (requires fun t0 -> True)
   (ensures fun t0 _ t1 -> True)

val nonce_secrecy_test:
  a:principal ->
  b:principal ->
  idx_init_session:nat ->
  test_n_b:bytes ->
  LCrypto unit (pki ns)
  (requires (fun t0 -> A.attacker_knows_at (trace_len t0) test_n_b))
  (ensures (fun t0 _ t1 -> True))
