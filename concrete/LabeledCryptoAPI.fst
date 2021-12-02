/// LabeledCryptoAPI (concrete implementation)
/// ===========================================
module LabeledCryptoAPI

let get_usage g b =  None

let get_label g b = public

let get_sk_label g b = public

let get_signkey_label g b = public

let get_dhkey_label g b = public

let is_valid p ts b = True

let is_valid_later pr i j t = ()

let empty #pr #i = empty

let empty_lemma #p #i = ()

let len #p #i #l b = len b

let len_lemma #p #i #l b = ()

let restrict #p #i #l1 t l2 =  t

let rand_is_secret #p #i #l #u r = admit()

let string_to_bytes #p #i  s = string_to_bytes s

let string_to_bytes_lemma #p #i s = ()

let bytes_to_string #p #i #l t = bytes_to_string t

let bytes_to_string_lemma #p #i #l t = ()

let nat_to_bytes #p  #i len s = nat_to_bytes len s

let nat_to_bytes_lemma #p #i len s =()

let bytes_to_nat #p #i #l t = bytes_to_nat t

let bytes_to_nat_lemma #p #i #l t = ()

let bytestring_to_bytes #p #i s = bytestring_to_bytes s

let bytestring_to_bytes_lemma #p #i s = ()

let bytes_to_bytestring #p #i s = bytes_to_bytestring s

let bytes_to_bytestring_lemma #p #i b = ()

let concat_len_prefixed ll t1 t2 = concat_len_prefixed ll t1 t2

let concat_len_prefixed_lemma ll t1 t2 = ()

let split_len_prefixed ll t = split_len_prefixed ll t

let split_len_prefixed_lemma ll t = ()

let concat #p t1 t2 = let b = concat t1 t2 in assume (get_label p.key_usages b == meet (get_label p.key_usages t1) (get_label p.key_usages t2)); b

let concat_lemma t1 t2 = ()

let split t = split t

let split_lemma t = ()

let split_at l t = split_at l t

let split_at_lemma l t = ()

let pk s = pk s

let pk_lemma s = ()

let sk_label_lemma p i t l = ()

let pke_enc pk n m = pke_enc pk n m

let pke_enc_lemma pk n m = ()

let pke_dec sk m = pke_dec sk m

let pke_dec_lemma sk m = ()

let aead_enc k iv m ad = aead_enc k iv m ad

let aead_enc_lemma k iv m ad = ()

let aead_dec k iv c ad = aead_dec k iv c ad

let aead_dec_lemma k iv c ad = ()

let vk s = vk s

let vk_lemma s = ()

let sign k n m = sign k n m

let sign_lemma k n m = ()

let verify k m sg = verify k m sg

let verify_lemma k m sg = ()

let verification_key_label_lemma p i t l = ()

let mac k m = mac k m

let mac_lemma k m = ()

let hash m = hash m

let hash_lemma m = ()

let extract k salt = extract k salt

let extract_lemma k salt = ()

let expand k info = expand k info

let expand_lemma k info = ()

let dh_pk s = dh_pk s

let dh_pk_lemma s = ()

let dh_key_label_lemma p i b = ()

let dh_private_key_cannot_be_split b = ()

let dh #pr #i sk pk =
  admit();
  dh sk pk

let dh_lemma sk pk = ()

let strings_are_publishable_forall c = ()
let nats_are_publishable_forall c = ()
let bytestrings_are_publishable_forall c = ()
let splittable_term_publishable_implies_components_publishable_forall c = ()
let splittable_at_term_publishable_implies_components_publishable_forall c = ()
let concatenation_publishable_implies_components_publishable_forall c = ()
let public_key_is_publishable_if_private_key_is_publishable_forall c = ()
let pke_ciphertext_publishable_if_key_and_msg_are_publishable_forall c = ()
let pke_plaintext_publishable_if_key_and_ciphertext_publishable_forall c = ()
let aead_enc_ciphertext_publishable_if_key_and_msg_are_publishable_forall c = ()
let aead_dec_plaintext_publishable_if_key_and_ciphertext_publishable_forall c = ()
let verif_key_is_publishable_if_private_key_is_publishable_forall c = ()
let sig_is_publishable_if_key_and_msg_are_publishable_forall c = ()
let mac_is_publishable_if_key_and_msg_are_publishable_forall c = ()
let expand_value_publishable_if_secrets_are_publishable_forall c = ()
let extract_value_publishable_if_secrets_are_publishable_forall c = ()
let hash_value_publishable_if_message_is_publishable_forall c = ()
let dh_public_key_is_publishable_if_private_key_is_publishable_forall c = ()
let dh_is_publishable_if_keys_are_publishable_forall c = ()
