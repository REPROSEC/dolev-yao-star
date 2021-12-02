/// CryptoLib (concrete implementation)
/// ====================================
module CryptoLib
open Lib.IntTypes
open Lib.ByteSequence

/// ``usage`` is abstract in the CryptoLib interface
type usage = string

let nonce_usage s = s
let guid_usage s = s
let pke_usage s = s
let aead_usage s = s
let mac_usage s = s
let sig_usage s = s
let kdf_usage s = s
let dh_usage s = s

let sig_usage_injective s1 s2 = ()
let pke_usage_injective s1 s2 = ()
let aead_usage_injective s1 s2 = ()
let mac_usage_injective s1 s2 = ()

/// This type is from HACL* (unbounded sequence of bytes)
type bytes = pub_bytes

/// Printing ``bytes``
let sprint_bytes b =
  let l = Lib.Sequence.to_list b in
  let l' = List.Tot.map FStar.UInt8.to_string_hex_pad l in
  String.concat "" l'

let sprint_generated_rand t = "Generated "^sprint_bytes t

/// Construct/Destruct ``bytes``
let empty = Seq.Base.empty

let len b = Seq.length b

let term_depth b = len b

// TODO fix this to support all character points
let char_to_byte c : FStar.UInt8.t =
  let u = FStar.Char.u32_of_char c  in
  FStar.Int.Cast.uint32_to_uint8 u

// TODO fix this to support all character points
let byte_to_char b : Char.char =
  let u = FStar.Int.Cast.uint8_to_uint32 b in
  FStar.Char.char_of_u32 u

let string_to_bytes_ s : b:pub_bytes{Seq.length b == String.length s} =
  let l = FStar.String.list_of_string s in
  let l' = List.Tot.map char_to_byte l in
  FStar.Seq.seq_of_list l'

let bytes_to_string_ b : s:string =
  let l = FStar.Seq.seq_to_list b in
  let l' = List.Tot.map byte_to_char l in
  FStar.String.string_of_list l'

let nat_to_bytes_ len n : b:pub_bytes{Seq.length b == len} =
  let open FStar.Mul in
  let n' = n % pow2 (8 * len)  in
  nat_to_bytes_be len n'

let bytes_to_nat_ (b:pub_bytes) = nat_from_bytes_be b

let string_to_bytes s = string_to_bytes_ s
let bytes_to_string b = Success (bytes_to_string_ b)
let string_to_bytes_lemma s = admit()
let nat_to_bytes len n = nat_to_bytes_ len n
let bytes_to_nat b = Success (bytes_to_nat_ b)
let nat_to_bytes_lemma n = admit()
let bytestring_to_bytes b = b
let bytes_to_bytestring b = Success b
let bytestring_to_bytes_lemma b = admit()

let mk_rand i l u =
  let b = FStar.UInt8.uint_to_t (i % 256) in
  if u = "AEAD_NONCE" then
    Seq.create 12 b
  else Seq.create 32 b

let g_rand i l u = mk_rand i l u
let g_rand_inj_lemma i1 i2 l1 l2 u1 u2 = admit()


let concat_len_prefixed len b1 b2 =
    (Seq.append (nat_to_bytes_ len (Seq.length b1)) (Seq.append b1 b2))
let split_len_prefixed lenlen b =
   if Seq.length b < lenlen then Error "not a concat"
   else (
      let len = bytes_to_nat_ (Seq.slice b 0 lenlen) in
      if Seq.length b < lenlen + len then Error "not a concat"
      else
        let b1 = Seq.slice b lenlen (lenlen+len) in
        let b2 = Seq.slice b (lenlen+len) (Seq.length b) in
        Success (b1, b2))
let split_concat_len_prefixed_lemma ll b1 b2 =  admit()
let concat_split_len_prefixed_lemma ll b = admit()

let concat b1 b2 = concat_len_prefixed 4 b1 b2
let split b = split_len_prefixed 4 b

let split_concat_lemma b1 b2 = ()
let concat_split_lemma b = admit()

