/// Signal.DR
/// ===============
module Signal.DR

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open Signal.Messages
open Signal.Crypto
open Signal.Core
module A = LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open Signal.Sessions

val send_message : #i:nat -> p:principal -> peer:principal -> msg: msg_at i (readers [P p; P peer]) ->
    LCrypto nat (pki signal)
	    (requires (fun t0 -> i == trace_len t0))
	    (ensures (fun t0 _ t1 -> True))

val receive_message : #i:nat -> p:principal -> peer:principal -> msg_id:nat ->
    LCrypto (l:label & msg_at i l) (pki signal)
	    (requires (fun t0 -> i == trace_len t0))
	    (ensures (fun t0 (|l,m|) t1 -> A.can_flow i (readers [P p; P peer]) l))

