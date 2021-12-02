/// NS.Debug (implementation)
/// ===========================
module NS.Debug

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open AttackerAPI
open NS.Messages
open NS.Sessions
open NS.Protocol
open SecurityLemmas

val benign_attacker:
  unit ->
  LCrypto unit (pki ns)
  (requires fun _ -> True)
  (ensures fun _ _ _ -> True)

let benign_attacker () =
  let alice:principal = "alice" in
  let bob:principal = "bob" in
  let t0 = global_timestamp () in
  let pka = gen_private_key #ns #t0 alice PKE "NS.key" in
  let t1 = global_timestamp () in
  let pkb = gen_private_key #ns #t1 bob PKE "NS.key" in
  let t2 = global_timestamp () in
  assert (later_than t1 t0);
  assert (later_than t2 t1);
  let idx_pka_b = install_public_key #ns #t2 bob alice PKE "NS.key" in
  let t3 = global_timestamp () in
  let idx_pkb_a = install_public_key #ns #t3 alice bob PKE "NS.key" in
  let (idx_sess_a, idx_msg_1) = initiator_send_msg_1 alice bob in 
  let (idx_sess_b, idx_msg_2) = responder_send_msg_2 bob idx_msg_1 in 
  let idx_msg_3 = initiator_send_msg_3 alice idx_sess_a idx_msg_2 in 
  responder_receive_msg_3 bob idx_sess_b idx_msg_3

let benign () : LCrypto unit (pki ns)
  (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) 
= let t0 = get() in
  let x = benign_attacker () in
  print_trace ()

(* Lowe's Attack on NS-PK

A, B honest
E dishonest

A talks to E
E impersonates A to B

(1) S1 A->E: {N_A, A}K_PE     s1msg1
(2) S2 E->B: {N_A, A}K_PB     s2msg1
(3) S2 B->E: {N_A, N_B}K_PA   s2msg2
(4) S1 E->A: {N_A, N_B}K_PA   s1msg2
(5) S1 A->E: {N_B}K_PE        s1msg3
(6) S2 E->B: {N_B}K_PB        s2msg3

*)
val query_secret_key:
    idx_state:nat -> idx_corrupt:nat -> idx_query:nat ->
    p:principal -> s:nat -> v:nat -> 
    LCrypto (pub_bytes idx_query) (pki ns)
    (requires (fun t0 -> idx_state < idx_query /\ idx_corrupt < idx_query /\ idx_query <= trace_len t0 /\ was_corrupted_at idx_corrupt p s v))
    (ensures (fun t0 _ t1 -> t1 == t0))
let query_secret_key idx_state idx_corrupt idx_query p s v =
    let t = query_state_i idx_state idx_corrupt idx_query p s v in
    match split t with 
    | Success (tag, b) -> // tag == PKI
      (match split b with 
      | Success (tag, b) -> b // Due to the string on key-usages in LabeledPKI, we need to split again
      | _ -> b)
    | _ -> error "incorrect tag"

val query_public_key:
    idx_state:nat -> idx_corrupt:nat -> idx_query:nat ->
    p:principal -> s:nat -> v:nat -> 
    LCrypto (pub_bytes idx_query) (pki ns)
    (requires (fun t0 -> idx_state < idx_query /\ idx_corrupt < idx_query /\ idx_query <= trace_len t0 /\ was_corrupted_at idx_corrupt p s v))
    (ensures (fun t0 _ t1 -> t1 == t0))
let query_public_key idx_state idx_corrupt idx_query p s v =
    let t = query_state_i idx_state idx_corrupt idx_query p s v in
    match split t with 
    | Success (tag, b) -> // tag == PKI
      (match split b with 
      // Due to the string on key-usages in LabeledPKI, we need to split again
      | Success (tag, b) -> (match split b with 
			   | Success (tag, b) -> b // public key contains peer name
			   | _ -> b) 
      | _ -> b)
    | _ -> error "incorrect tag"

