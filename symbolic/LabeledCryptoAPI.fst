/// LabeledCryptoAPI (symbolic implementation)
/// ===========================================
module LabeledCryptoAPI

open FStar.List.Tot
friend CryptoLib

let rec get_usage g b =
  match b with
  | Rand n l u -> Some u
  | Extract key salt -> (match get_usage g key with | Some (KDF s) -> g.kdf_extract_usage s key salt
                                                   | _ -> None)
  | Expand key info -> (match get_usage g key with | Some (KDF s) -> g.kdf_expand_usage s key info | _ -> None)
  | DH sk (DH_PK sk') -> (match get_usage g sk, get_usage g sk' with
                        | Some (DHKey s), Some (DHKey s') -> g.dh_shared_secret_usage s s' b
                        | Some (DHKey s), _ | _, Some (DHKey s) -> g.dh_unknown_peer_usage s b
                        | _ -> None)
  | DH sk pk -> (match get_usage g sk with | Some (DHKey s) -> g.dh_unknown_peer_usage s b | _ -> None)
  | _ -> None

let rec get_label g b =
  match b with
  | Literal _ -> Public
  | Rand n l u -> l
  | Concat b1 b2 -> meet (get_label g b1) (get_label g b2)
  | PK s -> Public
  | PKEnc pk n msg -> Public
  | Extract key salt -> (match get_usage g key with 
		       | Some (KDF s) -> let l = (meet (get_label g key) (get_label g salt)) in 
					join_opt l (g.kdf_extend_label s key salt (get_label g key) (get_label g salt))
		       | _ -> meet (get_label g key) (get_label g salt))
  | Expand key info -> get_label g key 
  | AEnc k iv msg ad -> Public
  | VK s -> Public
  | Sig sk n m -> get_label g m
  | Mac k m -> get_label g m
  | Hash m -> get_label g m
  | DH_PK s -> Public
  | DH sk (DH_PK sk') -> join (get_label g sk) (get_label g sk')
  | DH sk pk -> join (get_label g sk) private_label

let get_sk_label g b =
  match b with
  | PK s -> (match get_usage g s with | Some (PKE _) -> get_label g s | _ -> Public)
  | _ -> Public

let get_signkey_label g b =
  match b with
  | VK s -> (match get_usage g s with | Some (SIG _) -> get_label g s | _ -> Public)
  | _ -> Public

let get_dhkey_label g b =
  match b with
  | DH_PK s -> get_label g s
  | _ -> private_label

(* Labeling Predicates *)
let rec is_valid (p:global_usage) (ts:timestamp) (b:bytes) =
  match b with
  | Literal s -> True
  | Rand i l u -> i <= ts /\ (was_rand_generated_before i b l u)
  | Concat t1 t2 -> is_valid p ts t1 /\ is_valid p ts t2
  | PK s | VK s | DH_PK s -> is_valid p ts s
  | PKEnc pk n msg -> is_valid p ts pk /\ is_valid p ts msg /\ is_valid p ts n /\
                  (let nl = get_label p.key_usages n in
                    let pkl = get_sk_label p.key_usages pk in
                   let ml = get_label p.key_usages msg in
                   can_flow ts ml nl /\
                   can_flow ts ml pkl /\
                   (can_flow ts ml Public \/ // (1) message is public, or
                    (match pk with
                     | PK s ->
                       (match get_usage p.key_usages s with
                         | Some (PKE s) -> pke_pred p.usage_preds ts s pk msg
                         | _ -> False)
                     | _ -> False)))
  | AEnc k iv msg ad -> is_valid p ts k /\ is_valid p ts msg /\ is_valid p ts ad /\ can_flow ts (get_label p.key_usages ad) public /\ is_valid p ts iv /\ can_flow ts (get_label p.key_usages iv) public /\
                    ((can_flow ts (get_label p.key_usages msg) public /\ can_flow ts (get_label p.key_usages k) public)    // (1) message and key are public, or
                      \/ (match get_usage p.key_usages k with
                        | Some (AE s) -> can_flow ts (get_label p.key_usages msg) (get_label p.key_usages k) /\ aead_pred p.usage_preds ts s k msg ad | _ -> False))
  | Sig sk n msg -> is_valid p ts sk /\ is_valid p ts msg /\ is_valid p ts n /\
                 (can_flow ts (get_label p.key_usages sk) Public  // (1) key is public, or
                 \/ (match get_usage p.key_usages sk with
                   | Some (SIG s) -> sign_pred p.usage_preds ts s (vk sk) msg | _ -> False))
  | Mac k msg -> is_valid p ts k /\ is_valid p ts msg /\
                (can_flow ts (get_label p.key_usages k) Public // (1) key is public, or
                \/ (match get_usage p.key_usages k with
                  | Some (MAC s) -> mac_pred p.usage_preds ts s k msg | _ -> False))
  | Hash msg -> is_valid p ts msg
  | Expand k1 k2 -> is_valid p ts k1 /\ is_valid p ts k2 /\ can_flow ts (get_label p.key_usages k2) Public /\
                     (can_flow ts (get_label p.key_usages k1) Public \/
                     (match get_usage p.key_usages k1 with
                     | Some (KDF _) -> True | _ -> False))
  | Extract k1 k2 -> is_valid p ts k1 /\ is_valid p ts k2 /\
                    ((can_flow ts (get_label p.key_usages k1) Public /\ can_flow ts (get_label p.key_usages k2) Public) \/
                      (match get_usage p.key_usages k1 with
                      | Some (KDF _) -> True | _ -> False))
  | DH sk (DH_PK sk') -> is_valid p ts sk /\ is_valid p ts sk' /\
                        (can_flow ts (get_label p.key_usages sk) Public \/ can_flow ts (get_label p.key_usages sk') Public \/
                        (match get_usage p.key_usages sk, get_usage p.key_usages sk' with
                        | Some (DHKey s), _ | _, Some (DHKey s) -> True
                        | _ -> False))
  | DH sk pk -> is_valid p ts sk /\ is_valid p ts pk /\ can_flow ts (get_label p.key_usages pk) Public /\
               (can_flow ts (get_label p.key_usages sk) Public \/
                (match  get_usage p.key_usages sk with
                 | Some (DHKey s) -> True
                 | _ -> False))

let rec is_valid_later pr i j t =
  match t with
  | Rand _ _ _
  | Literal _ -> ()
  | Concat t1 t2 -> is_valid_later pr i j t1; is_valid_later pr i j t2
  | PK s | VK s | DH_PK s -> is_valid_later pr i j s
  | Hash msg -> is_valid_later pr i j msg; ()
  | Extract k1 k2 -> is_valid_later pr i j k1; is_valid_later pr i j k2; ()
  | Expand k1 k2 -> is_valid_later pr i j k1; is_valid_later pr i j k2
  | PKEnc p n msg -> is_valid_later pr i j p; is_valid_later pr i j msg; is_valid_later pr i j n
  | AEnc k iv msg ad -> is_valid_later pr i j k; is_valid_later pr i j msg; is_valid_later pr i j ad; is_valid_later pr i j iv
  | Sig sk n msg -> is_valid_later pr i j sk; is_valid_later pr i j msg; is_valid_later pr i j n
  | Mac k msg -> is_valid_later pr i j k; is_valid_later pr i j msg
  | DH sk pk -> is_valid_later pr i j sk; is_valid_later pr i j pk

(* Crypto functions *)
let empty #pr #i = empty
let empty_lemma #pr #i = ()
let len #pr #i #l b = C.len b
let len_lemma #pr #i #l b = ()
let restrict #pr #i #l1 t l2 = can_flow_transitive i (get_label pr.key_usages t) l1 l2; t

let rand_is_secret #i #l #u r = ()

let string_to_bytes #p #i s = C.string_to_bytes s 
let string_to_bytes_lemma #i s = ()

let bytes_to_string #i #l t = C.bytes_to_string t
let bytes_to_string_lemma #i #l t = ()

let nat_to_bytes #i len s = C.nat_to_bytes len s
let nat_to_bytes_lemma #i len s = ()

let bytes_to_nat #i #l t = C.bytes_to_nat t
let bytes_to_nat_lemma #i #l t = ()

let bytestring_to_bytes #i s = C.bytestring_to_bytes s
let bytestring_to_bytes_lemma #i s = ()

let bytes_to_bytestring #i #l t = C.bytes_to_bytestring t
let bytes_to_bytestring_lemma #i #l t = ()

let concat_len_prefixed #i #l lenlen t1 t2 = C.concat_len_prefixed lenlen t1 t2
let concat_len_prefixed_lemma #i #l lenlen t1 t2 = ()

let split_len_prefixed #p #i #l lenlen t =
  match C.split_len_prefixed lenlen t with
  | Success (t1, t2) -> can_flow_transitive i (get_label p.key_usages t1) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)) l;
                       can_flow_transitive i (get_label p.key_usages t2) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)) l;
                       assert (can_flow i (get_label p.key_usages t1) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)));
                       assert (can_flow i (get_label p.key_usages t2) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)));
                       Success (t1, t2)
  | Error e -> Error e
