module LabeledPKI

module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI

type session_st =
  | SigningKey: t:string -> secret_key:bytes -> session_st
  | VerificationKey: t:string -> peer:principal -> public_key:bytes -> session_st
  | DHPrivateKey: t:string -> secret_key:bytes -> session_st
  | DHPublicKey: t:string -> peer:principal -> public_key:bytes -> session_st
  | OneTimeDHPrivKey: t:string -> secret_key:bytes -> session_st
  | OneTimeDHPubKey: t:string -> peer:principal -> public_key:bytes -> session_st
  | DeletedOneTimeKey: t:string -> session_st
  | DecryptionKey: t:string -> secret_key:bytes -> session_st
  | EncryptionKey: t:string -> peer:principal -> public_key:bytes -> session_st
  | APP: st:bytes -> session_st

let serialize_session_st st : bytes =
   match st with
   |SigningKey t secret_key -> concat (literal_to_bytes (String "SigningKey")) (concat (literal_to_bytes (String t)) (secret_key))
   |VerificationKey t p public_key -> concat (literal_to_bytes (String "VerificationKey")) (concat (literal_to_bytes (String t)) (concat (literal_to_bytes (String p)) public_key))
   |DHPrivateKey t secret_key -> concat (literal_to_bytes (String "DHPrivateKey")) (concat (literal_to_bytes (String t)) secret_key)
   |DHPublicKey t p public_key -> concat (literal_to_bytes (String "DHPublicKey")) (concat (literal_to_bytes (String t)) (concat (literal_to_bytes (String p)) public_key))
   |OneTimeDHPrivKey t secret_key -> concat (literal_to_bytes (String "OneTimeDHPrivKey")) (concat (literal_to_bytes (String t)) secret_key)
   |OneTimeDHPubKey t p public_key -> concat (literal_to_bytes (String "OneTimeDHPubKey")) (concat (literal_to_bytes (String t)) (concat (literal_to_bytes (String p)) public_key))
   |DeletedOneTimeKey t -> concat (literal_to_bytes (String "DeletedOneTimeKey")) (literal_to_bytes (String t))
   |DecryptionKey t secret_key -> concat (literal_to_bytes (String "DecryptionKey")) (concat (literal_to_bytes (String t)) secret_key)
   |EncryptionKey t p public_key -> concat (literal_to_bytes (String "EncryptionKey")) (concat (literal_to_bytes (String t)) (concat (literal_to_bytes (String p)) public_key))
   |APP s -> concat (literal_to_bytes (String "APP")) s

let parse_session_st (serialized_session:bytes) : result session_st =
  r <-- split serialized_session;
  let (tn,o) = r in
  r <-- bytes_to_string tn;
  match r with
  | "APP" -> Success (APP o)
  | "SigningKey" -> (
    r <-- split o ;
    let (tb,sk) = r in
    t <-- bytes_to_string tb;
    Success (SigningKey t sk))
  | "VerificationKey" -> (
    r <-- split o ;
    let (tb,ppk) = r in
    t <-- bytes_to_string tb;
    r <-- split ppk ;
    let (pb,pk) = r in
    p <-- bytes_to_string pb ;
    Success (VerificationKey t p pk))
  | "DHPrivateKey" -> (
    r <-- split o ;
    let (tb,sk) = r in
    t <-- bytes_to_string tb;
    Success (DHPrivateKey t sk))
  | "DHPublicKey" -> (
    r <-- split o ;
    let (tb,ppk) = r in
    t <-- bytes_to_string tb;
    r <-- split ppk ;
    let (pb,pk) = r in
    p <-- bytes_to_string pb ;
    Success (DHPublicKey t p pk))
  | "OneTimeDHPrivKey" -> (
    r <-- split o ;
    let (tb,sk) = r in
    t <-- bytes_to_string tb;
    Success (OneTimeDHPrivKey t sk))
  | "OneTimeDHPubKey" -> (
    r <-- split o ;
    let (tb,ppk) = r in
    t <-- bytes_to_string tb;
    r <-- split ppk ;
    let (pb,pk) = r in
    p <-- bytes_to_string pb ;
    Success (OneTimeDHPubKey t p pk))
  | "DeletedOneTimeKey" -> (
    t <-- bytes_to_string o;
    Success (DeletedOneTimeKey t))
  | "DecryptionKey" -> (
    r <-- split o ;
    let (tb,sk) = r in
    t <-- bytes_to_string tb;
    Success (DecryptionKey t sk))
  | "EncryptionKey" -> (
    r <-- split o ;
    let (tb,ppk) = r in
    t <-- bytes_to_string tb;
    r <-- split ppk ;
    let (pb,pk) = r in
    p <-- bytes_to_string pb ;
    Success (EncryptionKey t p pk))
  | _ -> Error "unknown key name"


