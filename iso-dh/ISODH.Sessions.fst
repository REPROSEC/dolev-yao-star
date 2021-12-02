/// ISODH.Sessions (implementation)
/// ================================
module ISODH.Sessions

module A = LabeledCryptoAPI
module R = LabeledRuntimeAPI


let parse_session_st (serialized_session:bytes) : result session_st =
  r <-- split serialized_session ;
  let (tn,o) = r in
  r <-- bytes_to_string tn ;
  (match r with
  | "InitiatorSentMsg1" ->
    r <-- split o; let (b,x) = r in
    (match bytes_to_string b with
    | Success (b) -> Success (InitiatorSentMsg1 b x)
    | _ -> Error "Not a principal")
  | "ResponderSentMsg2" ->
    r <-- split o; let (a,o) = r in
    (match bytes_to_string a with
    | Success (a) ->
      r <-- split o; let (gx,gyk) = r in
      r <-- split gyk; let (gy,k) = r in
      Success (ResponderSentMsg2 a gx gy k)
    | _ -> Error "not a principal")
  | "InitiatorSentMsg3" ->
    r <-- split o; let (b,o) = r in
    (match bytes_to_string b with
    | Success (b) ->
      r <-- split o; let (gx,gyk) = r in
      r <-- split gyk; let (gy,k) = r in
      Success (InitiatorSentMsg3 b gx gy k)
    | _ -> Error "not a principal")
  | "ResponderReceivedMsg3" ->
    r <-- split o; let (a,o) = r in
    (match bytes_to_string a with
    | Success (a) ->
      r <-- split o; let (gx,gyk) = r in
      r <-- split gyk; let (gy,k) = r in
      Success (ResponderReceivedMsg3 a gx gy k)
    | _ -> Error "not a principal")
  | _ -> Error "not a session state")

let includes_lemma (p:principal) (s:nat) (v:nat) : Lemma (includes_ids [P p] [V p s v]) [SMTPat (includes_ids [P p] [V p s v])] = ()

let serialize_valid_session_st i p si vi st =
  assert (includes_ids [P p] [V p si vi]);
  match st with
   |InitiatorSentMsg1 b x ->
    A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) ("InitiatorSentMsg1"))
	      (A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) (b)) x)
   |ResponderSentMsg2 a gx gy k ->
    A.can_flow_transitive i (A.get_label isodh_key_usages k) (readers [P p]) (readers [V p si vi]);
    A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) ("ResponderSentMsg2"))
	     (A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) (a)) (A.concat gx (A.concat gy k)))
   |InitiatorSentMsg3 b gx gy k ->
    A.can_flow_transitive i (A.get_label isodh_key_usages k) (readers [P p]) (readers [V p si vi]);
    A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) ("InitiatorSentMsg3"))
	   (A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) (b)) (A.concat gx (A.concat gy k)))
   |ResponderReceivedMsg3 a gx gy k ->
    A.can_flow_transitive i (A.get_label isodh_key_usages k) (readers [P p]) (readers [V p si vi]);
    A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) ("ResponderReceivedMsg3"))
	   (A.concat (A.string_to_labeled_bytes #isodh_global_usage #i #(readers [V p si vi]) (a)) (A.concat gx (A.concat gy k)))

#push-options "--z3rlimit 100"
let parse_valid_serialize_session_st_lemma i p si vi ss =
   match ss with
   |InitiatorSentMsg1 b x -> ()
   |ResponderSentMsg2 a gx gy k -> assert (includes_ids [P p] [V p si vi]);
     A.can_flow_transitive i (A.get_label isodh_key_usages k) (readers [P p]) (readers [V p si vi])
   |InitiatorSentMsg3 b gx gy k -> ()
   |ResponderReceivedMsg3 a gx gy k -> ()
#pop-options

