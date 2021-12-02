open Prims
let (prime : Prims.pos) = Spec_ECDSAP256_Definition.prime_p256_order
type nat_prime = Prims.nat


let (ith_bit :
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
let (op_Star_Percent : Prims.int -> Prims.int -> Prims.int) =
  fun a -> fun b -> (a * b) mod prime
let (_exp_step0 : nat_prime -> nat_prime -> (nat_prime * nat_prime)) =
  fun r0 ->
    fun r1 ->
      let r11 = op_Star_Percent r0 r1 in
      let r01 = op_Star_Percent r0 r0 in (r01, r11)
let (_exp_step1 : nat_prime -> nat_prime -> (nat_prime * nat_prime)) =
  fun r0 ->
    fun r1 ->
      let r01 = op_Star_Percent r0 r1 in
      let r11 = op_Star_Percent r1 r1 in (r01, r11)
let swap : 'uuuuu 'uuuuu1 . 'uuuuu -> 'uuuuu1 -> ('uuuuu1 * 'uuuuu) =
  fun p -> fun q -> (q, p)
let (conditional_swap :
  FStar_UInt64.t -> nat_prime -> nat_prime -> (nat_prime * nat_prime)) =
  fun i ->
    fun p ->
      fun q ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic i)) =
            Prims.int_zero
        then (p, q)
        else (q, p)

let (_exp_step :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> (nat_prime * nat_prime) -> (nat_prime * nat_prime))
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
            then _exp_step0 p q
            else _exp_step1 p q
let (_exponent_spec :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    (nat_prime * nat_prime) -> (nat_prime * nat_prime))
  =
  fun k ->
    fun uu___ ->
      match uu___ with
      | (p, q) ->
          Lib_LoopCombinators.repeati (Prims.of_int (256)) (_exp_step k)
            (p, q)




let (prime_p256_order_inverse_list : FStar_UInt8.t Prims.list) =
  [FStar_UInt8.uint_to_t (Prims.of_int (79));
  FStar_UInt8.uint_to_t (Prims.of_int (37));
  FStar_UInt8.uint_to_t (Prims.of_int (99));
  FStar_UInt8.uint_to_t (Prims.of_int (252));
  FStar_UInt8.uint_to_t (Prims.of_int (194));
  FStar_UInt8.uint_to_t (Prims.of_int (202));
  FStar_UInt8.uint_to_t (Prims.of_int (185));
  FStar_UInt8.uint_to_t (Prims.of_int (243));
  FStar_UInt8.uint_to_t (Prims.of_int (132));
  FStar_UInt8.uint_to_t (Prims.of_int (158));
  FStar_UInt8.uint_to_t (Prims.of_int (23));
  FStar_UInt8.uint_to_t (Prims.of_int (167));
  FStar_UInt8.uint_to_t (Prims.of_int (173));
  FStar_UInt8.uint_to_t (Prims.of_int (250));
  FStar_UInt8.uint_to_t (Prims.of_int (230));
  FStar_UInt8.uint_to_t (Prims.of_int (188));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255))]
let (prime_p256_order_inverse_seq : (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  Lib_Sequence.of_list
    [FStar_UInt8.uint_to_t (Prims.of_int (79));
    FStar_UInt8.uint_to_t (Prims.of_int (37));
    FStar_UInt8.uint_to_t (Prims.of_int (99));
    FStar_UInt8.uint_to_t (Prims.of_int (252));
    FStar_UInt8.uint_to_t (Prims.of_int (194));
    FStar_UInt8.uint_to_t (Prims.of_int (202));
    FStar_UInt8.uint_to_t (Prims.of_int (185));
    FStar_UInt8.uint_to_t (Prims.of_int (243));
    FStar_UInt8.uint_to_t (Prims.of_int (132));
    FStar_UInt8.uint_to_t (Prims.of_int (158));
    FStar_UInt8.uint_to_t (Prims.of_int (23));
    FStar_UInt8.uint_to_t (Prims.of_int (167));
    FStar_UInt8.uint_to_t (Prims.of_int (173));
    FStar_UInt8.uint_to_t (Prims.of_int (250));
    FStar_UInt8.uint_to_t (Prims.of_int (230));
    FStar_UInt8.uint_to_t (Prims.of_int (188));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255))]
let (prime_p256_order_list : FStar_UInt8.t Prims.list) =
  [FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (255));
  FStar_UInt8.uint_to_t (Prims.of_int (188));
  FStar_UInt8.uint_to_t (Prims.of_int (230));
  FStar_UInt8.uint_to_t (Prims.of_int (250));
  FStar_UInt8.uint_to_t (Prims.of_int (173));
  FStar_UInt8.uint_to_t (Prims.of_int (167));
  FStar_UInt8.uint_to_t (Prims.of_int (23));
  FStar_UInt8.uint_to_t (Prims.of_int (158));
  FStar_UInt8.uint_to_t (Prims.of_int (132));
  FStar_UInt8.uint_to_t (Prims.of_int (243));
  FStar_UInt8.uint_to_t (Prims.of_int (185));
  FStar_UInt8.uint_to_t (Prims.of_int (202));
  FStar_UInt8.uint_to_t (Prims.of_int (194));
  FStar_UInt8.uint_to_t (Prims.of_int (252));
  FStar_UInt8.uint_to_t (Prims.of_int (99));
  FStar_UInt8.uint_to_t (Prims.of_int (37));
  FStar_UInt8.uint_to_t (Prims.of_int (81))]
