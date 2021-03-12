/// Signal.Sessions
/// =====================
module Signal.Sessions

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
open LabeledPKI
open Signal.Messages
open Signal.Crypto
open Signal.Core
module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI

noeq
type session_peers = {
  peer:principal;
  role:role;
  our_identity_public_key: bytes;
  their_identity_public_key: bytes}
  
noeq
type send_state = {
  send_chain_key: bytes;
  send_counter: nat;
  our_ephemeral_private_key: bytes}

noeq
type recv_state = {
  recv_chain_key: bytes;
  recv_counter: nat;
  their_ephemeral_public_key: bytes}

noeq
type session_st =
  | Session: peers:session_peers -> root_key:bytes -> send:option send_state -> recv:option recv_state -> session_st

let role_to_bytes r =
  match r with
  | I -> string_to_bytes "I"
  | R -> string_to_bytes "R"

let role_to_labeled_bytes (#i:nat) (#l:label) (r:role) : A.msg signal_global_usage i l =
  match r with
  | I -> A.string_to_bytes #signal_global_usage #i "I"
  | R -> A.string_to_bytes #signal_global_usage #i "R"

let bytes_to_role t =
  match bytes_to_string t with
  | Success "I" -> Success I
  | Success "R" -> Success R
  | _ -> Error "not a role"

let bytes_to_role_lemma r : Lemma (bytes_to_role (role_to_bytes r) == Success r)
	[SMTPat (bytes_to_role (role_to_bytes r))] = ()

(* Valid session state *)
let valid_session (i:nat) (p:principal) (si:nat) (vi:nat) (st:session_st):Type0 = 
  match st with
    | Session peers root_key (Some send) None ->
       is_ratcheted_root_key i peers.role p peers.peer si vi root_key false /\
       is_signal_dh_public_key i peers.our_identity_public_key (readers [P p]) "Signal.identity_key" /\
       is_signal_dh_public_key i peers.their_identity_public_key (readers [P peers.peer]) "Signal.identity_key" /\
       is_signal_root_key i root_key (A.get_label signal_key_usages root_key) /\
       A.is_msg signal_global_usage i root_key (readers [V p si vi]) /\
       is_signal_chain_key i send.send_chain_key (A.get_label signal_key_usages root_key) /\
       is_signal_dh_private_key i send.our_ephemeral_private_key (readers [V p si vi]) "Signal.one_time_pre_key"
    | Session peers root_key None (Some recv) ->
       is_ratcheted_root_key i peers.role p peers.peer si vi root_key true /\
       is_signal_dh_public_key i peers.our_identity_public_key (readers [P p]) "Signal.identity_key" /\
       is_signal_dh_public_key i peers.their_identity_public_key (readers [P peers.peer]) "Signal.identity_key" /\
       is_signal_root_key i root_key (A.get_label signal_key_usages root_key) /\
       A.is_msg signal_global_usage i root_key (readers [V p si vi]) /\
       A.is_publishable signal_global_usage i recv.their_ephemeral_public_key /\
       is_signal_chain_key i recv.recv_chain_key (A.get_label signal_key_usages root_key) /\
       (A.can_flow i (A.get_label signal_key_usages root_key) public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages recv.their_ephemeral_public_key == readers [V peers.peer rsid rv]))
    | _ -> False

val valid_session_later_: i:nat -> j:nat -> p: principal -> si:nat -> vi:nat -> st:session_st -> Lemma
  ((valid_session i p si vi st /\ later_than j i) ==> valid_session j p si vi st)
  [SMTPat (valid_session i p si vi st); SMTPat (valid_session j p si vi st)]

let valid_session_later (p:principal) :
    Lemma (forall i j si vi st. (valid_session i p si vi st /\ later_than j i) ==> valid_session j p si vi st) = ()

val parse_session_st : bytes -> result session_st

val serialize_valid_session_st : i:nat -> p:principal -> si:nat -> vi:nat -> st:session_st{valid_session i p si vi st} -> 
				 A.msg signal_global_usage i (readers [V p si vi])

val parse_valid_serialize_session_st_lemma : i:nat -> p:principal -> si:nat -> vi:nat -> ss:session_st ->
    Lemma (requires (valid_session i p si vi ss))
	  (ensures (Success ss == parse_session_st (serialize_valid_session_st i p si vi ss)))
	  [SMTPat (parse_session_st (serialize_valid_session_st i p si vi ss))]

/// State invariant
/// ---------------
///
/// This invariant carries all integrity and trace-based properties, i.e., all security and privacy
/// properties except simple confidentiality. Thus, this is a key element when modeling protocols
/// and properties.
(** Invariant on pricipals' states; carries application-specific integrity and trace-based properties. *)
let session_st_inv i p si vi st =
    A.is_msg signal_global_usage i st (readers [V p si vi]) /\
    (match parse_session_st st with
     | Success s -> valid_session i p si vi s
     | _ -> False)
     
let signal: R.preds = {
  R.global_usage = signal_global_usage;
  R.trace_preds = {
    R.can_trigger_event = (fun i p e -> True);
    R.session_st_inv = session_st_inv;
    R.session_st_inv_later = (fun i j p si vi st -> valid_session_later p);
    R.session_st_inv_lemma = (fun i p si vi st -> ())
  }
}

val get_peer_session: i:nat -> p:principal -> peer:principal ->
    R.LCrypto (nat * nat * session_st) (pki signal)
		(requires (fun t0 -> i == trace_len t0))
		(ensures (fun t0 (sid, vi, st) t1 -> t0 == t1 /\ Session? st /\ valid_session i p sid vi st))

