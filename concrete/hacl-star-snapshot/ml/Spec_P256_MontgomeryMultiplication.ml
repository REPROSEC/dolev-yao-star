open Prims
let (prime : Prims.pos) = Spec_P256_Definitions.prime256
let (fromDomain_ : Prims.int -> Prims.nat) =
  fun a ->
    (a * (Spec_P256_Lemmas.modp_inv2 (Prims.pow2 (Prims.of_int (256))))) mod
      Spec_P256_Definitions.prime256
let (fromDomainPoint :
  (Prims.nat * Prims.nat * Prims.nat) -> (Prims.nat * Prims.nat * Prims.nat))
  =
  fun a ->
    let uu___ = a in
    match uu___ with
    | (x, y, z) -> ((fromDomain_ x), (fromDomain_ y), (fromDomain_ z))
let (toDomain_ : Prims.int -> Prims.nat) =
  fun a ->
    (a * (Prims.pow2 (Prims.of_int (256)))) mod
      Spec_P256_Definitions.prime256









let (op_Star_Percent : Prims.int -> Prims.int -> Prims.int) =
  fun a -> fun b -> (a * b) mod prime
let (ith_bit_power :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat -> FStar_UInt64.t) =
  fun k ->
    fun i ->
      let q = i / (Prims.of_int (8)) in
      let r = i mod (Prims.of_int (8)) in
      let tmp1 =
        FStar_UInt8.shift_right (Lib_Sequence.index (Prims.of_int (32)) k q)
          (FStar_UInt32.uint_to_t r) in
      let tmp2 =
        FStar_UInt8.logand tmp1 (FStar_UInt8.uint_to_t Prims.int_one) in
      let res = FStar_Int_Cast.uint8_to_uint64 tmp2 in
      let k1 =
        Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
          (Obj.magic k) in
      res
let (_pow_step0 :
  Spec_P256_Definitions.nat_prime ->
    Spec_P256_Definitions.nat_prime ->
      (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime))
  =
  fun r0 ->
    fun r1 ->
      let r11 = op_Star_Percent r0 r1 in
      let r01 = op_Star_Percent r0 r0 in (r01, r11)
let (_pow_step1 :
  Spec_P256_Definitions.nat_prime ->
    Spec_P256_Definitions.nat_prime ->
      (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime))
  =
  fun r0 ->
    fun r1 ->
      let r01 = op_Star_Percent r0 r1 in
      let r11 = op_Star_Percent r1 r1 in (r01, r11)
let (swap :
  Spec_P256_Definitions.nat_prime ->
    Spec_P256_Definitions.nat_prime ->
      (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime))
  = fun p -> fun q -> (q, p)
let (conditional_swap_pow :
  FStar_UInt64.t ->
    Spec_P256_Definitions.nat_prime ->
      Spec_P256_Definitions.nat_prime ->
        (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime))
  =
  fun i ->
    fun p ->
      fun q ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic i)) =
            Prims.int_zero
        then (p, q)
        else (q, p)

let (_pow_step :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime) ->
        (Spec_P256_Definitions.nat_prime * Spec_P256_Definitions.nat_prime))
  =
  fun k ->
    fun i ->
      fun uu___ ->
        match uu___ with
        | (p, q) ->
            let bit = (Prims.of_int (255)) - i in
            let bit1 = ith_bit_power k bit in
            if
              (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                 (Obj.magic bit1))
                = Prims.int_zero
            then _pow_step0 p q
            else _pow_step1 p q




let (pow_spec :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Spec_P256_Definitions.nat_prime -> Spec_P256_Definitions.nat_prime)
  =
  fun k ->
    fun p ->
      let uu___ =
        Lib_LoopCombinators.repeati (Prims.of_int (256)) (_pow_step k)
          (Prims.int_one, p) in
      match uu___ with | (a, b) -> a
let (sq_root_spec :
  Spec_P256_Definitions.nat_prime -> Spec_P256_Definitions.nat_prime) =
  fun a ->
    (Spec_P256_Lemmas.pow a
       ((Spec_P256_Definitions.prime256 + Prims.int_one) / (Prims.of_int (4))))
      mod Spec_P256_Definitions.prime256