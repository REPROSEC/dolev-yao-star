open Prims
let (prime_p256_order : Prims.pos) =
  (Prims.parse_int "115792089210356248762697446949407573529996955224135760342422259061068512044369")
let (p256_order_prime_list : FStar_UInt64.t Prims.list) =
  [FStar_UInt64.uint_to_t (Prims.parse_int "17562291160714782033");
  FStar_UInt64.uint_to_t (Prims.parse_int "13611842547513532036");
  FStar_UInt64.uint_to_t (Prims.parse_int "18446744073709551615");
  FStar_UInt64.uint_to_t (Prims.parse_int "18446744069414584320")]
let (felem_seq_as_nat_8 :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq -> Prims.nat) =
  fun a ->
    let a0 = Lib_Sequence.index (Prims.of_int (8)) a Prims.int_zero in
    let a1 = Lib_Sequence.index (Prims.of_int (8)) a Prims.int_one in
    let a2 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (2)) in
    let a3 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (3)) in
    let a4 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (4)) in
    let a5 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (5)) in
    let a6 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (6)) in
    let a7 = Lib_Sequence.index (Prims.of_int (8)) a (Prims.of_int (7)) in
    (((((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a0)) +
            ((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a1))
               * (Prims.pow2 (Prims.of_int (64)))))
           +
           (((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a2))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64)))))
          +
          ((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a3))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64))))
             * (Prims.pow2 (Prims.of_int (64)))))
         +
         (((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a4))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64))))
             * (Prims.pow2 (Prims.of_int (64))))
            * (Prims.pow2 (Prims.of_int (64)))))
        +
        ((((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a5))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64))))
             * (Prims.pow2 (Prims.of_int (64))))
            * (Prims.pow2 (Prims.of_int (64))))
           * (Prims.pow2 (Prims.of_int (64)))))
       +
       (((((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a6))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64))))
             * (Prims.pow2 (Prims.of_int (64))))
            * (Prims.pow2 (Prims.of_int (64))))
           * (Prims.pow2 (Prims.of_int (64))))
          * (Prims.pow2 (Prims.of_int (64)))))
      +
      ((((((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a7))
               * (Prims.pow2 (Prims.of_int (64))))
              * (Prims.pow2 (Prims.of_int (64))))
             * (Prims.pow2 (Prims.of_int (64))))
            * (Prims.pow2 (Prims.of_int (64))))
           * (Prims.pow2 (Prims.of_int (64))))
          * (Prims.pow2 (Prims.of_int (64))))
         * (Prims.pow2 (Prims.of_int (64))))
type felem_seq = (FStar_UInt64.t, unit) Lib_Sequence.lseq
let (felem_seq_as_nat : felem_seq -> Prims.nat) =
  fun a ->
    let a0 = Lib_Sequence.index (Prims.of_int (4)) a Prims.int_zero in
    let a1 = Lib_Sequence.index (Prims.of_int (4)) a Prims.int_one in
    let a2 = Lib_Sequence.index (Prims.of_int (4)) a (Prims.of_int (2)) in
    let a3 = Lib_Sequence.index (Prims.of_int (4)) a (Prims.of_int (3)) in
    (((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a0)) +
        ((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a1)) *
           (Prims.pow2 (Prims.of_int (64)))))
       +
       (((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a2)) *
           (Prims.pow2 (Prims.of_int (64))))
          * (Prims.pow2 (Prims.of_int (64)))))
      +
      ((((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic a3)) *
           (Prims.pow2 (Prims.of_int (64))))
          * (Prims.pow2 (Prims.of_int (64))))
         * (Prims.pow2 (Prims.of_int (64))))