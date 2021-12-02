open Prims
let (frodo_pack8 :
  Prims.nat ->
    (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun d ->
    fun a ->
      let maskd =
        FStar_UInt16.sub_mod
          (FStar_Int_Cast.uint32_to_uint16
             (FStar_UInt32.shift_left (FStar_UInt32.uint_to_t Prims.int_one)
                (FStar_UInt32.uint_to_t d)))
          (FStar_UInt16.uint_to_t Prims.int_one) in
      let a0 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a Prims.int_zero) maskd in
      let a1 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a Prims.int_one) maskd in
      let a2 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (2))) maskd in
      let a3 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (3))) maskd in
      let a4 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (4))) maskd in
      let a5 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (5))) maskd in
      let a6 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (6))) maskd in
      let a7 =
        FStar_UInt16.logand
          (Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (7))) maskd in
      let templong =
        FStar_UInt128.logor
          (FStar_UInt128.logor
             (FStar_UInt128.logor
                (FStar_UInt128.logor
                   (FStar_UInt128.logor
                      (FStar_UInt128.logor
                         (FStar_UInt128.logor
                            (FStar_UInt128.shift_left
                               (FStar_UInt128.uint64_to_uint128
                                  (FStar_Int_Cast.uint16_to_uint64 a0))
                               (FStar_UInt32.uint_to_t
                                  ((Prims.of_int (7)) * d)))
                            (FStar_UInt128.shift_left
                               (FStar_UInt128.uint64_to_uint128
                                  (FStar_Int_Cast.uint16_to_uint64 a1))
                               (FStar_UInt32.uint_to_t
                                  ((Prims.of_int (6)) * d))))
                         (FStar_UInt128.shift_left
                            (FStar_UInt128.uint64_to_uint128
                               (FStar_Int_Cast.uint16_to_uint64 a2))
                            (FStar_UInt32.uint_to_t ((Prims.of_int (5)) * d))))
                      (FStar_UInt128.shift_left
                         (FStar_UInt128.uint64_to_uint128
                            (FStar_Int_Cast.uint16_to_uint64 a3))
                         (FStar_UInt32.uint_to_t ((Prims.of_int (4)) * d))))
                   (FStar_UInt128.shift_left
                      (FStar_UInt128.uint64_to_uint128
                         (FStar_Int_Cast.uint16_to_uint64 a4))
                      (FStar_UInt32.uint_to_t ((Prims.of_int (3)) * d))))
                (FStar_UInt128.shift_left
                   (FStar_UInt128.uint64_to_uint128
                      (FStar_Int_Cast.uint16_to_uint64 a5))
                   (FStar_UInt32.uint_to_t ((Prims.of_int (2)) * d))))
             (FStar_UInt128.shift_left
                (FStar_UInt128.uint64_to_uint128
                   (FStar_Int_Cast.uint16_to_uint64 a6))
                (FStar_UInt32.uint_to_t (Prims.int_one * d))))
          (FStar_UInt128.shift_left
             (FStar_UInt128.uint64_to_uint128
                (FStar_Int_Cast.uint16_to_uint64 a7))
             (FStar_UInt32.uint_to_t (Prims.int_zero * d))) in
      let v16 =
        Obj.magic
          (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
             Lib_IntTypes.SEC (Prims.of_int (16))
             (Lib_IntTypes.v Lib_IntTypes.U128 Lib_IntTypes.SEC
                (Obj.magic templong))) in
      Lib_Sequence.sub (Prims.of_int (16)) v16 ((Prims.of_int (16)) - d) d
