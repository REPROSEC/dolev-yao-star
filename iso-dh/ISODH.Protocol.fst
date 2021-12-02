/// ISO_DH.Protocol (implementation)
/// =================================
module ISODH.Protocol

module C = CryptoLib

let initiator_send_msg_1 a b = 
  print_string ("initiator "^a^" sending first message to "^b^"\n");
  let si = new_session_number #isodh a in
  let (|t0,x|) = rand_gen #isodh (readers [V a si 0]) (dh_usage "ISODH.dh_key") in
  let gx = dh_pk #isodh_global_usage #t0 #(readers [V a si 0]) x in
  let ev = initiate a b gx in
  trigger_event #isodh a ev;
  let t1 = global_timestamp () in
  let new_ss_st = InitiatorSentMsg1 b x in
  let new_ss = serialize_valid_session_st t1 a si 0 new_ss_st in
  new_session #(isodh) #t1 a si 0 new_ss;
  let t2 = global_timestamp () in
  let msg1 = Msg1 a gx in
  let w_msg1 = serialize_msg t2 msg1 in
  let i = send #isodh #t2 a b w_msg1 in
  i,si

val receive_msg_1_helper: b:principal -> idx_msg:nat -> LCrypto (now:nat & a:principal & gx:msg now public) (pki isodh)
			  (requires (fun _ -> True))
			  (ensures (fun t0 (|now, _, _|) t1 -> t0 == t1 /\ now == trace_len t0))

let receive_msg_1_helper b idx_msg =
  print_string ("responder "^b^" processing first message to \n");
  let (|now,_,w_msg1|) = receive_i #isodh idx_msg b in
  let msg1 = parse_msg w_msg1 in
  match msg1 with
   | Success (Msg1 a gx) -> (|now,a,gx|)
   | _ -> error "responder_send_msg_2: not a msg1"

#set-options "--z3rlimit 200 --max_fuel 2 --max_ifuel 2" 

val send_msg_2_helper: #idx:nat -> b:principal -> a:principal -> gx:msg idx public -> LCrypto (nat*nat) (pki isodh)
			  (requires (fun t0 -> later_than (trace_len t0) idx))
			  (ensures (fun t0 (i,si) t1 -> trace_len t1 > trace_len t0 /\ i == trace_len t1 - 1))
let send_msg_2_helper #idx b a gx =
  print_string ("responder "^b^" sending second message to "^a^"\n");
  let t0 = global_timestamp () in
  let si = new_session_number #isodh b in
  let (|_, skb|) = get_private_key #isodh #t0 b SIG sig_key_label in
  let kl = (readers [V b si 0]) in
  let (|t1, y|) = rand_gen #isodh kl (dh_usage "ISODH.dh_key") in
  let gy = dh_pk #isodh_global_usage #t1 #kl y in
  let new_ss_st = (ResponderSentMsg2 a gx gy y) in
  let new_ss = serialize_valid_session_st t1 b si 0 new_ss_st in
  assert (is_eph_priv_key (t1+1) y b si 0); assert (exists si vi. is_eph_priv_key (t1+1) y b si vi);
  trigger_event #isodh b (respond a b gx gy y);
  let t2 = global_timestamp () in
  new_session #isodh #t2 b si 0 new_ss;
  let t3 = global_timestamp () in
  let sv: msg t3 public = sigval_msg2 #t3 a gx gy in
  let vkb = vk #isodh_global_usage #t3 #(readers [P b]) skb in
  let (|t4,n_sig|) = rand_gen #isodh (readers [P b]) (nonce_usage "SIG_NONCE") in
  assert (spred t4 sig_key_label (C.vk skb) sv);
  let sg = sign #isodh_global_usage #t4 #(readers [P b]) #public skb n_sig sv in
  let gy:msg t4 public = gy in
  let msg2 = Msg2 b gy sg in
  let w_msg2 = serialize_msg t4 msg2 in
  let i = send #isodh #t4 b a w_msg2 in
  i,si

let responder_send_msg_2 b idx_msg =
  let (|now,a,gx|) = receive_msg_1_helper b idx_msg in
  send_msg_2_helper #now b a gx

