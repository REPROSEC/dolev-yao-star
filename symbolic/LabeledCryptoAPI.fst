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
  | PKEnc pk msg -> Public
  | Extract key salt -> (match get_usage g key with | Some (KDF s) -> join (meet (get_label g key) (get_label g salt)) (g.kdf_extend_label s key salt)
						   | _ -> meet (get_label g key) (get_label g salt))
  | Expand key info -> get_label g key 
  | AEnc k msg ad -> Public
  | VK s -> Public
  | Sig sk m -> get_label g m
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
let rec is_valid (p:global_usage) (ts:nat) (b:bytes) = 
  match b with
  | Literal s -> True
  | Rand i l u -> i <= ts /\ (was_rand_generated_before i b l u) 
  | Concat t1 t2 -> is_valid p ts t1 /\ is_valid p ts t2
  | PK s | VK s | DH_PK s -> is_valid p ts s
  | PKEnc pk msg -> is_valid p ts pk /\ is_valid p ts msg /\
		  (can_flow ts (get_label p.key_usages msg) Public \/ // (1) message is public, or
		  (match pk with
		    | PK s ->  let pkl = get_sk_label p.key_usages pk in can_flow ts (get_label p.key_usages msg) pkl /\ pke_pred p.usage_preds ts pk msg
		    | _ -> False))
  | AEnc k msg ad -> is_valid p ts k /\ is_valid p ts msg /\ is_valid p ts ad /\ can_flow ts (get_label p.key_usages ad) public /\
		    ((can_flow ts (get_label p.key_usages msg) public /\ can_flow ts (get_label p.key_usages k) public)    // (1) message and key are public, or
		      \/ (match get_usage p.key_usages k with
			| Some (AE _) -> can_flow ts (get_label p.key_usages msg) (get_label p.key_usages k) /\ aead_pred p.usage_preds ts k msg ad | _ -> False))
  | Sig sk msg -> is_valid p ts sk /\ is_valid p ts msg /\
	         (can_flow ts (get_label p.key_usages sk) Public  // (1) key is public, or
		 \/ (match get_usage p.key_usages sk with
	           | Some (SIG _) -> sign_pred p.usage_preds ts (vk sk) msg | _ -> False))
  | Mac k msg -> is_valid p ts k /\ is_valid p ts msg /\
		(can_flow ts (get_label p.key_usages k) Public // (1) key is public, or
		\/ (match get_usage p.key_usages k with
                  | Some (MAC _) -> mac_pred p.usage_preds ts k msg | _ -> False))
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
  | PKEnc p msg -> is_valid_later pr i j p; is_valid_later pr i j msg
  | AEnc k msg ad -> is_valid_later pr i j k; is_valid_later pr i j msg; is_valid_later pr i j ad
  | Sig sk msg -> is_valid_later pr i j sk; is_valid_later pr i j msg
  | Mac k msg -> is_valid_later pr i j k; is_valid_later pr i j msg
  | DH sk pk -> is_valid_later pr i j sk; is_valid_later pr i j pk

(* Crypto functions *)
let restrict #pr #i #l1 t l2 = can_flow_transitive i (get_label pr.key_usages t) l1 l2; t

let rand_is_secret #i #l #u r = ()

let literal_to_bytes #i s = C.literal_to_bytes s
let literal_to_bytes_lemma #i s = ()

let bytes_to_literal #i #l t = C.bytes_to_literal t
let bytes_to_literal_lemma #i #l t = ()

let concat #i #l t1 t2 = C.concat t1 t2
let concat_lemma #i #l t1 t2 = ()

let split #p #i #l t =
  match C.split t with
  | Success (t1, t2) -> can_flow_transitive i (get_label p.key_usages t1) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)) l;
		       can_flow_transitive i (get_label p.key_usages t2) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)) l;
		       assert (can_flow i (get_label p.key_usages t1) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)));
		       assert (can_flow i (get_label p.key_usages t2) (meet (get_label p.key_usages t1) (get_label p.key_usages t2)));
		       Success (t1, t2)
  | Error e -> Error e
let split_lemma #p #i #l t = ()

let pk #p #i #l sk = C.pk sk
let pk_lemma #p #i #l sk = ()
let sk_label_lemma pr i t l = ()

let pke_enc #pr #i k msg = 
  let c = C.pke_enc k msg in assert (get_label pr.key_usages c == Public);
  (match k with 
  | PK s -> (match get_usage pr.key_usages s with 
	   | Some (PKE _) -> let pkl = get_label pr.key_usages s in ()
	   | _ -> ())
  | _ -> ());
  c
let pke_enc_lemma #pr #i k msg = ()

let pke_dec #pr #i #l k c = 
  match C.pke_dec k c with
  | Success p -> 
    (match c with 
    | PKEnc (PK s') _ -> can_flow_transitive i (get_label pr.key_usages p) public l; Success p)
  | Error s -> Error s
let pke_dec_lemma #i #l k c = ()

let aead_enc #pr #i #l k m ad = C.aead_enc k m ad
let aead_enc_lemma #pr #i #l k m ad = ()

#push-options "--z3rlimit 25"
let aead_dec #pr #i #l k c ad = 
  match C.aead_dec k c ad with 
  | Success p -> can_flow_transitive i (get_label pr.key_usages p) public l; Success p
  | Error s -> Error s
let aead_dec_lemma #pr #i #l k c ad = ()
#pop-options

let vk #pr #i #l sk = C.vk sk
let vk_lemma #pr #i #l sk = ()

let sign #pr #i #l #l' sk msg = C.sign sk msg 
let sign_lemma #pr #i #l #l' sk msg = ()

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
let literals_are_publishable_forall c = ()
let splittable_term_publishable_implies_components_publishable_forall c = ()
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