val parse_serialize_session_st_lemma : ss:session_st ->
    Lemma (Success ss == parse_session_st (serialize_session_st ss))
	  [SMTPat (parse_session_st (serialize_session_st ss))]
let parse_serialize_session_st_lemma ss = ()

let valid_session (pr:R.preds) (i:nat) (p:principal) (si:nat) (vi:nat) (st:session_st) : Type0 =
  match st with
  | SigningKey t secret_key ->
    A.is_signing_key pr.R.global_usage i secret_key (readers [P p]) t
  | VerificationKey t p public_key ->
    A.is_verification_key pr.R.global_usage i public_key (readers [P p]) t
  | DHPrivateKey t secret_key ->
    A.is_dh_private_key pr.R.global_usage i secret_key (readers [P p]) t
  | DHPublicKey t p public_key ->
    A.is_dh_public_key pr.R.global_usage i public_key (readers [P p]) t
  | OneTimeDHPrivKey t secret_key ->
    vi = 0 /\ A.is_dh_private_key pr.R.global_usage i secret_key (readers [V p si 0]) t
  | OneTimeDHPubKey t p public_key ->
    (exists si. A.is_dh_public_key pr.R.global_usage i public_key (readers [V p si 0]) t)
  | DeletedOneTimeKey t -> 
    vi = 1
  | DecryptionKey t secret_key ->
    A.is_private_dec_key pr.R.global_usage i secret_key (readers [P p]) t
  | EncryptionKey t p public_key ->
    A.is_public_enc_key pr.R.global_usage i public_key (readers [P p]) t
  | APP s -> R.(pr.trace_preds.session_st_inv i p si vi s)

val valid_session_later: pr:R.preds -> i:nat -> j:nat -> p: principal -> si:nat -> vi:nat -> st:session_st -> Lemma
  ((valid_session pr i p si vi st /\ later_than j i) ==> valid_session pr j p si vi st)
  [SMTPat (valid_session pr i p si vi st); SMTPat (valid_session pr j p si vi st)]
let valid_session_later pr i j p si vi st = ()

let includes_lemma (p:principal) (s:nat) (v:nat) : Lemma (includes_ids [P p] [V p s v]) [SMTPat (includes_ids [P p] [V p s v])] = ()

val valid_session_lemma: pr:R.preds -> i:nat -> p: principal -> si:nat -> vi:nat -> st:session_st ->
  Lemma (requires (valid_session pr i p si vi st))
	(ensures (A.is_msg pr.R.global_usage i (serialize_session_st st) (readers [V p si vi])))
	[SMTPatOr
	  [
	    [SMTPat (valid_session pr i p si vi st)];
	    [SMTPat (A.is_msg pr.R.global_usage i (serialize_session_st st) (readers [V p si vi]))]
	  ]
	]
let valid_session_lemma pr i p si vi st =
  let l = readers [V p si vi] in
  let tg : A.msg pr.R.global_usage i public =
    match st with
    | SigningKey _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "SigningKey")
    | VerificationKey _ _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "VerificationKey")
    | DHPrivateKey _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "DHPrivateKey")
    | DHPublicKey _ _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "DHPublicKey")
    | OneTimeDHPrivKey _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "OneTimeDHPrivKey")
    | OneTimeDHPubKey _ _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "OneTimeDHPubKey")
    | DeletedOneTimeKey _ -> A.literal_to_bytes #pr.R.global_usage #i (String "DeletedOneTimeKey")
    | DecryptionKey _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "DecryptionKey")
    | EncryptionKey _ _ _ -> A.literal_to_bytes #pr.R.global_usage #i (String "EncryptionKey")
    | APP _ -> A.literal_to_bytes #pr.R.global_usage #i (String "APP") in
  match st with
  | SigningKey t secret_key
  | DHPrivateKey t secret_key
  | DecryptionKey t secret_key ->
    assert (A.can_flow i public l);
    A.includes_can_flow_lemma i [P p] [V p si vi];
    let ct = A.concat #pr.R.global_usage #i #(readers [P p]) tg (A.concat #pr.R.global_usage #i #(readers [P p]) (A.string_to_bytes #pr.R.global_usage #i t) secret_key) in
    ()
  | OneTimeDHPrivKey t secret_key -> 
    let ct = A.concat #pr.R.global_usage #i #(readers [V p si vi]) tg (A.concat #pr.R.global_usage #i #(readers [V p si vi]) (A.string_to_bytes #pr.R.global_usage #i t) secret_key) in
    ()
  | OneTimeDHPubKey t p' public_key -> 
    let pb = A.literal_to_bytes #pr.R.global_usage #i (String p') in
    let ct = A.concat #pr.R.global_usage #i #l tg (A.concat #pr.R.global_usage #i #l (A.string_to_bytes #pr.R.global_usage #i t) (A.concat #pr.R.global_usage #i #l pb public_key)) in
    ()
  | DeletedOneTimeKey t -> 
    let ct = A.concat #pr.R.global_usage #i #(readers [V p si vi]) tg (A.string_to_bytes #pr.R.global_usage #i t) in
    ()
  | VerificationKey t p' public_key
  | DHPublicKey t p' public_key
  | EncryptionKey t p' public_key ->
    let pb = A.literal_to_bytes #pr.R.global_usage #i (String p') in
    assert (A.can_flow i public (readers [P p]));
    A.includes_can_flow_lemma i [P p] [V p si vi];
    let ct = A.concat #pr.R.global_usage #i #l tg (A.concat #pr.R.global_usage #i #l (A.string_to_bytes #pr.R.global_usage #i t) (A.concat #pr.R.global_usage #i #l pb public_key)) in
    ()
  | APP s ->
    R.(pr.trace_preds.session_st_inv_lemma i p si vi s);
    assert (A.is_msg pr.R.global_usage i s l);
    let ct = A.concat #pr.R.global_usage #i #l tg s in
    ()


