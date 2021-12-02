open Prims
let (frodo_gen_matrix_shake_get_r :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      fun i ->
        let tmp =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (2))
               (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                  (Obj.magic (FStar_UInt16.uint_to_t i)))) in
        let b =
          Lib_Sequence.concat (Prims.of_int (2)) (Prims.of_int (16)) tmp seed in
        Spec_SHA3.shake128 (Prims.of_int (18)) b ((Prims.of_int (2)) * n)
let (frodo_gen_matrix_shake0 :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun i ->
      fun res_i ->
        fun j ->
          fun res0 ->
            Spec_Matrix.mset n n res0 i j
              (let n1 =
                 Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                   Lib_IntTypes.SEC
                   (Obj.magic
                      (Lib_Sequence.sub ((Prims.of_int (2)) * n) res_i
                         (j * (Prims.of_int (2))) (Prims.of_int (2)))) in
               FStar_UInt16.uint_to_t n1)
let (frodo_gen_matrix_shake1 :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      fun i ->
        fun res ->
          let res_i = frodo_gen_matrix_shake_get_r n seed i in
          Lib_LoopCombinators.repeati n (frodo_gen_matrix_shake0 n i res_i)
            res
let (frodo_gen_matrix_shake :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      let res = Spec_Matrix.create n n in
      Lib_LoopCombinators.repeati n (frodo_gen_matrix_shake1 n seed) res
let (frodo_gen_matrix_shake_4x0 :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              Prims.nat ->
                (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                  (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun i ->
      fun r0 ->
        fun r1 ->
          fun r2 ->
            fun r3 ->
              fun j ->
                fun res0 ->
                  let res01 =
                    Spec_Matrix.mset n n res0
                      (((Prims.of_int (4)) * i) + Prims.int_zero) j
                      (let n1 =
                         Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                           Lib_IntTypes.SEC
                           (Obj.magic
                              (Lib_Sequence.sub ((Prims.of_int (2)) * n) r0
                                 (j * (Prims.of_int (2))) (Prims.of_int (2)))) in
                       FStar_UInt16.uint_to_t n1) in
                  let res02 =
                    Spec_Matrix.mset n n res01
                      (((Prims.of_int (4)) * i) + Prims.int_one) j
                      (let n1 =
                         Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                           Lib_IntTypes.SEC
                           (Obj.magic
                              (Lib_Sequence.sub ((Prims.of_int (2)) * n) r1
                                 (j * (Prims.of_int (2))) (Prims.of_int (2)))) in
                       FStar_UInt16.uint_to_t n1) in
                  let res03 =
                    Spec_Matrix.mset n n res02
                      (((Prims.of_int (4)) * i) + (Prims.of_int (2))) j
                      (let n1 =
                         Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                           Lib_IntTypes.SEC
                           (Obj.magic
                              (Lib_Sequence.sub ((Prims.of_int (2)) * n) r2
                                 (j * (Prims.of_int (2))) (Prims.of_int (2)))) in
                       FStar_UInt16.uint_to_t n1) in
                  let res04 =
                    Spec_Matrix.mset n n res03
                      (((Prims.of_int (4)) * i) + (Prims.of_int (3))) j
                      (let n1 =
                         Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                           Lib_IntTypes.SEC
                           (Obj.magic
                              (Lib_Sequence.sub ((Prims.of_int (2)) * n) r3
                                 (j * (Prims.of_int (2))) (Prims.of_int (2)))) in
                       FStar_UInt16.uint_to_t n1) in
                  res04
let (frodo_gen_matrix_shake_4x1_get_r :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
          Lib_Sequence.lseq * (FStar_UInt8.t, unit) Lib_Sequence.lseq *
          (FStar_UInt8.t, unit) Lib_Sequence.lseq))
  =
  fun n ->
    fun seed ->
      fun i ->
        let t0 =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (2))
               (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                  (Obj.magic
                     (FStar_UInt16.uint_to_t
                        (((Prims.of_int (4)) * i) + Prims.int_zero))))) in
        let t1 =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (2))
               (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                  (Obj.magic
                     (FStar_UInt16.uint_to_t
                        (((Prims.of_int (4)) * i) + Prims.int_one))))) in
        let t2 =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (2))
               (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                  (Obj.magic
                     (FStar_UInt16.uint_to_t
                        (((Prims.of_int (4)) * i) + (Prims.of_int (2))))))) in
        let t3 =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (2))
               (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                  (Obj.magic
                     (FStar_UInt16.uint_to_t
                        (((Prims.of_int (4)) * i) + (Prims.of_int (3))))))) in
        let b0 =
          Lib_Sequence.concat (Prims.of_int (2)) (Prims.of_int (16)) t0 seed in
        let b1 =
          Lib_Sequence.concat (Prims.of_int (2)) (Prims.of_int (16)) t1 seed in
        let b2 =
          Lib_Sequence.concat (Prims.of_int (2)) (Prims.of_int (16)) t2 seed in
        let b3 =
          Lib_Sequence.concat (Prims.of_int (2)) (Prims.of_int (16)) t3 seed in
        let r0 =
          Spec_SHA3.shake128 (Prims.of_int (18)) b0 ((Prims.of_int (2)) * n) in
        let r1 =
          Spec_SHA3.shake128 (Prims.of_int (18)) b1 ((Prims.of_int (2)) * n) in
        let r2 =
          Spec_SHA3.shake128 (Prims.of_int (18)) b2 ((Prims.of_int (2)) * n) in
        let r3 =
          Spec_SHA3.shake128 (Prims.of_int (18)) b3 ((Prims.of_int (2)) * n) in
        (r0, r1, r2, r3)
