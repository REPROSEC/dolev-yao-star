/// ISODH.Sessions
/// ===============
module ISODH.Sessions

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open ISODH.Messages

module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI

(* Instantiated Protocol Usages and Keys *)

let is_dh_un_key i k x gy = A.is_aead_key isodh_global_usage i k (join (A.get_label isodh_key_usages x) (A.get_dhkey_label isodh_key_usages gy)) "ISODH.aead_key"
let is_eph_priv_key i k p si vi = A.is_dh_private_key isodh_global_usage i k (readers [V p si vi]) "ISODH.dh_key"
let is_eph_pub_key i k p si vi = A.is_dh_public_key isodh_global_usage i k (readers [V p si vi]) "ISODH.dh_key"
let is_dh_shared_key i k a b = (exists si sj vi vj. A.is_aead_key isodh_global_usage i k (join (readers [V a si vi]) (readers [V b sj vj])) "ISODH.aead_key")

let eph_pub_key i p si vi = A.dh_public_key isodh_global_usage i (readers [V p si vi]) "ISODH.dh_key"
let eph_priv_key i p si vi = A.dh_private_key isodh_global_usage i (readers [V p si vi]) "ISODH.dh_key"

(* Session States *)

noeq type session_st =
  |InitiatorSentMsg1: b:principal -> x:bytes -> session_st
  |ResponderSentMsg2: a:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st
  |InitiatorSentMsg3: b:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st
  |ResponderReceivedMsg3: a:principal -> gx:bytes -> gy:bytes -> k:bytes -> session_st

val parse_session_st: bytes -> result session_st

let valid_session (i:nat) (p:principal) (si:nat) (vi:nat) (st:session_st) : Type0 =
  match st with
  | InitiatorSentMsg1 b x -> is_eph_priv_key i x p si vi
  | ResponderSentMsg2 a gx gy y -> A.is_publishable isodh_global_usage i gx /\
				  A.is_publishable isodh_global_usage i gy /\
				  A.is_msg isodh_global_usage i y (readers [V p si vi]) /\
				  is_eph_priv_key i y p si vi /\
				  gy == dh_pk y
  | InitiatorSentMsg3 b gx gy k -> A.is_publishable isodh_global_usage i gx /\
				  A.is_publishable isodh_global_usage i gy /\
				  A.is_msg isodh_global_usage i k (readers [V p si vi]) /\
				  (A.corrupt_id i (P b) \/
   				     (exists y. k == dh y gx /\ is_dh_shared_key i k p b /\
				       did_event_occur_before i b (respond p b gx gy y)))
  | ResponderReceivedMsg3 a gx gy k -> A.is_publishable isodh_global_usage i gx /\
				      A.is_publishable isodh_global_usage i gy /\
				      A.is_msg isodh_global_usage i k (readers [V p si vi]) /\
				      (A.corrupt_id i (P a) \/
					(is_dh_shared_key i k a p /\
					  did_event_occur_before i a (finishI a p gx gy k)))
  | _ -> True


let valid_session_later (p:principal) :
    Lemma (forall i j si vi st. (valid_session i p si vi st /\ later_than j i) ==>
			    valid_session j p si vi st) = ()

val serialize_valid_session_st (i:nat) (p:principal) (si:nat) (vi:nat)
			       (st:session_st{valid_session i p si vi st}) :
			       A.msg isodh_global_usage i (readers [V p si vi])

val parse_valid_serialize_session_st_lemma : i:nat -> p:principal -> si:nat -> vi:nat -> ss:session_st ->
    Lemma (requires (valid_session i p si vi ss))
	  (ensures (Success ss == parse_session_st (serialize_valid_session_st i p si vi ss)))
	  [SMTPat (parse_session_st (serialize_valid_session_st i p si vi ss))]

let epred i s e =
    match e with
    | ("Initiate",[ta;tb;gx]) -> True
    | ("Respond",[ta;tb;gx;gy;y]) ->
      (match bytes_to_string tb, bytes_to_string ta with
       | Success (b), Success (a) -> A.is_publishable isodh_global_usage i gx /\ A.is_publishable isodh_global_usage i gy /\ 
						  (exists si vi. is_eph_priv_key i y b si vi) /\ gy == dh_pk y 
       | _, _ -> False )
    | ("FinishI",[ta;tb;gx;gy;k]) ->
      (match bytes_to_string tb, bytes_to_string ta with
       | Success (b), Success (a) -> A.is_publishable isodh_global_usage i gx /\ A.is_publishable isodh_global_usage i gy /\ 
						  (exists si vi. is_eph_pub_key i gx a si vi) /\ 
						  (A.corrupt_id i (P b) \/ (exists y. k == dh y gx /\ is_dh_shared_key i k s b /\ did_event_occur_before i b (respond a b gx gy y)))
       | _, _ -> False )
    | ("FinishR",[ta;tb;gx;gy;k]) ->
      (match bytes_to_string ta, bytes_to_string tb with
	| Success (a), Success (b) -> A.corrupt_id i (P a) \/ (is_dh_shared_key i k a s /\ did_event_occur_before i a (finishI a b gx gy k))
       | _, _ -> False )
    | _ -> False
let session_st_inv i p si vi st =
    A.is_msg isodh_global_usage i st (readers [V p si vi]) /\
    (match parse_session_st st with
     | Success s -> valid_session i p si vi s
     | _ -> False)

let isodh: R.preds = {
  R.global_usage = isodh_global_usage;
  R.trace_preds = {
    R.can_trigger_event = epred;
    R.session_st_inv = session_st_inv;
    R.session_st_inv_later = (fun i j p si vi st -> valid_session_later p);
    R.session_st_inv_lemma = (fun i p si vi st -> ())
  }
}