let session_st_inv pr i p si vi st =
  A.is_msg pr.R.global_usage i st (readers [V p si vi]) /\
  (match parse_session_st st with
   | Success s -> valid_session pr i p si vi s
   | _ -> False)

val session_st_inv_later: pr:R.preds -> i:nat -> j:nat -> p: principal -> si:nat -> vi:nat -> st:bytes -> Lemma
  ((session_st_inv pr i p si vi st /\ later_than j i) ==> session_st_inv pr j p si vi st)
  [SMTPat (session_st_inv pr i p si vi st); SMTPat (session_st_inv pr j p si vi st)]
let session_st_inv_later pr i j p si vi st = ()

let pki (pr:R.preds) : R.preds = {
  R.global_usage = pr.R.global_usage;
  R.trace_preds = {
    R.can_trigger_event = pr.R.trace_preds.R.can_trigger_event;
    R.session_st_inv = session_st_inv pr;
    R.session_st_inv_later = session_st_inv_later pr;
    R.session_st_inv_lemma = (fun i p si vi st -> ())
  }
}

open LabeledCryptoAPI
open LabeledRuntimeAPI
let new_session #pr #i p si vi ss =
  let sst = serialize_session_st (APP ss) in
  assert (session_st_inv pr i p si vi sst);
  assert ((pki pr).trace_preds.session_st_inv i p si vi sst);
  new_session #(pki pr) #i p si vi sst

let update_session #pr #i p si vi ss =
  let sst = serialize_session_st (APP ss) in
  update_session #(pki pr) #i p si vi sst

