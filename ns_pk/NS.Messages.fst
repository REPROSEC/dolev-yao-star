/// NS.Messages (implementation)
/// =============================
module NS.Messages

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib
module A = LabeledCryptoAPI

let initiate (a:principal) (b:principal) (n_a:bytes) : event =
  ("Initiate",[(string_to_bytes a);(string_to_bytes b);n_a])
let respond (a:principal) (b:principal) (n_a:bytes) (n_b:bytes) : event =
  ("Respond",[(string_to_bytes a);(string_to_bytes b);n_a;n_b])
let finishI (a:principal) (b:principal) (n_a:bytes) (n_b:bytes) : event =
  ("FinishI",[(string_to_bytes a);(string_to_bytes b);n_a;n_b])
let finishR (a:principal) (b:principal) (n_a:bytes) (n_b:bytes) : event =
  ("FinishR",[(string_to_bytes a);(string_to_bytes b);n_a;n_b])

noeq type message =
  | Msg1: a:principal -> n_a: bytes -> message
  | Msg2: n_a: bytes -> n_b:bytes -> message
  | Msg3: n_b: bytes -> message

let parse_message (m:bytes) =
  tm <-- split m;
  let (tag,msg) = tm in
  str_tag <-- bytes_to_string tag;
  if str_tag = "msg_2" then (
    na_nb_b <-- split msg;
    let (n_a,n_b) = na_nb_b in
    Success (Msg2 n_a n_b))
  else if str_tag = "msg_1" then (
    na_a_p <-- split msg;
    let (n_a,a) = na_a_p in
    str_a <-- bytes_to_string a;
    Success (Msg1 str_a n_a))
  else if str_tag = "msg_3" then (
    let n_b = msg in
    Success (Msg3 n_b))
  else Error "incorrect tag"

let ns_key_usages : A.key_usages = A.default_key_usages

let ppred (i:nat) s pk m =
    (exists p. A.get_sk_label ns_key_usages pk == readers [P p] /\
    (match parse_message m with
    | Success (Msg2 n_a n_b) ->
       exists b. (did_event_occur_before i b (respond p b n_a n_b)) /\
            (was_rand_generated_before i n_b (readers [P p; P b]) (nonce_usage "NS.nonce"))
    | Success (Msg1 a n_a) ->
       (did_event_occur_before i a (initiate a p n_a)) /\
       (was_rand_generated_before i n_a (readers [P a; P p]) (nonce_usage "NS.nonce"))
    | Success (Msg3 n_b) -> True
    | _ -> False))

let apred i s k m ad = True
let spred i s k m = True
let mpred i s k m = True

let ns_usage_preds : A.usage_preds = {
  A.can_pke_encrypt = ppred;
  A.can_aead_encrypt =  apred;
  A.can_sign = spred;
  A.can_mac = mpred
}

let ns_global_usage : A.global_usage = {
  A.key_usages = ns_key_usages;
  A.usage_preds = ns_usage_preds;
}

let msg i l = A.msg ns_global_usage i l

val valid_message: i:nat -> m:message -> l:label -> Type0
let valid_message i m l =
  match m with
  | Msg1 a n_a -> A.is_msg ns_global_usage i n_a l
  | Msg2 n_a n_b -> A.is_msg ns_global_usage i n_a l /\
		   A.is_msg ns_global_usage i n_b l
  | Msg3 n_b -> A.is_msg ns_global_usage i n_b l

val serialize_valid_message: i:nat -> m:message -> l:label{valid_message i m l} -> msg i l
let serialize_valid_message i m l =
  match m with
  | Msg1 a n_a ->
    let c = A.concat #_ #i #l (A.string_to_bytes #ns_global_usage #i "msg_1")
	    (A.concat #ns_global_usage #i #l n_a (A.string_to_bytes #ns_global_usage #i a)) in
    c
  | Msg2 n_a n_b ->
    let c = A.concat #_ #i #l (A.string_to_bytes #ns_global_usage #i "msg_2")
	    (A.concat #ns_global_usage #i #l n_a n_b) in
    c
  | Msg3 n_b ->
    let c = A.concat #_ #i #l (A.string_to_bytes #ns_global_usage #i "msg_3") n_b in
    c


let parse_serialize_valid_message_lemma (i:nat) (m:message) (l:label) : Lemma
    (valid_message i m l ==>
     (Success m == parse_message (serialize_valid_message i m l)))
    [SMTPat (parse_message (serialize_valid_message i m l))] = ()

val parse_valid_message: #i:nat -> #l:label -> w:msg i l ->
                        r:result message{match r with
                                 | Success m -> Success m == parse_message w /\ valid_message i m l
                                 | Error s -> True}
let parse_valid_message #i #l w =
  match A.split w with
  | Success (tag,msg) -> (
    match bytes_to_string tag, A.split msg with 
    | Success "msg_1", Success (n_a, a) ->
	(match bytes_to_string a with 
	| Success str_a -> Success (Msg1 str_a n_a)
	| _ -> Error ("incorrect string a in msg1"))
    | Success "msg_2", Success (n_a, n_b) -> Success (Msg2 n_a n_b)
    | Success "msg_3", Error _ -> Success (Msg3 msg)
    | _ -> Error ("invalid term"))
  | Error e -> Error e