let (prime_p256_order_seq : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    [FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (255));
    FStar_UInt8.uint_to_t (Prims.of_int (188));
    FStar_UInt8.uint_to_t (Prims.of_int (230));
    FStar_UInt8.uint_to_t (Prims.of_int (250));
    FStar_UInt8.uint_to_t (Prims.of_int (173));
    FStar_UInt8.uint_to_t (Prims.of_int (167));
    FStar_UInt8.uint_to_t (Prims.of_int (23));
    FStar_UInt8.uint_to_t (Prims.of_int (158));
    FStar_UInt8.uint_to_t (Prims.of_int (132));
    FStar_UInt8.uint_to_t (Prims.of_int (243));
    FStar_UInt8.uint_to_t (Prims.of_int (185));
    FStar_UInt8.uint_to_t (Prims.of_int (202));
    FStar_UInt8.uint_to_t (Prims.of_int (194));
    FStar_UInt8.uint_to_t (Prims.of_int (252));
    FStar_UInt8.uint_to_t (Prims.of_int (99));
    FStar_UInt8.uint_to_t (Prims.of_int (37));
    FStar_UInt8.uint_to_t (Prims.of_int (81))]
let (exponent_spec : nat_prime -> nat_prime) =
  fun a ->
    let uu___ =
      _exponent_spec prime_p256_order_inverse_seq (Prims.int_one, a) in
    match uu___ with | (a0, uu___1) -> a0
let (changeEndian :
  Spec_ECDSAP256_Definition.felem_seq -> Spec_ECDSAP256_Definition.felem_seq)
  =
  fun i ->
    let zero = Lib_Sequence.index (Prims.of_int (4)) i Prims.int_zero in
    let one = Lib_Sequence.index (Prims.of_int (4)) i Prims.int_one in
    let two = Lib_Sequence.index (Prims.of_int (4)) i (Prims.of_int (2)) in
    let three = Lib_Sequence.index (Prims.of_int (4)) i (Prims.of_int (3)) in
    let o = Lib_Sequence.upd (Prims.of_int (4)) i Prims.int_zero three in
    let o1 = Lib_Sequence.upd (Prims.of_int (4)) o Prims.int_one two in
    let o2 = Lib_Sequence.upd (Prims.of_int (4)) o1 (Prims.of_int (2)) one in
    Lib_Sequence.upd (Prims.of_int (4)) o2 (Prims.of_int (3)) zero



let (verifyQValidCurvePointSpec :
  (Prims.nat * Prims.nat * Prims.nat) -> Prims.bool) =
  fun publicKey ->
    let uu___ = publicKey in
    match uu___ with
    | (x, y, z) ->
        let x1 = x in
        ((((x1 < Spec_P256_Definitions.prime256) &&
             (y < Spec_P256_Definitions.prime256))
            && (z < Spec_P256_Definitions.prime256))
           && (Spec_P256.isPointOnCurve (x1, y, z)))
          &&
          (Spec_P256.isPointAtInfinity
             (Spec_P256.scalar_multiplication prime_p256_order_seq publicKey))
let (checkCoordinates : Prims.nat -> Prims.nat -> Prims.bool) =
  fun r ->
    fun s ->
      if
        (((r > Prims.int_zero) &&
            (r < Spec_ECDSAP256_Definition.prime_p256_order))
           && (s > Prims.int_zero))
          && (s < Spec_ECDSAP256_Definition.prime_p256_order)
      then true
      else false
type hash_alg_ecdsa =
  | NoHash 
  | Hash of Spec_Hash_Definitions.hash_alg 
let (uu___is_NoHash : hash_alg_ecdsa -> Prims.bool) =
  fun projectee -> match projectee with | NoHash -> true | uu___ -> false
let (uu___is_Hash : hash_alg_ecdsa -> Prims.bool) =
  fun projectee -> match projectee with | Hash _0 -> true | uu___ -> false
let (__proj__Hash__item___0 :
  hash_alg_ecdsa -> Spec_Hash_Definitions.hash_alg) =
  fun projectee -> match projectee with | Hash _0 -> _0

let (min_input_length : hash_alg_ecdsa -> Prims.int) =
  fun a ->
    match a with | NoHash -> (Prims.of_int (32)) | Hash a1 -> Prims.int_zero
