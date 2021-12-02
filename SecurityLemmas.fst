/// SecurityLemmas (implementation)
/// ================================
module SecurityLemmas

friend AttackerAPI // required for definition of query_result
friend LabeledCryptoAPI // required for definition of is_valid
friend LabeledRuntimeAPI // required for definition of valid_trace
friend SecrecyLabels
let publishable_readers_implies_corruption #i l = includes_corrupt_lemma i l

val corrupt_principals_have_publishable_state_at: pr:preds -> t:trace -> trace_index:timestamp ->
  Lemma (requires (valid_trace pr t /\ trace_index <= trace_len t))
        (ensures (forall j p vv s si v. (Seq.length vv > si /\ corrupt_at trace_index (V p si (Seq.index vv si)) /\
                                   j < trace_index /\ state_was_set_at j p vv s /\ Seq.index s si == v) ==> is_publishable pr.global_usage trace_index v))
let corrupt_principals_have_publishable_state_at pr t i =
  let corrupt_principal_has_publishable_state (pr:preds) (i:timestamp) (j:timestamp) (p:principal) (v:version_vec) (s:state_vec) (session_index:nat) (b:bytes) :
    Lemma (requires (state_inv pr i p v s /\ Seq.length v = Seq.length s /\ session_index < Seq.length v /\
                    Seq.index s session_index == b /\ i <= j /\ corrupt_at j (V p session_index (Seq.index v session_index))))
          (ensures (is_publishable pr.global_usage j b))
          [SMTPat (state_inv pr i p v s); SMTPat (corrupt_at j (V p session_index (Seq.index v session_index)));
          SMTPat (is_publishable pr.global_usage j b)]
  = let ps = readers [V p session_index (Seq.index v session_index)] in
    pr.trace_preds.session_st_inv_lemma i p session_index (Seq.index v session_index) (Seq.index s session_index);
    let l = get_label pr.global_usage.key_usages (Seq.index s session_index) in
    can_flow_transitive j l ps public; assert (later_than j i)
  in  ()

val publishable_before_is_publishable : pr:preds -> h:trace -> i:timestamp ->
    Lemma (requires (valid_trace pr h /\ later_than (trace_len h) i))
          (ensures (forall t. (i > 0 /\ Att.was_published_before (i-1) t) ==> is_publishable pr.global_usage i t))
let publishable_before_is_publishable pr h i = assert (later_than i (i-1)); ()

val corrupted_before_is_publishable : pr:preds -> h:trace -> i:timestamp ->
    Lemma (requires (valid_trace pr h /\ later_than (trace_len h) i))
          (ensures (forall idx si v p t. idx < i /\ Att.query_result idx p si v t /\
                                    was_corrupted_before i p si v ==> is_publishable pr.global_usage i t))
let corrupted_before_is_publishable pr h i = corrupt_principals_have_publishable_state_at pr h i; ()

val attacker_only_derives_public_values_:
    pr:preds -> h:trace -> i:timestamp -> steps:nat -> Lemma
    (requires (valid_trace pr h /\ later_than (trace_len h) i))
    (ensures (forall t. Att.attacker_can_derive i steps t ==> is_publishable pr.global_usage i t))

#push-options "--z3rlimit 25"
let rec attacker_only_derives_public_values_ pr h i steps =
  if steps = 0 then (
        strings_are_publishable_forall pr.global_usage;
        nats_are_publishable_forall pr.global_usage;
        bytestrings_are_publishable_forall pr.global_usage;
        corrupted_before_is_publishable pr h i;
        publishable_before_is_publishable pr h i
  )
  else (
        attacker_only_derives_public_values_ pr h i (steps - 1);
        assert (forall a'. Att.attacker_can_derive i (steps - 1) a' ==> is_publishable pr.global_usage i a');
        concatenation_publishable_implies_components_publishable_forall pr.global_usage;
        splittable_term_publishable_implies_components_publishable_forall pr.global_usage;
        public_key_is_publishable_if_private_key_is_publishable_forall pr.global_usage;
        pke_ciphertext_publishable_if_key_and_msg_are_publishable_forall pr.global_usage;
        pke_plaintext_publishable_if_key_and_ciphertext_publishable_forall pr.global_usage;
        aead_enc_ciphertext_publishable_if_key_and_msg_are_publishable_forall pr.global_usage;
        aead_dec_plaintext_publishable_if_key_and_ciphertext_publishable_forall pr.global_usage;
        sig_is_publishable_if_key_and_msg_are_publishable_forall pr.global_usage;
        expand_value_publishable_if_secrets_are_publishable_forall pr.global_usage;
        extract_value_publishable_if_secrets_are_publishable_forall pr.global_usage;
        mac_is_publishable_if_key_and_msg_are_publishable_forall pr.global_usage;
        hash_value_publishable_if_message_is_publishable_forall pr.global_usage;
        dh_is_publishable_if_keys_are_publishable_forall pr.global_usage;
        ())
#pop-options

val attacker_only_derives_public_values:
    pr:preds -> h:trace -> i:timestamp -> steps:nat -> b:bytes -> Lemma
    (requires (valid_trace pr h /\ later_than (trace_len h) i /\ Att.attacker_can_derive i steps b))
    (ensures (is_publishable pr.global_usage i b))
    [SMTPat (valid_trace pr h); SMTPat (Att.attacker_can_derive i steps b)]

let attacker_only_derives_public_values pr h i steps b = attacker_only_derives_public_values_ pr h i steps

let attacker_preserves_validity pr t0 t1 =
  assert (Att.attacker_modifies_trace t0 t1 ==>
         (((exists u n. trace_len t1 = trace_len t0 + 2 /\ was_rand_generated_at (trace_len t0) n public u /\ Att.was_published_at (trace_len t0 + 1) n) \/
              (exists u n. trace_len t1 = trace_len t0 + 1 /\ was_rand_generated_at (trace_len t0) n public u) \/
           (exists i a. trace_len t1 = trace_len t0 + 1 /\ i <= trace_len t0 /\ Att.attacker_knows_at i a /\ Att.was_published_at (trace_len t0) a) \/
           (exists p s v. trace_len t1 = trace_len t0 + 1 /\ was_corrupted_at (trace_len t0) p s v))));
  assert (Att.attacker_modifies_trace t0 t1 ==> trace_len t1 > trace_len t0 /\ later_than (trace_len t1) (trace_len t0));
  assert (Att.attacker_modifies_trace t0 t1 /\ valid_trace pr t0 ==>
         (forall (i:timestamp) (t:bytes) (s:principal) (r:principal). i < trace_len t1 ==> (was_message_sent_at i s r t ==> (is_publishable pr.global_usage i t))));
  assert (Att.attacker_modifies_trace t0 t1 /\ valid_trace pr t0 ==>
         (forall (i:timestamp) (p:principal) (v:version_vec) (s:state_vec). i < trace_len t1 ==> (state_was_set_at i p v s ==> (state_inv pr i p v s))));
  assert (Att.attacker_modifies_trace t0 t1 /\ valid_trace pr t0 ==>
         (forall (i:timestamp) (s:principal) (e:event). i < trace_len t1 ==> (did_event_occur_at i s e ==> (event_pred_at pr i s e))))

let attacker_only_knows_publishable_values pr b = ()


let secrecy_lemma #pr b = ()
let secrecy_join_label_lemma #pr b = ()
