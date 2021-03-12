/// Signal.Crypto (implementation)
/// ========================================
module Signal.Crypto

let priv_to_pub #i #l #s sk = dh_pk #signal_global_usage #i #l sk
let priv_to_pub_lemma #i #l sk = dh_key_label_lemma signal_global_usage i (priv_to_pub sk)
let get_label_of_signal_dh_private_key_lemma #i #l k = dh_key_label_lemma signal_global_usage i (priv_to_pub k)
let get_label_of_signal_dh_public_key_lemma #i #l k = dh_key_label_lemma signal_global_usage i k

let dh #i #l #l' #s #s' sk pk = 
  let k = dh #signal_global_usage #i #l sk pk in 
  dh_key_label_lemma signal_global_usage i pk;
  k

let dh_un #i #l #s k pk = 
    let pkl = (get_dhkey_label signal_key_usages pk) in 
    let s = LabeledCryptoAPI.dh #signal_global_usage #i #l k pk in 
    dh_key_label_lemma signal_global_usage i pk;
    s

let kdf_mix #i #l1 #l2 (k1:signal_kdf_input i l1) (k2:signal_kdf_input i l2) : signal_kdf_input i (kdf_meet l1 l2) = 
    extract #signal_global_usage #i #l1 #l2 k1 k2 

let x3dh_concat_i #i #l1 #l2 #l3 #l4 k1 k2 k3 k4 =
    let m1 = (kdf_mix #i #l1 #l2 k1 k2) in 
    let m2 = (kdf_mix #i #(kdf_meet l1 l2) #l3 m1 k3) in 
    let m3 = (kdf_mix #i #(kdf_meet (kdf_meet l1 l2) l3) #l4 m2 k4) in 
    m3
    
let x3dh_concat_r #i #l1 #l2 #l3 #l4 k1 k2 k3 k4 =
    let m1 = (kdf_mix #i #l1 #l2 k1 k2) in 
    let m2 = (kdf_mix #i #(kdf_meet l1 l2) #l3 m1 k3) in 
    let m3 = (kdf_mix #i #(kdf_meet (kdf_meet l1 l2) l3) #l4 m2 k4) in 
    m3

let zz #i = literal_to_bytes #signal_global_usage #i (ByteSeq (Seq.empty))

let x3dh_derive_root_key #i #l ki =
    (expand #signal_global_usage #i #l ki (zz #i)) <: signal_root_key i l

let kdf_mix_root_key #i #l1 #l2 (k1:signal_root_key i l1) (k2:signal_root_key i l2) : signal_root_key i (kdf_meet l1 l2) = 
    extract #signal_global_usage #i #l1 #l2 k1 k2 

let ratchet_derive_aead_key0 #i #l #l' rk ss =
    let dk:signal_root_key i l' = (expand #signal_global_usage #i #l' ss (zz #i)) <: signal_root_key i l' in 
    let rat_key = kdf_mix_root_key #i #l #l' rk dk in 
    let der_key = expand #signal_global_usage #i #(kdf_meet l l') rat_key (zz #i) in 
    (expand #signal_global_usage #i #(kdf_meet l l') der_key (zz #i)) <: signal_aead_key i (kdf_meet l l')

let ratchet_derive_new_keys #i #l #l' rk ss =
    let root_key:signal_root_key i l' = (expand #signal_global_usage #i #l' ss (zz #i)) <: signal_root_key i l' in 
    let der_key:signal_chain_key i l' = expand #signal_global_usage #i #l' root_key (zz #i) in
    (root_key, der_key)

let ratchet_derive_aead_key #i #l ck =
    (expand #signal_global_usage #i #l ck (zz #i), ck)

let aead_enc #i #l k p ad = aead_enc k p ad

let aead_dec #i #l k c ad = aead_dec k c ad

let  signal_msg0_key_i_later_lemma i j a b sid spk opk k = ()

let  signal_msg0_key_r_later_lemma i j a b sid spk opk k = ()
