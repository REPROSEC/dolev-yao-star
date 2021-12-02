/// ISOKem.Protocol (implementation)
/// =================================
module ISOKem.Protocol

module C = CryptoLib

#push-options "--z3rlimit 200 --max_fuel 3 --max_ifuel 3"
let initiator_send_msg_1 a b = 
  print_string ("initiator "^a^" sending first message to "^b^"\n");
  let si = new_session_number #isokem a in
  let (|t0,x|) = rand_gen #isokem (readers [P a]) (pke_usage "ISOKem.pke_key") in
  let gx = pk #isokem_global_usage #t0 #(readers [P a]) x in
  let ev = initiate a b gx in
  trigger_event #isokem a ev;
  let t1 = global_timestamp () in
  let new_ss_st = InitiatorSentMsg1 b x in
  let new_ss = serialize_valid_session_st t1 a si 0 new_ss_st in
  new_session #(isokem) #t1 a si 0 new_ss;
  let t2 = global_timestamp () in
  let msg1 = Msg1 a gx in
  let w_msg1 = serialize_msg t2 msg1 in
  let i = send #isokem #t2 a b w_msg1 in
  i,si
#pop-options

val receive_msg_1_helper: b:principal -> idx_msg:nat -> LCrypto (now:nat & a:principal & gx:msg now public) (pki isokem)
			  (requires (fun _ -> True))
			  (ensures (fun t0 (|now, _, _|) t1 -> t0 == t1 /\ now == trace_len t0))

let receive_msg_1_helper b idx_msg =
  print_string ("responder "^b^" processing first message to \n");
  let (|now,_,w_msg1|) = receive_i #isokem idx_msg b in
  let msg1 = parse_msg w_msg1 in
  match msg1 with
   | Success (Msg1 a gx) -> (|now,a,gx|)
   | _ -> error "responder_send_msg_2: not a msg1"

#set-options "--z3rlimit 100 --max_fuel 2 --max_ifuel 2" 

val send_msg_2_helper: #idx:nat -> b:principal -> a:principal -> gx:msg idx public -> LCrypto (nat*nat) (pki isokem)
			  (requires (fun t0 -> later_than (trace_len t0) idx))
			  (ensures (fun t0 (i,si) t1 -> trace_len t1 > trace_len t0 /\ i == trace_len t1 - 1))
let send_msg_2_helper #idx b a gx =
  print_string ("responder "^b^" sending second message to "^a^"\n");
  let t0 = global_timestamp () in
  let (|_, skb|) = get_private_key #isokem #t0 b SIG "ISOKem.sig_key" in
  let xl = get_sk_label isokem_key_usages gx in
  let kl = join xl (readers [P b]) in
  let (|t1, k|) = rand_gen #isokem kl (aead_usage "ISOKem.aead_key") in
  can_flow_from_join t1 xl (readers [P b]);
  let (|t2,n_pke|) = rand_gen #isokem (readers [P b]) (nonce_usage "PKE_NONCE") in
  assert (can_flow t2 kl (readers [P b]));
  let gy = pke_enc #isokem_global_usage #t2 #(readers [P b]) gx n_pke k in
  let si = new_session_number #isokem b in
  let new_ss_st = (ResponderSentMsg2 a gx gy k) in
  let new_ss = serialize_valid_session_st t2 b si 0 new_ss_st in
  trigger_event #isokem b (respond a b gx gy k); 
  let t2 = global_timestamp () in
  new_session #isokem #t2 b si 0 new_ss;
  let t3 = global_timestamp () in
  let sv: msg t3 public = sigval_msg2 #t3 a gx gy in
  let vkb = vk #isokem_global_usage #t3 #(readers [P b]) skb in
  let (|t4,n_sig|) = rand_gen #isokem (readers [P b]) (nonce_usage "SIG_NONCE") in
  let sg = sign #isokem_global_usage #t4 #(readers [P b]) #public skb n_sig sv in
  let gy:msg t3 public = gy in
  let msg2 = Msg2 b gy sg in
  let w_msg2 = serialize_msg t4 msg2 in
  let i = send #isokem #t4 b a w_msg2 in
  i,si

let responder_send_msg_2 b idx_msg =
  let (|now,a,gx|) = receive_msg_1_helper b idx_msg in
  send_msg_2_helper #now b a gx

