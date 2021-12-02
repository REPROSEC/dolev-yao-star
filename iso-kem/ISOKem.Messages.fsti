/// ISOKem.Messages
/// ================
module ISOKem.Messages

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib

module A = LabeledCryptoAPI

(* Events *)

let initiate (a:principal) (b:principal) (gx:bytes) : event = ("Initiate",[(string_to_bytes a);(string_to_bytes b);gx])
let respond (a:principal) (b:principal) (gx:bytes) (gy:bytes) (k:bytes): event = ("Respond",[(string_to_bytes a);(string_to_bytes b);gx;gy;k])
let finishI (a:principal) (b:principal) (gx:bytes) (gy:bytes) (k:bytes): event = ("FinishI",[(string_to_bytes a);(string_to_bytes b);gx;gy;k])
let finishR (a:principal) (b:principal) (gx:bytes) (gy:bytes) (k:bytes): event = ("FinishR",[(string_to_bytes a);(string_to_bytes b);gx;gy;k])

(* Formats of Signed Values *)
noeq type sigval =
  | SigMsg2: a:principal -> gx:bytes -> gy:bytes -> sigval
  | SigMsg3: b:principal -> gx:bytes -> gy:bytes -> sigval

val parse_sigval: bytes -> result sigval

(* Global Key Usages *)
let isokem_key_usages : A.key_usages = A.default_key_usages

let ppred i s pk m = True
let apred i s k m ad = True
let spred i s k m =
    s == "ISOKem.sig_key" /\
    (exists p. A.get_signkey_label isokem_key_usages k == readers [P p] /\
	(match parse_sigval m with
	 | Success (SigMsg2 a gx gy) ->
	   (exists k n. gy == (pke_enc gx n k) /\ did_event_occur_before i p (respond a p gx gy k))
	 | Success (SigMsg3 b gx gy) ->
	   (exists k n. gy == (pke_enc gx n k) /\ did_event_occur_before i p (finishI p b gx gy k))
	 | _ -> False))
let mpred i s k m = True

let isokem_usage_preds : A.usage_preds = {
  A.can_pke_encrypt = ppred;
  A.can_aead_encrypt =  apred;
  A.can_sign = spred;
  A.can_mac = mpred
}

let isokem_global_usage : A.global_usage = {
  A.key_usages = isokem_key_usages;
  A.usage_preds = isokem_usage_preds;
}

(* Messages and Serialization *)

let msg i l = A.msg isokem_global_usage i l

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

