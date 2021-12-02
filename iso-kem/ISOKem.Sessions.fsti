/// ISOKem.Sessions
/// ================
module ISOKem.Sessions

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open ISOKem.Messages

module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI

(* Instantiated Protocol Usages and Keys *)

let is_encapsulated_key i k gx b = A.is_aead_key isokem_global_usage i k (join (A.get_sk_label isokem_key_usages gx) (readers [P b])) "ISOKem.aead_key"
let is_eph_priv_key i k p = A.is_private_dec_key isokem_global_usage i k (readers [P p]) "ISOKem.pke_key"
let is_eph_pub_key i k p = A.is_public_enc_key isokem_global_usage i k (readers [P p]) "ISOKem.pke_key"
let is_session_key i k a b = A.is_aead_key isokem_global_usage i k (join (readers [P a]) (readers [P b])) "ISOKem.aead_key"

let eph_pub_key i p = A.public_enc_key isokem_global_usage i (readers [P p]) "ISOKem.pke_key"
let eph_priv_key i p = A.private_dec_key isokem_global_usage i (readers [P p]) "ISOKem.pke_key"
let session_key i a b = A.aead_key isokem_global_usage i (join (readers [P a]) (readers [P b])) "ISOKem.aead_key"

(* Session States *)

noeq type session_st =
  |InitiatorSentMsg1: b:principal -> x:bytes -> session_st
  |ResponderSentMsg2: a:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st
  |InitiatorSentMsg3: b:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st
  |ResponderReceivedMsg3: a:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st

val parse_session_st: bytes -> result session_st

let valid_session (i:nat) (p:principal) (si:nat) (vi:nat) (st:session_st) : Type0 =
  match st with
  | InitiatorSentMsg1 b x -> is_eph_priv_key i x p
  | ResponderSentMsg2 a gx gy k -> A.is_publishable isokem_global_usage i gx /\
				  A.is_publishable isokem_global_usage i gy /\
				  A.can_flow i (A.get_label isokem_key_usages k) (readers [P p]) /\
				  is_encapsulated_key i k gx p /\
				  (exists n. gy == pke_enc gx n k)
  | InitiatorSentMsg3 b gx gy k -> A.is_publishable isokem_global_usage i gx /\
				  A.is_publishable isokem_global_usage i gy /\
				  A.is_msg isokem_global_usage i k (readers [P p]) /\
				  (A.corrupt_id i (P b) \/
   				     (is_session_key i k p b /\
				       did_event_occur_before i b (respond p b gx gy k)))
  | ResponderReceivedMsg3 a gx gy k -> A.is_publishable isokem_global_usage i gx /\
				      A.is_publishable isokem_global_usage i gy /\
				      A.is_msg isokem_global_usage i k (readers [P p]) /\
				      (A.corrupt_id i (P a) \/
					(is_session_key i k a p /\
					  did_event_occur_before i a (finishI a p gx gy k)))
  | _ -> True


let valid_session_later (p:principal) :
    Lemma (forall i j si vi st. (valid_session i p si vi st /\ later_than j i) ==>
			    valid_session j p si vi st) = ()

val serialize_valid_session_st (i:nat) (p:principal) (si:nat) (vi:nat)
			       (st:session_st{valid_session i p si vi st}) :
			       A.msg isokem_global_usage i (readers [V p si vi])

val parse_valid_serialize_session_st_lemma : i:nat -> p:principal -> si:nat -> vi:nat -> ss:session_st ->
    Lemma (requires (valid_session i p si vi ss))
	  (ensures (Success ss == parse_session_st (serialize_valid_session_st i p si vi ss)))
	  [SMTPat (parse_session_st (serialize_valid_session_st i p si vi ss))]




let epred i s e =
    match e with
    | ("Initiate",[ta;tb;gx]) -> True
    | ("Respond",[ta;tb;gx;gy;k]) ->
      (match bytes_to_string tb, bytes_to_string ta with
       | Success (b), Success (a) ->
		 A.is_publishable isokem_global_usage i gx /\ A.is_publishable isokem_global_usage i gy /\ is_encapsulated_key i k gx b
       | _, _ -> False )
    | ("FinishI",[ta;tb;gx;gy;k]) ->
      (match bytes_to_string tb, bytes_to_string ta with
       | Success (b), Success (a) -> is_eph_pub_key i gx a /\ (A.corrupt_id i (P b) \/ did_event_occur_before i b (respond a b gx gy k))
       | _, _ -> False )
    | ("FinishR",[ta;tb;gx;gy;k]) ->
      (match bytes_to_string ta, bytes_to_string tb with
	| Success (a), Success (b) -> A.corrupt_id i (P a) \/ did_event_occur_before i a (finishI a b gx gy k)
       | _, _ -> False )
    | _ -> False
let session_st_inv i p si vi st =
    A.is_msg isokem_global_usage i st (readers [V p si vi]) /\
    (match parse_session_st st with
     | Success s -> valid_session i p si vi s
     | _ -> False)

let isokem: R.preds = {
  R.global_usage = isokem_global_usage;
  R.trace_preds = {
    R.can_trigger_event = epred;
    R.session_st_inv = session_st_inv;
    R.session_st_inv_later = (fun i j p si vi st -> valid_session_later p);
    R.session_st_inv_lemma = (fun i p si vi st -> ())
  }
}
