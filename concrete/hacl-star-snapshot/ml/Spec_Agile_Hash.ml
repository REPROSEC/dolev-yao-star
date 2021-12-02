open Prims
let (init :
  Spec_Hash_Definitions.hash_alg -> unit Spec_Hash_Definitions.init_t) =
  fun a ->
    match a with
    | Spec_Hash_Definitions.SHA2_224 -> Spec_SHA2.init a
    | Spec_Hash_Definitions.SHA2_256 -> Spec_SHA2.init a
    | Spec_Hash_Definitions.SHA2_384 -> Spec_SHA2.init a
    | Spec_Hash_Definitions.SHA2_512 -> Spec_SHA2.init a
    | Spec_Hash_Definitions.MD5 -> Spec_MD5.init
    | Spec_Hash_Definitions.SHA1 -> Spec_SHA1.init
    | Spec_Hash_Definitions.Blake2S ->
        ((Obj.magic
            (Spec_Blake2.blake2_init Spec_Blake2.Blake2S Prims.int_zero
               (FStar_Seq_Base.empty ()) (Prims.of_int (32)))),
          (Obj.magic (FStar_UInt64.uint_to_t Prims.int_zero)))
    | Spec_Hash_Definitions.Blake2B ->
        ((Obj.magic
            (Spec_Blake2.blake2_init Spec_Blake2.Blake2B Prims.int_zero
               (FStar_Seq_Base.empty ()) (Prims.of_int (64)))),
          (Obj.magic
             (FStar_UInt128.uint64_to_uint128
                (FStar_UInt64.uint_to_t Prims.int_zero))))
let (update :
  Spec_Hash_Definitions.hash_alg -> unit Spec_Hash_Definitions.update_t) =
  fun a ->
    match a with
    | Spec_Hash_Definitions.SHA2_224 -> Spec_SHA2.update a
    | Spec_Hash_Definitions.SHA2_256 -> Spec_SHA2.update a
    | Spec_Hash_Definitions.SHA2_384 -> Spec_SHA2.update a
    | Spec_Hash_Definitions.SHA2_512 -> Spec_SHA2.update a
    | Spec_Hash_Definitions.MD5 -> Spec_MD5.update
    | Spec_Hash_Definitions.SHA1 -> Spec_SHA1.update
    | Spec_Hash_Definitions.Blake2S ->
        (fun h ->
           fun l ->
             let uu___ = h in
             match uu___ with
             | (blake_state, totlen) ->
                 let totlen1 =
                   Lib_IntTypes.add_mod
                     (match a with
                      | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                      | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC totlen
                     (Spec_Hash_Definitions.nat_to_extra_state a
                        (Spec_Hash_Definitions.size_block a)) in
                 ((Obj.magic
                     (Spec_Blake2.blake2_update_block Spec_Blake2.Blake2S
                        false
                        (match a with
                         | Spec_Hash_Definitions.MD5 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA1 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_224 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_256 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_384 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_512 -> Prims.int_zero
                         | Spec_Hash_Definitions.Blake2S ->
                             Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                               totlen1
                         | Spec_Hash_Definitions.Blake2B ->
                             Lib_IntTypes.v Lib_IntTypes.U128
                               Lib_IntTypes.SEC totlen1) l
                        (Obj.magic blake_state))), totlen1))
    | Spec_Hash_Definitions.Blake2B ->
        (fun h ->
           fun l ->
             let uu___ = h in
             match uu___ with
             | (blake_state, totlen) ->
                 let totlen1 =
                   Lib_IntTypes.add_mod
                     (match a with
                      | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                      | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC totlen
                     (Spec_Hash_Definitions.nat_to_extra_state a
                        (Spec_Hash_Definitions.size_block a)) in
                 ((Obj.magic
                     (Spec_Blake2.blake2_update_block Spec_Blake2.Blake2B
                        false
                        (match a with
                         | Spec_Hash_Definitions.MD5 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA1 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_224 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_256 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_384 -> Prims.int_zero
                         | Spec_Hash_Definitions.SHA2_512 -> Prims.int_zero
                         | Spec_Hash_Definitions.Blake2S ->
                             Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                               totlen1
                         | Spec_Hash_Definitions.Blake2B ->
                             Lib_IntTypes.v Lib_IntTypes.U128
                               Lib_IntTypes.SEC totlen1) l
                        (Obj.magic blake_state))), totlen1))
let (update_multi :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      unit Spec_Hash_Definitions.bytes_blocks ->
        unit Spec_Hash_Definitions.words_state)
  =
  fun a ->
    fun hash ->
      fun blocks ->
        Lib_UpdateMulti.mk_update_multi
          (Spec_Hash_Definitions.block_length a) (update a) hash blocks
let (hash :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun input ->
      if
        match a with
        | Spec_Hash_Definitions.Blake2S -> true
        | Spec_Hash_Definitions.Blake2B -> true
        | uu___ -> false
      then
        Spec_Blake2.blake2
          (match a with
           | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
           | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) input
          Prims.int_zero (FStar_Seq_Base.empty ())
          (match match a with
                 | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                 | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B
           with
           | Spec_Blake2.Blake2S -> (Prims.of_int (32))
           | Spec_Blake2.Blake2B -> (Prims.of_int (64)))
      else
        (let padding =
           Spec_Hash_PadFinish.pad a (FStar_Seq_Base.length input) in
         Spec_Hash_PadFinish.finish a
           (update_multi a (init a) (FStar_Seq_Base.op_At_Bar input padding)))