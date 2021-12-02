/// NS.Protocol (implementation)
/// ==============================
module NS.Protocol

#push-options "--z3rlimit 200 --max_fuel 2 --max_ifuel 2"
let initiator_send_msg_1 a b =
  let si = new_session_number #ns a in
  let (|t0, n_a|) = rand_gen #ns (readers [P a; P b]) (nonce_usage "NS.nonce") in
  let ev = initiate a b n_a in 
  trigger_event #ns a ev;
  let t1 = global_timestamp () in
  let new_ss_st = InitiatorSentMsg1 b n_a in
  let new_ss = serialize_valid_session_st t1 a si 0 new_ss_st in 
  new_session #ns #t1 a si 0 new_ss;
  let t2 = global_timestamp () in
  let m = Msg1 a n_a in
  let l = readers [P a; P b] in
  let msg1' : msg t2 l = serialize_valid_message t2 m l in
  let msg1'' = restrict msg1' (readers [P b]) in
  let msg1''' = restrict msg1' (readers [P a]) in
  assert (get_label ns_key_usages msg1'' == get_label ns_key_usages msg1');
  assert (get_label ns_key_usages msg1''' == get_label ns_key_usages msg1');
  assert (can_flow t2 (get_label ns_key_usages msg1') (readers [P a; P b]));
  assert (can_flow t2 (get_label ns_key_usages msg1'') (readers [P b]));
  assert (can_flow t2 (get_label ns_key_usages msg1''') (readers [P a]));
  let pkb = get_public_key #ns #t2 a b PKE "NS.key" in
  sk_label_lemma ns_global_usage t2 pkb (readers [P b]);
  let (|t3,n_msg1|) = rand_gen #ns (readers [P a]) (nonce_usage "PKE_NONCE") in
  assert (ppred t3 "NS.Key" pkb msg1');
  let c_msg1 = pke_enc #ns_global_usage #t3 #(readers [P a]) pkb n_msg1 msg1' in
  let now = send #ns #t3 a b c_msg1 in
  (si, now)
#pop-options

val responder_receive_msg_1_helper:
  #i:nat ->
  b: principal ->
  c_msg1:msg i public ->
  skb: priv_key i b ->
  LCrypto (a:principal * n_a:msg i (readers [P b])) (pki ns)
    (requires (fun _ -> True))
    (ensures (fun t0 (a, n_a) t1 -> t0 == t1 /\
			  (is_publishable ns_global_usage i n_a \/
			  (was_rand_generated_before i n_a (readers [P a;P b]) (nonce_usage "NS.nonce")))))

let responder_receive_msg_1_helper #i b c_msg1 skb =
  match pke_dec #ns_global_usage #i #(readers [P b]) skb c_msg1 with
  | Success msg1 ->
    (let l = readers [P b] in
    let pkb = pk #ns_global_usage #i #(readers [P b]) skb in
    readers_is_injective b;
    match parse_valid_message #i #(get_label ns_key_usages msg1) msg1 with
    | Success (Msg1 a n_a) ->
      assert (is_msg ns_global_usage i n_a l);
      can_flow_transitive i (get_label ns_key_usages n_a) (get_label ns_key_usages msg1) public;
      can_flow_transitive i (get_label ns_key_usages n_a) (get_label ns_key_usages msg1) l;
      (a, n_a)
    | _ -> error "wrong msg_1 tag")
  | _ -> error "decrypt failed in receive msg1"


val responder_send_msg_2_helper:
  #i:nat ->
  b:principal ->
  a:principal ->
  pka: pub_key i a ->
  n_a: msg i (readers [P b]){
    is_publishable ns_global_usage i n_a \/
    was_rand_generated_before i n_a (readers [P a;P b]) (nonce_usage "NS.nonce")
  } ->
  n_b:ns_nonce i a b{
    did_event_occur_before i b (respond a b n_a n_b)} ->
  n_pke:pke_nonce ns_global_usage i (readers [P b]) ->
  msg i public

let responder_send_msg_2_helper #i b a pka n_a n_b n_pke =
  rand_is_secret #ns_global_usage #i #(readers [P a; P b]) #(nonce_usage "NS.nonce") n_a;
  let n_a:msg i (readers [P a; P b]) = n_a in
  let msg2 : msg i (readers [P a; P b]) = serialize_valid_message i (Msg2 n_a n_b) (readers [P a; P b]) in
  let msg2' = restrict msg2 (readers [P a]) in
  let msg2'' = restrict msg2 (readers [P b]) in
  assert (get_label ns_key_usages msg2'' == get_label ns_key_usages msg2);
  sk_label_lemma ns_global_usage i pka (readers [P a]);
  let c_msg3 = pke_enc #ns_global_usage #i pka n_pke msg2' in
  c_msg3

let responder_send_msg_2 b msg_idx =
  let (|now,_,c_msg1|) = receive_i #ns msg_idx b in
  let (|_, skb|) = get_private_key #ns #now b PKE "NS.key" in
  let (a, n_a) = responder_receive_msg_1_helper #now b c_msg1 skb in
  let pka = get_public_key #ns #now b a PKE "NS.key" in
  let (|t0, n_b|) = rand_gen #ns (readers [P a; P b]) (nonce_usage "NS.nonce") in
  let ev = respond a b n_a n_b in
  trigger_event #ns b ev;
  let t1 = global_timestamp () in
  let si = new_session_number #ns b in
  let new_ss_st = ResponderSentMsg2 a n_a n_b in
  let new_ss = serialize_valid_session_st t1 b si 0 new_ss_st in
  new_session #ns #t1 b si 0 new_ss;
  let t2 = global_timestamp () in
  let (|t3,n_msg2|) = rand_gen #ns (readers [P b]) (nonce_usage "PKE_NONCE") in
  let c_msg2 = responder_send_msg_2_helper #t3 b a pka n_a n_b n_msg2 in
  let now = send #ns #t3 b a c_msg2 in
  (si, now)

let n_b_pred i a b n_a n_b =
	((is_publishable ns_global_usage i n_b /\ (corrupt_id i (P a) \/ corrupt_id i (P b))) \/
	  (exists b. (did_event_occur_before i b (respond a b n_a n_b)) /\
	    was_rand_generated_before i n_b (readers [P a;P b]) (nonce_usage "NS.nonce")))

let initiator_receive_msg_2_helper (i:nat) (a:principal) (b:principal) (c_msg2:msg i public)
				   (ska:priv_key i a) (n_a:ns_nonce i a b) :
    LCrypto (msg i (readers [P a])) (pki ns) (requires (fun _ -> True)) (ensures (fun t0 (n_b) t1 -> t0 == t1 /\ n_b_pred i a b n_a n_b))
= match pke_dec #ns_global_usage #i #(readers [P a]) ska c_msg2 with 
  | Success msg2 ->
    (let l = readers [P a] in
    let pka = pk #ns_global_usage #i #(readers [P a]) ska in 
    readers_is_injective a;
    match parse_valid_message #i #(get_label ns_key_usages msg2) msg2 with
    | Success (Msg2 n_a' n_b) ->
      if n_a = n_a' then (
	includes_corrupt_2_lemma i (P a) (P b);
	n_b)
      else error "n_a or b did not match"
    | _ -> error "wrong msg_2 tag")
  | _ -> error "decrypt failed in receive msg2"
  
let initiator_send_msg_3_helper (#i:nat) (a:principal) (b:principal) (pkb: pub_key i b) (n_a: ns_nonce i a b)
    (n_b: msg i (readers [P a]){did_event_occur_before i a (finishI a b n_a n_b) /\ n_b_pred i a b n_a n_b})
    (n_pke: pke_nonce ns_global_usage i (readers [P a]))
  : msg i public
= let l_b =  (readers [P a; P b]) in
  // This assume is needed because we cannot prove
  // that it is safe to send n_b to b (Lowe's attack).
  assume (is_msg ns_global_usage i n_b l_b);
  rand_is_secret #ns_global_usage #i #(readers [P a; P b]) #(nonce_usage "NS.nonce") n_b;
  let msg3 : msg i (readers [P a; P b]) = serialize_valid_message i (Msg3 n_b) l_b in
  let msg3' = restrict msg3 (readers [P b]) in
  let msg3'' = restrict msg3 (readers [P a]) in
  assert (get_label ns_key_usages msg3'' == get_label ns_key_usages msg3);
  sk_label_lemma ns_global_usage i pkb (readers [P b]);
  pke_enc #ns_global_usage #i pkb n_pke msg3'

#push-options "--z3rlimit 100"

let initiator_send_msg_3 a idx_init_session msg_idx =
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #ns #t0 a idx_init_session in
  match parse_session_st st with
  | Success (InitiatorSentMsg1 b n_a) ->
    let (|now,_,c_msg2|) = receive_i #ns msg_idx a in
    let (|_,ska|) = get_private_key #ns #now a PKE "NS.key" in
    let pkb = get_public_key #ns #now a b PKE "NS.key" in
    let n_b = initiator_receive_msg_2_helper now a b c_msg2 ska n_a in
    let ev = finishI a b n_a n_b in
    trigger_event #ns a ev;
    let t1 = global_timestamp () in
    let new_ss_st = InitiatorSentMsg3 b n_a n_b in
    rand_is_secret #ns_global_usage #t1 #(readers [P a; P b]) #(nonce_usage "NS.nonce") n_b;
    let new_ss = serialize_valid_session_st t1 a idx_init_session vi new_ss_st in
    update_session #ns #t1 a idx_init_session vi new_ss;
    let t2 = global_timestamp () in
    let (|t3,n_msg3|) = rand_gen #ns (readers [P a]) (nonce_usage "PKE_NONCE") in
    let c_msg3 = initiator_send_msg_3_helper #t3 a b pkb n_a n_b n_msg3 in
    let now = send #ns #t3 a b c_msg3 in 
    now
  | _ -> error "parse error"
  
let responder_receive_msg_3_helper (#i: nat) (b: principal) (a: principal) (c_msg3: msg i public) (skb: priv_key i b) (n_b: ns_nonce i a b) :
    LCrypto unit (pki ns) (requires (fun _ -> True)) (ensures fun t0 _ t1 -> True)
= match pke_dec #ns_global_usage #i #(readers [P b]) skb c_msg3 with 
  | Success msg3 ->
    (let l = readers [P b] in
    let pkb = pk #ns_global_usage #i #l skb in 
    readers_is_injective b;
    match parse_valid_message #i #(get_label ns_key_usages msg3) msg3 with
    | Success (Msg3 n_b') ->
      if n_b = n_b' then includes_corrupt_2_lemma i (P a) (P b)
      else error "n_b did not match"
    | _ -> error "wrong msg_3 tag")
  | _ -> error "decrypt failed in receive msg3"

let responder_receive_msg_3 b idx_resp_session msg_idx =
  let t0 = global_timestamp () in
  let (|vi,st|) = get_session #ns #t0 b idx_resp_session in
  match parse_session_st st with
  | Success (ResponderSentMsg2 a n_a n_b) ->
    let (|now,_,c_msg3|) = receive_i #ns msg_idx b in
    let (|_,skb|) = get_private_key #ns #now b PKE "NS.key" in 
    responder_receive_msg_3_helper #now b a c_msg3 skb n_b;
    let ev = finishR a b n_a n_b in 
    trigger_event #ns b ev;
    let t1 = global_timestamp () in
    let new_ss_st = ResponderReceivedMsg3 a n_b in
    let new_ss = serialize_valid_session_st t1 b idx_resp_session vi new_ss_st in
    update_session #ns #t1 b idx_resp_session vi new_ss
  |_ -> error "parse error"
#pop-options

let nonce_secrecy_test a b idx_init_session test_n_b =
  let t0 = global_timestamp () in 
  let (|v,state|) = get_session #ns #t0 a idx_init_session in
  (match parse_session_st state  with
  | Success (InitiatorSentMsg3 b n_a n_b) ->
	if n_b = test_n_b then
	   trigger_event #ns a ("Leaked",[n_b])
	else error "attack failed"
  | _ -> error "not an initiator state")
