open Prims
let (size_key : Prims.nat) = (Prims.of_int (32))
let (size_nonce : Prims.nat) = (Prims.of_int (12))
let (size_block : Prims.nat) = Spec_Poly1305.size_block
let (size_tag : Prims.nat) = size_block
type key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type nonce = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type tag = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (poly1305_padded :
  Spec_Poly1305.felem ->
    FStar_UInt8.t Lib_Sequence.seq ->
      Spec_Poly1305.felem -> Spec_Poly1305.felem)
  =
  fun r_elem ->
    fun text ->
      fun acc ->
        let len = Lib_Sequence.length text in
        let n = len / Spec_Poly1305.size_block in
        let r = len mod Spec_Poly1305.size_block in
        let blocks =
          FStar_Seq_Base.slice text Prims.int_zero
            (n * Spec_Poly1305.size_block) in
        let rem =
          FStar_Seq_Base.slice text (n * Spec_Poly1305.size_block) len in
        let acc1 = Spec_Poly1305.poly1305_update blocks acc r_elem in
        let tmp =
          Lib_Sequence.create Spec_Poly1305.size_block
            (FStar_UInt8.uint_to_t Prims.int_zero) in
        let tmp1 =
          Lib_Sequence.update_sub Spec_Poly1305.size_block tmp Prims.int_zero
            r rem in
        let acc2 =
          if r > Prims.int_zero
          then
            Spec_Poly1305.poly1305_update1 r_elem Spec_Poly1305.size_block
              tmp1 acc1
          else acc1 in
        acc2
let (poly1305_do :
  Spec_Poly1305.key ->
    FStar_UInt8.t Lib_Sequence.seq ->
      FStar_UInt8.t Lib_Sequence.seq -> Spec_Poly1305.tag)
  =
  fun k ->
    fun m ->
      fun aad ->
        let uu___ = Spec_Poly1305.poly1305_init k in
        match uu___ with
        | (acc, r) ->
            let acc1 =
              if (Lib_Sequence.length aad) <> Prims.int_zero
              then poly1305_padded r aad acc
              else acc in
            let acc2 = poly1305_padded r m acc1 in
            let aad_len8 =
              Obj.magic
                (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                   Lib_IntTypes.SEC (Prims.of_int (8))
                   (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                      (Obj.magic
                         (FStar_UInt64.uint_to_t (Lib_Sequence.length aad))))) in
            let ciphertext_len8 =
              Obj.magic
                (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                   Lib_IntTypes.SEC (Prims.of_int (8))
                   (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                      (Obj.magic
                         (FStar_UInt64.uint_to_t (Lib_Sequence.length m))))) in
            let block =
              Lib_Sequence.op_At_Bar (Prims.of_int (8)) (Prims.of_int (8))
                aad_len8 ciphertext_len8 in
            let acc3 =
              Spec_Poly1305.poly1305_update1 r (Prims.of_int (16)) block acc2 in
            Spec_Poly1305.poly1305_finish k acc3
let (aead_encrypt :
  key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun k ->
    fun n ->
      fun m ->
        fun aad ->
          let cipher =
            Spec_Chacha20.chacha20_encrypt_bytes k n Prims.int_one m in
          let key0 =
            Spec_Chacha20.chacha20_encrypt_bytes k n Prims.int_zero
              (Lib_Sequence.create (Prims.of_int (64))
                 (FStar_UInt8.uint_to_t Prims.int_zero)) in
          let poly_k =
            Lib_Sequence.sub (Prims.of_int (64)) key0 Prims.int_zero
              (Prims.of_int (32)) in
          let mac = poly1305_do poly_k cipher aad in
          FStar_Seq_Base.append cipher mac
let (aead_decrypt :
  key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        tag ->
          FStar_UInt8.t Lib_Sequence.seq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq
              FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun cipher ->
        fun mac ->
          fun aad ->
            let key0 =
              Spec_Chacha20.chacha20_encrypt_bytes k n Prims.int_zero
                (Lib_Sequence.create (Prims.of_int (64))
                   (FStar_UInt8.uint_to_t Prims.int_zero)) in
            let poly_k =
              Lib_Sequence.sub (Prims.of_int (64)) key0 Prims.int_zero
                (Prims.of_int (32)) in
            let computed_mac = poly1305_do poly_k cipher aad in
            if
              let res =
                Obj.magic
                  (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8
                     Spec_Poly1305.size_block Spec_Poly1305.size_block
                     (Obj.magic computed_mac) (Obj.magic mac)
                     Spec_Poly1305.size_block) in
              res = (FStar_UInt8.uint_to_t (Prims.of_int (255)))
            then
              let plain =
                Spec_Chacha20.chacha20_encrypt_bytes k n Prims.int_one cipher in
              FStar_Pervasives_Native.Some plain
            else FStar_Pervasives_Native.None