let raw_concat b1 b2 = concat_len_prefixed 0 b1 b2
let split_at len b =
  if len > Seq.length b then Success (b,empty)
  else Success (Seq.slice b 0 len, Seq.slice b len (Seq.length b))
let split_at_raw_concat_lemma l b = admit()

let dh_alg = Spec.Agile.DH.DH_Curve25519
let aead_alg = Spec.Agile.AEAD.CHACHA20_POLY1305
let hash_alg = Spec.Agile.Hash.SHA2_256
let cs = (dh_alg,aead_alg,hash_alg)

let pk b =
  let sk = if Seq.length b = 32 then b else Seq.create 32 0uy in
  let res = Spec.Agile.DH.secret_to_public dh_alg (Lib.Sequence.map secret sk) in
  match res with
  | None -> Seq.create 32 0uy
  | Some res ->  Lib.Sequence.map Lib.RawIntTypes.u8_to_UInt8 res
let pk_inj_lemma sk1 sk2 = admit()

let pke_enc k n e =
  let eph = if Seq.length n <> 32 then Seq.create 32 (u8 0)
            else Lib.Sequence.map secret n in
  let pub = if Seq.length k <> 32 then Seq.create 32 (u8 0)
            else Lib.Sequence.map secret k in
  let msg : b:Lib.ByteSequence.bytes{Seq.length b <= Spec.Agile.HPKE.max_length cs} =
    if Seq.length e > Spec.Agile.HPKE.max_length cs then Seq.empty
    else Lib.Sequence.map #UInt8.t #uint8 #(Seq.length e) secret e in
  assert(Seq.length msg <= Spec.Agile.HPKE.max_length cs);
  match Spec.Agile.HPKE.sealBase cs eph pub msg Seq.empty with
    | None -> Seq.create 32 0uy
    | Some res ->
      if Seq.length res > max_size_t then Seq.create 32 0uy else
      Lib.Sequence.map #uint8 #UInt8.t #(Seq.length res) Lib.RawIntTypes.u8_to_UInt8 res

