/// Signal.DR (implementation)
/// ================================
module Signal.DR

noeq type signal_msg (i:nat) =
| Msg: ephemeral_pub_key:msg_at i public -> prev_counter: nat -> counter: nat -> ciphertext:msg_at i public -> signal_msg i

let serialize_signal_msg (#i:nat) (m:signal_msg i) : msg_at i public =
  match m with
  | Msg ek pct ct c -> 
	(A.concat #signal_global_usage #i #public ek 
	  (A.concat #signal_global_usage #i #public (A.nat_to_bytes #signal_global_usage #i 4 (pct)) 
	    (A.concat #signal_global_usage #i #public (A.nat_to_bytes #signal_global_usage #i 4 (ct)) c)))

let parse_signal_msg (#i:nat) (msg:msg_at i public) : result (signal_msg i) =
    r <-- A.split #signal_global_usage #i #public msg; let (ek,rest) = r in
    r <-- A.split #signal_global_usage #i #public rest; let (pct,rest) = r in
    r <-- A.split #signal_global_usage #i #public rest; let (ct,c) = r in
    match bytes_to_nat pct, bytes_to_nat ct with 
    | Success (pct), Success (ct) -> Success (Msg ek pct ct c)
    | _ -> Error "error in parse signal msg"

let send_message #i p pr msg =
  let sid, vi, st = get_peer_session i p pr in
  let Session peers root_key s r = st in 
  match s, r with 
  | Some send_st, None ->
    if pr = peers.peer then( 
       let our_ephemeral_pub_key = priv_to_pub #i #(readers [V p sid vi]) #"Signal.one_time_pre_key" send_st.our_ephemeral_private_key in
       let l = A.get_label signal_key_usages root_key in
       assert (is_signal_chain_key i send_st.send_chain_key l);
       let (msg_key, chain_key) = kdf_ratchet #i #l send_st.send_chain_key in
       let send_st' = {send_chain_key = chain_key; send_counter = send_st.send_counter + 1; our_ephemeral_private_key = send_st.our_ephemeral_private_key} in
       let nst = Session peers root_key (Some send_st') None in
       update_session #signal #i p sid vi (serialize_valid_session_st i p sid vi nst);       
       is_ratcheted_root_key_lemma i peers.role p pr sid vi false;
       assert (A.can_flow i (readers [P p; P pr]) l); 
       assert (is_signal_dh_public_key i peers.our_identity_public_key (readers [P p]) "Signal.identity_key");
       assert ((A.get_dhkey_label signal_key_usages peers.our_identity_public_key) == (readers [P p]));
       assert ((A.get_dhkey_label signal_key_usages our_ephemeral_pub_key) == (readers [V p sid vi])); 
       A.can_flow_transitive i (A.get_label signal_key_usages msg) (readers [P p; P pr]) l;
       let ciphertext = encrypt #i #l #p #sid #vi peers.our_identity_public_key peers.their_identity_public_key msg_key our_ephemeral_pub_key 0 0 msg in
       let msg = Msg our_ephemeral_pub_key 0 0 ciphertext in
       let cmsg = serialize_signal_msg msg in 
       let i = send #signal #i p pr cmsg in
       i
       )
    else error ("wrong peer found\n")
  | None, (Some recv) -> 
    if pr = peers.peer then (
       let new_v = vi + 1 in
       let new_l = readers [V p sid new_v] in
       let t0 = global_timestamp () in
       let (|_, our_ephemeral_priv_key|) = rand_gen #signal new_l (dh_usage "Signal.one_time_pre_key") in
       let t1 = global_timestamp () in 
       assert(valid_session t1 p sid vi (Session peers root_key None (Some recv))); 
       let our_ephemeral_pub_key = priv_to_pub #i #new_l #"Signal.one_time_pre_key" our_ephemeral_priv_key in
       let l = A.get_label signal_key_usages root_key in 
       let (ciphertext, root_key0, chain_key0) = dh_ratchet_encrypt #t1 #t0 #l #peers.role #p #pr #sid #vi
	     root_key peers.our_identity_public_key peers.their_identity_public_key
	     our_ephemeral_priv_key recv.their_ephemeral_public_key 0 0 msg in 
       let send_st' = {send_chain_key = chain_key0; send_counter = 0; our_ephemeral_private_key = our_ephemeral_priv_key} in
       let nst = Session peers root_key0 (Some send_st') None in 
       update_session #signal #t1 p sid new_v (serialize_valid_session_st t1 p sid new_v nst); 
       let msg = Msg our_ephemeral_pub_key 0 0 ciphertext in
       let cmsg = serialize_signal_msg #t1 msg in 
       assert(A.is_publishable signal_global_usage t1 cmsg); 
       let i = send #signal #t1 p pr cmsg in
       i)
    else error ("wrong peer found\n")
  | _ -> error ("parsing error for session states in "^p^" or "^pr^"\n")

let receive_message #i p peer msg_idx =
  let (|now,_,msg|) = receive_i #signal msg_idx p in 
  match parse_signal_msg msg with
  | Success (Msg their_ephemeral_pub_key' prev_counter curr_counter ct) -> (
    let sid, vi, st = get_peer_session i p peer in
    let Session peers root_key s r = st in 
    (match s, r with 
    | None, Some recv_st ->
      if peers.peer = peer && recv_st.their_ephemeral_public_key = their_ephemeral_pub_key' then (
	 let l = A.get_label signal_key_usages root_key in
	 is_ratcheted_root_key_lemma i peers.role p peer sid vi true;
         assert(A.can_flow i (readers [P p; P peer]) l); 
	 let (msg_key, rchain_key) = kdf_ratchet #i #l recv_st.recv_chain_key in
	 (match decrypt #i #l peers.our_identity_public_key peers.their_identity_public_key recv_st.their_ephemeral_public_key msg_key prev_counter curr_counter ct with
	 | Success plain ->
		   let recv_st' = {recv_chain_key = rchain_key; recv_counter = recv_st.recv_counter + 1; their_ephemeral_public_key = recv_st.their_ephemeral_public_key} in
		   let nst = Session peers root_key None (Some recv_st') in
		   update_session #signal #i p sid vi (serialize_valid_session_st i p sid vi nst); 
		   (|l, plain|)
	 | _ -> error "decrypt error in recv_state for receive"
	 ))
      else error "incorrect peer or ephemeral key in receive"
    | Some send_st, None -> (
      if peers.peer = peer then (
	 let l_root_key = A.get_label signal_key_usages root_key in
	 let l_msg = kdf_meet l_root_key (dh_secret_label p sid vi their_ephemeral_pub_key') in
	 A.can_flow_to_join_forall i; A.can_flow_to_meet_forall i;
	 (match dh_ratchet_decrypt #i #l_root_key #peers.role #p #peer #sid #vi
					          root_key peers.our_identity_public_key peers.their_identity_public_key
						  send_st.our_ephemeral_private_key their_ephemeral_pub_key'
						  prev_counter curr_counter ct with
	 | Success (plain, root_key0, chain_key0) ->
	   let recv_st' = {recv_chain_key = chain_key0; recv_counter = 0; their_ephemeral_public_key = their_ephemeral_pub_key'} in
	   let nst = Session peers root_key0 None (Some recv_st') in
           assert(is_ratcheted_root_key i peers.role p peer sid vi root_key0 true);
           assert(is_signal_root_key i root_key0 (A.get_label signal_key_usages root_key0));
           assert(A.is_msg signal_global_usage i root_key0 (readers [V p sid vi]));
           assert(valid_session i p sid vi nst); 
	   update_session #signal #i p sid vi (serialize_valid_session_st i p sid vi nst);
	   is_ratcheted_root_key_lemma i peers.role p peer sid vi false;
	   assert(A.can_flow i (readers [P p; P peer]) l_msg); 
	   (|l_msg, plain|)
	 | _ -> error "dh ratchet decrypt error in receive"
      ))
      else error "incorrect peer in receive")
    | _ -> error "no send state to process dh ratchet"))
  | _ -> error "session id out of bound"

