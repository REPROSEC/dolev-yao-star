/// This module encodes a Dolev-Yao style model of symbolic cryptography
module CryptoLib

open SecrecyLabels
friend SecrecyLabels

open FStar.List.Tot

type usage_ =
  | NONCE: string -> usage_
  | GUID: string -> usage_
  | PKE: string -> usage_
  | AE: string -> usage_
  | MAC: string -> usage_
  | SIG: string -> usage_
  | KDF: string -> usage_
  | DHKey: string -> usage_

let usage = usage_
let nonce_usage s = NONCE s
let guid_usage s = GUID s
let pke_usage s = PKE s
let aead_usage s = AE s
let mac_usage s = MAC s
let sig_usage s = SIG s
let kdf_usage s = KDF s
let dh_usage s = DHKey s

(* Ordering on usages; uses the <= ordering on labels defined in DY.Labels *)
let usage_to_list_int (u:usage) =
  match u with
  | NONCE s -> 0 :: string_to_list_int s
  | GUID s -> 1 :: string_to_list_int s
  | PKE s -> 2 :: string_to_list_int s
  | AE s -> 3 :: string_to_list_int s
  | MAC s -> 4 :: string_to_list_int s
  | SIG s -> 5 :: string_to_list_int s
  | KDF s -> 6 :: string_to_list_int s
  | DHKey s -> 7 :: string_to_list_int s

let usage_to_list_int_inj (u1 u2:usage):
  Lemma (usage_to_list_int u1 == usage_to_list_int u2 ==> u1 == u2) =
  match u1,u2 with
  | NONCE s1, NONCE s2
  | GUID s1, GUID s2
  | PKE s1, PKE s2
  | AE s1, AE s2
  | MAC s1, MAC s2
  | SIG s1, SIG s2
  | KDF s1, KDF s2
  | DHKey s1, DHKey s2 -> string_to_list_int_inj s1 s2
  | _,_ ->()

instance usage_comparable : comparable usage = {
  to_list_int = usage_to_list_int;
  to_list_int_inj = usage_to_list_int_inj
}

let usage_le l1 l2 = le usage_comparable l1 l2


type bytes_ =
  | Literal: literal -> bytes_
  | Rand: n:nat -> l:label -> u:usage -> bytes_
  | Concat: bytes_ -> bytes_ -> bytes_
  | PK: secret:bytes_ -> bytes_
  | PKEnc: pk:bytes_ -> msg:bytes_ -> bytes_
  | Extract: key:bytes_ -> salt:bytes_ -> bytes_
  | Expand: key:bytes_ -> info:bytes_ -> bytes_
  | AEnc: k:bytes_ -> msg:bytes_ -> ad:bytes_ -> bytes_
  | VK: secret:bytes_ -> bytes_
  | Sig: sk:bytes_ -> msg:bytes_ -> bytes_
  | Mac: k:bytes_ -> msg:bytes_ -> bytes_
  | Hash: m:bytes_ -> bytes_
  | DH_PK: s:bytes_ -> bytes_
  | DH: k:bytes_ -> s:bytes_ -> bytes_

(* Ordering on terms - uses <= relations defined for lists of UInt8, lists of chars, usages and labels.
   The main use of this is to define the equality of terms when using symbolic terms like DH, XOR.
*)

let rec bytes_to_list_int (t:bytes_) : list int = 
  match t with
  | Literal (ByteSeq b) -> 0::seq_u8_to_list_int b
  | Literal (String b) -> 1::string_to_list_int b
  | Literal (Nat b) -> 2::[b]
  | Rand n l u -> 3::n::lconcat (label_to_list_int l) (usage_to_list_int u)
  | Concat b1 b2 -> 4 :: lconcat (bytes_to_list_int b1) (bytes_to_list_int b2)
  | PK s -> 5 :: bytes_to_list_int s
  | PKEnc p m ->  6 :: lconcat (bytes_to_list_int p) (bytes_to_list_int m)
  | Extract k s -> 7 :: lconcat (bytes_to_list_int k) (bytes_to_list_int s)
  | Expand k i -> 8 :: lconcat (bytes_to_list_int k) (bytes_to_list_int i)
  | AEnc k m ad -> 9 :: lconcat (lconcat (bytes_to_list_int k) (bytes_to_list_int m)) (bytes_to_list_int ad)
  | VK s -> 10 :: bytes_to_list_int s
  | Sig sk m -> 11 :: lconcat (bytes_to_list_int sk) (bytes_to_list_int m)
  | Mac k m -> 12 :: lconcat (bytes_to_list_int k) (bytes_to_list_int m)
  | Hash m -> 13:: bytes_to_list_int m
  | DH_PK s -> 14:: bytes_to_list_int s
  | DH k p -> 15 :: lconcat (bytes_to_list_int k) (bytes_to_list_int p)

