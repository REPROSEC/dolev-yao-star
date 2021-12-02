open Prims
let (ecp256_dh_i :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
      Lib_Sequence.lseq * Prims.bool))
  =
  fun s ->
    let uu___ = Spec_P256.secret_to_public s in
    match uu___ with
    | (xN, yN, zN) ->
        if Spec_P256.isPointAtInfinity (xN, yN, zN)
        then
          ((Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (32)) xN)),
            (Obj.magic
               (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                  Lib_IntTypes.SEC (Prims.of_int (32)) yN)), false)
        else
          ((Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (32)) xN)),
            (Obj.magic
               (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                  Lib_IntTypes.SEC (Prims.of_int (32)) yN)), true)
let (ecp256_dh_r :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
          Lib_Sequence.lseq * Prims.bool))
  =
  fun x ->
    fun y ->
      fun s ->
        let uu___ =
          ((Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
              Lib_IntTypes.SEC (Obj.magic x)),
            (Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Obj.magic y))) in
        match uu___ with
        | (x_, y_) ->
            let uu___1 = Spec_P256.toJacobianCoordinates (x_, y_) in
            (match uu___1 with
             | (pointJacX, pointJacY, pointJacZ) ->
                 if
                   Spec_ECDSA.verifyQValidCurvePointSpec
                     (pointJacX, pointJacY, pointJacZ)
                 then
                   let uu___2 =
                     Spec_P256.scalar_multiplication s
                       (pointJacX, pointJacY, pointJacZ) in
                   (match uu___2 with
                    | (xN, yN, zN) ->
                        if Spec_P256.isPointAtInfinity (xN, yN, zN)
                        then
                          ((Obj.magic
                              (Lib_ByteSequence.nat_to_intseq_be_
                                 Lib_IntTypes.U8 Lib_IntTypes.SEC
                                 (Prims.of_int (32)) xN)),
                            (Obj.magic
                               (Lib_ByteSequence.nat_to_intseq_be_
                                  Lib_IntTypes.U8 Lib_IntTypes.SEC
                                  (Prims.of_int (32)) yN)), false)
                        else
                          ((Obj.magic
                              (Lib_ByteSequence.nat_to_intseq_be_
                                 Lib_IntTypes.U8 Lib_IntTypes.SEC
                                 (Prims.of_int (32)) xN)),
                            (Obj.magic
                               (Lib_ByteSequence.nat_to_intseq_be_
                                  Lib_IntTypes.U8 Lib_IntTypes.SEC
                                  (Prims.of_int (32)) yN)), true))
                 else
                   ((Obj.magic
                       (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                          Lib_IntTypes.SEC (Prims.of_int (32)) Prims.int_zero)),
                     (Obj.magic
                        (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                           Lib_IntTypes.SEC (Prims.of_int (32))
                           Prims.int_zero)), false))