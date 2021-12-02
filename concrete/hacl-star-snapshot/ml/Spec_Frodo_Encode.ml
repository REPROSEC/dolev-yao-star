open Prims
let (ec : Prims.pos -> Prims.pos -> FStar_UInt16.t -> FStar_UInt16.t) =
  fun logq ->
    fun b ->
      fun k ->
        let res =
          FStar_UInt16.shift_left k (FStar_UInt32.uint_to_t (logq - b)) in
        res
let (dc : Prims.pos -> Prims.pos -> FStar_UInt16.t -> FStar_UInt16.t) =
  fun logq ->
    fun b ->
      fun c ->
        let res1 =
          FStar_UInt16.shift_right
            (FStar_UInt16.add_mod c
               (FStar_UInt16.shift_left
                  (FStar_UInt16.uint_to_t Prims.int_one)
                  (FStar_UInt32.uint_to_t ((logq - b) - Prims.int_one))))
            (FStar_UInt32.uint_to_t (logq - b)) in
        let res =
          FStar_UInt16.logand res1
            (FStar_UInt16.sub_mod
               (FStar_UInt16.shift_left
                  (FStar_UInt16.uint_to_t Prims.int_one)
                  (FStar_UInt32.uint_to_t b))
               (FStar_UInt16.uint_to_t Prims.int_one)) in
        res
let (ec1 :
  Prims.pos -> Prims.pos -> FStar_UInt64.t -> Prims.nat -> FStar_UInt16.t) =
  fun logq ->
    fun b ->
      fun x ->
        fun k ->
          let rk =
            FStar_UInt64.logand
              (FStar_UInt64.shift_right x (FStar_UInt32.uint_to_t (b * k)))
              (FStar_UInt64.sub_mod
                 (FStar_UInt64.shift_left
                    (FStar_UInt64.uint_to_t Prims.int_one)
                    (FStar_UInt32.uint_to_t b))
                 (FStar_UInt64.uint_to_t Prims.int_one)) in
          ec logq b (FStar_Int_Cast.uint64_to_uint16 rk)
let (frodo_key_encode0 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          FStar_UInt64.t ->
            Prims.nat ->
              Prims.nat ->
                (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                  (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          fun x ->
            fun i ->
              fun k ->
                fun res -> Spec_Matrix.mset n n res i k (ec1 logq b x k)
let (frodo_key_encode1 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> FStar_UInt64.t)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          fun i ->
            let v8 =
              Lib_Sequence.create (Prims.of_int (8))
                (FStar_UInt8.uint_to_t Prims.int_zero) in
            let v81 =
              Lib_Sequence.update_sub (Prims.of_int (8)) v8 Prims.int_zero b
                (Lib_Sequence.sub (((n * n) * b) / (Prims.of_int (8))) a
                   (i * b) b) in
            let n1 =
              Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Obj.magic v81) in
            FStar_UInt64.uint_to_t n1
let (frodo_key_encode2 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          fun i ->
            fun res ->
              let x = frodo_key_encode1 logq b n a i in
              Lib_LoopCombinators.repeati (Prims.of_int (8))
                (frodo_key_encode0 logq b n a x i) res
let (frodo_key_encode :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          let res = Spec_Matrix.create n n in
          Lib_LoopCombinators.repeati n (frodo_key_encode2 logq b n a) res
let (frodo_key_decode0 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> Prims.nat -> FStar_UInt64.t -> FStar_UInt64.t)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          fun i ->
            fun k ->
              fun templong ->
                FStar_UInt64.logor templong
                  (FStar_UInt64.shift_left
                     (FStar_Int_Cast.uint16_to_uint64
                        (dc logq b (Spec_Matrix.mget n n a i k)))
                     (FStar_UInt32.uint_to_t (b * k)))
let (frodo_key_decode1 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        Prims.nat ->
          FStar_UInt64.t ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun i ->
          fun templong ->
            fun res ->
              Lib_Sequence.update_sub (((n * n) * b) / (Prims.of_int (8)))
                res (i * b) b
                (Lib_Sequence.sub (Prims.of_int (8))
                   (Obj.magic
                      (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                         Lib_IntTypes.SEC (Prims.of_int (8))
                         (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                            (Obj.magic templong)))) Prims.int_zero b)
type 'i decode_templong_t = FStar_UInt64.t
let (frodo_key_decode2 :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          fun i ->
            fun res ->
              let templong =
                Obj.magic
                  (Lib_LoopCombinators.repeat_gen (Prims.of_int (8)) ()
                     (fun uu___1 ->
                        fun uu___ ->
                          (Obj.magic (frodo_key_decode0 logq b n a i)) uu___1
                            uu___)
                     (Obj.magic (FStar_UInt64.uint_to_t Prims.int_zero))) in
              frodo_key_decode1 logq b n i templong res
let (frodo_key_decode :
  Prims.pos ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun logq ->
    fun b ->
      fun n ->
        fun a ->
          let resLen = ((n * n) * b) / (Prims.of_int (8)) in
          let res =
            Lib_Sequence.create resLen (FStar_UInt8.uint_to_t Prims.int_zero) in
          Lib_LoopCombinators.repeati n (frodo_key_decode2 logq b n a) res