let (hashSpec :
  hash_alg_ecdsa ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun mLen ->
      fun m ->
        match a with | NoHash -> m | Hash a1 -> Spec_Agile_Hash.hash a1 m
let (ecdsa_verification_agile :
  hash_alg_ecdsa ->
    (Prims.nat * Prims.nat) ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun alg ->
    fun publicKey ->
      fun r ->
        fun s ->
          fun mLen ->
            fun m ->
              let publicJacobian = Spec_P256.toJacobianCoordinates publicKey in
              if
                Prims.op_Negation (verifyQValidCurvePointSpec publicJacobian)
              then false
              else
                if Prims.op_Negation (checkCoordinates r s)
                then false
                else
                  (let hashM = hashSpec alg mLen m in
                   let cutHashM =
                     Lib_Sequence.sub
                       (if uu___is_Hash alg
                        then
                          Spec_Hash_Definitions.hash_length
                            (match alg with | Hash a -> a)
                        else mLen) hashM Prims.int_zero (Prims.of_int (32)) in
                   let hashNat =
                     (Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
                        Lib_IntTypes.SEC (Obj.magic cutHashM))
                       mod Spec_ECDSAP256_Definition.prime_p256_order in
                   let u1 =
                     Obj.magic
                       (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                          Lib_IntTypes.SEC (Prims.of_int (32))
                          (((Spec_P256_Lemmas.pow s
                               (Spec_ECDSAP256_Definition.prime_p256_order -
                                  (Prims.of_int (2))))
                              * hashNat)
                             mod Spec_ECDSAP256_Definition.prime_p256_order)) in
                   let u2 =
                     Obj.magic
                       (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                          Lib_IntTypes.SEC (Prims.of_int (32))
                          (((Spec_P256_Lemmas.pow s
                               (Spec_ECDSAP256_Definition.prime_p256_order -
                                  (Prims.of_int (2))))
                              * r)
                             mod Spec_ECDSAP256_Definition.prime_p256_order)) in
                   let pointAtInfinity =
                     (Prims.int_zero, Prims.int_zero, Prims.int_zero) in
                   let uu___2 =
                     Spec_P256.montgomery_ladder_spec u1
                       (pointAtInfinity, Spec_P256.basePoint) in
                   match uu___2 with
                   | (u1D, uu___3) ->
                       let uu___4 =
                         Spec_P256.montgomery_ladder_spec u2
                           (pointAtInfinity, publicJacobian) in
                       (match uu___4 with
                        | (u2D, uu___5) ->
                            let sumD =
                              if
                                (Spec_P256._norm u1D) = (Spec_P256._norm u2D)
                              then Spec_P256._point_double u1D
                              else Spec_P256._point_add u1D u2D in
                            let pointNorm = Spec_P256._norm sumD in
                            let uu___6 = pointNorm in
                            (match uu___6 with
                             | (x, y, z) ->
                                 let x1 =
                                   x mod
                                     Spec_ECDSAP256_Definition.prime_p256_order in
                                 if Spec_P256.isPointAtInfinity pointNorm
                                 then false
                                 else x1 = r)))
let (ecdsa_signature_agile :
  hash_alg_ecdsa ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (Prims.nat * Prims.nat * Prims.bool))
  =
  fun alg ->
    fun mLen ->
      fun m ->
        fun privateKey ->
          fun k ->
            let uu___ =
              Spec_P256.montgomery_ladder_spec k
                ((Prims.int_zero, Prims.int_zero, Prims.int_zero),
                  Spec_P256.basePoint) in
            match uu___ with
            | (r, uu___1) ->
                let uu___2 = Spec_P256._norm r in
                (match uu___2 with
                 | (xN, uu___3, uu___4) ->
                     let hashM = hashSpec alg mLen m in
                     let cutHashM =
                       Lib_Sequence.sub
                         (if uu___is_Hash alg
                          then
                            Spec_Hash_Definitions.hash_length
                              (match alg with | Hash a -> a)
                          else mLen) hashM Prims.int_zero (Prims.of_int (32)) in
                     let z =
                       (Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
                          Lib_IntTypes.SEC (Obj.magic cutHashM))
                         mod Spec_ECDSAP256_Definition.prime_p256_order in
                     let kFelem =
                       Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
                         Lib_IntTypes.SEC (Obj.magic k) in
                     let privateKeyFelem =
                       Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
                         Lib_IntTypes.SEC (Obj.magic privateKey) in
                     let resultR =
                       xN mod Spec_ECDSAP256_Definition.prime_p256_order in
                     let resultS =
                       ((z + (resultR * privateKeyFelem)) *
                          (Spec_P256_Lemmas.pow kFelem
                             (Spec_ECDSAP256_Definition.prime_p256_order -
                                (Prims.of_int (2)))))
                         mod Spec_ECDSAP256_Definition.prime_p256_order in
                     if
                       (resultR = Prims.int_zero) ||
                         (resultS = Prims.int_zero)
                     then (resultR, resultS, false)
                     else (resultR, resultS, true))