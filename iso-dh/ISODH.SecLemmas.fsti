/// ISODH.SecLemmas
/// ====================
module ISODH.SecLemmas

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open AttackerAPI
open ISODH.Messages
open ISODH.Sessions
open ISODH.Protocol
open SecurityLemmas

val initiator_correspondence_lemma: i:nat -> a:principal -> b:principal -> gx:bytes -> gy:bytes -> k:bytes -> 
    LCrypto unit (pki isodh)
    (requires (fun t0 -> i < trace_len t0 /\ did_event_occur_at i a (finishI a b gx gy k)))
    (ensures (fun t0 _ t1 -> t0 == t1 /\ (corrupt_at i (P b) \/
			  (exists y. did_event_occur_before i b (respond a b gx gy y) /\ k == (CryptoLib.dh y gx)))))

val responder_correspondence_lemma: i:nat -> a:principal -> b:principal -> gx:bytes -> gy:bytes -> k:bytes ->  
    LCrypto unit (pki isodh)
    (requires (fun t0 -> i < trace_len t0 /\ did_event_occur_at i b (finishR a b gx gy k)))
    (ensures (fun t0 _ t1 -> t0 == t1 /\ (corrupt_at i (P a) \/ did_event_occur_before i a (finishI a b gx gy k))))

val key_secrecy_lemma : k:bytes -> a:principal -> b:principal -> 
    LCrypto unit (pki isodh) 
    (requires (fun _ -> True))
    (ensures (fun t0 _ t1 -> t0 == t1 /\ (forall si sj vi vj. is_labeled isodh_global_usage (trace_len t0) k (join (readers [V a si vi]) (readers [V b sj vj])) ==> 
			  (corrupt_at (trace_len t0) (V a si vi) \/ corrupt_at (trace_len t0) (V b sj vj) \/ is_unknown_to_attacker_at (trace_len t0) k))))

val initiator_forward_secrecy_lemma: i:nat -> a:principal -> b:principal -> gx:bytes -> gy:bytes -> k:bytes -> 
    LCrypto unit (pki isodh)
    (requires (fun t0 -> i < trace_len t0 /\ did_event_occur_at i a (finishI a b gx gy k)))
    (ensures (fun t0 _ t1 -> t0 == t1 /\ (corrupt_at i (P b) \/ 
	     (exists si sj vi vj. is_labeled isodh_global_usage i k (join (readers [V a si vi]) (readers [V b sj vj])) /\ 
			     (corrupt_at (trace_len t0) (V a si vi) \/ corrupt_at (trace_len t0) (V b sj vj) \/ is_unknown_to_attacker_at (trace_len t0) k)))))

val responder_forward_secrecy_lemma: i:nat -> a:principal -> b:principal -> gx:bytes -> gy:bytes -> k:bytes ->  
    LCrypto unit (pki isodh)
    (requires (fun t0 -> i < trace_len t0 /\ did_event_occur_at i b (finishR a b gx gy k)))
    (ensures (fun t0 _ t1 -> t0 == t1 /\ (corrupt_at i (P a) \/ 
	     (exists si sj vi vj. is_labeled isodh_global_usage i k (join (readers [V b si vi]) (readers [V a sj vj])) /\ 
			     (corrupt_at (trace_len t0) (V b si vi) \/ corrupt_at (trace_len t0) (V a sj vj) \/ is_unknown_to_attacker_at (trace_len t0) k)))))


