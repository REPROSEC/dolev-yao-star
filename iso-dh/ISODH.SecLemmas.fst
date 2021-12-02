/// ISODH.SecLemmas (implementation)
/// =====================================
module ISODH.SecLemmas

let initiator_correspondence_lemma i a b gx gy k = ()
  
let responder_correspondence_lemma i a b gx gy k = ()
  
let key_secrecy_lemma k a b = secrecy_join_label_lemma #(pki isodh) k 

let initiator_forward_secrecy_lemma i a b gx gy k =
  let t0 = global_timestamp () in
  assert (later_than t0 i);
  key_secrecy_lemma k a b;
  ()
  
let responder_forward_secrecy_lemma i a b gx gy k =
  let t0 = global_timestamp () in
  assert (later_than t0 i);
  key_secrecy_lemma k a b;
  ()
