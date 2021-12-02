/// ISOKem.Debug (implementation)
/// ==============================
module ISOKem.Debug

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open AttackerAPI
open ISOKem.Messages
open ISOKem.Sessions
open ISOKem.Protocol
open SecurityLemmas

val benign_attacker:
  unit ->
  LCrypto unit (pki isokem)
  (requires fun _ -> True)
  (ensures fun _ _ _ -> True)

let benign_attacker () =
  let alice:principal = "alice" in
  let bob:principal = "bob" in
  let t0 = global_timestamp () in
  let pka = gen_private_key #isokem #t0 alice SIG "ISOKem.sig_key" in
  let t1 = global_timestamp () in
  let pkb = gen_private_key #isokem #t1 bob SIG "ISOKem.sig_key" in
  let t2 = global_timestamp () in
  assert (later_than t1 t0);
  assert (later_than t2 t1);
  let idx_pka_b = install_public_key #isokem #t2 bob alice SIG "ISOKem.sig_key" in
  let t3 = global_timestamp () in
  let idx_pkb_a = install_public_key #isokem #t3 alice bob SIG "ISOKem.sig_key" in
  let (idx_msg_1, idx_sess_a) = initiator_send_msg_1 alice bob in
  let (idx_msg_2, idx_sess_b) = responder_send_msg_2 bob idx_msg_1 in
  let idx_msg_3 = initiator_send_msg_3 alice idx_sess_a idx_msg_2 in
  responder_accept_msg_3 bob idx_sess_b idx_msg_3

let benign () : LCrypto unit (pki isokem)
  (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) =
  print_string "start\n";
  let t0 = get() in
  let x = benign_attacker () in
  print_trace ()

val query_secret_key:
    idx_state:nat -> idx_corrupt:nat -> idx_query:nat ->
    p:principal -> LCrypto (pub_bytes idx_query) (pki isokem)
    (requires (fun t0 -> idx_state < idx_query /\ idx_corrupt < idx_query /\ idx_query <= trace_len t0 /\ was_corrupted_at idx_corrupt p 0 0))
    (ensures (fun t0 _ t1 -> trace_len t1 == trace_len t0))
let query_secret_key idx_state idx_corrupt idx_query p =
    let t = query_state_i idx_state idx_corrupt idx_query p 0 0 in
    match split t with 
    | Success (tag, b) -> // tag == PKI
      (match split b with 
      | Success (tag, b) -> b // Due to the string on key-usages in LabeledPKI, we need to split again
      | _ -> b)
