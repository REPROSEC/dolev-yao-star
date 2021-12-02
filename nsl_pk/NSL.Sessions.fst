/// NSL.Sessions (implementation)
/// ==============================
module NSL.Sessions

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open NSL.Messages
module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI

let is_priv_key i secret_key p = A.is_private_dec_key nsl_global_usage i secret_key (readers [P p]) "NSL.key"
let is_pub_key i pub_key p = A.is_public_enc_key nsl_global_usage i pub_key (readers [P p]) "NSL.key"
let is_nonce (i:nat) n a b = A.is_secret nsl_global_usage i n (readers [P a; P b]) (nonce_usage "NSL.nonce") /\
	             (was_rand_generated_before i n (readers [P a; P b]) (nonce_usage "NSL.nonce"))

type ns_nonce (i:nat) (a:principal) (b:principal) =
  s:A.secret nsl_global_usage i (readers [P a; P b]) (nonce_usage "NSL.nonce") {
   was_rand_generated_before i s (readers [P a; P b]) (nonce_usage "NSL.nonce")
  }
type pub_key i p = A.public_enc_key nsl_global_usage i (readers [P p]) "NSL.key"
type priv_key i p = A.private_dec_key nsl_global_usage i (readers [P p]) "NSL.key"

noeq type session_st =
  |InitiatorSentMsg1: b:principal -> n_a:bytes -> session_st
  |ResponderSentMsg2: a:principal -> n_a:bytes -> n_b:bytes -> session_st
  |InitiatorSentMsg3: b:principal -> n_a:bytes -> n_b:bytes -> session_st
  |ResponderReceivedMsg3: a:principal -> n_b:bytes -> session_st

let parse_session_st (serialized_session:bytes) : result session_st =
  match split serialized_session with 
  | Success (tn, o) ->
    (match bytes_to_string tn with 
    | Success ("InitiatorSentMsg1") ->
      (match split o with | Success (b, n_a) -> (match bytes_to_string b with | Success (b) -> Success (InitiatorSentMsg1 b n_a) | _ -> Error "Not a principal")
			  | _ -> Error "initiator msg1 error")
    | Success ("ResponderSentMsg2") ->
      (match split o with | Success (a, o) -> (match bytes_to_string a, split o with 
					     | Success (a), Success (n_a, n_b) -> 
					       Success (ResponderSentMsg2 a n_a n_b) | _ -> Error "responder msg2 error")
			  | _ -> Error "responder msg2 error")
    | Success ("InitiatorSentMsg3") ->
      (match split o with | Success (b, o) -> (match bytes_to_string b, split o with 
					     | Success (b), Success (n_a, n_b) -> Success (InitiatorSentMsg3 b n_a n_b) | _ -> Error "initiator msg3 error")
			  | _ -> Error "initiator msg3 error")
    | Success ("ResponderReceivedMsg3") ->
      (match split o with | Success (a, n_b) -> (match bytes_to_string a with 
					     | Success (a) -> 
					       Success (ResponderReceivedMsg3 a n_b) | _ -> Error "responder msg3 error")
			  | _ -> Error "responder msg3 error")
    | _ -> Error "incorrect session state format")
  | _ -> Error "error in split"


(** valid session predicates *)
val valid_session: i:nat -> p: principal -> si: nat -> vi:nat -> st: session_st -> Type0
let valid_session i p si vi st =
  match st with
  | InitiatorSentMsg1 b n_a -> is_nonce i n_a p b
  | ResponderSentMsg2 a n_a n_b ->
      A.is_msg nsl_global_usage i n_a (readers [P p]) /\
      A.is_secret nsl_global_usage i n_b (readers [P a; P p]) (nonce_usage "NSL.nonce") /\
      did_event_occur_before i p (respond a p n_a n_b) /\
      was_rand_generated_before i n_b (readers [P a; P p]) (nonce_usage "NSL.nonce")
  | InitiatorSentMsg3 b n_a n_b ->
      A.is_msg nsl_global_usage i n_b (readers [P p]) /\
      is_nonce i n_a p b /\
      (A.corrupt_id i (P p) \/ A.corrupt_id i (P b) \/ A.is_labeled nsl_global_usage i n_b (readers [P p; P b]))
  | ResponderReceivedMsg3 a n_b ->
        A.is_secret nsl_global_usage i n_b (readers [P a; P p]) (nonce_usage "NSL.nonce")
  | _ -> True


