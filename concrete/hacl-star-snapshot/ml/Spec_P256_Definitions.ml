open Prims
let (prime256 : Prims.pos) =
  ((((Prims.pow2 (Prims.of_int (256))) - (Prims.pow2 (Prims.of_int (224)))) +
      (Prims.pow2 (Prims.of_int (192))))
     + (Prims.pow2 (Prims.of_int (96))))
    - Prims.int_one
let (p256_prime_list : FStar_UInt64.t Prims.list) =
  [FStar_UInt64.uint_to_t (Prims.parse_int "0xffffffffffffffff");
  FStar_UInt64.uint_to_t (Prims.parse_int "0xffffffff");
  FStar_UInt64.uint_to_t Prims.int_zero;
  FStar_UInt64.uint_to_t (Prims.parse_int "0xffffffff00000001")]
type felem4 =
  (FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t)
type felem8 =
  (FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t *
    FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t)
type felem8_32 =
  (FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t *
    FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t)
type felem9 =
  (FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t *
    FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t * FStar_UInt64.t *
    FStar_UInt64.t)


type point_nat = (Prims.nat * Prims.nat * Prims.nat)
type point_nat_prime = point_nat
type point_seq = (FStar_UInt64.t, unit) Lib_Sequence.lseq
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
type felem_seq_prime = felem_seq
type point_prime = point_seq
type nat_prime = Prims.nat