let rec bytes_to_list_int_inj (t1 t2:bytes_) :
  Lemma (bytes_to_list_int t1 == bytes_to_list_int t2 ==> t1 == t2) =
  match t1,t2 with
  | Literal (ByteSeq b1), Literal (ByteSeq b2) -> seq_u8_to_list_int_inj b1 b2
  | Literal (String b1), Literal (String b2) -> string_to_list_int_inj b1 b2
  | Literal (Nat n1), Literal (Nat n2) -> ()
  | Rand n1 l1 u1, Rand n2 l2 u2 -> label_to_list_int_inj l1 l2; usage_to_list_int_inj u1 u2
  | PK b1, PK b2 | VK b1, VK b2 | Hash b1, Hash b2 | DH_PK b1, DH_PK b2 -> bytes_to_list_int_inj b1 b2
  | Concat b1 b2, Concat b1' b2' | PKEnc b1 b2, PKEnc b1' b2'
  | Extract b1 b2, Extract b1' b2' | Expand b1 b2 , Expand b1' b2'
  | Sig b1 b2, Sig b1' b2' | Mac b1 b2, Mac b1' b2' | DH b1 b2, DH b1' b2' ->
    bytes_to_list_int_inj b1 b1'; bytes_to_list_int_inj b2 b2'
  | AEnc k1 m1 ad1, AEnc k2 m2 ad2 ->
    bytes_to_list_int_inj k1 k2; bytes_to_list_int_inj m1 m2; bytes_to_list_int_inj ad1 ad2
  | _, _ -> ()

instance bytes_comparable : comparable bytes_ = {
  to_list_int = bytes_to_list_int;
  to_list_int_inj = bytes_to_list_int_inj
}

let bytes_le = le bytes_comparable

let bytes = b:bytes_{hasEq bytes_}
let empty = Literal (ByteSeq Seq.empty)
  
let sprint_usage u =
  match u with
  | PKE s -> "PKE "^s
  | AE s -> "AE "^s
  | MAC s -> "MAC "^s
  | SIG s -> "SIG "^s
  | NONCE s -> "NONCE "^s
  | GUID s -> "GUID "^s
  | KDF s -> "KDF "^s
  | DHKey s -> "DHKey "^s

let sprint_literal l =
  match l with
  | ByteSeq bs -> String.concat " " (List.Tot.map UInt8.to_string (Seq.seq_to_list bs))
  | String s -> s
  | Nat n -> string_of_int n
  
let rec sprint_bytes t =
  match t with
  | Literal l -> sprint_literal l
  | Concat t1 t2 -> "("^sprint_bytes t1 ^ " | " ^ sprint_bytes t2^")"
  | Rand i l u -> sprint_usage u^"("^string_of_int i^")"
  | PK s -> "pk("^sprint_bytes s^")"
  | VK s -> "vk("^sprint_bytes s^")"
  | Sig k m -> "sign("^sprint_bytes k^","^sprint_bytes m^")"
  | PKEnc p m -> "pke_enc("^sprint_bytes p^","^sprint_bytes m^")"
  | AEnc p m ad -> "aead_enc("^sprint_bytes p^","^sprint_bytes m^","^sprint_bytes ad^")"
  | Expand k k' -> "kdf_expand("^sprint_bytes k^","^sprint_bytes k'^")"
  | Extract k k' -> "kdf_extract("^sprint_bytes k^","^sprint_bytes k'^")"
  | Mac k m -> "mac("^sprint_bytes k^","^sprint_bytes m^")"
  | Hash m -> "hash("^sprint_bytes m^")"
  | DH sk1 sk2 -> "dh("^sprint_bytes sk1^","^sprint_bytes sk2^")"
  | DH_PK k1 -> "dh_pk("^sprint_bytes k1

