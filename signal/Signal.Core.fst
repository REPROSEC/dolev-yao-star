/// Signal.Core (implementation)
/// ========================================
module Signal.Core

let msg0_can_flow_i i p sid peer spk opk = 
    can_flow_to_join_forall i;
    can_flow_to_meet_forall i;
    ()

let msg0_can_flow_r i p sid peer ek0 ek1 =
    can_flow_to_join_forall i;
    can_flow_to_meet_forall i;
    ()

let dh_secret_label0_can_flow i p si their_ephemeral_pub_key = 
    can_flow_transitive i (join (readers [P p]) (get_dhkey_label signal_key_usages their_ephemeral_pub_key)) (readers [P p]) (readers [V p si 0]);
    ()
      
let initiate #i #p #sid #peer
    our_identity_priv_key our_ephemeral_priv_key0 our_ephemeral_priv_key1
    their_identity_pub_key their_signed_pub_key their_onetime_pub_key =
  let dh1 = dh_un our_identity_priv_key their_signed_pub_key in
  let dh2 = dh our_ephemeral_priv_key0 their_identity_pub_key in
  let dh3 = dh_un our_ephemeral_priv_key0 their_signed_pub_key in
  let dh4 = dh_un our_ephemeral_priv_key0 their_onetime_pub_key in
  let kdf_in = x3dh_concat_i dh1 dh2 dh3 dh4 in
  let rk = x3dh_derive_root_key kdf_in in
  let shared_secret = dh_un our_ephemeral_priv_key1 their_signed_pub_key in
  let msg_key0 = ratchet_derive_aead_key0 rk shared_secret in
  let (root_key', chain_key) = ratchet_derive_new_keys rk shared_secret in
  assert (is_signal_root_key i root_key' (dh_secret_label p sid 1 their_signed_pub_key));
  assert (is_ratcheted_root_key i I p peer sid 1 root_key' false);
  (msg_key0, root_key', chain_key)

let respond #i #p #sid #sid' #peer
    our_identity_priv_key our_signed_priv_key our_onetime_priv_key
    their_identity_pub_key their_ephemeral_pub_key0 their_ephemeral_pub_key1 =
  let dh1 = dh our_signed_priv_key their_identity_pub_key in
  let dh2 = dh_un our_identity_priv_key their_ephemeral_pub_key0 in
  let dh3 = dh_un our_signed_priv_key their_ephemeral_pub_key0 in
  let dh4 = dh_un our_onetime_priv_key their_ephemeral_pub_key0 in
  let kdf_in = x3dh_concat_r dh1 dh2 dh3 dh4 in
  let rk0 = x3dh_derive_root_key kdf_in in
  let shared_secret = dh_un our_signed_priv_key their_ephemeral_pub_key1 in
  let msg_key0 = ratchet_derive_aead_key0 rk0 shared_secret in
  let (root_key', chain_key) = ratchet_derive_new_keys rk0 shared_secret in
  dh_secret_label0_can_flow i p sid' their_ephemeral_pub_key1;
  assert (can_flow i (dh_secret_label0 p their_ephemeral_pub_key1) (readers [V p sid' 0]));
  assert (is_signal_root_key i root_key' (dh_secret_label0 p their_ephemeral_pub_key1));
  (msg_key0, root_key', chain_key)

let dh_ratchet #i #l #l' root_key our_ephemeral_priv_key their_ephemeral_pub_key =
  let shared_secret = dh_un our_ephemeral_priv_key their_ephemeral_pub_key in
  let msg_key0 = ratchet_derive_aead_key0 root_key shared_secret in
  let (root_key', chain_key) = ratchet_derive_new_keys root_key shared_secret in
  (msg_key0, root_key', chain_key)

let kdf_ratchet #i #l chain_key =
  ratchet_derive_aead_key #i #l chain_key

val serialize_ad: #i:nat -> our_ephemeral_pub_key:msg_at i public -> prev_counter:nat -> counter:nat -> their_identity_pub_key:msg_at i public ->
		  our_identity_pub_key:msg_at i public -> msg_at i public
let serialize_ad #i (our_ephemeral_pub_key)
    (prev_counter) (counter)
    (their_identity_pub_key)
    (our_identity_pub_key) = 
    concat their_identity_pub_key
      (concat our_identity_pub_key
	(concat (our_ephemeral_pub_key)
	  (concat ((nat_to_bytes #signal_global_usage #i 4 prev_counter))
	    ((nat_to_bytes #signal_global_usage #i 4 counter)))))

friend Signal.Messages

val serialize_ad_lemma (#i:nat)
    (our_ephemeral_pub_key:msg_at i public)
    (prev_counter:nat)  (counter:nat)
    (their_identity_pub_key:msg_at i public)
    (our_identity_pub_key:msg_at i public) :
    Lemma (serialize_ad #i our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key ==
	   Signal.Messages.serialize_ad our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key)
    [SMTPat (serialize_ad #i our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key)]

let serialize_ad_lemma #i ek1 pc1 c1 tik1 oik1 = ()

let encrypt #i #l #p #si #vi
    our_identity_pub_key their_identity_pub_key
    msg_key our_ephemeral_pub_key prev_counter counter plaintext =
  get_label_of_signal_dh_public_key_lemma #i #(readers [P p]) #"Signal.identity_key" our_identity_pub_key;
  get_label_of_signal_dh_public_key_lemma #i #(readers [V p si vi]) #"Signal.one_time_pre_key" our_ephemeral_pub_key;
  assert (get_dhkey_label signal_key_usages our_identity_pub_key == readers [P p]);
  assert (get_dhkey_label signal_key_usages our_ephemeral_pub_key == readers [V p si vi]);
  let ad = serialize_ad our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key in
  assert (ad == serialize_ad our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key);
  let aek,aeiv = msg_key in
  assert (apred i "Signal.aead_key" aek plaintext ad); 
  let ciphertext = aead_enc msg_key plaintext ad in
  ciphertext

let decrypt #i #l
    our_identity_pub_key their_identity_pub_key
    remote_ephemeral_key msg_key prev_counter counter ciphertext =
  let ad = serialize_ad remote_ephemeral_key prev_counter counter
			our_identity_pub_key their_identity_pub_key in
  aead_dec msg_key ciphertext ad 

let decrypt0 #i #l #l' #peer our_identity_pub_key their_identity_pub_key
	     remote_ephemeral_key msg_key prev_counter counter ciphertext =
    get_label_of_signal_dh_public_key_lemma #i #(readers [P peer]) #"Signal.identity_key" their_identity_pub_key;
    readers_is_injective peer;
    decrypt #i #(kdf_meet l l') our_identity_pub_key their_identity_pub_key remote_ephemeral_key msg_key prev_counter counter ciphertext

let dh_ratchet_encrypt #i #j #l #r #p #peer #si #vi
		       root_key our_identity_pub_key their_identity_pub_key
		       our_ephemeral_priv_key their_ephemeral_pub_key
		       prev_counter counter msg =
    let new_v = vi + 1 in 
    let new_l = readers [V p si new_v] in
    let (msg_key0, root_key0, chain_key0) = dh_ratchet #i #l #new_l root_key our_ephemeral_priv_key their_ephemeral_pub_key in
    let l' = join new_l (get_dhkey_label signal_key_usages their_ephemeral_pub_key) in
    let l_msg_key = kdf_meet l l' in
    is_ratcheted_root_key_lemma j r p peer si vi true;
    can_flow_to_meet_forall i; can_flow_to_join_forall i;
    can_flow_transitive i (get_label signal_key_usages msg) (readers [P p; P peer]) l_msg_key;
    let our_ephemeral_pub_key = priv_to_pub #i #new_l #"Signal.one_time_pre_key" our_ephemeral_priv_key in
    let ciphertext = encrypt #i #l_msg_key #p #si #new_v our_identity_pub_key their_identity_pub_key msg_key0 our_ephemeral_pub_key 0 0 msg in
    sent_ratcheted_root_key i j r p peer si vi root_key their_ephemeral_pub_key root_key0;
    (ciphertext, root_key0, chain_key0)

let dh_ratchet_decrypt #i #l #r #p #peer #si #vi
		       root_key our_identity_pub_key their_identity_pub_key
		       our_ephemeral_priv_key their_ephemeral_pub_key
		       prev_counter counter ciphertext =
    let eph_l = readers [V p si vi] in
    let (msg_key0, root_key0, chain_key0) = dh_ratchet #i #l #eph_l root_key our_ephemeral_priv_key their_ephemeral_pub_key in
    let l' = join eph_l (get_dhkey_label signal_key_usages their_ephemeral_pub_key) in
    let l_msg_key = kdf_meet l l' in
    can_flow_to_meet_forall i; can_flow_to_join_forall i;
    match decrypt0 #i #l #l' #peer our_identity_pub_key their_identity_pub_key their_ephemeral_pub_key msg_key0 0 0 ciphertext with 
    | Success msg -> can_flow_transitive i l l_msg_key public;
		    recv_ratcheted_root_key i r p peer si vi root_key their_ephemeral_pub_key root_key0;
		    can_flow_transitive i l' l_msg_key public;
		    Success (msg,root_key0,chain_key0)
    | Error e -> Error e