let split_len_prefixed_lemma #p #i #l lenlen t = ()

let concat #i #l t1 t2 = concat_len_prefixed #i #l 4 t1 t2
let concat_lemma #i #l t1 t2 = ()
let split #i #l t = split_len_prefixed #i #l 4 t
let split_lemma #i #l t = ()
let split_at #p #i #l len t = split_len_prefixed #p #i 0 t
let split_at_lemma #p #i #l len t = ()

let pk #p #i #l sk = C.pk sk
let pk_lemma #p #i #l sk = ()
let sk_label_lemma pr i t l = ()

let pke_enc #pr #i #l k n msg =
  let c = C.pke_enc k n msg in
  assert (is_valid pr i k);
  assert (is_valid pr i n);
  assert (is_valid pr i msg);
  let nl = get_label pr.key_usages n in
  let pkl = get_sk_label pr.key_usages k in
  assert (can_flow i (get_label pr.key_usages msg) pkl);
  assert (can_flow i (get_label pr.key_usages msg) nl);
  assert (is_valid pr i c);
  assert (get_label pr.key_usages c == public);
  c


let pke_enc_lemma #pr #i k n msg = ()

let pke_dec #pr #i #l k c =
  match C.pke_dec k c with
  | Success p ->
    (match c with
    | PKEnc (PK s') _ _ -> can_flow_transitive i (get_label pr.key_usages p) public l; Success p)
  | Error s -> Error s
let pke_dec_lemma #i #l k c = ()

let aead_enc #pr #i #l k iv m ad = C.aead_enc k iv m ad
let aead_enc_lemma #pr #i #l k iv m ad = ()

#push-options "--z3rlimit 25"
let aead_dec #pr #i #l k iv c ad =
  match C.aead_dec k iv c ad with
  | Success p -> can_flow_transitive i (get_label pr.key_usages p) public l; Success p
  | Error s -> Error s
let aead_dec_lemma #pr #i #l k iv c ad = ()
#pop-options

let vk #pr #i #l sk = C.vk sk
let vk_lemma #pr #i #l sk = ()

let sign #pr #i #l #l' sk n msg = C.sign sk n msg
let sign_lemma #pr #i #l #l' sk n msg = ()

let verify #pr #i #l #l' p m s = C.verify p m s
let verify_lemma #pr #i #l #l' p m s = ()
let verification_key_label_lemma pr i b l = ()

let mac #pr #i #l #l' k m = C.mac k m
let mac_lemma #pr #i #l #l' k m = ()

let hash #pr #i #l m = C.hash m
let hash_lemma #pr #i #l m = ()

let extract #pr #i #l #l' k salt = C.extract k salt
let extract_lemma #pr #i #l #l' k salt = ()

let expand #pr #i #l k info = C.expand k info
let expand_lemma #pr #i #l k info = ()

let dh_pk #pr #i #l sk = C.dh_pk sk
let dh_pk_lemma #pr #i #l sk = ()
let dh_key_label_lemma pr i b = ()
let dh_private_key_cannot_be_split b = concat_split_lemma b
 
#push-options "--z3rlimit 25"
let dh #pr #i #l sk pk =
    dh_key_label_lemma pr i pk;
    let k = C.dh sk pk in
    match k with
    | DH s1 (DH_PK s2) ->
      (match get_usage pr.key_usages s1, get_usage pr.key_usages s2 with
                         | Some (DHKey s), Some (DHKey s') -> assert (is_valid pr i k);
                                assert (get_usage pr.key_usages k == pr.key_usages.dh_shared_secret_usage s s' k);
                                pr.key_usages.dh_usage_commutes_lemma ();
                                pr.key_usages.dh_unknown_peer_usage_lemma ();
                                k
                         | Some (DHKey s), _ | _, Some (DHKey s) -> assert (is_valid pr i k); k
                         | _ -> assert (is_valid pr i k); k)
    | _ -> k 

let dh_lemma #pr #i #l sk pk = ()
#pop-options

(* Lemmas for is_publishable *)
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
#push-options "--z3rlimit 10"
let dh_is_publishable_if_keys_are_publishable_forall c = ()
#pop-options
