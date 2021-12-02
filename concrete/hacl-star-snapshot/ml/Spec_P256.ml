open Prims
let (prime : Prims.pos) = Spec_P256_Definitions.prime256
let (aCoordinateP256 : Prims.int) = (Prims.of_int (-3))
let (bCoordinateP256 : Prims.nat) =
  (Prims.parse_int "41058363725152142129326129780047268409114441015993725554835256314039467401291")
let (basePoint : Spec_P256_Definitions.point_nat_prime) =
  ((Prims.parse_int "0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296"),
    (Prims.parse_int "0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5"),
    Prims.int_one)
let (_point_double :
  Spec_P256_Definitions.point_nat_prime ->
    Spec_P256_Definitions.point_nat_prime)
  =
  fun p ->
    let uu___ = p in
    match uu___ with
    | (x, y, z) ->
        let delta = z * z in
        let gamma = y * y in
        let beta = x * gamma in
        let alpha = ((Prims.of_int (3)) * (x - delta)) * (x + delta) in
        let x3 = ((alpha * alpha) - ((Prims.of_int (8)) * beta)) mod prime in
        let y3 =
          ((alpha * (((Prims.of_int (4)) * beta) - x3)) -
             (((Prims.of_int (8)) * gamma) * gamma))
            mod prime in
        let z3 = ((((y + z) * (y + z)) - delta) - gamma) mod prime in
        (x3, y3, z3)
let (_point_add :
  Spec_P256_Definitions.point_nat_prime ->
    Spec_P256_Definitions.point_nat_prime ->
      Spec_P256_Definitions.point_nat_prime)
  =
  fun p ->
    fun q ->
      let uu___ = p in
      match uu___ with
      | (x1, y1, z1) ->
          let uu___1 = q in
          (match uu___1 with
           | (x2, y2, z2) ->
               let z2z2 = z2 * z2 in
               let z1z1 = z1 * z1 in
               let u1 = (x1 * z2z2) mod Spec_P256_Definitions.prime256 in
               let u2 = (x2 * z1z1) mod Spec_P256_Definitions.prime256 in
               let s1 = ((y1 * z2) * z2z2) mod Spec_P256_Definitions.prime256 in
               let s2 = ((y2 * z1) * z1z1) mod Spec_P256_Definitions.prime256 in
               let h = (u2 - u1) mod Spec_P256_Definitions.prime256 in
               let r = (s2 - s1) mod Spec_P256_Definitions.prime256 in
               let rr = r * r in
               let hh = h * h in
               let hhh = (h * h) * h in
               let x3 =
                 ((rr - hhh) - (((Prims.of_int (2)) * u1) * hh)) mod
                   Spec_P256_Definitions.prime256 in
               let y3 =
                 ((r * ((u1 * hh) - x3)) - (s1 * hhh)) mod
                   Spec_P256_Definitions.prime256 in
               let z3 = ((h * z1) * z2) mod Spec_P256_Definitions.prime256 in
               if z2 = Prims.int_zero
               then (x1, y1, z1)
               else
                 if z1 = Prims.int_zero then (x2, y2, z2) else (x3, y3, z3))
let (isPointAtInfinity : Spec_P256_Definitions.point_nat -> Prims.bool) =
  fun p ->
    let uu___ = p in
    match uu___ with | (uu___1, uu___2, z) -> z = Prims.int_zero
let (_norm :
  Spec_P256_Definitions.point_nat_prime ->
    Spec_P256_Definitions.point_nat_prime)
  =
  fun p ->
    let uu___ = p in
    match uu___ with
    | (x, y, z) ->
        let z2 = z * z in
        let z2i = Spec_P256_Lemmas.modp_inv2_pow z2 in
        let z3 = (z * z) * z in
        let z3i = Spec_P256_Lemmas.modp_inv2_pow z3 in
        let x3 = (z2i * x) mod Spec_P256_Definitions.prime256 in
        let y3 = (z3i * y) mod Spec_P256_Definitions.prime256 in
        let z31 =
          if isPointAtInfinity p then Prims.int_zero else Prims.int_one in
        (x3, y3, z31)
type scalar = (FStar_UInt8.t, unit) Lib_Sequence.lseq


let (ith_bit :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat -> FStar_UInt64.t) =
  fun k ->
    fun i ->
      let q = (Prims.of_int (31)) - (i / (Prims.of_int (8))) in
      let r = FStar_UInt32.uint_to_t (i mod (Prims.of_int (8))) in
      FStar_Int_Cast.uint8_to_uint64
        (FStar_UInt8.logand
           (FStar_UInt8.shift_right
              (Lib_Sequence.index (Prims.of_int (32)) k q) r)
           (FStar_UInt8.uint_to_t Prims.int_one))
