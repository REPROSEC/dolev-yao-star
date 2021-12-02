open Prims
type impl =
  | Hacl_CHACHA20 
  | Vale_AES128 
  | Vale_AES256 
let (uu___is_Hacl_CHACHA20 : impl -> Prims.bool) =
  fun projectee ->
    match projectee with | Hacl_CHACHA20 -> true | uu___ -> false
let (uu___is_Vale_AES128 : impl -> Prims.bool) =
  fun projectee ->
    match projectee with | Vale_AES128 -> true | uu___ -> false
let (uu___is_Vale_AES256 : impl -> Prims.bool) =
  fun projectee ->
    match projectee with | Vale_AES256 -> true | uu___ -> false
let (cipher_alg_of_impl : impl -> Spec_Agile_Cipher.cipher_alg) =
  fun i ->
    match i with
    | Hacl_CHACHA20 -> Spec_Agile_Cipher.CHACHA20
    | Vale_AES128 -> Spec_Agile_Cipher.AES128
    | Vale_AES256 -> Spec_Agile_Cipher.AES256
type vale_cipher_alg = Spec_Agile_Cipher.cipher_alg
let (vale_alg_of_cipher_alg :
  Spec_Agile_Cipher.cipher_alg -> Vale_AES_AES_s.algorithm) =
  fun a ->
    match a with
    | Spec_Agile_Cipher.AES128 -> Vale_AES_AES_s.AES_128
    | Spec_Agile_Cipher.AES256 -> Vale_AES_AES_s.AES_256
let (vale_xkey_length : vale_cipher_alg -> Prims.nat) =
  fun uu___ ->
    match uu___ with
    | Spec_Agile_Cipher.AES128 -> (Prims.of_int (304))
    | Spec_Agile_Cipher.AES256 -> (Prims.of_int (368))
let (vale_aes_expansion :
  vale_cipher_alg -> Obj.t -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun a ->
    fun k ->
      let k_nat = Vale_Def_Words_Seq_s.seq_uint8_to_seq_nat8 (Obj.magic k) in
      let k_w = Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE k_nat in
      let ekv_w =
        Vale_AES_AES_s.key_to_round_keys_LE (vale_alg_of_cipher_alg a) k_w in
      let ekv_nat = Vale_Def_Types_s.le_seq_quad32_to_bytes ekv_w in
      let ek = Vale_Def_Words_Seq_s.seq_nat8_to_seq_uint8 ekv_nat in
      let hkeys_quad =
        Vale_AES_OptPublic.get_hkeys_reqs
          (Vale_Def_Types_s.reverse_bytes_quad32
             (Vale_AES_AES_s.aes_encrypt_LE (vale_alg_of_cipher_alg a) k_w
                {
                  Vale_Def_Words_s.lo0 = Prims.int_zero;
                  Vale_Def_Words_s.lo1 = Prims.int_zero;
                  Vale_Def_Words_s.hi2 = Prims.int_zero;
                  Vale_Def_Words_s.hi3 = Prims.int_zero
                })) in
      let hkeys =
        Vale_Def_Words_Seq_s.seq_nat8_to_seq_uint8
          (Vale_Def_Types_s.le_seq_quad32_to_bytes hkeys_quad) in
      FStar_Seq_Base.append ek hkeys


let (xkey_length : Spec_Agile_Cipher.cipher_alg -> Prims.nat) =
  fun uu___ ->
    match uu___ with
    | Spec_Agile_Cipher.CHACHA20 -> (Prims.of_int (32))
    | Spec_Agile_Cipher.AES128 -> (Prims.of_int (176))
    | Spec_Agile_Cipher.AES256 -> (Prims.of_int (240))
type 'a xkey = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (concrete_xkey_length : impl -> Prims.nat) =
  fun i ->
    match i with
    | Vale_AES128 -> vale_xkey_length (cipher_alg_of_impl i)
    | Vale_AES256 -> vale_xkey_length (cipher_alg_of_impl i)
    | Hacl_CHACHA20 -> (Prims.of_int (32))
type 'i concrete_xkey = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (concrete_expand : impl -> Obj.t -> unit concrete_xkey) =
  fun uu___1 ->
    fun uu___ ->
      (fun i ->
         fun k ->
           match i with
           | Hacl_CHACHA20 -> Obj.magic (Obj.repr k)
           | Vale_AES128 ->
               Obj.magic
                 (Obj.repr
                    (let a = cipher_alg_of_impl i in vale_aes_expansion a k))
           | Vale_AES256 ->
               Obj.magic
                 (Obj.repr
                    (let a = cipher_alg_of_impl i in vale_aes_expansion a k)))
        uu___1 uu___