let pke_dec k c =
  let priv = if Seq.length k <> 32 then Seq.create 32 (u8 0)
            else Lib.Sequence.map secret k in
  let min_len = Spec.Agile.HPKE.size_dh_public cs + Spec.Agile.HPKE.size_aead_tag cs in
  let cipher = if Seq.length c > max_size_t || Seq.length c < min_len then Seq.create min_len (u8 0)
               else Lib.Sequence.map #UInt8.t #uint8 #(Seq.length c) secret c in
  match Spec.Agile.HPKE.openBase cs priv cipher Seq.empty with
    | None -> Error "decryption failed"
    | Some res ->
      if Seq.length res > max_size_t then Error "plaintext too large" else
      Success (Lib.Sequence.map #uint8 #UInt8.t #(Seq.length res) Lib.RawIntTypes.u8_to_UInt8 res)
let pke_enc_inj_lemma pk n m = admit()
let pke_dec_enc_lemma sk n msg = admit()
let pke_dec_lemma sk cip = admit()

let aead_enc k iv m ad =
  let aek = if Seq.length k <> 32
            then Seq.create 32 (u8 0)
            else Lib.Sequence.map #_ #_ #32 secret k in
  let aeiv = if Seq.length iv <> 12
             then Seq.create 12 (u8 0)
             else Lib.Sequence.map #_ #_ #12 secret iv in
  let ad = if Seq.length ad <= Spec.Agile.AEAD.max_length aead_alg
           then Lib.Sequence.map #_ #_ #(Seq.length ad) secret ad
           else Seq.empty in
  let msg = if Seq.length m <= Spec.Agile.AEAD.max_length aead_alg
           then Lib.Sequence.map #_ #_ #(Seq.length m) secret m
           else Seq.empty in
  let cip = Spec.Agile.AEAD.encrypt #aead_alg aek aeiv ad msg in
  Lib.Sequence.map #uint8 #UInt8.t #(Seq.length cip) Lib.RawIntTypes.u8_to_UInt8 cip

let aead_dec k iv m ad =
  let aek = if Seq.length k <> 32
            then Seq.create 32 (u8 0)
            else Lib.Sequence.map #_ #_ #32 secret k in
  let aeiv = if Seq.length iv <> 12
             then Seq.create 12 (u8 0)
             else Lib.Sequence.map #_ #_ #12 secret iv in
  let ad = if Seq.length ad <= Spec.Agile.AEAD.max_length aead_alg
           then Lib.Sequence.map #_ #_ #(Seq.length ad) secret ad
           else Seq.empty in
  let cip = if Seq.length m >= Spec.Agile.AEAD.tag_length aead_alg && Seq.length m <= max_size_t
           then Lib.Sequence.map #_ #_ #(Seq.length m) secret m
           else Seq.create (Spec.Agile.AEAD.tag_length aead_alg) (u8 0) in
  match Spec.Agile.AEAD.decrypt #aead_alg aek aeiv ad cip with
  | None -> Error "aead decryption failed"
  | Some msg -> Success (Lib.Sequence.map #uint8 #UInt8.t #(Seq.length msg) Lib.RawIntTypes.u8_to_UInt8 msg)

let aead_dec_enc_lemma k iv m ad = admit()
let aead_dec_lemma k iv c ad = admit()

let inv_aead_enc c = Error "Ghost function"
let inv_aead_enc_inj_lemma c1 c2 = admit()
let inv_aead_enc_lemma c = admit()

let vk b =
  let sk = if Seq.length b = 32 then b else Seq.create 32 0uy in
  let res = Spec.Ed25519.secret_to_public (Lib.Sequence.map secret sk) in
  Lib.Sequence.map Lib.RawIntTypes.u8_to_UInt8 res
let vk_inj_lemma sk1 sk2 = admit()

let sign sk n b =
  let sk = if Seq.length sk = 32 then Lib.Sequence.map secret sk
           else (let _ = IO.debug_print_string "sign: sk wrong size\n" in Seq.create 32 (u8 0)) in
  let msg = if Seq.length b + 64 <= max_size_t then  (
             assert (Seq.length b <= max_size_t);
             let l : size_nat = Seq.length b in
             Lib.Sequence.map #_ #_ #l secret b)
            else (let _ = IO.debug_print_string "sign: msg wrong size\n" in Seq.empty) in
  let res = Spec.Ed25519.sign sk msg in
  Lib.Sequence.map Lib.RawIntTypes.u8_to_UInt8 res

let verify vk b sg =
  let vk = if Seq.length vk = 32 then Lib.Sequence.map secret vk
           else (let _ = IO.debug_print_string "verify: vk wrong size\n" in Seq.create 32 (u8 0)) in
  let sg = if Seq.length sg = 64 then Lib.Sequence.map secret sg
           else (let _ = IO.debug_print_string "verify: sg wrong size\n" in Seq.create 64 (u8 0)) in
  let msg = if Seq.length b + 64 <= max_size_t then  (
             assert (Seq.length b <= max_size_t);
             let l : size_nat = Seq.length b in
             Lib.Sequence.map #_ #_ #l secret b)
            else (let _ = IO.debug_print_string "verify: msg wrong size\n" in Seq.empty) in
  Spec.Ed25519.verify vk msg sg

let verify_sign_lemma sk n m = admit()
let verify_lemma p m sig = admit()

#push-options "--z3rlimit 100"
let mac k b =
  let k : lbytes 32 = if Seq.length k = 32 then Lib.Sequence.map secret k else Seq.create 32 (u8 0) in
  let msg = if Seq.length b <= max_size_t &&
               Seq.length b + Spec.Hash.Definitions.block_length hash_alg <=
               Spec.Hash.Definitions.max_input_length hash_alg
            then (
             let l : size_nat = Seq.length b in
             Lib.Sequence.map #_ #_ #l secret b)
            else Seq.empty in
  assert (Spec.Agile.HMAC.keysized hash_alg 32);
  let res = Spec.Agile.HMAC.hmac hash_alg k msg in
  Lib.Sequence.map #_ #_ #(Spec.Hash.Definitions.hash_length hash_alg) Lib.RawIntTypes.u8_to_UInt8 res
#pop-options

let mac_inj_lemma k1 m1 k2 m2 = admit()

let verify_mac k m b =
  mac k m = b
let verify_mac_lemma k m tag = ()

let hash x =
  let x = if Seq.length x <= max_size_t &&
             Seq.length x <= Spec.Hash.Definitions.max_input_length hash_alg
          then Lib.Sequence.map #_ #_ #(Seq.length x) secret x
          else Seq.empty in
  let res = Spec.Agile.Hash.hash hash_alg x in
  Lib.Sequence.map #_ #_ #(Spec.Hash.Definitions.hash_length hash_alg) Lib.RawIntTypes.u8_to_UInt8 res

let hash_inj_lemma m1 m2 = admit()

let inv_hash m = Error "Ghost function"
let inv_hash_eq_lemma m = admit()
let inv_hash_lemma m = admit()


#push-options "--z3rlimit 100"
let extract k b =
  let k : lbytes 32 = if Seq.length k = 32 then Lib.Sequence.map secret k else Seq.create 32 (u8 0) in
  assert (Spec.Agile.HMAC.keysized hash_alg 32);
  let salt = if Seq.length b <= max_size_t &&
               Seq.length b + Spec.Hash.Definitions.block_length hash_alg <=
               Spec.Hash.Definitions.max_input_length hash_alg
            then (
             let l : size_nat = Seq.length b in
             Lib.Sequence.map #_ #_ #l secret b)
            else Seq.empty in
  let res = Spec.Agile.HKDF.extract hash_alg k salt in
  Lib.Sequence.map #_ #_ #(Spec.Hash.Definitions.hash_length hash_alg) Lib.RawIntTypes.u8_to_UInt8 res
#pop-options

let extract_inj_lemma k1 k2 s1 s2 = admit()

let inv_extract c = Error "Ghost function"
let inv_extract_inj_lemma c1 c2 = admit()
let inv_extract_lemma c = admit()

#push-options "--z3rlimit 100"
let expand k b =
  let k : lbytes 32 = if Seq.length k = 32 then Lib.Sequence.map secret k else Seq.create 32 (u8 0) in
  assert (Spec.Agile.HMAC.keysized hash_alg 32);
  let info = if Seq.length b <= max_size_t &&
               Spec.Hash.Definitions.hash_length hash_alg + Seq.length b + 1 + Spec.Hash.Definitions.block_length hash_alg <=  Spec.Hash.Definitions.max_input_length hash_alg
            then (
             let l : size_nat = Seq.length b in
             Lib.Sequence.map #_ #_ #l secret b)
            else Seq.empty in
  let res = Spec.Agile.HKDF.expand hash_alg k info 32 in
  Lib.Sequence.map #_ #_ #32 Lib.RawIntTypes.u8_to_UInt8 res
#pop-options

let expand_inj_lemma k1 k2 i1 i2 = admit()

let inv_expand c = Error "Ghost function"
let inv_expand_inj_lemma c1 c2 = admit()
let inv_expand_lemma c = admit()

let dh_pk b =
  let sk = if Seq.length b = 32 then b else Seq.create 32 0uy in
  let res = Spec.Agile.DH.secret_to_public dh_alg (Lib.Sequence.map secret sk) in
  match res with
  | None -> Seq.create 32 0uy
  | Some res ->  Lib.Sequence.map Lib.RawIntTypes.u8_to_UInt8 res
let dh_pk_inj_lemma sk1 sk2 = admit()

let dh sk pk =
  let sk = if Seq.length sk = 32 then Lib.Sequence.map secret sk else Seq.create 32 (u8 0) in
  let pk = if Seq.length pk = 32 then Lib.Sequence.map secret pk else Seq.create 32 (u8 0) in
  let res = Spec.Agile.DH.dh dh_alg sk pk in
  match res with
  | None -> Seq.create 32 0uy
  | Some res ->  Lib.Sequence.map Lib.RawIntTypes.u8_to_UInt8 res

let dh_inj_lemma sk1 sk2 pk1 pk2 = ()
let dh_shared_secret_lemma x y = admit()

