/// Signal.Core
/// ========================================
module Signal.Core

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open LabeledCryptoAPI
open Signal.Messages
open Signal.Crypto

val msg0_can_flow_i: i:nat -> p:principal -> sid:nat -> peer:principal -> ek0:msg_at i public -> ek1:msg_at i public ->
  Lemma (can_flow i (readers [P p; P peer]) (x3dh_key_label_i p sid peer ek0 ek1))
  [SMTPat (can_flow i (readers [P p; P peer]) (x3dh_key_label_i p sid peer ek0 ek1))]

val msg0_can_flow_r: i:nat -> p:principal -> sid:nat -> peer:principal -> ek0:msg_at i public -> ek1:msg_at i public ->
  Lemma (can_flow i (readers [P p; P peer]) (x3dh_key_label_r p sid peer ek0 ek1))
  [SMTPat (can_flow i (readers [P p; P peer]) (x3dh_key_label_r p sid peer ek0 ek1))]

val dh_secret_label0_can_flow: i:nat -> p:principal -> si:nat -> their_ephemeral_pub_key:bytes ->
  Lemma (can_flow i (dh_secret_label0 p their_ephemeral_pub_key)  (readers [V p si 0]))

val initiate: #i:nat -> #p:principal -> #sid:nat -> #peer:principal ->
    (our_identity_priv_key: signal_identity_key i (readers [P p]) ) ->
    (our_ephemeral_priv_key0: signal_onetimepre_key i (readers [V p sid 0])) ->
    (our_ephemeral_priv_key1: signal_onetimepre_key i (readers [V p sid 1])) ->
    (their_identity_pub_key: signal_identity_pub_key i (readers [P peer])) ->
    (their_signed_pub_key: msg_at i public{
      (can_flow i (readers [P peer]) public \/
       is_signal_dh_public_key i their_signed_pub_key (readers [P peer]) "Signal.signed_pre_key")}) ->
    (their_onetime_pub_key:msg_at i public) ->
    (r:((*signal_aead_key i (x3dh_key_label_i p sid peer their_signed_pub_key their_onetime_pub_key)*) 
        signal_msg0_key_i i p peer sid their_signed_pub_key their_onetime_pub_key *
	signal_root_key i (dh_secret_label p sid 1 their_signed_pub_key) *
	signal_chain_key i (dh_secret_label p sid 1 their_signed_pub_key)){
	let (aek, rk, ck) = r in 
	is_msg signal_global_usage i rk (readers [V p sid 1]) /\
	is_msg signal_global_usage i ck (readers [V p sid 1]) /\
	is_signal_root_key i rk (get_label signal_key_usages rk) /\
	is_signal_chain_key i ck (get_label signal_key_usages rk) /\
	is_ratcheted_root_key i I p peer sid 1 rk false})

val respond: #i:nat -> #p:principal -> #sid:nat -> #sid':nat -> #peer:principal ->
    (our_identity_priv_key: signal_identity_key i (readers [P p])) ->
    (our_signed_priv_key: signal_signedpre_key i (readers [P p])) ->
    (our_onetime_priv_key: signal_onetimepre_key i (readers [V p sid 0])) ->
    (their_identity_pub_key: signal_identity_pub_key i (readers [P peer])) ->
    (their_ephemeral_pub_key0:msg_at i public) ->
    (their_ephemeral_pub_key1:msg_at i public) ->
    (r:((*signal_aead_key_iv i (x3dh_key_label_r p sid peer their_ephemeral_pub_key0 their_ephemeral_pub_key1)*)
    signal_msg0_key_r i p peer sid  their_ephemeral_pub_key0 their_ephemeral_pub_key1 &
		 signal_root_key i (dh_secret_label0 p their_ephemeral_pub_key1) &
		 signal_chain_key i (dh_secret_label0 p their_ephemeral_pub_key1)){
	let (aek,rk,ck) = r in 
	     is_msg signal_global_usage i rk (readers [V p sid' 0]) /\
	     is_msg signal_global_usage i ck (readers [V p sid' 0]) /\
	     is_signal_root_key i rk (get_label signal_key_usages rk) /\
	     is_signal_chain_key i ck (get_label signal_key_usages rk)})

