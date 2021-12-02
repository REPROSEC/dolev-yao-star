/// NSL.Messages (implementation)
/// ==============================
module NSL.Messages
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
  | Msg1: n_a: bytes -> a:string -> message
  | Msg2: n_a: bytes -> n_b:bytes -> b:string -> message
  | Msg3: n_b: bytes -> a:string -> message

let parse_message (m:bytes) =
  tm <-- split m;
  let (tag,msg) = tm in
  str_tag <-- bytes_to_string tag;
  if str_tag = "msg_2" then (
    na_nb_b <-- split msg;
    let (n_a,nb_b) = na_nb_b in
    nb_b <-- split nb_b;
    let (n_b,b) = nb_b in
    str_b <-- bytes_to_string b;
    Success (Msg2 n_a n_b str_b))
  else if str_tag = "msg_1" then (
    na_a_p <-- split msg;
    let (n_a,a) = na_a_p in
    str_a <-- bytes_to_string a;
    Success (Msg1 n_a str_a))
  else if str_tag = "msg_3" then (
    nb_a_p <-- split msg;
    let (n_b,a) = nb_a_p in
    str_a <-- bytes_to_string a;
    Success (Msg3 n_b str_a))
  else Error "incorrect tag"

let nsl_key_usages : A.key_usages = A.default_key_usages

let ppred (i:nat) s pk m =
    (exists p. A.get_sk_label nsl_key_usages pk == readers [P p] /\
    (match parse_message m with
    | Success (Msg2 n_a n_b b) ->
       (did_event_occur_before i b (respond p b n_a n_b)) /\
       (was_rand_generated_before i n_b (readers [P p; P b]) (nonce_usage "NSL.nonce"))
    | Success (Msg1 n_a a) ->
       (did_event_occur_before i a (initiate a p n_a)) /\
       (was_rand_generated_before i n_a (readers [P a; P p]) (nonce_usage "NSL.nonce"))
    | Success (Msg3 n_b a) ->
       (exists n_a. did_event_occur_before i a (finishI a p n_a n_b))
    | _ -> False))
let apred i s k m ad = True
let spred i s k m = True
let mpred i s k m = True

let nsl_usage_preds : A.usage_preds = {
  A.can_pke_encrypt = ppred;
  A.can_aead_encrypt =  apred;
  A.can_sign = spred;
  A.can_mac = mpred
}

let nsl_global_usage : A.global_usage = {
  A.key_usages = nsl_key_usages;
  A.usage_preds = nsl_usage_preds;
}

let msg i l = A.msg nsl_global_usage i l

val valid_message: i:nat -> m:message -> l:label -> Type0
let valid_message i m l =
  match m with
  | Msg1 n_a a -> A.is_msg nsl_global_usage i n_a l
  | Msg2 n_a n_b b -> A.is_msg nsl_global_usage i n_a l /\
		     A.is_msg nsl_global_usage i n_b l
  | Msg3 n_b a -> A.is_msg nsl_global_usage i n_b l

val serialize_valid_message: i:nat -> m:message -> l:label{valid_message i m l} -> msg i l
let serialize_valid_message i m l =
  match m with
  | Msg1 n_a a ->
    let c = A.concat #_ #i #l (A.string_to_bytes #nsl_global_usage #i "msg_1")
	    (A.concat #nsl_global_usage #i #l n_a (A.string_to_bytes #nsl_global_usage #i a)) in
    c
  | Msg2 n_a n_b b ->
    let c = A.concat #_ #i #l (A.string_to_bytes #nsl_global_usage #i "msg_2")
	    (A.concat #nsl_global_usage #i #l n_a
	     (A.concat #_ #i #l n_b (A.string_to_bytes #nsl_global_usage #i b))) in
    c
  | Msg3 n_b a ->
    let c = A.concat #_ #i #l (A.string_to_bytes #nsl_global_usage #i "msg_3")
	     (A.concat #nsl_global_usage #i #l n_b (A.string_to_bytes #nsl_global_usage #i a)) in
    c


let parse_serialize_valid_message_lemma (i:nat) (m:message) (l:label) : Lemma
    (valid_message i m l ==>
     (Success m == parse_message (serialize_valid_message i m l)))
    [SMTPat (parse_message (serialize_valid_message i m l))] = ()

val parse_valid_message: #i:nat -> #l:label -> w:msg i l ->
                        r:result message{match r with
                                 | Success m -> Success m == parse_message w /\
					       valid_message i m l
                                 | Error s -> True}
#push-options "--z3rlimit 700"
let parse_valid_message #i #l w =
  r1 <-- A.split w; let (tag,msg) = r1 in
  r2 <-- bytes_to_string tag; let str_tag = r2 in
  match str_tag with
  | "msg_2" ->
    r3 <-- A.split msg; let (n_a,nbb) = r3 in
    r4 <-- A.split nbb; let (n_b,b) = r4 in
    r5 <-- bytes_to_string b; let str_b = r5 in
    Success (Msg2 n_a n_b str_b)
  |  "msg_1" ->
    r6 <-- split msg; let (n_a,a) = r6 in
    r7 <-- bytes_to_string a; let str_a = r7 in
    Success (Msg1 n_a str_a)
  | "msg_3" ->
    r8 <-- split msg; let (n_b,a) = r8 in
    r9 <-- bytes_to_string a; let str_a = r9 in
    Success (Msg3 n_b str_a)
  | _ -> Error ("invalid term")
#pop-options
