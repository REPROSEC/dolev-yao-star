/// ISODH.Messages (implementation)
/// ================================
module ISODH.Messages

module A = LabeledCryptoAPI

let parse_sigval t : result sigval =
  r <-- split t ;
  let (ttag,pgxgy) = r in
  r <-- split pgxgy ;
  let (tp,gxgy) = r in
  r <-- split gxgy ;
  let (gx,gy) = r in
  r1 <-- bytes_to_string ttag ;
  r2 <-- bytes_to_string tp ;
  match r1,r2 with
  | "msg2", b -> Success (SigMsg2 b gx gy)
  | "msg3", a -> Success (SigMsg3 a gx gy)
  | _ -> Error "incorrect tag"

let sigval_msg2 (#i:nat) (b:principal) (gx:msg i public) (gy:msg i public) : msg i public =
    A.concat #isodh_global_usage #i #public (A.string_to_bytes #isodh_global_usage #i "msg2") 
      (A.concat #_ #i #public  (A.string_to_bytes #isodh_global_usage #i b) (A.concat #_ #i #public gx gy))

let sigval_msg3 (#i:nat) (a:principal) (gx:msg i public) (gy:msg i public) : msg i public =
    A.concat #_ #i #public (A.string_to_bytes #isodh_global_usage #i "msg3") 
      (A.concat #_ #i #public (A.string_to_bytes #isodh_global_usage #i a) (A.concat #_ #i #public gx gy))


let serialize_msg (i:nat) (m:iso_msg i) : msg i public =
  match m with
  | Msg1 a gx -> A.concat #_ #i #public (A.string_to_bytes #isodh_global_usage #i "msg1") (A.concat #_ #i #public (A.string_to_bytes #isodh_global_usage #i a) gx)
  | Msg2 b gy sg -> A.concat #_  #i #public (A.string_to_bytes #isodh_global_usage #i "msg2") (A.concat #_  #i #public (A.string_to_bytes #isodh_global_usage #i b) (A.concat #_  #i #public gy sg))
  | Msg3 sg -> A.concat #_ #i #public (A.string_to_bytes #isodh_global_usage #i "msg3") sg

let parse_msg (#i:nat) (w:msg i public) : result (iso_msg i) = 
  r1 <-- A.split w ; let (ttag,rest) = r1 in
  r2 <-- A.bytes_to_string ttag ;
  match r2 with
  | "msg1" -> r3 <-- A.split rest; let (ta,gx) = r3 in a <-- A.bytes_to_string ta ; Success (Msg1 a gx)
  | "msg2" -> r3 <-- A.split rest; let (tb,gysg) = r3 in b <-- A.bytes_to_string tb ; r4 <-- A.split gysg ; let (gy,sg) = r4 in Success (Msg2 b gy sg)
  | "msg3" -> Success (Msg3 rest)
  | _ -> Error "unknown message tag"

let parse_serialize_msg_lemma #i m : Lemma (parse_msg #i (serialize_msg i m) == Success m) = ()
