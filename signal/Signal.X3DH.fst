/// Signal.X3DH (implementation)
/// ==================================
module Signal.X3DH

noeq type x3dh_msg (i:nat) =
| X3DHMsg: a:principal -> identity_pub_key:msg_at i public -> ephemeral_pub_key0:msg_at i public -> ephemeral_pub_key1:msg_at i public ->
	   prev_counter: nat -> counter: nat -> ciphertext:msg_at i public -> x3dh_msg i

let serialize_x3dh_msg (i:nat) (m:x3dh_msg i) : msg_at i public =
  match m with
  | X3DHMsg a ik ek0 ek1 pct ct c -> 
	    A.concat #signal_global_usage #i #public (A.string_to_bytes #signal_global_usage #i a) 
	      (A.concat #signal_global_usage #i #public ik (A.concat #signal_global_usage #i #public ek0 
		(A.concat #signal_global_usage #i #public ek1 (A.concat #signal_global_usage #i #public (A.nat_to_bytes #signal_global_usage #i 4 (pct))
		  (A.concat #signal_global_usage #i #public (A.nat_to_bytes #signal_global_usage #i 4 (ct)) c)))))

let parse_x3dh_msg (#i:nat) (msg:msg_at i public) : result (x3dh_msg i) =
  r <-- A.split #signal_global_usage #i #public msg; let (ta,rest) = r in
  r <-- A.split #signal_global_usage #i #public rest; let (ik,rest) = r in
  r <-- A.split #signal_global_usage #i #public rest; let (ek0,rest) = r in
  r <-- A.split #signal_global_usage #i #public rest; let (ek1,rest) = r in
  r <-- A.split #signal_global_usage #i #public rest; let (pct,rest) = r in
  r <-- A.split #signal_global_usage #i #public rest; let (ct,c) = r in
  (match bytes_to_string ta, bytes_to_nat pct, bytes_to_nat ct with 
  | Success a, Success (pct), Success (ct) -> Success (X3DHMsg a ik ek0 ek1 pct ct c)
  | _ -> Error ("parse x3dh msg error"))

(**
generate identity private and public key, save the private key into state and return publick key
*)
val x3dh_initialize_identity_key: p:principal -> 
    LCrypto bytes (pki signal) 
    (requires fun t0 -> True)
    (ensures fun t0 public_identity_key t1 -> (trace_len t1 == trace_len t0 + 2)  /\
					   is_signal_dh_public_key (trace_len t1) public_identity_key (readers [P p]) "Signal.identity_key")
let x3dh_initialize_identity_key p =
  let i = global_timestamp () in 
  let si = gen_private_key #signal #i p DH "Signal.identity_key" in 
  let t1 = global_timestamp () in 
  let (|_,id_key|) = get_private_key #signal #t1 p DH "Signal.identity_key" in
  let public_identity_key = priv_to_pub #t1 #(readers [P p]) #"Signal.identity_key" id_key in
  public_identity_key

(**
generate signed private and public key, save the private key into state and return publick key
*)
val x3dh_initialize_signed_pre_key: p:principal -> 
    LCrypto bytes (pki signal) 
    (requires fun t0 -> True)
    (ensures fun t0 public_signed_key t1 -> (trace_len t1 == trace_len t0 + 2)  /\
					 is_signal_dh_public_key (trace_len t1) public_signed_key (readers [P p]) "Signal.signed_pre_key")

let x3dh_initialize_signed_pre_key p =
  let i = global_timestamp () in 
  let si = gen_private_key #signal #i p DH "Signal.signed_pre_key" in 
  let t1 = global_timestamp () in 
  let (|_,s_key|) = get_private_key #signal #t1 p DH "Signal.signed_pre_key" in
  let public_signed_key = priv_to_pub #t1 #(readers [P p]) #"Signal.signed_pre_key" s_key in
  public_signed_key

(**
generate onetime private and public key, save the private key into state and return public key
*)
val x3dh_initialize_onetime_key: p:principal -> 
    LCrypto (si:nat * public_onetime_key:bytes) (pki signal) 
    (requires fun t0 -> True)
    (ensures fun t0 (si, public_onetime_key) t1 -> (trace_len t1 == trace_len t0 + 2)  /\
						is_signal_dh_public_key (trace_len t1) public_onetime_key (readers [V p si 0]) "Signal.one_time_pre_key")
let x3dh_initialize_onetime_key p =
  let i = global_timestamp () in 
  let si = gen_private_key #signal #i p OneTimeDH "Signal.one_time_pre_key" in 
  let t1 = global_timestamp () in 
  let (|si, o_key|) = get_private_key #signal #t1 p OneTimeDH "Signal.one_time_pre_key" in
  let public_onetime_key = priv_to_pub #t1 #(readers [V p si 0]) #"Signal.one_time_pre_key" o_key in
  (si,public_onetime_key)

let x3dh_initialize_state p peer =
  print_string ("generating private keys for "^p^"\n"); 
  let identity_pub_key = x3dh_initialize_identity_key p in
  let signed_key = x3dh_initialize_signed_pre_key p in
  let (si,onetime_key) = x3dh_initialize_onetime_key p in
  print_string ("generating private keys for "^peer^"\n"); 
  let identity_pub_key = x3dh_initialize_identity_key peer in
  let signed_key = x3dh_initialize_signed_pre_key peer in
  let (si,onetime_key) = x3dh_initialize_onetime_key peer in
  let i = global_timestamp () in 
  let si_p = install_public_key #signal #i peer p DH "Signal.identity_key" in 
  let i = global_timestamp () in 
  let si_p = install_public_key #signal #i peer p DH "Signal.signed_pre_key" in 
  let i = global_timestamp () in 
  let si_p = install_public_key #signal #i peer p OneTimeDH "Signal.one_time_pre_key" in 
  let i = global_timestamp () in 
  let si_peer = install_public_key #signal #i p peer DH "Signal.identity_key" in 
  let i = global_timestamp () in 
  let si_peer = install_public_key #signal #i p peer DH "Signal.signed_pre_key" in 
  let i = global_timestamp () in 
  let si_peer = install_public_key #signal #i p peer OneTimeDH "Signal.one_time_pre_key" in 
  ()

val can_label_of_msg_flow_to_l: i:nat -> p:principal -> sid:nat -> peer:principal -> ek0:msg_at i public -> ek1:msg_at i public -> msg: msg_at i (readers [P p; P peer]) ->
    Lemma (A.is_msg signal_global_usage i msg (x3dh_key_label_i p sid peer ek0 ek1))
let can_label_of_msg_flow_to_l i p sid peer ek0 ek1 msg = 
  let l = A.get_label signal_key_usages msg in
  msg0_can_flow_i i p sid peer ek0 ek1;
  A.can_flow_transitive i l (readers [P p; P peer]) (x3dh_key_label_i p sid peer ek0 ek1)

val generate_and_send_out_msg: #now:nat -> #l:label -> #p:principal -> #peer:principal -> #sid:nat ->
    our_identity_pub_key:signal_identity_pub_key now (readers [P p]) -> 
    their_identity_pub_key:msg_at now public ->
    msg_key:signal_aead_key_iv now l ->
    our_ephemeral_pub_key0:msg_at now public ->
    our_ephemeral_pub_key1:signal_onetimepre_pub_key now (readers [V p sid 1]) ->
    msg:msg_at now l ->
    LCrypto nat (pki signal)
    (requires fun t0 -> now == trace_len t0)
    (ensures fun t0 _ t1 -> True)

let generate_and_send_out_msg #now #l #p #peer #sid
  our_identity_pub_key  their_identity_pub_key msg_key our_ephemeral_pub_key0 our_ephemeral_pub_key1 msg =
  let ciphertext = encrypt #now #l #p #sid #1 our_identity_pub_key their_identity_pub_key msg_key our_ephemeral_pub_key1 0 0 msg in 
  let imsg:x3dh_msg now = X3DHMsg p our_identity_pub_key our_ephemeral_pub_key0 our_ephemeral_pub_key1 0 0 ciphertext in 
  let out_msg = serialize_x3dh_msg now imsg in
  let now = global_timestamp () in 
  let sidx = send #signal #now p peer out_msg in
  sidx

let x3dh_initiate #i p peer msg = 
  print_string ("initiating x3dh from "^p^"\n"); 
  let their_identity_pub_key = get_public_key #signal #i p peer DH "Signal.identity_key" in
  let their_signed_pub_key = get_public_key #signal #i p peer DH "Signal.signed_pre_key" in
  let their_onetime_pub_key = get_public_key #signal #i p peer OneTimeDH "Signal.one_time_pre_key" in
  let (|si, our_identity_priv_key|) = get_private_key #signal #i p DH "Signal.identity_key" in
  let our_identity_pub_key = priv_to_pub #i #(readers [P p]) #"Signal.identity_key" our_identity_priv_key in
  let sid = new_session_number #signal p in 
  let (|i1, our_ephemeral_priv_key0|) = rand_gen #signal (readers [V p sid 0]) (dh_usage "Signal.one_time_pre_key") in 
  let (|i2, our_ephemeral_priv_key1|) = rand_gen #signal (readers [V p sid 1]) (dh_usage "Signal.one_time_pre_key") in  
  let now = global_timestamp () in
  let (msg_key, root_key, chain_key) = initiate #now #p #sid #peer our_identity_priv_key our_ephemeral_priv_key0 our_ephemeral_priv_key1 their_identity_pub_key their_signed_pub_key their_onetime_pub_key in 
  let l = x3dh_key_label_i p sid peer their_signed_pub_key their_onetime_pub_key in
  let msg_key:signal_aead_key_iv now l = msg_key in 
  let our_ephemeral_pub_key1 = priv_to_pub #now #(readers [V p sid 1]) #"Signal.one_time_pre_key" our_ephemeral_priv_key1 in
  can_label_of_msg_flow_to_l now p sid peer their_signed_pub_key their_onetime_pub_key msg;
  let our_ephemeral_pub_key0 = priv_to_pub #now #(readers [V p sid 0]) #"Signal.one_time_pre_key" our_ephemeral_priv_key0 in 
  let peers = {peer = peer; role = I; our_identity_public_key = our_identity_pub_key; their_identity_public_key = their_identity_pub_key} in
  let send_st = {send_chain_key = chain_key; send_counter = 0; our_ephemeral_private_key = our_ephemeral_priv_key1} in  
  let nst = Session peers root_key (Some send_st) None in
  new_session #signal #now p sid 1 (serialize_valid_session_st now p sid 1 nst);
  let i = global_timestamp () in
  let (k,iv) = msg_key in
  let msg_key = (k,iv) in
  let sidx = generate_and_send_out_msg #i #l #p #peer #sid
  our_identity_pub_key  their_identity_pub_key msg_key our_ephemeral_pub_key0 our_ephemeral_pub_key1 msg in
  print_string ("message sent from "^p^"\n");
  (sidx, sid)

let x3dh_respond p msg_idx = 
  print_string ("respond started at "^p^"\n"); 
  let (|i,_,w_msg1|) = receive_i #signal msg_idx p in 
  match parse_x3dh_msg #i w_msg1 with 
  | Success msg ->
    print_string ("message parsed at "^p^"\n");
    let X3DHMsg peer their_identity_pub_key_wire their_ephemeral_pub_key0 their_ephemeral_pub_key1 pct ct ctext = msg in
    let their_identity_pub_key = get_public_key #signal #i p peer DH "Signal.identity_key" in 
    if (their_identity_pub_key = their_identity_pub_key_wire) then (
       let (|_, our_identity_priv_key|) = get_private_key #signal #i p DH "Signal.identity_key" in 
       let our_identity_pub_key = priv_to_pub #i #(readers [P p]) #"Signal.identity_key" our_identity_priv_key in
       let (|_, our_signed_priv_key|) = get_private_key #signal #i p DH "Signal.signed_pre_key" in 
       let (|sid, our_onetime_priv_key|) = get_private_key #signal #i p OneTimeDH "Signal.one_time_pre_key" in
       print_string ("retrieve all keys at "^p^" and calling -respond-\n");   
       let nsid = new_session_number #signal p in
       let (msg_key, root_key, chain_key) = respond #i #p #sid #nsid #peer our_identity_priv_key our_signed_priv_key our_onetime_priv_key their_identity_pub_key their_ephemeral_pub_key0 their_ephemeral_pub_key1 in 
       // The root key is shared at this point. Further on, the first message sent by the initiator is decrypted.
       // For decrypting, we need to generate the chain key, which comes from the ratchet function. This is used in initiate for generating it initially. 
       // In encrypt, generate_mac_tag concats the ciphertext with the tag
       let l0 = (x3dh_root_key0_label_r p sid peer their_ephemeral_pub_key0) in
       let l1 = (dh_secret_label0 p their_ephemeral_pub_key1) in
       let l = (kdf_meet l0 l1) in
       (match decrypt0 #i #l0 #l1 #peer our_identity_pub_key their_identity_pub_key their_ephemeral_pub_key1 msg_key pct ct ctext with 
       | Success plaintext ->
	 let peers = {peer = peer; role= R; our_identity_public_key = our_identity_pub_key; their_identity_public_key = their_identity_pub_key} in
	 let recv_st = {recv_chain_key = chain_key; recv_counter = 0; their_ephemeral_public_key = their_ephemeral_pub_key1} in
	 let nst = Session peers root_key None (Some recv_st) in
	 assert (is_signal_dh_public_key i peers.their_identity_public_key (readers [P peers.peer]) "Signal.identity_key");
	 A.can_flow_transitive i l1 l public;
	 A.can_flow_to_join_forall i; A.can_flow_to_meet_forall i;
	 msg0_can_flow_r i p sid peer their_ephemeral_pub_key0 their_ephemeral_pub_key1;
	 A.can_flow_transitive i (readers [P p;P peer]) l public;
	 assert(is_ratcheted_root_key i R p peer nsid 0 root_key true); 
	 new_session #signal #i p nsid 0 (serialize_valid_session_st i p nsid 0 nst); 
	 msg0_can_flow_r i p sid peer their_ephemeral_pub_key0 their_ephemeral_pub_key1;
	 let t2 = global_timestamp () in 
	 delete_one_time_key #signal #t2 p "Signal.one_time_pre_key";
	 (|peer, l, plaintext, nsid|)
       | _ -> error "decrypt0 failed in respond"))
    else error "identity public keys do not match"
  | _ -> error "parse error in respond"
 