(*      (match split b with
	| Success (tag', b) -> b // tag == SecretKey
	| _ -> error "incorrect tag") *)
    | _ -> error "incorrect tag"

val key_synch_attacker:
  unit ->
  LCrypto unit (pki isokem)
  (requires fun _ -> True)
  (ensures fun _ _ _ -> True)

#push-options "--z3rlimit 100 --max_fuel 0 --max_ifuel 0"
let key_synch_attacker () =
  let alice:principal = "alice" in
  let bob:principal = "bob" in
  let mallory:principal = "mallory" in
  let t0 = global_timestamp () in
  let pka = gen_private_key #isokem #t0 alice SIG "ISOKem.sig_key" in
  let t1 = global_timestamp () in
  let pkb = gen_private_key #isokem  #t1 bob SIG "ISOKem.sig_key" in
  let t2 = global_timestamp () in
  let pkm = gen_private_key #isokem #t2 mallory SIG "ISOKem.sig_key" in
  let t3 = global_timestamp () in
  let t4 = compromise mallory 0 0 in
  let t5 = global_timestamp () in
  let skm = query_secret_key (t2+1) t3 t5 mallory in
  let idx_pkm_b = install_public_key #isokem #t5 mallory bob SIG "ISOKem.sig_key" in
  let t6 = global_timestamp () in
  let idx_pkm_a = install_public_key #isokem #t6 mallory alice SIG "ISOKem.sig_key" in
  let (idx_msg1, idx_sess_a) = initiator_send_msg_1 alice mallory in
  let t7 = global_timestamp () in
  let (|t8,w_msg1|) = receive_i idx_msg1 mallory in 
  (match split w_msg1 with
  | Success (ttag,rest) ->
    (match split rest with
    | Success (ta,gx) ->
      let gx: pub_bytes t8 = gx in
      let str_m : pub_bytes t8 =
	pub_bytes_later 0 t8 ((string_to_pub_bytes mallory)) in
      let w_msg1':pub_bytes t8 = concat ttag (concat #t8 str_m gx) in
      let idx_msg1' = send #t8 mallory bob w_msg1' in
      let (idx_msg2, idx_sess_b) = responder_send_msg_2 bob idx_msg1' in
      let t9 = global_timestamp () in
      let (|_,w_msg2|) = receive_i idx_msg2 mallory in
      let w_msg2: pub_bytes t9 = w_msg2 in
      (match split w_msg2 with 
      | Success (ttag,rest) ->
	(match split rest with 
	| Success (tb,gysg) ->
	  (match split gysg with 
	  | Success (gy,_) ->
	    let skm :pub_bytes t9 = pub_bytes_later t5 t9 skm in
	    let gy: pub_bytes t9 = gy in
	    let gx: pub_bytes t9 = pub_bytes_later t8 t9 gx in
	    let str_m : pub_bytes t9 = pub_bytes_later t8 t9 str_m in
	    let str_a : pub_bytes t9 = pub_bytes_later 0 t9 ((string_to_pub_bytes alice)) in
	    let sv' : pub_bytes t9 = concat ttag (concat str_a (concat gx gy)) in
	    let (| t10, n_sig |) = pub_rand_gen (nonce_usage "SIG_NONCE") in
	    let sv' : pub_bytes t10 = pub_bytes_later t9 t10 sv' in
	    let sg' : pub_bytes t10 = sign #t10 skm n_sig sv' in
	    let w_msg2':pub_bytes t10 = concat #t10 ttag (concat #t10 str_m (concat #t10 gy sg')) in
	    let idx_msg2' = send mallory alice w_msg2' in 
	    let idx_msg3 = initiator_send_msg_3 alice idx_sess_a idx_msg2' in
	    let (|_,w_msg3|) = receive_i idx_msg3 mallory in
	    (match split w_msg3 with 
	    | Success (ttag, rest) ->
	      let t11 = global_timestamp () in
	      let str_b : pub_bytes t11 = pub_bytes_later 0 t11 ((string_to_pub_bytes bob)) in
	      let gy: pub_bytes t11 = pub_bytes_later t10 t11 gy in
	      let gx: pub_bytes t11 = pub_bytes_later t10 t11 gx in
	      let sv': pub_bytes t11 = concat ttag (concat str_b (concat gx gy)) in
	      let skm :pub_bytes t11 = pub_bytes_later t5 t11 skm in
	      let (| t12, n_sig |) = pub_rand_gen (nonce_usage "SIG_NONCE") in
	      let sg':pub_bytes t12  = sign #t12 skm n_sig sv' in
	      let w_msg3':pub_bytes t12 = concat #t12 ttag sg' in
	      let idx_msg3' = send mallory bob w_msg3' in
	      responder_accept_msg_3 bob idx_sess_b idx_msg3'
	    | _ -> error "w_msg3 split error")
	  | _ -> error "gysg split error")
	| _ -> error "rest2 split error")
      | _ -> error "w_msg2 split error")
    | _ -> error "rest1 split error")
  | _ -> error "w_msg1 split error")
#pop-options


let key_synch () : LCrypto unit (pki isokem) (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) =
  print_string "key synch start\n";
  let x = key_synch_attacker () in
  print_trace ()


let main =
  IO.print_string "======================\n";
  IO.print_string "       ISO-KEM        \n";
  IO.print_string "======================\n";
  let t0 = Seq.empty in
  IO.print_string "Starting Benign Attacker:\n";
  assume(valid_trace (pki isokem) t0);
  let r,t1 = (reify (benign ()) t0) in
  (match r with
  | Error s -> IO.print_string ("ERROR: "^s^"\n")
  | Success _ -> IO.print_string "PROTOCOL RUN (SUCCESS for jenkins): Successful execution of ISO-KEM protocol.\n");
  IO.print_string "Finished Benign Attacker:\n";
  IO.print_string "Starting Key-Synch Attacker:\n";
  assume(valid_trace (pki isokem) t0);
  let r,t1 = (reify (key_synch ()) t0) in
  (match r with
  | Error s -> IO.print_string ("ERROR: "^s^"\n")
  | Success _ -> IO.print_string "PROTOCOL RUN (SUCCESS for jenkins): Successful key synch attack on ISO-KEM protocol.\n");
  IO.print_string "Finished Key-Synch Attacker:\n"



