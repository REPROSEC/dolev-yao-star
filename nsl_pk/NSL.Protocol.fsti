/// NSL.Protocol
/// =============
module NSL.Protocol

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open NSL.Messages
open NSL.Sessions

(*
Needham-Schroeder-Lowe Fixed Public Key Protocol [2]

A -> B: {N_A, A}K_PB       msg 1
B -> A: {N_A, N_B, B}K_PA  msg 2 -- note addition of B
A -> B: {N_B}K_PA          msg 3

[2] Gavin Lowe. "Breaking and fixing the Needham-Schroeder Public-Key
    Protocol using FDR". TACAS, pp 147-166, 1996.
*)

val initiator_send_msg_1:
  a:principal ->
  b:principal ->
  LCrypto (si:nat * mi:nat) (pki nsl)
  (requires fun t0 -> True)
  (ensures fun t0 msg_idx t1 -> True)

val responder_send_msg_2:
  b:principal ->
  msg_idx: nat -> //index of the input message in trace
  LCrypto (si:nat * mi:nat) (pki nsl)
  (requires fun t0 ->  True)
  (ensures fun t0 idx t1 -> True)

val initiator_send_msg_3:
  a:principal ->
  idx_init_session:nat ->
  msg_idx: nat -> //index of the input message in trace
  LCrypto nat (pki nsl)
  (requires fun t0 -> True)
  (ensures fun t0 _ t1 -> True)

val responder_receive_msg_3:
   b:principal ->
   idx_resp_session:nat ->
   msg_idx: nat -> //index of the input message in trace
   LCrypto unit (pki nsl)
   (requires fun t0 -> True)
   (ensures fun t0 _ t1 -> True)