type ('n1, 'n2, 'd, 'i) frodo_pack_state =
  (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (frodo_pack_inner :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (unit, unit, unit, unit) frodo_pack_state ->
              (unit, unit, unit, unit) frodo_pack_state)
  =
  fun n1 ->
    fun n2 ->
      fun d ->
        fun a ->
          fun i ->
            fun s ->
              Lib_Sequence.op_At_Bar (d * i) d s
                (frodo_pack8 d
                   (Lib_Sequence.sub (n1 * n2) a ((Prims.of_int (8)) * i)
                      (Prims.of_int (8))))
let (frodo_pack :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun n1 ->
             fun n2 ->
               fun d ->
                 fun a ->
                   Obj.magic
                     (Lib_LoopCombinators.repeat_gen
                        ((n1 * n2) / (Prims.of_int (8))) ()
                        (fun uu___1 ->
                           fun uu___ ->
                             (Obj.magic (frodo_pack_inner n1 n2 d a)) uu___1
                               uu___)
                        (Obj.magic
                           (Lib_Sequence.create Prims.int_zero
                              (FStar_UInt8.uint_to_t Prims.int_zero)))))
            uu___3 uu___2 uu___1 uu___
let (frodo_unpack8 :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun d ->
    fun b ->
      let maskd =
        FStar_UInt16.sub_mod
          (FStar_Int_Cast.uint32_to_uint16
             (FStar_UInt32.shift_left (FStar_UInt32.uint_to_t Prims.int_one)
                (FStar_UInt32.uint_to_t d)))
          (FStar_UInt16.uint_to_t Prims.int_one) in
      let v16 =
        Lib_Sequence.create (Prims.of_int (16))
          (FStar_UInt8.uint_to_t Prims.int_zero) in
      let src =
        Lib_Sequence.update_sub (Prims.of_int (16)) v16
          ((Prims.of_int (16)) - d) d b in
      let templong =
        let n =
          Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
            Lib_IntTypes.SEC (Obj.magic src) in
        FStar_UInt128.uint_to_t n in
      let res =
        Lib_Sequence.create (Prims.of_int (8))
          (FStar_UInt16.uint_to_t Prims.int_zero) in
      let res1 =
        Lib_Sequence.upd (Prims.of_int (8)) res Prims.int_zero
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (7)) * d)))))
             maskd) in
      let res2 =
        Lib_Sequence.upd (Prims.of_int (8)) res1 Prims.int_one
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (6)) * d)))))
             maskd) in
      let res3 =
        Lib_Sequence.upd (Prims.of_int (8)) res2 (Prims.of_int (2))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (5)) * d)))))
             maskd) in
      let res4 =
        Lib_Sequence.upd (Prims.of_int (8)) res3 (Prims.of_int (3))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (4)) * d)))))
             maskd) in
      let res5 =
        Lib_Sequence.upd (Prims.of_int (8)) res4 (Prims.of_int (4))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (3)) * d)))))
             maskd) in
      let res6 =
        Lib_Sequence.upd (Prims.of_int (8)) res5 (Prims.of_int (5))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t ((Prims.of_int (2)) * d)))))
             maskd) in
      let res7 =
        Lib_Sequence.upd (Prims.of_int (8)) res6 (Prims.of_int (6))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t (Prims.int_one * d))))) maskd) in
      let res8 =
        Lib_Sequence.upd (Prims.of_int (8)) res7 (Prims.of_int (7))
          (FStar_UInt16.logand
             (FStar_Int_Cast.uint64_to_uint16
                (FStar_UInt128.uint128_to_uint64
                   (FStar_UInt128.shift_right templong
                      (FStar_UInt32.uint_to_t (Prims.int_zero * d))))) maskd) in
      res8
type ('n1, 'n2, 'i) frodo_unpack_state =
  (FStar_UInt16.t, unit) Lib_Sequence.lseq
let (frodo_unpack_inner :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (unit, unit, unit) frodo_unpack_state ->
              (unit, unit, unit) frodo_unpack_state)
  =
  fun n1 ->
    fun n2 ->
      fun d ->
        fun b ->
          fun i ->
            fun s ->
              Lib_Sequence.op_At_Bar ((Prims.of_int (8)) * i)
                (Prims.of_int (8)) s
                (frodo_unpack8 d
                   (Lib_Sequence.sub (d * ((n1 * n2) / (Prims.of_int (8)))) b
                      (d * i) d))
let (frodo_unpack :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun n1 ->
             fun n2 ->
               fun d ->
                 fun b ->
                   Obj.magic
                     (Lib_LoopCombinators.repeat_gen
                        ((n1 * n2) / (Prims.of_int (8))) ()
                        (fun uu___1 ->
                           fun uu___ ->
                             (Obj.magic (frodo_unpack_inner n1 n2 d b))
                               uu___1 uu___)
                        (Obj.magic (FStar_Seq_Base.empty ())))) uu___3 uu___2
            uu___1 uu___