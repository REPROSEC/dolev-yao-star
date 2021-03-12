/// ISOKem.Protocol
/// ================
module ISOKem.Protocol

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open ISOKem.Messages
open ISOKem.Sessions

(* Protocol API *)

val initiator_send_msg_1:
  a:principal ->
  b:principal ->
  LCrypto (idx_msg:nat * idx_session:nat) (pki isokem)
  (requires (fun _ -> True))
  (ensures (fun t0 (i,si) t1 ->
	    trace_len t1 > trace_len t0 /\
	    i == trace_len t1 - 1))

val responder_send_msg_2:
  b:principal ->
  idx_msg:nat ->
  LCrypto (idx_msg':nat * idx_session:nat) (pki isokem)
  (requires (fun _ -> True))
  (ensures (fun t0 (i,si) t1 ->
	   trace_len t1 > trace_len t0 /\
	    i == trace_len t1 - 1 ))

val initiator_send_msg_3:
  a:principal ->
  idx_session:nat ->
  idx_msg:nat ->
  LCrypto (idx_msg':nat) (pki isokem)
  (requires (fun _ -> True))
  (ensures (fun t0 i t1 ->
    trace_len t1 > trace_len t0 /\
    i == trace_len t1 - 1))

val responder_accept_msg_3:
  b:principal ->
  idx_session:nat ->
  idx_msg:nat ->
  LCrypto unit (pki isokem)
  (requires (fun _ -> True))
  (ensures (fun _ _ _ -> True))

