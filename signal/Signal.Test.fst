/// Signal.Test (implementation)
/// ==================================
module Signal.Test

open SecrecyLabels
open CryptoLib
open GlobalRuntimeLib
open LabeledRuntimeAPI
module A = LabeledCryptoAPI
open Signal.Sessions
open Signal.X3DH
open Signal.DR
open Signal.Messages
open Signal.Core
open Signal.Crypto
open LabeledPKI

val check_ptext : plaintext_bytes:bytes -> plaintext_string:string -> LCrypto unit (pki signal) (requires fun t0 -> True) (ensures fun t0 _ t1 -> True)
let check_ptext p_bytes p_string = 
    (match bytes_to_string p_bytes with
    | Success s -> if s = p_string then print_string "successfully decrypted message\n" 
		  else (print_string "mismatch in plaintext\n"; error "mismatch in plaintext"); ()
    | _ -> print_string "incorrect message received\n"; error "incorrect message")

val x3dh: p:principal -> peer:principal -> LCrypto unit (pki signal) (requires fun t0 -> True) (ensures fun t0 _ t1 -> True)
let x3dh p peer = 
  x3dh_initialize_state p peer;
  let i = global_timestamp () in
  let m1 = "initiate x3dh" in 
  let msg:msg_at i public = A.string_to_bytes #signal_global_usage #i m1 in 
  let i = global_timestamp () in 
  let msg:msg_at i (readers [P p; P peer]) = A.restrict #signal_global_usage #i #public msg (readers [P p; P peer]) in
  let (msg_idx, sidx) = x3dh_initiate #i p peer msg in 
  let i = global_timestamp () in 
  let (|_,l,ptext,ridx|) = x3dh_respond #i peer msg_idx in
  check_ptext ptext m1;
  print_string "PROTOCOL RUN (SUCCESS for jenkins): x3dh protocol completes\n"; ()

#push-options "--z3rlimit 50"
val double_ratchet: p:principal -> peer: principal ->  LCrypto unit (pki signal) (requires fun t0 -> True) (ensures fun t0 _ t1 -> True)
let double_ratchet p peer = 
    // X3DH to set up
    x3dh_initialize_state p peer;
    let i = global_timestamp () in
    let m1 = "initiate x3dh" in 
    let msg:msg_at i public = A.string_to_bytes #signal_global_usage #i m1 in 
    let i = global_timestamp () in 
    let msg:msg_at i (readers [P p; P peer]) = A.restrict #signal_global_usage #i #public msg (readers [P p; P peer]) in
    let (msg_idx, sidx) = x3dh_initiate #i p peer msg in 
    let i = global_timestamp () in 
    let (|_,l,ptext,ridx|) = x3dh_respond #i peer msg_idx in
    check_ptext ptext m1;
    print_string ("keys established for DR\n");
    // both responder and initiator have same root/chain keys at this point
    let i = global_timestamp () in 
    let msg:msg_at i public = A.string_to_bytes #signal_global_usage #i "respond" in 
    let msg:msg_at i (readers [P peer; P p]) = A.restrict #signal_global_usage #i #public msg (readers [P peer; P p]) in
    let msg_idx = send_message #i peer p msg in
    let i = global_timestamp () in 
    let (|_,plaintext|) = receive_message #i p peer msg_idx in
    check_ptext plaintext "respond";
    print_string ("=== performing second round ===\n");
    let i = global_timestamp () in 
    let m2 = A.string_to_bytes #signal_global_usage #i "m2" in 
    let m2:msg_at i (readers [P p; P peer]) = A.restrict #signal_global_usage #i #public m2 (readers [P p; P peer]) in
    let msg_idx = send_message #i p peer m2 in 
    let i = global_timestamp () in 
    let (|_,plaintext|) = receive_message #i peer p msg_idx in
    check_ptext plaintext "m2";
    print_string ("=== finishing second round ===\n");
    print_string "PROTOCOL RUN (SUCCESS for jenkins): double ratchet protocol completes\n"; 
    ()
#pop-options

let x3dh_test () : LCrypto unit (pki signal) (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) =
  print_string "start\n";
  let t0 = get() in
  let p: principal = "initiator" in
  let peer:principal = "responder" in
  let x = x3dh p peer in
  print_trace ();
  print_string "\n"

let double_ratchet_test () : LCrypto unit (pki signal) (requires (fun _ -> True)) (ensures (fun _ _ _ -> True)) =
  print_string "start\n";
  let t0 = get() in
  let p: principal = "initiator" in
  let peer:principal = "responder" in
  let x = double_ratchet p peer in
  print_trace ();
  print_string "\n"

open FStar.IO

let main =
  let t0 = Seq.empty in
  print_string "======= test 1 (x3dh) ======== \n";
  assume(valid_trace (pki signal) t0);
  let r1,t1 = (reify (x3dh_test ()) t0) in
  print_string "======= end test 1 (x3dh) ======== \n";
  print_string "======= test 2 (Double ratchet) ======== \n";
  let r2,t2 = (reify (double_ratchet_test ()) t0) in
  print_string "======= end test 2 (Double ratchet) ======== \n";
  ()