val dh_ratchet : #i:nat -> #l:label -> #l':label ->
    (root_key:signal_root_key i l) ->
    (our_ephemeral_priv_key:signal_onetimepre_key i l') ->
    (their_ephemeral_pub_key:msg_at i public) ->
    (r:(signal_aead_key_iv i (kdf_meet l (join l' (get_dhkey_label signal_key_usages their_ephemeral_pub_key))) &
		 signal_root_key i ((join l' (get_dhkey_label signal_key_usages their_ephemeral_pub_key))) &
		 signal_chain_key i ((join l' (get_dhkey_label signal_key_usages their_ephemeral_pub_key)))){
	let (aek,rk,ck) = r in 
		    is_msg signal_global_usage i rk l' /\
		    is_msg signal_global_usage i ck l' /\
		    is_signal_root_key i rk (get_label signal_key_usages rk) /\
		    is_signal_chain_key i ck (get_label signal_key_usages rk)})

val kdf_ratchet : #i:nat -> #l:label ->
    (signal_chain_key i l) ->
    Tot (signal_aead_key_iv i l &
	 signal_chain_key i l)

val encrypt: #i:nat -> #l:label -> #p:principal -> #si:nat -> #vi:nat ->
    (our_identity_pub_key:signal_identity_pub_key i (readers [P p])) ->
    (their_identity_pub_key:msg_at i public) ->
    (msg_key:signal_aead_key_iv i l) ->
    (our_ephemeral_pub_key:signal_onetimepre_pub_key i (readers [V p si vi])) ->
    (prev_counter:nat) -> (counter:nat) ->
    (plaintext:msg_at i l) ->
    Tot (msg_at i public)

val decrypt: #i:nat -> #l:label ->
    (our_identity_pub_key:msg_at i public) ->
    (their_identity_pub_key:msg_at i public) ->
    (their_ephemeral_pub_key:msg_at i public) ->
    (msg_key:signal_aead_key_iv i l) ->
    (prev_counter:nat) -> (counter:nat) ->
    (ciphertext:msg_at i public)  ->
    Pure (result (msg_at i l))
	 (requires True)
	 (ensures (fun r -> match r with
		  | Success m -> (can_flow i l public \/
					  (exists p si v. get_dhkey_label signal_key_usages their_identity_pub_key == readers [P p] /\
					     get_dhkey_label signal_key_usages their_ephemeral_pub_key == readers [V p si v]))
		  | _ -> True))

(**
this version is used after calling dh_ratchet
*)
val decrypt0: #i:nat -> #l:label -> #l':label -> #peer:principal ->
    (our_identity_pub_key:msg_at i public) ->
    (their_identity_pub_key:signal_identity_pub_key i (readers [P peer])) ->
    (their_ephemeral_pub_key: msg_at i public) ->
    (msg_key:signal_aead_key_iv i (kdf_meet l l')) ->
    (prev_counter:nat) -> (counter:nat) ->
    (ciphertext:msg_at i public)  ->
    Pure (result (msg_at i (kdf_meet l l')))
	 (requires True)
	 (ensures (fun r -> match r with
			 | Success m -> (can_flow i (kdf_meet l l') public \/
			   (exists si v. get_dhkey_label signal_key_usages their_ephemeral_pub_key == readers [V peer si v]))
			 | _ -> True))

val dh_ratchet_encrypt: #i:nat -> #j:nat{j<i} ->  #l:label -> #r:role -> #p:principal -> #peer:principal -> #si:nat -> #vi:nat ->
    (root_key:signal_root_key i l{is_ratcheted_root_key j r p peer si vi root_key true}) ->
    (our_identity_pub_key:signal_identity_pub_key i (readers [P p])) ->
    (their_identity_pub_key:msg_at i public) ->
    (our_ephemeral_priv_key:signal_onetimepre_key i (readers [V p si (vi+1)])) ->
    (their_ephemeral_pub_key:msg_at i public{
				    (can_flow i (get_label signal_key_usages root_key) public \/
				    (exists rsid rv. get_dhkey_label signal_key_usages their_ephemeral_pub_key == readers [V peer rsid rv]))}) ->
    (prev_counter:nat) -> (counter:nat) ->
    (plaintext:msg_at i (readers [P p; P peer])) ->
    (res:(msg_at i public &
		 signal_root_key i (dh_secret_label p si (vi+1) their_ephemeral_pub_key) &
		 signal_chain_key i (dh_secret_label p si (vi+1) their_ephemeral_pub_key)){
	       let (cip,rk,ck) = res in 
		       is_msg signal_global_usage i rk (readers [V p si (vi+1)]) /\
		       is_msg signal_global_usage i ck (readers [V p si (vi+1)]) /\
		       is_signal_root_key i rk (get_label signal_key_usages rk) /\
		       is_signal_chain_key i ck (get_label signal_key_usages rk) /\
		       is_ratcheted_root_key i r p peer si (vi+1) rk false})


val dh_ratchet_decrypt: #i:nat -> #l:label -> #r:role -> #p:principal -> #peer:principal -> #si:nat -> #vi:nat ->
    (root_key:signal_root_key i l{is_ratcheted_root_key i r p peer si vi root_key false}) ->
    (our_identity_pub_key:signal_identity_pub_key i (readers [P p])) ->
    (their_identity_pub_key:signal_identity_pub_key i (readers [P peer])) ->
    (our_ephemeral_priv_key:signal_onetimepre_key i (readers [V p si vi])) ->
    (their_ephemeral_pub_key:msg_at i public) ->
    (prev_counter:nat) -> (counter:nat) ->
    (ciphertext:msg_at i public) ->
    Pure (result (msg_at i (kdf_meet l (dh_secret_label p si vi their_ephemeral_pub_key)) &
			 signal_root_key i (dh_secret_label p si vi their_ephemeral_pub_key) &
			 signal_chain_key i (dh_secret_label p si vi their_ephemeral_pub_key)))
	 (requires True)
	 (ensures (fun res -> match res with
		     | Success (m,rk,ck) ->
		       is_msg signal_global_usage i rk (readers [V p si vi]) /\
		       is_msg signal_global_usage i ck (readers [V p si vi]) /\
		       is_signal_root_key i rk (get_label signal_key_usages rk) /\
		       is_signal_chain_key i ck (get_label signal_key_usages rk) /\
		       is_ratcheted_root_key i r p peer si vi rk true /\
		       (can_flow i (dh_secret_label p si vi their_ephemeral_pub_key) public \/
		       (exists si v. get_dhkey_label signal_key_usages their_ephemeral_pub_key == readers [V peer si v])) 
		     | _ -> True))
