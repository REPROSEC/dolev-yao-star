/// Signal.Crypto
/// ========================================
module Signal.Crypto

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open LabeledCryptoAPI
open Signal.Messages

type labeled_at (i:nat) (l:label) = lbytes signal_global_usage i l
type msg_at i l = msg signal_global_usage i l

let signal_aead_key (i:nat) (l:label) = aead_key signal_global_usage i l "Signal.aead_key"
let signal_aead_iv (i:nat) (l:label) = kdf_key signal_global_usage i l "Signal.aead_iv"
let signal_aead_key_iv (i:nat) (l:label) = (signal_aead_key i l & msg_at i public)
let signal_chain_key i l = kdf_key signal_global_usage i l "Signal.chain_key"
let signal_root_key i l = kdf_key signal_global_usage i l "Signal.root_key"
let signal_kdf_input i l = kdf_key signal_global_usage i l "Signal.kdf_input_key"
let signal_dh_private_key i l s = dh_private_key signal_global_usage i l s
let signal_dh_public_key i l s = dh_public_key signal_global_usage i l s

let signal_identity_key i l = signal_dh_private_key i l "Signal.identity_key"
let signal_identity_pub_key i l = signal_dh_public_key i l "Signal.identity_key"
let signal_onetimepre_key i l = signal_dh_private_key i l "Signal.one_time_pre_key"
let signal_onetimepre_pub_key i l = signal_dh_public_key i l "Signal.one_time_pre_key"
let signal_signedpre_key i l = signal_dh_private_key i l "Signal.signed_pre_key"
let signal_signedpre_pub_key i l = signal_dh_public_key i l "Signal.signed_pre_key"

val priv_to_pub: #i:nat -> #l:label -> #s:dh_key_string ->
		 dh_private_key signal_global_usage i l s ->
		 dh_public_key signal_global_usage i l s

val priv_to_pub_lemma: #i:nat -> #l:label -> #s:dh_key_string -> k:signal_dh_private_key i l s ->
		       Lemma (let p = priv_to_pub #i #l #s k in is_publishable signal_global_usage i p /\ get_dhkey_label signal_key_usages p == l)
			     [SMTPat (priv_to_pub #i #l #s k)]

val get_label_of_signal_dh_private_key_lemma: #i:nat -> #l:label -> #s:dh_key_string ->
		 k:signal_dh_private_key i l s ->
		 Lemma (l == (get_dhkey_label signal_key_usages (priv_to_pub k)))
		       [SMTPat (get_dhkey_label signal_key_usages (priv_to_pub k))]

val get_label_of_signal_dh_public_key_lemma: #i:nat -> #l:label -> #s:dh_key_string -> k:msg_at i public ->
		 Lemma (is_signal_dh_public_key i k l s ==> l == (get_dhkey_label signal_key_usages k))
		       [SMTPat (get_dhkey_label signal_key_usages k);
		        SMTPat (is_signal_dh_public_key i k l s)]

val dh: #i:nat -> #l:label -> #l':label -> #s:dh_key_string -> #s':dh_key_string ->
	signal_dh_private_key i l s ->
	signal_dh_public_key i l' s' ->
	signal_kdf_input i (join l l')

val dh_un: #i:nat -> #l:label -> #s:dh_key_string -> k:signal_dh_private_key i l s -> pk:msg_at i public -> 
	   signal_kdf_input i (join l (get_dhkey_label signal_key_usages pk))

val x3dh_concat_i: #i:nat -> #l1:label -> #l2:label -> #l3:label -> #l4:label ->
  signal_kdf_input i l1 ->
  signal_kdf_input i l2 ->
  signal_kdf_input i l3 ->
  signal_kdf_input i l4 ->
  signal_kdf_input i (kdf_meet (kdf_meet (kdf_meet l1 l2) l3) l4)

val x3dh_concat_r: #i:nat -> #l1:label -> #l2:label -> #l3:label -> #l4:label ->
  signal_kdf_input i l1 ->
  signal_kdf_input i l2 ->
  signal_kdf_input i l3 ->
  signal_kdf_input i l4 ->
  signal_kdf_input i (kdf_meet (kdf_meet (kdf_meet l1 l2) l3) l4)

val x3dh_derive_root_key: #i:nat -> #l:label ->
  signal_kdf_input i l ->
  signal_root_key i l

val ratchet_derive_aead_key0: #i:nat -> #l:label -> #l':label ->
  signal_root_key i l ->
  signal_kdf_input i l' ->
  signal_aead_key_iv i (kdf_meet l l')

val ratchet_derive_new_keys: #i:nat -> #l:label -> #l':label ->
  signal_root_key i l ->
  signal_kdf_input i l' ->
  (signal_root_key i l' & signal_chain_key i l')

val ratchet_derive_aead_key: #i:nat -> #l:label ->
  signal_chain_key i l ->
  (signal_aead_key_iv i l & signal_chain_key i l)

val aead_enc: #i:nat -> #l:label ->
  k:signal_aead_key_iv i l ->
  plain:msg_at i l ->
  ad:msg_at i public{
    let (k,iv) = k in apred i "Signal.aead_key" k plain ad} ->
  msg_at i public

val aead_dec: #i:nat -> #l:label ->
  k:signal_aead_key_iv i l ->
  cipher:msg_at i public ->  ad:msg_at i public ->
  Pure (result (msg_at i l))
       (requires (True))
       (ensures (fun r -> match r with
		       | Success p -> let (k,iv) = k in can_flow i l public \/ apred i "Signal.aead_key" k p ad
		       | Error _ -> True))



let signal_msg0_key_r (i:nat) (a:principal) (b:principal) (sid:nat) (spk:bytes) (opk:bytes) =
    signal_aead_key_iv i (x3dh_key_label_r a sid b spk opk)


let signal_msg0_key_i (i:nat) (a:principal) (b:principal) (sid:nat) (spk:bytes) (opk:bytes) =
    signal_aead_key_iv i (x3dh_key_label_i a sid b spk opk)

