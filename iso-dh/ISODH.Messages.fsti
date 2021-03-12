module ISODH.Messages

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
 
module A = LabeledCryptoAPI

(* Events *)

let initiate (a:principal) (b:principal) (gx:bytes) : event = ("Initiate",[literal_to_bytes (String a);literal_to_bytes (String b);gx])
let respond (a:principal) (b:principal) (gx:bytes) (gy:bytes) (y:bytes): event = ("Respond",[literal_to_bytes (String a);literal_to_bytes (String b);gx;gy;y])
let finishI (a:principal) (b:principal) (gx:bytes) (gy:bytes) (k:bytes): event = ("FinishI",[literal_to_bytes (String a);literal_to_bytes (String b);gx;gy;k])
let finishR (a:principal) (b:principal) (gx:bytes) (gy:bytes) (k:bytes): event = ("FinishR",[literal_to_bytes (String a);literal_to_bytes (String b);gx;gy;k])

(* Formats of Signed Values *)
noeq type sigval =
  | SigMsg2: a:principal -> gx:bytes -> gy:bytes -> sigval
  | SigMsg3: b:principal -> gx:bytes -> gy:bytes -> sigval

val parse_sigval: bytes -> result sigval

(* Global Key Usages *)
let dh_shared_secret_usage s1 s2 ss = 
  if s1 = "ISODH.dh_key" then Some (aead_usage "ISODH.aead_key") 
  else if s2 = "ISODH.dh_key" then Some (aead_usage "ISODH.aead_key") 
  else None
let dh_unknown_peer_usage s1 ss = if s1 = "ISODH.dh_key" then Some (aead_usage "ISODH.aead_key") else None

let isodh_key_usages : A.key_usages = {
  A.dh_shared_secret_usage = dh_shared_secret_usage;
  A.dh_unknown_peer_usage = dh_unknown_peer_usage;
  A.dh_usage_commutes_lemma = (fun () -> ());
  A.dh_unknown_peer_usage_lemma = (fun () -> ());
  A.kdf_extend_label = (fun s k slt -> private_label);
  A.kdf_extract_usage = (fun s k slt -> None);
  A.kdf_expand_usage = (fun s k info -> None);
}

let ppred i pk m = True
let apred i k m ad = True
let spred i k m =
    (exists p. A.get_signkey_label isodh_key_usages k == readers [P p] /\
	(match parse_sigval m with
	 | Success (SigMsg2 a gx gy) ->
	   (exists y. gy == (dh_pk y) /\ did_event_occur_before i p (respond a p gx gy y))
	 | Success (SigMsg3 b gx gy) ->
	   (exists x. gx == (dh_pk x) /\ did_event_occur_before i p (finishI p b gx gy (dh x gy)))
	 | _ -> False))
let mpred i k m = True

let isodh_usage_preds : A.usage_preds = {
  A.can_pke_encrypt = ppred;
  A.can_aead_encrypt =  apred;
  A.can_sign = spred;
  A.can_mac = mpred
}

let isodh_global_usage : A.global_usage = {
  A.key_usages = isodh_key_usages;
  A.usage_preds = isodh_usage_preds;
}

(* Messages and Serialization *)

let msg i l = A.msg isodh_global_usage i l

val sigval_msg2 (#i:nat) (b:principal) (gx:msg i public) (gy:msg i public) :
		r:msg i public{parse_sigval r == Success (SigMsg2 b gx gy)}
val sigval_msg3 (#i:nat) (a:principal) (gx:msg i public) (gy:msg i public) :
		r:msg i public{parse_sigval r == Success (SigMsg3 a gx gy)}

noeq type iso_msg (i:nat) =
  |Msg1: a:principal -> gx:msg i public -> iso_msg i
  |Msg2: b:principal -> gy:msg i public -> sg:msg i public -> iso_msg i
  |Msg3: sg:msg i public -> iso_msg i

val serialize_msg: i:nat -> iso_msg i -> msg i public
val parse_msg: #i:nat -> msg i public -> result (iso_msg i)