let get_session #pr #i p si =
  let (|vi,s|) = get_session #(pki pr) #i p si in
  match parse_session_st s with
  | Success (APP s') ->
    assert (valid_session pr  i p si vi (APP s'));
    pr.trace_preds.session_st_inv_lemma i p si vi s';
    (|vi,s'|)
  | _ -> error "not an application state"

let find_session #pr #i p f =
  let f' si vi st =
    match parse_session_st st with
    | Success (APP s) -> f si vi s
    | _ -> false in
  match find_session #(pki pr) #i p f' with
  | None -> None
  | Some (|si,vi,st|) -> (
    (match parse_session_st st with
     | Success (APP s') ->
       assert (valid_session pr i p si vi (APP s'));
       pr.trace_preds.session_st_inv_lemma i p si vi s';
       Some (|si,vi,s'|)
     | _ -> error "not an application state")
)

let keygen pr p si kt ts :
  LCrypto (t:nat & private_key pr t si p kt ts) (pki pr)
  (requires (fun _ -> True))
  (ensures (fun t0 (|t,sk|) t1 -> t == trace_len t0 /\ trace_len t1 == t + 1)) =
  match kt with
  | SIG -> let (|t,sk|) = R.rand_gen #(pki pr) (readers [P p]) (sig_usage ts) in (|t,sk|)
  | DH -> let (|t,sk|) = R.rand_gen #(pki pr) (readers [P p]) (dh_usage ts) in (|t,sk|)
  | PKE -> let (|t,sk|) =  R.rand_gen #(pki pr) (readers [P p]) (pke_usage ts) in (|t,sk|)
  | OneTimeDH -> let (|t,sk|) =  R.rand_gen #(pki pr) (readers [V p si 0]) (dh_usage ts) in (|t,sk|)

let private_key_st pr i p si vi (kt:key_type{kt <> OneTimeDH}) ts (sk:private_key pr i si p kt ts) : s:session_st {valid_session pr i p si vi s}  =
  match kt with
  | SIG -> SigningKey ts sk
  | DH -> DHPrivateKey ts sk
  | PKE -> DecryptionKey ts sk

let public_key_st pr i p peer si vi (kt:key_type{kt <> OneTimeDH}) ts (sk:private_key pr i si p kt ts) : s:session_st {valid_session pr i peer si vi s}  =
  match kt with
  | SIG -> VerificationKey ts p (A.vk #pr.global_usage #i #(readers [P p]) sk)
  | DH -> DHPublicKey ts p (A.dh_pk #pr.global_usage #i #(readers [P p]) sk)
  | PKE -> EncryptionKey ts p (A.pk #pr.global_usage #i #(readers [P p]) sk)

let gen_private_key #pr #t0 p kt ts =
  print_string ("generating private key for "^p^"\n");
  let si = new_session_number #(pki pr) p in
  let (|t1,sk|) = keygen pr p si kt ts in
  assert (later_than t1 t0);
  let st = (match kt with | OneTimeDH -> OneTimeDHPrivKey ts sk | _ -> private_key_st pr t1 p si 0 kt ts sk) in 
  let new_ss_st = serialize_session_st st in
  let t2 = global_timestamp () in
  assert (session_st_inv pr t2 p si 0 new_ss_st);
  assert ((pki pr).trace_preds.session_st_inv t2 p si 0 new_ss_st);
  LabeledRuntimeAPI.new_session #(pki pr) #t2 p si 0 new_ss_st;
  si

let get_private_key #pr #i p kt ts =
  let filter si vi b = match kt, parse_session_st b with
    | SIG, Success (SigningKey ts' sk)
    | DH, Success (DHPrivateKey ts' sk)
    | PKE, Success (DecryptionKey ts' sk) 
    | OneTimeDH, Success (OneTimeDHPrivKey ts' sk) -> ts = ts'
    | _ -> false in
  match R.find_session #(pki pr) #i p filter with
  | Some (|si,vi,st|) ->
    (match kt, parse_session_st st with
     | SIG, Success (SigningKey ts' sk) -> (|si, sk|)
     | DH, Success (DHPrivateKey ts' sk) -> (|si, sk|)
     | PKE, Success (DecryptionKey ts' sk) -> (|si, sk|)
     | OneTimeDH, Success (OneTimeDHPrivKey ts' sk) -> (|si, sk|)
     |_ -> error "not the right kind of key")
  | None -> error "private key not found"

let install_public_key #pr #i p peer kt ts =
  print_string ("installing public key for "^p^" at "^peer^"\n");
  let (|osi, sk|) = get_private_key #pr #i p kt ts in
  let si = new_session_number #(pki pr) peer in
  let st = (match kt with | OneTimeDH -> OneTimeDHPubKey ts p (A.dh_pk #pr.global_usage #i #(readers [V p osi 0]) sk) | _ -> public_key_st pr i p peer si 0 kt ts sk) in 
  let new_st = serialize_session_st st in
  R.new_session #(pki pr) #i peer si 0 new_st;
  si

let get_public_key #pr #i p peer kt ts =
  let filter si vi b = match kt, parse_session_st b with
    | SIG, Success (VerificationKey ts' pr _)
    | DH, Success (DHPublicKey ts' pr _)
    | PKE, Success (EncryptionKey ts' pr _)
    | OneTimeDH, Success (OneTimeDHPubKey ts' pr _) -> pr = peer && ts = ts'
    | _ -> false in
  match R.find_session #(pki pr) #i p filter with
  | Some (|si,vi,st|) ->
    (match kt, parse_session_st st with
     | SIG, Success (VerificationKey ts' _ sk) -> sk
     | DH, Success (DHPublicKey ts' _ sk) -> sk
     | PKE, Success (EncryptionKey ts' _ sk) -> sk
     | OneTimeDH, Success (OneTimeDHPubKey ts' peer sk) -> sk
     |_ -> error "not the right kind of key")
  | None -> error "public key not found"

let delete_one_time_key #pr #i p ts =
  let (|si, sk|) = get_private_key #pr #i p OneTimeDH ts in 
  let st = serialize_session_st (DeletedOneTimeKey ts) in 
  R.update_session #(pki pr) #i p si 1 st
