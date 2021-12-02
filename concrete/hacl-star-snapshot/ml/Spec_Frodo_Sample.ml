open Prims
let (frodo_sample_f :
  Spec_Frodo_Params.frodo_alg -> FStar_UInt16.t -> Prims.nat -> Prims.nat) =
  fun a ->
    fun t ->
      fun i ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC (Obj.magic t)) >
            (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
               (Obj.magic
                  (Lib_Sequence.index
                     (match a with
                      | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (13))
                      | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (13))
                      | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (11))
                      | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (7)))
                     (Lib_Sequence.of_list
                        (match a with
                         | Spec_Frodo_Params.Frodo64 ->
                             [FStar_UInt16.uint_to_t (Prims.of_int (4643));
                             FStar_UInt16.uint_to_t (Prims.of_int (13363));
                             FStar_UInt16.uint_to_t (Prims.of_int (20579));
                             FStar_UInt16.uint_to_t (Prims.of_int (25843));
                             FStar_UInt16.uint_to_t (Prims.of_int (29227));
                             FStar_UInt16.uint_to_t (Prims.of_int (31145));
                             FStar_UInt16.uint_to_t (Prims.of_int (32103));
                             FStar_UInt16.uint_to_t (Prims.of_int (32525));
                             FStar_UInt16.uint_to_t (Prims.of_int (32689));
                             FStar_UInt16.uint_to_t (Prims.of_int (32745));
                             FStar_UInt16.uint_to_t (Prims.of_int (32762));
                             FStar_UInt16.uint_to_t (Prims.of_int (32766));
                             FStar_UInt16.uint_to_t (Prims.of_int (32767))]
                         | Spec_Frodo_Params.Frodo640 ->
                             [FStar_UInt16.uint_to_t (Prims.of_int (4643));
                             FStar_UInt16.uint_to_t (Prims.of_int (13363));
                             FStar_UInt16.uint_to_t (Prims.of_int (20579));
                             FStar_UInt16.uint_to_t (Prims.of_int (25843));
                             FStar_UInt16.uint_to_t (Prims.of_int (29227));
                             FStar_UInt16.uint_to_t (Prims.of_int (31145));
                             FStar_UInt16.uint_to_t (Prims.of_int (32103));
                             FStar_UInt16.uint_to_t (Prims.of_int (32525));
                             FStar_UInt16.uint_to_t (Prims.of_int (32689));
                             FStar_UInt16.uint_to_t (Prims.of_int (32745));
                             FStar_UInt16.uint_to_t (Prims.of_int (32762));
                             FStar_UInt16.uint_to_t (Prims.of_int (32766));
                             FStar_UInt16.uint_to_t (Prims.of_int (32767))]
                         | Spec_Frodo_Params.Frodo976 ->
                             [FStar_UInt16.uint_to_t (Prims.of_int (5638));
                             FStar_UInt16.uint_to_t (Prims.of_int (15915));
                             FStar_UInt16.uint_to_t (Prims.of_int (23689));
                             FStar_UInt16.uint_to_t (Prims.of_int (28571));
                             FStar_UInt16.uint_to_t (Prims.of_int (31116));
                             FStar_UInt16.uint_to_t (Prims.of_int (32217));
                             FStar_UInt16.uint_to_t (Prims.of_int (32613));
                             FStar_UInt16.uint_to_t (Prims.of_int (32731));
                             FStar_UInt16.uint_to_t (Prims.of_int (32760));
                             FStar_UInt16.uint_to_t (Prims.of_int (32766));
                             FStar_UInt16.uint_to_t (Prims.of_int (32767))]
                         | Spec_Frodo_Params.Frodo1344 ->
                             [FStar_UInt16.uint_to_t (Prims.of_int (9142));
                             FStar_UInt16.uint_to_t (Prims.of_int (23462));
                             FStar_UInt16.uint_to_t (Prims.of_int (30338));
                             FStar_UInt16.uint_to_t (Prims.of_int (32361));
                             FStar_UInt16.uint_to_t (Prims.of_int (32725));
                             FStar_UInt16.uint_to_t (Prims.of_int (32765));
                             FStar_UInt16.uint_to_t (Prims.of_int (32767))]))
                     i)))
        then Prims.int_one
        else Prims.int_zero

let (frodo_sample_res :
  Spec_Frodo_Params.frodo_alg ->
    FStar_UInt16.t -> Prims.nat -> FStar_UInt16.t)
  =
  fun a ->
    fun r0 ->
      fun e ->
        let e1 =
          (FStar_Math_Lib.powx (Prims.of_int (-1))
             (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC (Obj.magic r0)))
            * e in
        FStar_UInt16.uint_to_t (e1 mod (Prims.pow2 (Prims.of_int (16))))
let (frodo_sample :
  Spec_Frodo_Params.frodo_alg -> FStar_UInt16.t -> FStar_UInt16.t) =
  fun a ->
    fun r ->
      let t =
        FStar_UInt16.shift_right r (FStar_UInt32.uint_to_t Prims.int_one) in
      let r0 = FStar_UInt16.logand r (FStar_UInt16.uint_to_t Prims.int_one) in
      let e =
        Lib_LoopCombinators.repeati_inductive
          ((match a with
            | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (13))
            | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (13))
            | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (11))
            | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (7))) -
             Prims.int_one) ()
          (fun z -> fun e1 -> (frodo_sample_f a t z) + e1) Prims.int_zero in
      frodo_sample_res a r0 e
let (frodo_sample_matrix0 :
  Spec_Frodo_Params.frodo_alg ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            Prims.nat ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun n1 ->
      fun n2 ->
        fun r ->
          fun i ->
            fun j ->
              fun res ->
                Spec_Matrix.mset n1 n2 res i j
                  (frodo_sample a
                     (let n =
                        Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                          Lib_IntTypes.SEC
                          (Obj.magic
                             (Lib_Sequence.sub
                                (((Prims.of_int (2)) * n1) * n2) r
                                ((Prims.of_int (2)) * ((i * n2) + j))
                                (Prims.of_int (2)))) in
                      FStar_UInt16.uint_to_t n))
let (frodo_sample_matrix1 :
  Spec_Frodo_Params.frodo_alg ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun n1 ->
      fun n2 ->
        fun r ->
          fun i ->
            fun res ->
              Lib_LoopCombinators.repeati n2
                (frodo_sample_matrix0 a n1 n2 r i) res
let (frodo_sample_matrix :
  Spec_Frodo_Params.frodo_alg ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun n1 ->
      fun n2 ->
        fun r ->
          let res = Spec_Matrix.create n1 n2 in
          Lib_LoopCombinators.repeati n1 (frodo_sample_matrix1 a n1 n2 r) res