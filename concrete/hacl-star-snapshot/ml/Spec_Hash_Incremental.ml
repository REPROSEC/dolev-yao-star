open Prims
type _sync_decl = unit
let (blake2_init :
  Spec_Hash_Definitions.hash_alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        unit Spec_Hash_Definitions.init_t)
  =
  fun a ->
    fun kk ->
      fun k ->
        let prev0 =
          Spec_Blake2.compute_prev0
            (match a with
             | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
             | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) kk in
        match a with
        | Spec_Hash_Definitions.Blake2S ->
            ((Obj.magic
                (Spec_Blake2.blake2_init Spec_Blake2.Blake2S kk k
                   (Prims.of_int (32)))),
              (Obj.magic (FStar_UInt64.uint_to_t prev0)))
        | Spec_Hash_Definitions.Blake2B ->
            ((Obj.magic
                (Spec_Blake2.blake2_init Spec_Blake2.Blake2B kk k
                   (Prims.of_int (64)))),
              (Obj.magic
                 (FStar_UInt128.uint64_to_uint128
                    (FStar_UInt64.uint_to_t prev0))))
let (last_split_blake :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes ->
      (Spec_Hash_Definitions.bytes * Spec_Hash_Definitions.bytes * Prims.nat))
  =
  fun a ->
    fun input ->
      let uu___ =
        Spec_Blake2.split
          (match a with
           | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
           | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B)
          (FStar_Seq_Base.length input) in
      match uu___ with
      | (nb, rem) ->
          let blocks =
            FStar_Seq_Base.slice input Prims.int_zero
              (nb * (Spec_Hash_Definitions.block_length a)) in
          let last_block =
            Spec_Blake2.get_last_padded_block
              (match a with
               | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
               | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) input
              rem in
          (blocks, last_block, rem)