val receive_msg_2_helper:
  i:nat ->
  a:principal ->
  b:principal ->
  pkb:public_key isokem i b SIG "ISOKem.sig_key" ->
  x:eph_priv_key i a ->
  gx:eph_pub_key i a{gx == pk #isokem_global_usage #i #(readers [P a]) x} ->
  gy:msg i public ->
  sg:msg i public ->
  LCrypto bytes (pki isokem)
  (requires (fun t0 -> i == trace_len t0))
  (ensures (fun t0 k t1 -> trace_len t0 == trace_len t1 /\
			(exists n. gy == CryptoLib.pke_enc gx n k) /\
			is_msg isokem_global_usage i k (readers [P a]) /\
			(corrupt_id i (P b) \/
   				    (is_session_key i k a b /\ did_event_occur_before i b (respond a b gx gy k)))))

let receive_msg_2_helper i a b pkb x gx gy sg =
   let sv = sigval_msg2 a gx gy in
   if verify #isokem_global_usage #i #(readers [P b]) #public pkb sv sg then (
     can_flow_to_public_implies_corruption i (P b);
     verification_key_label_lemma isokem_global_usage i pkb (readers [P b]);
     (match pke_dec #isokem_global_usage #i #(readers [P a]) x gy with 
     | Success k ->
       pk_lemma #isokem_global_usage #i #(readers [P a]) x;
       readers_is_injective b;
       pke_dec_lemma #isokem_global_usage #i #(readers [P a]) x gy;
       sk_label_lemma isokem_global_usage i gx (readers [P a]); 
       k
     | _ -> error "decrypt failed"))
   else error "sig verification failed"

let initiator_send_msg_3 a idx_session idx_msg =
  print_string ("initiator "^a^" processing second message and sending third message\n");
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #isokem #t0 a idx_session in
  match parse_session_st st with
  | Success (InitiatorSentMsg1 b x) ->
    let (|si, ska|) = get_private_key #isokem #t0 a SIG "ISOKem.sig_key" in
    let pkb = get_public_key #isokem #t0 a b SIG "ISOKem.sig_key" in
    let (|t1,_,w_msg2|) = receive_i #isokem idx_msg a in
    assert (later_than t1 t0);
    (match parse_msg #t1 w_msg2 with
    | Success (Msg2 b'' gy sg) ->
      if b = b'' then (
      let gx = pk #isokem_global_usage #t1 #(readers [P a]) x in
      let pkb : public_key isokem t1 b SIG "ISOKem.sig_key" = pkb in
      let k = receive_msg_2_helper t1 a b pkb x gx gy sg in
      let new_ss_st = (InitiatorSentMsg3 b gx gy k) in
      let new_ss = serialize_valid_session_st t1 a idx_session 0 new_ss_st in
      trigger_event #isokem a (finishI a b gx gy k);
      let t2 = global_timestamp () in
      update_session #isokem #t2 a idx_session 0 new_ss;
      let t3 = global_timestamp () in
      let sv : msg t3 public = sigval_msg3 #t3 b gx gy in
      let ska : private_key isokem t3 si a SIG "ISOKem.sig_key" = ska in
      let vka = vk #isokem_global_usage #t3 #(readers [P a]) ska in
      assert (sign_pred isokem_global_usage.usage_preds t3 "ISOKem.sig_key" vka sv);
      let (|t4,n_sig|) = rand_gen #isokem (readers [P a]) (nonce_usage "SIG_NONCE") in
      let sg' = sign #isokem_global_usage #t4 #(readers [P a]) #public ska n_sig sv in
      let msg3 = Msg3 sg' in
      let w_msg3 : msg t4 public = serialize_msg t4 msg3 in
      let i = send #isokem #t4 a b w_msg3 in
      i)
      else error "initiator_send_msg_3: incorrect sender"
    | _ -> error "initiator_send_msg_3: not a msg2")
 | _ -> error  "initiator_send_msg_3: wrong session states"


let responder_accept_msg_3 b idx_session idx_msg =
  print_string ("responder "^b^" processing third message\n");
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #isokem #t0 b idx_session in
  match parse_session_st st with
  | Success (ResponderSentMsg2 a gx gy k) ->
    let pka = get_public_key #isokem #t0 b a SIG "ISOKem.sig_key" in
    let (|t1,_,w_msg3|) = receive_i #isokem idx_msg b in
    assert (t1 == t0); 
    (match parse_msg #t1 w_msg3 with
       | Success (Msg3 sg) ->
	 let sv = sigval_msg3 #t1 b gx gy in
	 if verify #isokem_global_usage #t1 #(readers [P a]) #public pka sv sg then (
	     can_flow_to_public_implies_corruption t1 (P a);
	     verification_key_label_lemma isokem_global_usage t1 pka (readers [P a]);
	     readers_is_injective a;
	     sk_label_lemma isokem_global_usage t1 gx (readers [P a]);
	     assert (corrupt_id t1 (P a) \/ (is_session_key t1 k a b /\ did_event_occur_before t1 a (finishI a b gx gy k))); 
  	     let new_ss_st = (ResponderReceivedMsg3 a gx gy k) in
	     let new_ss = serialize_valid_session_st t1 b idx_session 0 new_ss_st in
	     let ev = finishR a b gx gy k in
	     trigger_event #isokem b ev;
	     let t2 = global_timestamp () in
	     update_session #isokem #t2 b idx_session 0 new_ss;
	     ())
	   else error "responder_accept_msg_3: sig verif failed"
	 | _ -> error "responder_accept_msg_3: not a msg2")
     | _ -> error  "initiator_send_msg_3: wrong session states"