let dh_shared_secret_lemma__ (x:bytes) (y:bytes) : Lemma ((CryptoLib.dh x (CryptoLib.dh_pk y)) == (CryptoLib.dh y (CryptoLib.dh_pk x))) 
    [SMTPat (CryptoLib.dh x (CryptoLib.dh_pk y)); SMTPat (CryptoLib.dh y (CryptoLib.dh_pk x))] 
= CryptoLib.dh_shared_secret_lemma x y 

val receive_msg_2_helper:
  i:nat -> si:nat -> vi:nat -> 
  a:principal ->
  b:principal ->
  pkb:public_key isodh i b SIG "ISODH.sig_key" ->
  x:eph_priv_key i a si vi ->
  gx:eph_pub_key i a si vi{gx == dh_pk #isodh_global_usage #i #(readers [V a si vi]) x} ->
  gy:msg i public ->
  sg:msg i public ->
  LCrypto bytes (pki isodh)
  (requires (fun t0 -> i == trace_len t0))
  (ensures (fun t0 k t1 -> trace_len t0 == trace_len t1 /\
			k == CryptoLib.dh x gy /\
			is_msg isodh_global_usage i k (readers [V a si vi]) /\
			(corrupt_id i (P b) \/
   				    (exists y. k == CryptoLib.dh y gx /\ is_dh_shared_key i k a b /\ did_event_occur_before i b (respond a b gx gy y)))))

let receive_msg_2_helper i si vi a b pkb x gx gy sg =
   let sv = sigval_msg2 a gx gy in
   if verify #isodh_global_usage #i #(readers [P b]) #public pkb sv sg then (
     can_flow_to_public_implies_corruption i (P b);
     verification_key_label_lemma isodh_global_usage i pkb (readers [P b]);
     let k = dh #isodh_global_usage #i #(readers [V a si vi]) x gy in 
     readers_is_injective b;
     assert (forall y si vi. gy == (CryptoLib.dh_pk y) /\ is_eph_priv_key i y b si vi ==> is_eph_pub_key i gy b si vi); 
     assert (forall y idx si vi. is_eph_priv_key idx y b si vi /\ later_than i idx ==> is_eph_priv_key i y b si vi);
     assert (spred i "ISODH.sig_key" pkb sv ==> (exists y idx si vi. gy == (CryptoLib.dh_pk y) /\ is_eph_priv_key idx y b si vi /\ 
					     later_than i idx /\ did_event_occur_before i b (respond a b gx gy y)));
     assert (spred i "ISODH.sig_key" pkb sv ==> (exists y si vi. gy == (CryptoLib.dh_pk y) /\ is_eph_pub_key i gy b si vi /\ did_event_occur_before i b (respond a b gx gy y))); 
     dh_key_label_lemma isodh_global_usage i gy;
     k)
   else error "sig verification failed"