let valid_session_later (p:principal) : 
    Lemma (forall i j si vi st. (valid_session i p si vi st /\ later_than j i) ==> valid_session j p si vi st) = ()

let serialize_valid_session_st (i:nat) (p:principal) (si vi:nat) (st:session_st{valid_session i p si vi st}) : msg i (readers [V p si vi]) =
  let s2b s : msg i (readers [V p si vi]) = A.string_to_bytes #nsl_global_usage #i s in
  assert (forall s. s2b s == string_to_bytes s);
   match st with
   | InitiatorSentMsg1 b n_a ->
     A.concat #nsl_global_usage #i #(readers [V p si vi]) ((s2b "InitiatorSentMsg1")) (A.concat ((s2b b)) n_a)
   | ResponderSentMsg2 a n_a n_b ->
     A.can_flow_transitive i (A.get_label nsl_key_usages n_a) (readers [P p]) (readers [V p si vi]);
     A.concat #nsl_global_usage #i ((s2b "ResponderSentMsg2")) (A.concat ((s2b a)) (A.concat n_a n_b))
   | InitiatorSentMsg3 b n_a n_b ->
     A.can_flow_transitive i (A.get_label nsl_key_usages n_b) (readers [P p]) (readers [V p si vi]);
     A.concat #nsl_global_usage #i ((s2b "InitiatorSentMsg3")) (A.concat ((s2b b)) (A.concat n_a n_b))
   | ResponderReceivedMsg3 a n_b ->
     A.concat #nsl_global_usage #i ((s2b "ResponderReceivedMsg3")) (A.concat ((s2b a)) n_b)

val parse_serialize_valid_session_st_lemma (i:nat) (p:principal) (si vi:nat) (st:session_st):
    Lemma (requires (valid_session i p si vi st))
	  (ensures  (Success st == parse_session_st (serialize_valid_session_st i p si vi st)))
	  [SMTPat (parse_session_st (serialize_valid_session_st i p si vi st))]
let parse_serialize_valid_session_st_lemma i p si vi st =
   match st with
   | InitiatorSentMsg1 b n_a -> ()
   | ResponderSentMsg2 a n_a n_b -> ();
     A.can_flow_transitive i (A.get_label nsl_key_usages n_a) (readers [P p]) (readers [V p si vi])
   | InitiatorSentMsg3 b n_a n_b -> ();
     A.can_flow_transitive i (A.get_label nsl_key_usages n_b) (readers [P p]) (readers [V p si vi])
   | ResponderReceivedMsg3 a n_b -> ()



let session_st_inv i p si vi st =
    A.is_msg nsl_global_usage i st (readers [V p si vi]) /\
    (match parse_session_st st with
     | Success s -> valid_session i p si vi s
     | _ -> False)


let epred idx s e =
    match e with
    | ("Initiate",[ta;tb;n_a]) -> True
    | ("Respond",[ta;tb;n_a;n_b]) ->
      (match bytes_to_string ta, bytes_to_string tb with
       | Success a, Success b -> (b == s /\ idx > 0 /\
	 (was_rand_generated_at (idx-1) n_b (readers [P a; P b]) (nonce_usage "NSL.nonce")))
       | _ -> False)
    | ("FinishI",[ta;tb;n_a;n_b]) ->
      (match bytes_to_string ta, bytes_to_string tb with
       | Success a, Success b -> a == s /\ (A.corrupt_id idx (P a) \/ A.corrupt_id idx (P b) \/
	 (did_event_occur_before idx b (respond a b n_a n_b)))
       | _ -> False)
    | ("FinishR",[ta;tb;n_a;n_b]) ->
      (match bytes_to_string ta, bytes_to_string tb with
       | Success a, Success b ->
	 b == s /\
	 (did_event_occur_before idx s (respond a s n_a n_b)) /\
	 (A.corrupt_id idx (P a) \/ A.corrupt_id idx (P b) \/
	 (exists n_a. (did_event_occur_before idx a (finishI a b n_a n_b))))
       | _ -> False)
    | _ -> False


let nsl: R.preds = {
  R.global_usage = nsl_global_usage;
  R.trace_preds = {
    R.can_trigger_event = epred;
    R.session_st_inv = session_st_inv;
    R.session_st_inv_later = (fun i j p si vi st -> ());
    R.session_st_inv_lemma = (fun i p si vi st -> ())
  }
}
