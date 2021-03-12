/// This module encodes a Dolev-Yao style model of symbolic cryptography
module CryptoLib

open SecrecyLabels

(* Literals *)
type literal =
 | ByteSeq of FStar.Seq.seq FStar.UInt8.t
 | String of string
 | Nat of nat

(* Usages for Secrets *)
val usage: Type0
val nonce_usage: string -> usage
val guid_usage: string -> usage
val pke_usage: string -> usage
val aead_usage: string -> usage
val mac_usage: string -> usage
val sig_usage: string -> usage
val kdf_usage: string -> usage
val dh_usage: string -> usage

(* Abstract Bytestrings *)
val bytes: t:Type0{hasEq t}
val empty: bytes

(* Helper types and functions *)

type result (a:Type) =
  | Success: v:a -> result a
  | Error: e:string -> result a

let bind #a #b (f:result a) (g:a -> result b) : result b =
    match f with
    | Success x -> g x
    | Error s -> Error s

let return (x:'a) : result 'a = Success x

let is_some2 x (a:'a) (b:'b) = x == Some (a,b)
let is_some x (a:'a) = x == Some a
let is_succ2 x (a:'a) (b:'b) = x == Success (a,b)
let is_succ x (a:'a) = x == Success a

let op_String_Access #a b i = Seq.index #a b i
let op_String_Assignment #a b i v = Seq.upd #a b i v


(* Literals to/from Bytestrings *)
val literal_to_bytes: literal -> bytes
val bytes_to_literal: bytes -> result literal
val bytes_to_literal_lemma: s:literal ->
                 Lemma (bytes_to_literal (literal_to_bytes s) == Success s)
                       [SMTPat (bytes_to_literal (literal_to_bytes s))]
val literal_to_bytes_lemma: b:bytes ->
                 Lemma (match bytes_to_literal b with
		        | Success l -> b == literal_to_bytes l
			| Error _ -> True)

let string_to_bytes (s:string) = literal_to_bytes (String s)
let bytes_to_string (b:bytes) =
  match bytes_to_literal b with
  | Success (String s) -> Success s
  | _ -> Error "not a string literal"
let string_to_bytes_lemma (s:string) :
  Lemma (bytes_to_string (string_to_bytes s) == Success s)
	[SMTPat (bytes_to_string (string_to_bytes s))] = ()

(* Random numbers: ghost values *)
val g_rand: i:nat -> label -> usage -> GTot bytes
val g_rand_inj_lemma (i1 i2:nat) (l1 l2:label) (u1 u2:usage):
  Lemma (g_rand i1 l1 u1 == g_rand i2 l2 u2 ==> (i1 == i2 /\ l1 == l2 /\ u1 == u2))
  [SMTPat (g_rand i1 l1 u1); SMTPat (g_rand i2 l2 u2)]

(* Concatenation and Splitting *)
val concat: b1:bytes -> b2:bytes -> bytes
val split: bytes -> result (bytes * bytes)
val split_concat_lemma: b1:bytes -> b2:bytes ->
  Lemma (split (concat b1 b2) == Success (b1,b2))
	[SMTPat (split (concat b1 b2))]
val concat_split_lemma: b:bytes ->
  Lemma (match split b with
	 | Success (b1,b2) -> b == concat b1 b2
	 | Error _ -> True)

(* Public Key Encryption *)
val pk:bytes -> bytes
val pk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (pk sk1 == pk sk2 ==> sk1 == sk2)

val pke_enc:bytes -> bytes -> bytes
val pke_dec:bytes -> bytes -> result bytes

val pke_enc_inj_lemma: pk:bytes -> m:bytes ->
  Lemma (forall pk' m'. (pke_enc pk m == pke_enc pk' m') ==> pk == pk' /\ m == m')
	[SMTPat (pke_enc pk m)]
val pke_dec_enc_lemma: sk:bytes -> msg:bytes ->
  Lemma (pke_dec sk (pke_enc (pk sk) msg) == Success msg)
	[SMTPat (pke_dec sk (pke_enc (pk sk) msg))]
val pke_dec_lemma: sk:bytes -> cip:bytes ->
  Lemma (match pke_dec sk cip with
	 | Success msg -> cip == pke_enc (pk sk) msg
	 | Error _ -> True)
	[SMTPat (pke_dec sk cip)]

(* AEAD Encryption *)
val aead_enc: bytes -> bytes -> bytes -> bytes
val aead_dec: bytes -> bytes -> bytes -> result bytes

val aead_dec_enc_lemma: k:bytes -> m:bytes -> ad:bytes ->
  Lemma (aead_dec k (aead_enc k m ad) ad == Success m)
	[SMTPat (aead_dec k (aead_enc k m ad) ad)]
val aead_dec_lemma: k:bytes -> c:bytes -> ad:bytes ->
  Lemma (match aead_dec k c ad with
	 | Success m -> c == aead_enc k m ad
	 | Error _ -> True)

(* Signatures *)
val vk:bytes -> bytes
val vk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (vk sk1 == vk sk2 ==> sk1 == sk2)
val sign: bytes -> bytes -> bytes
val verify: bytes -> bytes -> bytes -> bool

val verify_sign_lemma: sk:bytes -> m:bytes ->
  Lemma (verify (vk sk) m (sign sk m) == true)
	[SMTPat (verify (vk sk) m (sign sk m))]
val verify_lemma: p:bytes -> m:bytes -> sig:bytes ->
  Lemma (match verify p m sig with
	 | true -> (exists sk. p == vk sk /\ sig == sign sk m)
	 | _ -> True)

(* MACs and Hashes *)

val mac: bytes -> bytes -> bytes
val mac_inj_lemma (k1 m1 k2 m2:bytes) :
  Lemma (mac k1 m1 == mac k2 m2 ==> (k1 == k2 /\ m1 == m2))
	[SMTPat (mac k1 m1); SMTPat (mac k2 m2)]

val verify_mac: bytes -> bytes -> bytes -> bool
val verify_mac_lemma: k:bytes -> m:bytes -> tag:bytes ->
  Lemma (ensures (verify_mac k m tag <==>  ((mac k m) == tag)))
  [SMTPat (verify_mac k m tag)]

val hash: bytes -> bytes
val hash_inj_lemma (m1 m2:bytes) :
  Lemma (hash m1 == hash m2 ==> m1 == m2)
	[SMTPat (hash m1); SMTPat (hash m2)]

(* KDF *)
val extract: bytes -> bytes -> bytes
val extract_inj_lemma (k1 k2 s1 s2:bytes) :
  Lemma (extract k1 s1 == extract k2 s2 ==> (k1 == k2 /\ s1 == s2))
	[SMTPat (extract k1 s1); SMTPat (extract k2 s2)]

val expand: bytes -> bytes -> bytes
val expand_inj_lemma (k1 k2 i1 i2:bytes) :
  Lemma (expand k1 i1 == expand k2 i2 ==> (k1 == k2 /\ i1 == i2))
	[SMTPat (expand k1 i1); SMTPat (expand k2 i2)]

(* Signatures *)
val dh_pk:bytes -> bytes
val dh_pk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (dh_pk sk1 == dh_pk sk2 ==> sk1 == sk2)
val dh: bytes -> bytes -> bytes
val dh_inj_lemma (sk1 sk2 pk1 pk2:bytes) :
  Lemma (sk1 == sk2 /\ pk1 == pk2 ==> dh sk1 pk1 == dh sk2 pk2)
val dh_shared_secret_lemma: x:bytes -> y:bytes ->
  Lemma ((dh x (dh_pk y)) == (dh y (dh_pk x)))
