/// Signal.X3DH
/// =================
(**
Inferface of X3DH protocol
For common signal functions, looking at Spec.Signal.Protocol
*)
module Signal.X3DH

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

val x3dh_initialize_state : p:principal -> peer:principal -> 
    LCrypto unit (pki signal)
	    (requires fun t0 -> True)
	    (ensures fun t0 r t1 -> later_than (trace_len t1) (trace_len t0))
	    
(**
send the initiate message to the wire, return the message index
*)
val x3dh_initiate : #i:nat -> p:principal -> peer:principal -> msg:msg_at i (readers [P p; P peer]) ->
		    LCrypto (msg_idx:nat * sess_idx:nat) (pki signal)
			    (requires (fun t0 -> i == trace_len t0))
			    (ensures (fun t0 (msg_idx,sess_idx) t1 -> True))

(**
return a root key rk_0, can be used to start double rachet
*)
val x3dh_respond : #i:nat -> p:principal -> msg_idx:nat ->
		   LCrypto (peer:principal & l:label & msg:msg_at i l & nat) (pki signal)
			   (requires (fun t0 -> i == trace_len t0))
			   (ensures (fun t0 (|peer,l,msg,sid|) t1 -> A.can_flow i (readers [P p; P peer]) l))

