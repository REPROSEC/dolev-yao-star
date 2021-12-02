/// CryptoLib
/// =========
///
module CryptoLib

open SecrecyLabels

/// Usages for Secrets
/// ------------------
///
/// TODO DOC what are usages, why do we use them, what is their semantic w.r.t. to proofs? Why the strings?
val usage: t:Type0{hasEq t}
val nonce_usage: string -> usage
val guid_usage: string -> usage
val pke_usage: string -> usage
val aead_usage: string -> usage
val mac_usage: string -> usage
val sig_usage: string -> usage
val kdf_usage: string -> usage
val dh_usage: string -> usage

/// Properties of usages
/// ~~~~~~~~~~~~~~~~~~~~
val sig_usage_injective: s1:string -> s2:string ->
    Lemma (sig_usage s1 == sig_usage s2 ==> s1 == s2)
          [SMTPat (sig_usage s1); SMTPat (sig_usage s2)]

val pke_usage_injective: s1:string -> s2:string ->
    Lemma (pke_usage s1 == pke_usage s2 ==> s1 == s2)
          [SMTPat (pke_usage s1); SMTPat (pke_usage s2)]


val aead_usage_injective: s1:string -> s2:string ->
    Lemma (aead_usage s1 == aead_usage s2 ==> s1 == s2)
          [SMTPat (aead_usage s1); SMTPat (aead_usage s2)]


val mac_usage_injective: s1:string -> s2:string ->
    Lemma (mac_usage s1 == mac_usage s2 ==> s1 == s2)
          [SMTPat (mac_usage s1); SMTPat (mac_usage s2)]


/// Abstract Bytestrings & literals
/// -------------------------------
val bytes: t:Type0{hasEq t}
val empty: bytes
val len: bytes -> nat

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

val term_depth:bytes -> nat

/// Literals to/from Bytestrings
/// ----------------------------
val string_to_bytes: string -> bytes
val bytes_to_string: bytes -> result string
val string_to_bytes_lemma (s:string) :
  Lemma (bytes_to_string (string_to_bytes s) == Success s)
        [SMTPat (bytes_to_string (string_to_bytes s))]

val nat_to_bytes: len:nat -> value:nat -> bytes
val bytes_to_nat: bytes -> result nat
val nat_to_bytes_lemma (len:nat) (n:nat) :
  Lemma (bytes_to_nat (nat_to_bytes len n) == Success n)
        [SMTPat (bytes_to_nat (nat_to_bytes len n))]

let bytestring = FStar.Seq.seq FStar.UInt8.t
val bytestring_to_bytes: bytestring -> bytes
val bytes_to_bytestring: bytes -> result bytestring
val bytestring_to_bytes_lemma (b:bytestring) :
  Lemma (bytes_to_bytestring (bytestring_to_bytes b) == Success b)
        [SMTPat (bytes_to_bytestring (bytestring_to_bytes b))]

/// Random numbers: ghost values
/// ----------------------------
///
/// Needed so we can specify exactly what a random value "looks like", including label and usage,
/// without exposing the exact inner workings of our abstract bytestrings. Note that ``GTot`` means
/// that the returned value is a so-called ghost value and can only be used in specifications.
val g_rand: i:nat -> label -> usage -> GTot bytes
val g_rand_inj_lemma (i1 i2:nat) (l1 l2:label) (u1 u2:usage):
  Lemma (g_rand i1 l1 u1 == g_rand i2 l2 u2 ==> (i1 == i2 /\ l1 == l2 /\ u1 == u2))
  [SMTPat (g_rand i1 l1 u1); SMTPat (g_rand i2 l2 u2)]

/// Concatenation and Splitting
/// ---------------------------
///
/// To be able to split a concatenated bytestring at some later point in time, we have to "remember"
/// the correct splitting point in the bytestring. This is currently done by storing the length of
/// ``b1`` in ``lenlen`` bytes. This "header" is stored before the actual bytes, hence the naming
/// "prefixed".
///
/// TODO this can be done much more elegantly without bothering the API user with ``lenlen``, just
/// use some self-delimiting encoding to store the length (or other ways, e.g., sequences of
/// sequences, ...).
val concat_len_prefixed: lenlen:nat -> b1:bytes -> b2:bytes -> bytes
val split_len_prefixed: lenlen:nat -> bytes -> result (bytes * bytes)
val split_concat_len_prefixed_lemma: lenlen:nat -> b1:bytes -> b2:bytes ->
  Lemma (split_len_prefixed lenlen (concat_len_prefixed lenlen b1 b2) == Success (b1,b2))
        [SMTPat (split_len_prefixed lenlen (concat_len_prefixed lenlen b1 b2))]