let (_ml_step0 :
  Spec_P256_Definitions.point_nat_prime ->
    Spec_P256_Definitions.point_nat_prime ->
      (Spec_P256_Definitions.point_nat_prime *
        Spec_P256_Definitions.point_nat_prime))
  =
  fun r0 ->
    fun r1 ->
      let r01 = _point_add r1 r0 in let r11 = _point_double r1 in (r01, r11)
let (_ml_step1 :
  Spec_P256_Definitions.point_nat_prime ->
    Spec_P256_Definitions.point_nat_prime ->
      (Spec_P256_Definitions.point_nat_prime *
        Spec_P256_Definitions.point_nat_prime))
  =
  fun r0 ->
    fun r1 ->
      let r11 = _point_add r0 r1 in let r01 = _point_double r0 in (r01, r11)
let (_ml_step :
  scalar ->
    Prims.nat ->
      (Spec_P256_Definitions.point_nat_prime *
        Spec_P256_Definitions.point_nat_prime) ->
        (Spec_P256_Definitions.point_nat_prime *
          Spec_P256_Definitions.point_nat_prime))
  =
  fun k ->
    fun i ->
      fun uu___ ->
        match uu___ with
        | (p, q) ->
            let bit = (Prims.of_int (255)) - i in
            let bit1 = ith_bit k bit in
            if
              (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                 (Obj.magic bit1))
                = Prims.int_zero
            then _ml_step1 p q
            else _ml_step0 p q
let (montgomery_ladder_spec :
  scalar ->
    (Spec_P256_Definitions.point_nat_prime *
      Spec_P256_Definitions.point_nat_prime) ->
      (Spec_P256_Definitions.point_nat_prime *
        Spec_P256_Definitions.point_nat_prime))
  =
  fun k ->
    fun pq ->
      Lib_LoopCombinators.repeati (Prims.of_int (256)) (_ml_step k) pq
let (scalar_multiplication :
  scalar ->
    Spec_P256_Definitions.point_nat_prime ->
      Spec_P256_Definitions.point_nat_prime)
  =
  fun k ->
    fun p ->
      let pai = (Prims.int_zero, Prims.int_zero, Prims.int_zero) in
      let uu___ = montgomery_ladder_spec k (pai, p) in
      match uu___ with | (q, f) -> _norm q
let (secret_to_public : scalar -> Spec_P256_Definitions.point_nat_prime) =
  fun k ->
    let pai = (Prims.int_zero, Prims.int_zero, Prims.int_zero) in
    let uu___ = montgomery_ladder_spec k (pai, basePoint) in
    match uu___ with | (q, f) -> _norm q
let (isPointOnCurve : Spec_P256_Definitions.point_nat_prime -> Prims.bool) =
  fun p ->
    let uu___ = p in
    match uu___ with
    | (x, y, z) ->
        ((y * y) mod prime) =
          (((((x * x) * x) + (aCoordinateP256 * x)) + bCoordinateP256) mod
             prime)
let (point_prime_to_coordinates :
  Spec_P256_Definitions.point_seq -> (Prims.nat * Prims.nat * Prims.nat)) =
  fun p ->
    ((Spec_P256_Definitions.felem_seq_as_nat
        (Lib_Sequence.sub (Prims.of_int (12)) p Prims.int_zero
           (Prims.of_int (4)))),
      (Spec_P256_Definitions.felem_seq_as_nat
         (Lib_Sequence.sub (Prims.of_int (12)) p (Prims.of_int (4))
            (Prims.of_int (4)))),
      (Spec_P256_Definitions.felem_seq_as_nat
         (Lib_Sequence.sub (Prims.of_int (12)) p (Prims.of_int (8))
            (Prims.of_int (4)))))
let (toJacobianCoordinates :
  (Prims.nat * Prims.nat) -> (Prims.nat * Prims.nat * Prims.nat)) =
  fun uu___ -> match uu___ with | (r0, r1) -> (r0, r1, Prims.int_one)
let rec (nat_from_intlist_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Prims.list -> Prims.nat)
  =
  fun t ->
    fun l ->
      fun uu___ ->
        match uu___ with
        | [] -> Prims.int_zero
        | hd::tl ->
            (Lib_IntTypes.v t l hd) +
              ((Prims.pow2 (Lib_IntTypes.bits t)) *
                 (nat_from_intlist_le t l tl))
let rec (nat_from_intlist_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Prims.list -> Prims.nat)
  =
  fun t ->
    fun l ->
      fun uu___ ->
        match uu___ with
        | [] -> Prims.int_zero
        | hd::tl ->
            ((Prims.pow2
                ((FStar_List_Tot_Base.length tl) * (Lib_IntTypes.bits t)))
               * (Lib_IntTypes.v t l hd))
              + (nat_from_intlist_be t l tl)


