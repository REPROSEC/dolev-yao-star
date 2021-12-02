/// Signal.Sessions (implementation)
/// ======================================
module Signal.Sessions

let valid_session_later_ i j p si vi st = 
   match st with
    | Session peers root_key (Some send) None -> is_ratcheted_root_key_later i j peers.role p peers.peer si vi false
    | Session peers root_key None (Some recv) -> is_ratcheted_root_key_later i j peers.role p peers.peer si vi true
    | _ -> ()

let serialize_send_session_data (i:nat) (p:principal) (si:nat) (vi:nat) (peers:session_peers) (root_key:bytes)
    (v:send_state{valid_session i p si vi (Session peers root_key (Some v) None)})
    : bytes 
= assert (includes_ids [P p] [V p si vi]);
  A.concat v.send_chain_key (A.concat (A.nat_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) 4 (v.send_counter)) 
				      v.our_ephemeral_private_key)

let parse_send_session_data st : result (option send_state) = 
  r <-- split st; let (sck,o) = r in
  r <-- split o; let (sc, oek) = r in
  (match bytes_to_nat sc with
  | Success (sct) -> Success (Some ({send_chain_key = sck; send_counter = sct; our_ephemeral_private_key = oek}))
  | _ -> Success (None))
  
let parse_valid_send_session_st_lemma (i:nat) (p:principal) (si:nat) (vi:nat) (peers:session_peers) (root_key:bytes) (send:send_state) : 
    Lemma (requires (valid_session i p si vi (Session peers root_key (Some send) None)))
	  (ensures (Success (Some send) == parse_send_session_data (serialize_send_session_data i p si vi peers root_key send))) = ()

let serialize_recv_session_data (i:nat) (p:principal) (si:nat) (vi:nat) (peers:session_peers) (root_key:bytes)
    (v:recv_state{valid_session i p si vi (Session peers root_key None (Some v))})
    : bytes 
= assert (includes_ids [P p] [V p si vi]);
  A.concat v.recv_chain_key (A.concat (A.nat_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) 4 (v.recv_counter))
    				      v.their_ephemeral_public_key)

let parse_recv_session_data st : result (option recv_state) = 
  r <-- split st; let (rck,o) = r in
  r <-- split o; let (rc,tek) = r in
  (match bytes_to_nat rc with
  | Success (rct) -> Success (Some ({recv_chain_key = rck; recv_counter = rct; their_ephemeral_public_key = tek}))
  | _ -> Success None)

let parse_valid_recv_session_st_lemma (i:nat) (p:principal) (si:nat) (vi:nat) (peers:session_peers) (root_key:bytes) (recv:recv_state) : 
    Lemma (requires (valid_session i p si vi (Session peers root_key None (Some recv))))
	  (ensures (Success (Some recv) == parse_recv_session_data (serialize_recv_session_data i p si vi peers root_key recv))) = ()

let parse_session_st serialized_session =
  r <-- split serialized_session ;
  let (tn,o) = r in
  r <-- bytes_to_string tn ;
  (match r with
  | "SendSession" ->
    r <-- split o; let (a,o) = r in
    r <-- split o; let (rl,o) = r in
    (match bytes_to_string a, bytes_to_role rl with
    | Success (peer), Success role ->
      r <-- split o; let (oik,o) = r in
      r <-- split o; let (tik,o) = r in
      r <-- split o; let (rk,o) = r in
      let peers = {peer = peer; role = role; our_identity_public_key = oik; their_identity_public_key = tik} in
      (match parse_send_session_data o with 
      | Success send -> Success (Session peers rk send None)
      | _ -> Error "Invalid format")
    |_ ->  Error "Invalid format")      
  | "RecvSession" ->
    r <-- split o; let (a,o) = r in
    r <-- split o; let (rl,o) = r in
    (match bytes_to_string a, bytes_to_role rl with
    | Success (peer), Success role ->
      r <-- split o; let (oik,o) = r in
      r <-- split o; let (tik,o) = r in
      r <-- split o; let (rk,o) = r in
      let peers = {peer = peer; role = role; our_identity_public_key = oik; their_identity_public_key = tik} in
      (match parse_recv_session_data o with 
      | Success recv -> Success (Session peers rk None recv)
      | _ -> Error "Invalid format")
    |_ ->  Error "Invalid format")      
  | _ -> Error "not a session state")

let serialize_valid_session_st i p si vi st =
  assert (includes_ids [P p] [V p si vi]);
  match st with
  | Session peers root_key (Some send) None ->
    let s = serialize_send_session_data i p si vi peers root_key send in 
    A.concat (A.string_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) ("SendSession")) 
      (A.concat (A.string_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) (peers.peer)) 
    	(A.concat (role_to_labeled_bytes #i #(readers [V p si vi]) peers.role) 
    	  (A.concat peers.our_identity_public_key 
    	    (A.concat peers.their_identity_public_key 
    	      (A.concat root_key s)))))
  | Session peers root_key None (Some recv) ->
    let r = serialize_recv_session_data i p si vi peers root_key recv in 
    A.concat (A.string_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) ("RecvSession")) 
      (A.concat (A.string_to_labeled_bytes #signal_global_usage #i #(readers [V p si vi]) (peers.peer)) 
    	(A.concat (role_to_labeled_bytes #i #(readers [V p si vi]) peers.role) 
    	  (A.concat peers.our_identity_public_key 
    	    (A.concat peers.their_identity_public_key 
    	      (A.concat root_key r)))))
 
#push-options "--z3rlimit 10"
let parse_valid_serialize_session_st_lemma i p si vi ss = 
    assert (includes_ids [P p] [V p si vi]);
    match ss with
    | Session peers rk (Some send) None -> parse_valid_send_session_st_lemma i p si vi peers rk send
    | Session peers rk None (Some recv) -> parse_valid_recv_session_st_lemma i p si vi peers rk recv
    | _ -> ()
#pop-options

let get_peer_session i p peer = 
  let filter si vi st = match parse_session_st st with
    | Success (Session peers _ _ _) -> peers.peer = peer
    | _ -> false in
  match find_session #signal #i p filter with
  | Some (|si,vi,st|) ->
    (match parse_session_st st with
     | Success (Session peers rk snd rcv) -> (si, vi, Session peers rk snd rcv)
     |_ -> error "not the right state")
  | None -> error ("peer session not found.")