let (update_last_blake :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      Prims.nat ->
        Spec_Hash_Definitions.bytes -> unit Spec_Hash_Definitions.words_state)
  =
  fun a ->
    fun hash ->
      fun prevlen ->
        fun input ->
          let uu___ = last_split_blake a input in
          match uu___ with
          | (blocks, last_block, rem) ->
              let h' = Spec_Agile_Hash.update_multi a hash blocks in
              let ev' =
                Lib_IntTypes.add_mod
                  (match a with
                   | Spec_Hash_Definitions.Blake2S -> Lib_IntTypes.U64
                   | Spec_Hash_Definitions.Blake2B -> Lib_IntTypes.U128)
                  Lib_IntTypes.SEC (FStar_Pervasives_Native.snd h')
                  (Spec_Hash_Definitions.nat_to_extra_state a rem) in
              let h_f =
                Spec_Blake2.blake2_update_block
                  (match a with
                   | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                   | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B)
                  true
                  (match a with
                   | Spec_Hash_Definitions.MD5 -> Prims.int_zero
                   | Spec_Hash_Definitions.SHA1 -> Prims.int_zero
                   | Spec_Hash_Definitions.SHA2_224 -> Prims.int_zero
                   | Spec_Hash_Definitions.SHA2_256 -> Prims.int_zero
                   | Spec_Hash_Definitions.SHA2_384 -> Prims.int_zero
                   | Spec_Hash_Definitions.SHA2_512 -> Prims.int_zero
                   | Spec_Hash_Definitions.Blake2S ->
                       Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC ev'
                   | Spec_Hash_Definitions.Blake2B ->
                       Lib_IntTypes.v Lib_IntTypes.U128 Lib_IntTypes.SEC ev')
                  last_block (Obj.magic (FStar_Pervasives_Native.fst h')) in
              ((Obj.magic h_f),
                (Spec_Hash_Definitions.nat_to_extra_state a Prims.int_zero))
let (update_last :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      Prims.nat ->
        Spec_Hash_Definitions.bytes -> unit Spec_Hash_Definitions.words_state)
  =
  fun a ->
    fun hash ->
      fun prevlen ->
        fun input ->
          if
            match a with
            | Spec_Hash_Definitions.Blake2S -> true
            | Spec_Hash_Definitions.Blake2B -> true
            | uu___ -> false
          then update_last_blake a hash prevlen input
          else
            (let total_len = prevlen + (FStar_Seq_Base.length input) in
             let padding = Spec_Hash_PadFinish.pad a total_len in
             Spec_Agile_Hash.update_multi a hash
               (FStar_Seq_Base.op_At_Bar input padding))
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
      then Spec_Hash_PadFinish.pad_blake a total_len
      else Spec_Hash_PadFinish.pad_md a total_len
let (split_blocks :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes ->
      (Spec_Hash_Definitions.bytes * Spec_Hash_Definitions.bytes))
  =
  fun a ->
    fun input ->
      Lib_UpdateMulti.split_at_last_lazy
        (Spec_Hash_Definitions.block_length a) input
let (hash_incremental_body :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes ->
      unit Spec_Hash_Definitions.words_state ->
        unit Spec_Hash_Definitions.words_state)
  =
  fun a ->
    fun input ->
      fun s ->
        let uu___ = split_blocks a input in
        match uu___ with
        | (bs, l) ->
            let s1 = Spec_Agile_Hash.update_multi a s bs in
            update_last a s1 (FStar_Seq_Base.length bs) l
let (hash_incremental :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes -> Spec_Hash_Definitions.bytes)
  =
  fun a ->
    fun input ->
      let s = Spec_Agile_Hash.init a in
      let s1 = hash_incremental_body a input s in
      Spec_Hash_PadFinish.finish a s1
let (blake2_hash_incremental :
  Spec_Hash_Definitions.hash_alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Spec_Hash_Definitions.bytes ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun k ->
        fun input ->
          let s = blake2_init a kk k in
          let s1 = hash_incremental_body a input s in
          Spec_Hash_PadFinish.finish a s1
let (hash :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  = Spec_Agile_Hash.hash















let (blake2' :
  Spec_Hash_Definitions.hash_alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Spec_Hash_Definitions.bytes ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun k ->
        fun input ->
          let nn =
            match match a with
                  | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                  | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B
            with
            | Spec_Blake2.Blake2S -> (Prims.of_int (32))
            | Spec_Blake2.Blake2B -> (Prims.of_int (64)) in
          let prev0 =
            Spec_Blake2.compute_prev0
              (match a with
               | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
               | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) kk in
          let s1 =
            Spec_Blake2.blake2_init
              (match a with
               | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
               | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) kk k
              nn in
          let uu___ =
            Spec_Blake2.split
              (match a with
               | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
               | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B)
              (FStar_Seq_Base.length input) in
          match uu___ with
          | (nb, rem) ->
              let s2 =
                Lib_LoopCombinators.repeati nb
                  (Spec_Blake2.blake2_update1
                     (match a with
                      | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                      | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B)
                     prev0 input) s1 in
              let s3 =
                Spec_Blake2.blake2_update_last
                  (match a with
                   | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                   | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B)
                  prev0 rem input s2 in
              let s4 =
                Spec_Blake2.blake2_finish
                  (match a with
                   | Spec_Hash_Definitions.Blake2S -> Spec_Blake2.Blake2S
                   | Spec_Hash_Definitions.Blake2B -> Spec_Blake2.Blake2B) s3
                  (match match a with
                         | Spec_Hash_Definitions.Blake2S ->
                             Spec_Blake2.Blake2S
                         | Spec_Hash_Definitions.Blake2B ->
                             Spec_Blake2.Blake2B
                   with
                   | Spec_Blake2.Blake2S -> (Prims.of_int (32))
                   | Spec_Blake2.Blake2B -> (Prims.of_int (64))) in
              s4
let (blake2_hash_incremental' :
  Spec_Hash_Definitions.hash_alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Spec_Hash_Definitions.bytes ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun k ->
        fun input ->
          let uu___ = split_blocks a input in
          match uu___ with
          | (bs, l) ->
              let is1 = blake2_init a kk k in
              let is2 = Spec_Agile_Hash.update_multi a is1 bs in
              let is3 = update_last a is2 (FStar_Seq_Base.length bs) l in
              let is4 = Spec_Hash_PadFinish.finish a is3 in is4