let initiator_send_msg_3 a idx_session idx_msg =
  print_string ("initiator "^a^" processing second message and sending third message\n");
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #isodh #t0 a idx_session in
  match parse_session_st st with
  | Success (InitiatorSentMsg1 b x) ->
    assert (is_eph_priv_key t0 x a idx_session vi); 
    let (|si, ska|) = get_private_key #isodh #t0 a SIG "ISODH.sig_key" in
    let pkb = get_public_key #isodh #t0 a b SIG "ISODH.sig_key" in
    let (|t1,_,w_msg2|) = receive_i #isodh idx_msg a in
    assert (later_than t1 t0);
    (match parse_msg #t1 w_msg2 with
    | Success (Msg2 b'' gy sg) ->
      if b = b'' then (
      let gx = dh_pk #isodh_global_usage #t1 #(readers [V a idx_session vi]) x in
      let pkb : public_key isodh t1 b SIG "ISODH.sig_key" = pkb in
      let k = receive_msg_2_helper t1 idx_session vi a b pkb x gx gy sg in
      let new_ss_st = (InitiatorSentMsg3 b gx gy k) in
      let new_ss = serialize_valid_session_st t1 a idx_session vi new_ss_st in
      assert (is_eph_pub_key t1 gx a idx_session vi); assert (later_than (t1+1) t1);
      trigger_event #isodh a (finishI a b gx gy k);
      let t2 = global_timestamp () in
      update_session #isodh #t2 a idx_session vi new_ss;
      let t3 = global_timestamp () in
      let sv : msg t3 public = sigval_msg3 #t3 b gx gy in
      let ska : private_key isodh t3 si a SIG "ISODH.sig_key" = ska in
      let vka = vk #isodh_global_usage #t3 #(readers [P a]) ska in
      assert (sign_pred isodh_global_usage.usage_preds t3 "ISODH.sig_key" vka sv);
      let (|t4,n_sig|) = rand_gen #isodh (readers [P a]) (nonce_usage "SIG_NONCE") in
      let sg' = sign #isodh_global_usage #t4 #(readers [P a]) #public ska n_sig sv in
      let msg3 = Msg3 sg' in
      let w_msg3 : msg t3 public = serialize_msg t4 msg3 in
      let i = send #isodh #t4 a b w_msg3 in
      i)
      else error "initiator_send_msg_3: incorrect sender"
    | _ -> error "initiator_send_msg_3: not a msg2")
 | _ -> error  "initiator_send_msg_3: wrong session states"


let responder_accept_msg_3 b idx_session idx_msg =
  print_string ("responder "^b^" processing third message\n");
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #isodh #t0 b idx_session in
  match parse_session_st st with
  | Success (ResponderSentMsg2 a gx gy y) ->
    let pka = get_public_key #isodh #t0 b a SIG "ISODH.sig_key" in
    let (|t1,_,w_msg3|) = receive_i #isodh idx_msg b in
    assert (t1 == t0); 
    (match parse_msg #t1 w_msg3 with
       | Success (Msg3 sg) ->
	 let sv = sigval_msg3 #t1 b gx gy in
	 if verify #isodh_global_usage #t1 #(readers [P a]) #public pka sv sg then (
	     can_flow_to_public_implies_corruption t1 (P a);
	     verification_key_label_lemma isodh_global_usage t1 pka (readers [P a]);
	     let k = dh #isodh_global_usage #t1 #(readers [V b idx_session vi]) y gx in 
	     readers_is_injective a; dh_key_label_lemma isodh_global_usage t1 gx;
	     assert (forall idx si vi. is_eph_pub_key idx gx a si vi /\ later_than t1 idx ==> is_eph_pub_key t1 gx a si vi);
	     assert (forall si vi. is_eph_pub_key t1 gx a si vi ==> (exists x. gx == (CryptoLib.dh_pk x) /\ is_eph_priv_key t1 x a si vi));      
	     assert (spred t1 "ISODH.sig_key" pka sv ==> (exists x idx si vi. is_eph_pub_key idx gx a si vi /\ later_than t1 idx /\ 
					        gx == CryptoLib.dh_pk x /\ did_event_occur_before t1 a (finishI a b gx gy (CryptoLib.dh x gy)))); 
	     assert (spred t1 "ISODH.sig_key" pka sv ==> (is_dh_shared_key t1 k a b /\ 
				(exists x. k == CryptoLib.dh x gy /\ gx == CryptoLib.dh_pk x /\ did_event_occur_before t1 a (finishI a b gx gy (CryptoLib.dh x gy))))); 
	     assert (corrupt_id t1 (P a) \/ (is_dh_shared_key t1 k a b /\ did_event_occur_before t1 a (finishI a b gx gy k))); 
  	     let new_ss_st = (ResponderReceivedMsg3 a gx gy k) in
	     let new_ss = serialize_valid_session_st t1 b idx_session vi new_ss_st in
	     let ev = finishR a b gx gy k in
	     trigger_event #isodh b ev;
	     let t2 = global_timestamp () in
	     update_session #isodh #t2 b idx_session vi new_ss;
	     ())
	   else error "responder_accept_msg_3: sig verif failed"
	 | _ -> error "responder_accept_msg_3: not a msg2")
     | _ -> error  "initiator_send_msg_3: wrong session states"