let (frodo_gen_matrix_shake_4x1 :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      fun i ->
        fun res ->
          let uu___ = frodo_gen_matrix_shake_4x1_get_r n seed i in
          match uu___ with
          | (r0, r1, r2, r3) ->
              Lib_LoopCombinators.repeati n
                (frodo_gen_matrix_shake_4x0 n i r0 r1 r2 r3) res
let (frodo_gen_matrix_shake_4x :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      let res = Spec_Matrix.create n n in
      let n4 = n / (Prims.of_int (4)) in
      Lib_LoopCombinators.repeati n4 (frodo_gen_matrix_shake_4x1 n seed) res
let (frodo_gen_matrix_aes :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      let res = Spec_Matrix.create n n in
      let key = Spec_AES.aes128_key_expansion seed in
      let tmp =
        Lib_Sequence.create (Prims.of_int (8))
          (FStar_UInt16.uint_to_t Prims.int_zero) in
      let n1 = n / (Prims.of_int (8)) in
      Lib_LoopCombinators.repeati n
        (fun i ->
           fun res1 ->
             Lib_LoopCombinators.repeati n1
               (fun j ->
                  fun res2 ->
                    let j1 = j * (Prims.of_int (8)) in
                    let tmp1 =
                      Lib_Sequence.upd (Prims.of_int (8)) tmp Prims.int_zero
                        (FStar_UInt16.uint_to_t i) in
                    let tmp2 =
                      Lib_Sequence.upd (Prims.of_int (8)) tmp1 Prims.int_one
                        (FStar_UInt16.uint_to_t j1) in
                    let res_i =
                      Spec_AES.aes_encrypt_block Spec_AES.AES128 key
                        (let uu___ =
                           Lib_Sequence.generate_blocks (Prims.of_int (2))
                             (Prims.of_int (8)) (Prims.of_int (8)) ()
                             (fun uu___2 ->
                                fun uu___1 ->
                                  (Obj.magic
                                     (Lib_ByteSequence.uints_to_bytes_le_inner
                                        Lib_IntTypes.U16 Lib_IntTypes.SEC
                                        (Prims.of_int (8)) (Obj.magic tmp2)))
                                    uu___2 uu___1) (Obj.repr ()) in
                         match uu___ with | (uu___1, o) -> Obj.magic o) in
                    Lib_LoopCombinators.repeati (Prims.of_int (8))
                      (fun k ->
                         fun res3 ->
                           Spec_Matrix.mset n n res3 i (j1 + k)
                             (let n2 =
                                Lib_ByteSequence.nat_from_intseq_le_
                                  Lib_IntTypes.U8 Lib_IntTypes.SEC
                                  (Lib_Sequence.sub (Prims.of_int (16)) res_i
                                     (k * (Prims.of_int (2)))
                                     (Prims.of_int (2))) in
                              FStar_UInt16.uint_to_t n2)) res2) res1) res

let (frodo_gen_matrix_shake1_ind :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      fun i ->
        fun res ->
          let res_i = frodo_gen_matrix_shake_get_r n seed i in
          Lib_LoopCombinators.repeati_inductive' n ()
            (frodo_gen_matrix_shake0 n i res_i) res
let (frodo_gen_matrix_shake_ind :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      let res = Spec_Matrix.create n n in
      Lib_LoopCombinators.repeati_inductive' n ()
        (frodo_gen_matrix_shake1_ind n seed) res
let (frodo_gen_matrix_shake_4x1_ind :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      fun i ->
        fun res ->
          let uu___ = frodo_gen_matrix_shake_4x1_get_r n seed i in
          match uu___ with
          | (r0, r1, r2, r3) ->
              Lib_LoopCombinators.repeati_inductive' n ()
                (frodo_gen_matrix_shake_4x0 n i r0 r1 r2 r3) res

let (frodo_gen_matrix_shake_4x_ind :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n ->
    fun seed ->
      let res = Spec_Matrix.create n n in
      let n4 = n / (Prims.of_int (4)) in
      let res1 =
        Lib_LoopCombinators.repeati_inductive' n4 ()
          (frodo_gen_matrix_shake_4x1_ind n seed) res in
      res1
