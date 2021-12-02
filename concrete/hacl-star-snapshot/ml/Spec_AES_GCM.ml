open Prims
let (size_key : Spec_AES.variant -> Prims.nat) = fun v -> Spec_AES.key_size v
let (size_block : Prims.nat) = (Prims.of_int (16))
let (size_nonce : Prims.nat) = (Prims.of_int (12))
let (size_tag : Prims.nat) = size_block
type 'v key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type nonce = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type tag = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (padlen : Prims.nat -> Prims.int) =
  fun x -> (size_block - (x mod size_block)) mod size_block
let (ghash :
  FStar_UInt8.t Lib_Sequence.seq ->
    FStar_UInt8.t Lib_Sequence.seq ->
      Spec_GF128.key -> Spec_GF128.key -> Spec_GF128.tag)
  =
  fun text ->
    fun aad ->
      fun gf_key ->
        fun tag_key ->
          let alen = Lib_Sequence.length aad in
          let tlen = Lib_Sequence.length text in
          let aad_pad =
            Lib_Sequence.create
              ((size_block - (alen mod size_block)) mod size_block)
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let text_pad =
            Lib_Sequence.create
              ((size_block - (tlen mod size_block)) mod size_block)
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let aad_len_bytes =
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (8))
                 (alen * (Prims.of_int (8)))) in
          let text_len_bytes =
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (8))
                 (tlen * (Prims.of_int (8)))) in
          let uu____159 = Spec_GF128.gf128_init gf_key in
          match uu____159 with
          | (acc, r) ->
              let acc1 =
                Spec_GF128.gf128_update (FStar_Seq_Base.append aad aad_pad)
                  acc r in
              let acc2 =
                Spec_GF128.gf128_update (FStar_Seq_Base.append text text_pad)
                  acc1 r in
              let acc3 =
                Spec_GF128.gf128_update
                  (FStar_Seq_Base.append aad_len_bytes text_len_bytes) acc2 r in
              let tag1 = Spec_GF128.gf128_finish tag_key acc3 in tag1
let (aead_init :
  Spec_AES.variant ->
    unit key ->
      nonce ->
        (unit Spec_AES.aes_ctr_state * Spec_GF128.key * Spec_GF128.key))
  =
  fun v ->
    fun k ->
      fun n ->
        let st = Spec_AES.aes_ctr_init v k size_nonce n Prims.int_zero in
        let gf_key = Spec_AES.aes_ctr_current_key_block v st in
        let st1 = Spec_AES.aes_ctr_add_counter v st Prims.int_one in
        let tag_key = Spec_AES.aes_ctr_current_key_block v st1 in
        let st2 = Spec_AES.aes_ctr_add_counter v st1 Prims.int_one in
        (st2, (Obj.magic gf_key), (Obj.magic tag_key))
let (aead_encrypt :
  Spec_AES.variant ->
    unit key ->
      nonce ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun v ->
    fun k ->
      fun n ->
        fun m ->
          fun aad ->
            let mlen = Lib_Sequence.length m in
            let uu____284 = aead_init v k n in
            match uu____284 with
            | (st, gf_key, tag_key) ->
                let c = Spec_AES.aes_ctr_encrypt_stream v st m in
                let mac = ghash c aad gf_key tag_key in
                FStar_Seq_Base.append c mac
let (aead_decrypt :
  Spec_AES.variant ->
    unit key ->
      nonce ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq ->
            tag ->
              FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun v ->
    fun k ->
      fun n ->
        fun aad ->
          fun c ->
            fun tag1 ->
              let clen = Lib_Sequence.length c in
              let uu____374 = aead_init v k n in
              match uu____374 with
              | (st, gf_key, tag_key) ->
                  let computed_tag = ghash c aad gf_key tag_key in
                  if
                    let res =
                      Obj.magic
                        (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8
                           Spec_GF128.size_block Spec_GF128.size_block
                           (Obj.magic computed_tag) (Obj.magic tag1)
                           Spec_GF128.size_block) in
                    res = (FStar_UInt8.uint_to_t (Prims.of_int (255)))
                  then
                    FStar_Pervasives_Native.Some
                      (Spec_AES.aes_ctr_encrypt_stream v st c)
                  else FStar_Pervasives_Native.None
let (aes128gcm_encrypt :
  unit key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun k ->
    fun n -> fun m -> fun aad -> aead_encrypt Spec_AES.AES128 k n m aad
let (aes128gcm_decrypt :
  unit key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq ->
          tag ->
            FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun aad ->
        fun c -> fun tag1 -> aead_decrypt Spec_AES.AES128 k n aad c tag1
let (aes256gcm_encrypt :
  unit key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun k ->
    fun n -> fun m -> fun aad -> aead_encrypt Spec_AES.AES256 k n m aad
let (aes256gcm_decrypt :
  unit key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq ->
          tag ->
            FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun aad ->
        fun c -> fun tag1 -> aead_decrypt Spec_AES.AES256 k n aad c tag1