let sprint_generated_rand t =
    match t with
    | Rand i l u -> "Generated "^sprint_bytes t^"\n    "^ "Label: "^sprint_label l^"\n    "^ "Usage: "^sprint_usage u
    | _ -> "Generated <unexpected bytes>"

let literal_to_bytes s = Literal s
let bytes_to_literal t =
  match t with
  | Literal s -> Success s
  | _ -> Error "bytes_to_literal: not a literal"
let bytes_to_literal_lemma s = ()
let literal_to_bytes_lemma b = ()

(* A ghost function representing resulsts of  RNG calls *)
let g_rand i l u = Rand i l u
let g_rand_inj_lemma i1 i2 l1 l2 u1 u2 = ()

(* A hidden concrete function for RNG calls used only inside GlobalRuntimelib *)
let mk_rand i l u = Rand i l u

let concat b1 b2 = Concat b1 b2
let split c =
  match c with
  | Concat b1 b2 -> Success (b1,b2)
  | _ -> Error "split: not a concat"

let split_concat_lemma a b = ()
let concat_split_lemma b = ()

let pk s = (PK s)
let pk_inj_lemma t1 t2 = ()
let pke_enc p s = (PKEnc p s)
let pke_dec s c =
  match c with
  | PKEnc (PK s') m ->
    if s = s' then Success m
    else Error "pke_dec: key mismatch"
  | _ -> Error "pke_dec: not a pke ciphertext"
let pke_enc_inj_lemma p b = ()
let pke_dec_enc_lemma s b = ()
let pke_dec_lemma s c = ()

let aead_enc k p ad = AEnc k p ad
let aead_dec k c ad =
  match c with
  | AEnc k' m ad' ->
    if k = k' && ad = ad' then Success m
    else Error "aead_dec: key or ad mismatch"
  | _ -> Error "aead_dec: not an aead ciphertext"

let aead_dec_enc_lemma k p ad = ()
let aead_dec_lemma k c ad = ()

let vk s = (VK s)
let vk_inj_lemma s s' = ()

let sign s m = (Sig s m)
let verify p m t =
  match t with
  | Sig s m' -> if p = (VK s) && m = m' then true else false
  | _ -> false

let verify_sign_lemma s b = ()
let verify_lemma p msg tag = 
  match tag with
  | Sig s' m' ->
    if p = (VK s') && msg = m' then
      assert (tag == sign s' m' /\ p == (vk s') /\ msg == m')
    else ()
  | _ -> ()

let mac k m = Mac k m
let mac_inj_lemma k1 k2 m1 m2 = ()

let verify_mac k m t =
  match t with
  | Mac k' m' -> if k = k' && m = m' then true else false
  | _ -> false
let verify_mac_lemma k m t = ()

let hash m = Hash m
let hash_inj_lemma m1 m2 = ()


let extract k1 k2 = Extract k1 k2
let extract_inj_lemma k1 k2 k1' k2'  = ()

let expand t1 t2 = Expand t1 t2
let expand_inj_lemma k1 k2 t1 t2 = ()

let dh_pk k = DH_PK k
let dh_pk_inj_lemma k1 k2 = ()
let dh sk pk = match pk with
  | DH_PK sk' ->
    le_totality_lemma bytes_comparable sk sk';
    le_anti_symmetry_lemma bytes_comparable sk sk';
    if bytes_le sk sk' then DH sk (DH_PK sk') else DH sk' (DH_PK sk) | _ -> DH sk pk
let dh_inj_lemma sk1 sk2 pk1 pk2 = ()
let dh_shared_secret_lemma x y =
    le_totality_lemma bytes_comparable x y;
    le_anti_symmetry_lemma bytes_comparable x y