val concat_split_len_prefixed_lemma: lenlen:nat -> b:bytes ->
  Lemma (match split_len_prefixed lenlen b with
         | Success (b1,b2) -> b == concat_len_prefixed lenlen b1 b2
         | Error _ -> True)

/// Concatenation/Splitting with implicit length information
val concat: b1:bytes -> b2:bytes -> bytes
val split: bytes -> result (bytes * bytes)
val split_concat_lemma: b1:bytes -> b2:bytes ->
  Lemma (split (concat b1 b2) == Success (b1,b2))
        [SMTPat (split (concat b1 b2))]
val concat_split_lemma: b:bytes ->
  Lemma (match split b with
	 | Success (b1,b2) -> b == concat b1 b2 /\ (term_depth b1 < term_depth b) /\ (term_depth b2 < term_depth b)
	 | Error _ -> True)

/// Concatenation/Splitting without any length information
val raw_concat: b1:bytes -> b2:bytes -> bytes
val split_at: first_part_len:nat -> bytes -> result (bytes * bytes)
val split_at_raw_concat_lemma: b1:bytes -> b2:bytes ->
  Lemma (split_at (len b1) (raw_concat b1 b2) == Success (b1,b2))
        [SMTPat (split_at (len b1) (raw_concat b1 b2))]


/// Public Key Encryption
/// ---------------------
///
/// Create a public key from a secret key.
val pk:bytes -> bytes
val pk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (pk sk1 == pk sk2 ==> sk1 == sk2)
        [SMTPat (pk sk1); SMTPat (pk sk2)]

val pke_enc:pub_key:bytes -> randomness:bytes -> msg:bytes -> bytes
val pke_dec:priv_key:bytes -> ciphertext:bytes -> result bytes

val pke_enc_inj_lemma: pk:bytes -> n:bytes -> m:bytes ->
  Lemma (forall pk' n' m'. (pke_enc pk n m == pke_enc pk' n' m') ==> pk == pk' /\ m == m' /\ n == n')
        [SMTPat (pke_enc pk n m)]
val pke_dec_enc_lemma: sk:bytes -> n:bytes -> msg:bytes ->
  Lemma (pke_dec sk (pke_enc (pk sk) n msg) == Success msg)
        [SMTPat (pke_dec sk (pke_enc (pk sk) n msg))]
val pke_dec_lemma: sk:bytes -> cip:bytes ->
  Lemma (match pke_dec sk cip with
         | Success msg -> (exists n. cip == pke_enc (pk sk) n msg)
         | Error _ -> True)
        [SMTPat (pke_dec sk cip)]


/// AEAD Encryption
/// ---------------
val aead_enc: key:bytes -> iv:bytes -> msg:bytes -> ad:bytes -> bytes
val aead_dec: key:bytes -> iv:bytes -> ciphertext:bytes -> ad:bytes -> result bytes

val aead_dec_enc_lemma: k:bytes -> iv:bytes -> m:bytes -> ad:bytes ->
  Lemma (aead_dec k iv (aead_enc k iv m ad) ad == Success m)
        [SMTPat (aead_dec k iv (aead_enc k iv m ad) ad)]
val aead_dec_lemma: k:bytes -> iv:bytes -> c:bytes -> ad:bytes ->
  Lemma (match aead_dec k iv c ad with
         | Success m -> c == aead_enc k iv m ad
         | Error _ -> True)

(* Ghost functions to inverse the encryption and get the plaintext *)
val inv_aead_enc: bytes -> GTot (result (bytes * bytes * bytes * bytes))
val inv_aead_enc_inj_lemma (c1 c2:bytes) : Lemma (inv_aead_enc c1 == inv_aead_enc c2 /\ Success? (inv_aead_enc c1) ==> c1 == c2)
val inv_aead_enc_lemma: c:bytes ->
  Lemma (match inv_aead_enc c with | Success (k, iv, p, ad) -> c == aead_enc k iv p ad /\ term_depth p < term_depth c | Error e -> True)

/// Signatures
/// ----------
val vk:bytes -> bytes
val vk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (vk sk1 == vk sk2 ==> sk1 == sk2)
val sign: priv_key:bytes -> randomness:bytes -> msg:bytes -> bytes
val verify: pub_key:bytes -> msg:bytes -> tag:bytes -> bool

