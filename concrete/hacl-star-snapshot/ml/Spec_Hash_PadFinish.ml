open Prims
let (pad_md :
  Spec_Hash_Definitions.hash_alg -> Prims.nat -> Spec_Hash_Definitions.bytes)
  =
  fun a ->
    fun total_len ->
      let firstbyte =
        FStar_Seq_Base.create Prims.int_one
          (FStar_UInt8.uint_to_t (Prims.of_int (0x80))) in
      let zeros =
        FStar_Seq_Base.create (Spec_Hash_Definitions.pad0_length a total_len)
          (FStar_UInt8.uint_to_t Prims.int_zero) in
      let total_len_bits = total_len * (Prims.of_int (8)) in
      let encodedlen =
        match a with
        | Spec_Hash_Definitions.MD5 ->
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC
                 (Lib_IntTypes.numbytes
                    (match a with
                     | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128))
                 (Lib_IntTypes.v
                    (match a with
                     | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                    Lib_IntTypes.SEC
                    (Lib_IntTypes.mk_int
                       (match a with
                        | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                        | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                        | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                       Lib_IntTypes.PUB (total_len * (Prims.of_int (8))))))
        | uu___ ->
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC
                 (Lib_IntTypes.numbytes
                    (match a with
                     | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128))
                 (Lib_IntTypes.v
                    (match a with
                     | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                     | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                     | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                    Lib_IntTypes.SEC
                    (Lib_IntTypes.mk_int
                       (match a with
                        | Spec_Hash_Definitions.MD5 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA1 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_224 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_256 -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.SHA2_384 -> Lib_IntTypes.U128
                        | Spec_Hash_Definitions.SHA2_512 -> Lib_IntTypes.U128
                        | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                        | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                       Lib_IntTypes.PUB (total_len * (Prims.of_int (8)))))) in
      FStar_Seq_Base.op_At_Bar firstbyte
        (FStar_Seq_Base.op_At_Bar zeros encodedlen)
let (pad_blake :
  Spec_Hash_Definitions.hash_alg -> Prims.nat -> Spec_Hash_Definitions.bytes)
  =
  fun a ->
    fun total_len ->
      let len =
        ((Spec_Hash_Definitions.block_length a) - total_len) mod
          (Spec_Hash_Definitions.block_length a) in
      FStar_Seq_Base.create len (FStar_UInt8.uint_to_t Prims.int_zero)
let (pad :
  Spec_Hash_Definitions.hash_alg -> Prims.nat -> Spec_Hash_Definitions.bytes)
  =
  fun a ->
    fun total_len ->
      if
        match a with
        | Spec_Hash_Definitions.Blake2S -> true
        | Spec_Hash_Definitions.Blake2B -> true
        | uu___ -> false
      then pad_blake a total_len
      else pad_md a total_len
let (finish_md :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun hashw ->
      let uu___ = hashw in
      match uu___ with
      | (hashw1, extra) ->
          let hash_final_w =
            FStar_Seq_Base.slice hashw1 Prims.int_zero
              (match a with
               | Spec_Hash_Definitions.MD5 -> (Prims.of_int (4))
               | Spec_Hash_Definitions.SHA1 -> (Prims.of_int (5))
               | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (7))
               | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (8))
               | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (6))
               | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (8))
               | Spec_Hash_Definitions.Blake2S -> (Prims.of_int (8))
               | Spec_Hash_Definitions.Blake2B -> (Prims.of_int (8))) in
          Spec_Hash_Definitions.bytes_of_words a
            (match a with
             | Spec_Hash_Definitions.MD5 -> (Prims.of_int (4))
             | Spec_Hash_Definitions.SHA1 -> (Prims.of_int (5))
             | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (7))
             | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (8))
             | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (6))
             | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (8))
             | Spec_Hash_Definitions.Blake2S -> (Prims.of_int (8))
             | Spec_Hash_Definitions.Blake2B -> (Prims.of_int (8)))
            hash_final_w
let (finish_blake :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun hashw ->
      let alg =
        match a with
        | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
        | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B in
      Spec_Blake2.blake2_finish alg
        (Obj.magic (FStar_Pervasives_Native.fst hashw))
        (match alg with
         | Spec_Blake2.Blake2S -> (Prims.of_int (32))
         | Spec_Blake2.Blake2B -> (Prims.of_int (64)))
let (finish :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun hashw ->
      if
        match a with
        | Spec_Hash_Definitions.Blake2S -> true
        | Spec_Hash_Definitions.Blake2B -> true
        | uu___ -> false
      then finish_blake a hashw
      else finish_md a hashw