#push-options "--z3rlimit 100 --max_fuel 0 --max_ifuel 0"
let attacker () : LCrypto unit (pki ns)
    (requires fun _ -> True) (ensures fun _ _ _ -> True) =
  let alice:principal = "alice" in
  let bob:principal = "bob" in
  let eve:principal = "eve" in
  let t0 = global_timestamp () in
  let pka = gen_private_key #ns #t0 alice PKE "NS.key" in
  let t1 = global_timestamp () in
  let pkb = gen_private_key #ns #t1 bob PKE "NS.key" in
  let t2 = global_timestamp () in
  let pke = gen_private_key #ns #t2 eve PKE "NS.key" in
  let t3 = global_timestamp () in
  assert (later_than t1 t0);
  assert (later_than t2 t1);
  assert (later_than t3 t2);
  let idx_comp_eve = compromise eve pke 0 in
  let t3' = global_timestamp () in
  assert (was_corrupted_before t3' eve pke 0);
  let ske = query_secret_key (t2+1) t3 t3' eve pke 0 in
  let t3 = global_timestamp () in
  let idx_pka_b = install_public_key #ns #t3 alice bob PKE "NS.key" in
  let t4 = global_timestamp () in
  let idx_pkb_e = install_public_key #ns #t4 bob eve PKE "NS.key" in
  let t5 = global_timestamp () in
  let idx_pke_a = install_public_key #ns #t5 eve alice PKE "NS.key" in
  let t6 = global_timestamp () in
  let idx_comp_eve = compromise eve idx_pkb_e 0 in
  let t7 = global_timestamp () in
  let pke = query_public_key t4 t6 t7 eve idx_pkb_e 0 in
//  let (|_,n_pke|) = rand_gen #(ns) public (nonce_usage "PKE_NONCE") in
  let (|_,n_pke|) = pub_rand_gen (nonce_usage "PKE_NONCE") in
  // initialization done
  // -------------------
  // start protocol
  // (1)
  let (idx_sess_a, idx_s1msg1) = initiator_send_msg_1 alice eve in
  let (|_,c_s1msg1|) = receive_i idx_s1msg1 eve in
  let len_now = global_timestamp () in
  let ske':pub_bytes len_now = ske in
  let pkb':pub_bytes len_now = pke in 
  let c_s1msg1':pub_bytes len_now = c_s1msg1 in
  match pke_dec ske' c_s1msg1' with 
  | Success s1msg1 ->
    // (2)
    let s2msg1:pub_bytes len_now = s1msg1 in
    let c_s2msg1 = pke_enc #len_now pkb' n_pke s2msg1 in
    let idx_s2msg1 = send #len_now alice bob c_s2msg1 in
    let (idx_sess_b, idx_s2msg2) = responder_send_msg_2 bob idx_s2msg1 in
    // (3) + (4)
    let idx_s1msg3 = initiator_send_msg_3 alice idx_sess_a idx_s2msg2 in
    // (5)
    let (|_,c_s1msg3|) = receive_i idx_s1msg3 eve in
    let len_now = global_timestamp () in
    let ske'':pub_bytes len_now = ske in
    let c_s1msg3':pub_bytes len_now = c_s1msg3 in
    (match (pke_dec ske'' c_s1msg3') with 
    | Success msg1 -> (match split msg1 with 
		     | Success (tag,n_b) -> (match split n_b with 
					   | Success (n_b, p) -> nonce_secrecy_test alice bob idx_sess_b n_b // contains nonce and principal
					   | _ -> nonce_secrecy_test alice bob idx_sess_b n_b)
		     | _ -> error "split error")
    | _ -> error "decryption issue with ske")
  | _ -> error "decryption error"

let attack () : LCrypto unit (pki ns)
  (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) 
= let t0 = get() in
  let x = attacker () in
  print_trace ()
#pop-options

let main =
  IO.print_string "======================\n";
  IO.print_string "Needham-Schroeder\n";
  IO.print_string "======================\n";
  let t0 = Seq.empty in
  IO.print_string "Starting Benign Attacker:\n";
  assume(valid_trace (pki ns) t0);
  let r,t1 = (reify (benign ()) t0) in
  (match r with
  | Error s -> IO.print_string ("ERROR: "^s^"\n")
  | Success _ -> IO.print_string "PROTOCOL RUN (SUCCESS for jenkins): Successful execution of Needham-Schroeder protocol.\n");
  IO.print_string "Finished Benign Attacker:\n";
  IO.print_string "Starting Attacker:\n";
  let r,t1 = (reify (attack ()) t0) in
  (match r with
  | Error s -> IO.print_string ("ERROR: "^s^"\n")
  | Success _ -> IO.print_string "PROTOCOL RUN (SUCCESS for jenkins): Successful execution of Needham-Schroeder protocol.\n");
  IO.print_string "Finished Attacker:\n"

