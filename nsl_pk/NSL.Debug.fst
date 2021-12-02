/// NSL.Debug (implementation)
/// ===========================
module NSL.Debug

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledCryptoAPI
open LabeledRuntimeAPI
open LabeledPKI
open AttackerAPI
open NSL.Messages
open NSL.Sessions
open NSL.Protocol
open SecurityLemmas

val benign_attacker:
  unit ->
  LCrypto unit (pki nsl)
  (requires fun _ -> True)
  (ensures fun _ _ _ -> True)

let benign_attacker () =
  let alice:principal = "alice" in
  let bob:principal = "bob" in
  let t0 = global_timestamp () in
  let pka = gen_private_key #nsl #t0 alice PKE "NSL.key" in
  let t1 = global_timestamp () in
  let pkb = gen_private_key #nsl #t1 bob PKE "NSL.key" in
  let t2 = global_timestamp () in
  assert (later_than t1 t0);
  assert (later_than t2 t1);
  let idx_pka_b = install_public_key #nsl #t2 bob alice PKE "NSL.key" in
  let t3 = global_timestamp () in
  let idx_pkb_a = install_public_key #nsl #t3 alice bob PKE "NSL.key" in
  let (idx_sess_a, idx_msg_1) = initiator_send_msg_1 alice bob in 
  let (idx_sess_b, idx_msg_2) = responder_send_msg_2 bob idx_msg_1 in 
  let idx_msg_3 = initiator_send_msg_3 alice idx_sess_a idx_msg_2 in 
  responder_receive_msg_3 bob idx_sess_b idx_msg_3

let benign () : LCrypto unit (pki nsl)
  (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) 
= print_string "start\n";
  let t0 = get() in
  let x = benign_attacker () in
  print_trace ()

let main =
  IO.print_string "======================\n";
  IO.print_string "Needham-Schroeder-Lowe\n";
  IO.print_string "======================\n";
  let t0 = Seq.empty in
  IO.print_string "Starting Benign Attacker:\n";
  assume(valid_trace (pki nsl) t0);
  let r,t1 = (reify (benign ()) t0) in
  (match r with
  | Error s -> IO.print_string ("ERROR: "^s^"\n")
  | Success _ -> IO.print_string "PROTOCOL RUN (SUCCESS for jenkins): Successful execution of Needham-Schroeder-Lowe protocol.\n");
  IO.print_string "Finished Benign Attacker:\n"