val verify_sign_lemma: sk:bytes -> n:bytes -> m:bytes ->
  Lemma (verify (vk sk) m (sign sk n m) == true)
        [SMTPat (verify (vk sk) m (sign sk n m))]
val verify_lemma: p:bytes -> m:bytes -> sig:bytes ->
  Lemma (match verify p m sig with
         | true -> (exists sk n. p == vk sk /\ sig == sign sk n m)
         | _ -> True)


/// MACs and Hashes
/// ---------------
val mac: key:bytes -> msg:bytes -> bytes
val mac_inj_lemma (k1 m1 k2 m2:bytes) :
  Lemma (mac k1 m1 == mac k2 m2 ==> (k1 == k2 /\ m1 == m2))
        [SMTPat (mac k1 m1); SMTPat (mac k2 m2)]

val verify_mac: key:bytes -> msg:bytes -> tag:bytes -> bool
val verify_mac_lemma: k:bytes -> m:bytes -> tag:bytes ->
  Lemma (ensures (verify_mac k m tag <==>  ((mac k m) == tag)))
  [SMTPat (verify_mac k m tag)]

val hash: bytes -> bytes
val hash_inj_lemma (m1 m2:bytes) :
  Lemma (hash m1 == hash m2 ==> m1 == m2)
        [SMTPat (hash m1); SMTPat (hash m2)]

(* Ghost functions to inverse the hashed value*)
val inv_hash: bytes -> GTot (result bytes)
val inv_hash_eq_lemma : (m:bytes) ->
  Lemma ((inv_hash (hash m)) == Success m)
	[SMTPat (inv_hash m)]
val inv_hash_lemma : (m:bytes) ->
  Lemma (match (inv_hash m) with | Success v -> hash v == m /\ (term_depth v + 1 == term_depth m) | Error _ -> True)
	[SMTPat (inv_hash m)]

/// Key Derivation
/// --------------
val extract: key:bytes -> salt:bytes -> bytes
val extract_inj_lemma (k1 k2 s1 s2:bytes) :
  Lemma (extract k1 s1 == extract k2 s2 ==> (k1 == k2 /\ s1 == s2))
        [SMTPat (extract k1 s1); SMTPat (extract k2 s2)]

(* Ghost functions to inverse the extracted key and retrieve the original key and salt *)
val inv_extract: bytes -> GTot (result (bytes * bytes))
val inv_extract_inj_lemma (c1 c2:bytes) : Lemma (inv_extract c1 == inv_extract c2 /\ Success? (inv_extract c1) ==> c1 == c2)
val inv_extract_lemma: c:bytes ->
  Lemma (match inv_extract c with | Success (k, s) -> c == extract k s /\ term_depth k < term_depth c | Error e -> True)

val expand: key:bytes -> info:bytes -> bytes // TODO DOC What is the second param? If it's info: What would that be used for? Probably only relevant for concrete?
val expand_inj_lemma (k1 k2 i1 i2:bytes) :
  Lemma (expand k1 i1 == expand k2 i2 ==> (k1 == k2 /\ i1 == i2))
        [SMTPat (expand k1 i1); SMTPat (expand k2 i2)]

val inv_expand: bytes -> GTot (result (bytes * bytes))
val inv_expand_inj_lemma (c1 c2:bytes) : Lemma (inv_expand c1 == inv_expand c2 /\ Success? (inv_expand c1) ==> c1 == c2)
val inv_expand_lemma: c:bytes ->
  Lemma (match inv_expand c with | Success (k, s) -> c == expand k s /\ term_depth k < term_depth c | Error e -> True)


/// Diffie-Hellman
/// --------------
///
/// Create a public DH component from a private DH component.
val dh_pk:bytes -> bytes
val dh_pk_inj_lemma: sk1:bytes -> sk2:bytes ->
  Lemma (dh_pk sk1 == dh_pk sk2 ==> sk1 == sk2)
/// Create a DH secret from a private and a public component.
val dh: priv_component:bytes -> pub_component:bytes -> bytes
val dh_inj_lemma (sk1 sk2 pk1 pk2:bytes) : // TODO this lemma is trivially true (as dh is a side-effect free function), couldn't we just remove it? Also: The name is misleading, DH is not injective (see next lemma).
  Lemma (sk1 == sk2 /\ pk1 == pk2 ==> dh sk1 pk1 == dh sk2 pk2)
val dh_shared_secret_lemma: x:bytes -> y:bytes ->
  Lemma ((dh x (dh_pk y)) == (dh y (dh_pk x)))

