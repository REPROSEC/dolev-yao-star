open Prims
let (size_signature : Prims.nat) = (Prims.of_int (64))
type aff_point = (Spec_Curve25519.elem * Spec_Curve25519.elem)
type ext_point =
  (Spec_Curve25519.elem * Spec_Curve25519.elem * Spec_Curve25519.elem *
    Spec_Curve25519.elem)
let (modp_sqrt_m1 : Spec_Curve25519.elem) =
  Spec_Curve25519.op_Star_Star_Percent (Prims.of_int (2))
    ((Spec_Curve25519.prime - Prims.int_one) / (Prims.of_int (4)))
let (d : Spec_Curve25519.elem) =
  let x =
    (Prims.parse_int "37095705934669439343138083508754565189542113879843219016388785533085940283555") in
  x
let (q : Prims.nat) =
  (Prims.pow2 (Prims.of_int (252))) +
    (Prims.parse_int "27742317777372353535851937790883648493")

let (g_x : Spec_Curve25519.elem) =
  (Prims.parse_int "15112221349535400772501151409588531511454012693041857206046113283949847762202")
let (g_y : Spec_Curve25519.elem) =
  (Prims.parse_int "46316835694926478169428394003475163141307993866256225615783033603165251855960")
let (g : ext_point) =
  (g_x, g_y, Prims.int_one, (Spec_Curve25519.op_Star_Percent g_x g_y))
let (modp_inv : Spec_Curve25519.elem -> Spec_Curve25519.elem) =
  fun x ->
    Spec_Curve25519.op_Star_Star_Percent x
      (Spec_Curve25519.prime - (Prims.of_int (2)))
let (sha512_modq :
  Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat) =
  fun len ->
    fun s ->
      (Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
         (Obj.magic (Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_512 s)))
        mod q
let (point_add : ext_point -> ext_point -> ext_point) =
  fun p ->
    fun q1 ->
      let uu___ = p in
      match uu___ with
      | (x1, y1, z1, t1) ->
          let uu___1 = q1 in
          (match uu___1 with
           | (x2, y2, z2, t2) ->
               let a =
                 Spec_Curve25519.op_Star_Percent
                   (Spec_Curve25519.op_Subtraction_Percent y1 x1)
                   (Spec_Curve25519.op_Subtraction_Percent y2 x2) in
               let b =
                 Spec_Curve25519.op_Star_Percent
                   (Spec_Curve25519.op_Plus_Percent y1 x1)
                   (Spec_Curve25519.op_Plus_Percent y2 x2) in
               let c =
                 Spec_Curve25519.op_Star_Percent
                   (Spec_Curve25519.op_Star_Percent
                      (Spec_Curve25519.op_Star_Percent (Prims.of_int (2)) d)
                      t1) t2 in
               let d1 =
                 Spec_Curve25519.op_Star_Percent
                   (Spec_Curve25519.op_Star_Percent (Prims.of_int (2)) z1) z2 in
               let e = Spec_Curve25519.op_Subtraction_Percent b a in
               let f = Spec_Curve25519.op_Subtraction_Percent d1 c in
               let g1 = Spec_Curve25519.op_Plus_Percent d1 c in
               let h = Spec_Curve25519.op_Plus_Percent b a in
               let x3 = Spec_Curve25519.op_Star_Percent e f in
               let y3 = Spec_Curve25519.op_Star_Percent g1 h in
               let t3 = Spec_Curve25519.op_Star_Percent e h in
               let z3 = Spec_Curve25519.op_Star_Percent f g1 in
               (x3, y3, z3, t3))
let (point_double : ext_point -> ext_point) =
  fun p ->
    let uu___ = p in
    match uu___ with
    | (x1, y1, z1, t1) ->
        let a = Spec_Curve25519.op_Star_Percent x1 x1 in
        let b = Spec_Curve25519.op_Star_Percent y1 y1 in
        let c =
          Spec_Curve25519.op_Star_Percent (Prims.of_int (2))
            (Spec_Curve25519.op_Star_Percent z1 z1) in
        let h = Spec_Curve25519.op_Plus_Percent a b in
        let e =
          Spec_Curve25519.op_Subtraction_Percent h
            (Spec_Curve25519.op_Star_Percent
               (Spec_Curve25519.op_Plus_Percent x1 y1)
               (Spec_Curve25519.op_Plus_Percent x1 y1)) in
        let g1 = Spec_Curve25519.op_Subtraction_Percent a b in
        let f = Spec_Curve25519.op_Plus_Percent c g1 in
        let x3 = Spec_Curve25519.op_Star_Percent e f in
        let y3 = Spec_Curve25519.op_Star_Percent g1 h in
        let t3 = Spec_Curve25519.op_Star_Percent e h in
        let z3 = Spec_Curve25519.op_Star_Percent f g1 in (x3, y3, z3, t3)
let (ith_bit :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat -> FStar_UInt8.t) =
  fun k ->
    fun i ->
      let q1 = i / (Prims.of_int (8)) in
      let r = FStar_UInt32.uint_to_t (i mod (Prims.of_int (8))) in
      FStar_UInt8.logand
        (FStar_UInt8.shift_right
           (Lib_Sequence.index (Prims.of_int (32)) k q1) r)
        (FStar_UInt8.uint_to_t Prims.int_one)
let (cswap2 :
  FStar_UInt8.t -> ext_point -> ext_point -> (ext_point * ext_point)) =
  fun sw ->
    fun x ->
      fun xp1 ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic sw)) =
            Prims.int_one
        then (xp1, x)
        else (x, xp1)
let (ladder_step :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> (ext_point * ext_point) -> (ext_point * ext_point))
  =
  fun k ->
    fun i ->
      fun uu___ ->
        match uu___ with
        | (x, xp1) ->
            let bit = ith_bit k ((Prims.of_int (255)) - i) in
            let uu___1 = cswap2 bit x xp1 in
            (match uu___1 with
             | (x1, xp11) ->
                 let xx = point_double x1 in
                 let xxp1 = point_add x1 xp11 in cswap2 bit xx xxp1)
let (montgomery_ladder :
  ext_point ->
    ext_point ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq -> (ext_point * ext_point))
  =
  fun x ->
    fun xp1 ->
      fun k ->
        Lib_LoopCombinators.repeati (Prims.of_int (256)) (ladder_step k)
          (x, xp1)
let (point_mul :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> ext_point -> ext_point) =
  fun a ->
    fun p ->
      FStar_Pervasives_Native.fst
        (montgomery_ladder
           (Spec_Curve25519.zero, Spec_Curve25519.one, Spec_Curve25519.one,
             Spec_Curve25519.zero) p a)
let (recover_x :
  Prims.nat ->
    Prims.bool -> Spec_Curve25519.elem FStar_Pervasives_Native.option)
  =
  fun y ->
    fun sign ->
      if y >= Spec_Curve25519.prime
      then FStar_Pervasives_Native.None
      else
        (let y2 = Spec_Curve25519.op_Star_Percent y y in
         let x2 =
           Spec_Curve25519.op_Star_Percent
             (Spec_Curve25519.op_Subtraction_Percent y2 Spec_Curve25519.one)
             (modp_inv
                (Spec_Curve25519.op_Plus_Percent
                   (Spec_Curve25519.op_Star_Percent d y2) Spec_Curve25519.one)) in
         if x2 = Spec_Curve25519.zero
         then
           (if sign
            then FStar_Pervasives_Native.None
            else FStar_Pervasives_Native.Some Spec_Curve25519.zero)
         else
           (let x =
              Spec_Curve25519.op_Star_Star_Percent x2
                ((Spec_Curve25519.prime + (Prims.of_int (3))) /
                   (Prims.of_int (8))) in
            let x1 =
              if
                (Spec_Curve25519.op_Subtraction_Percent
                   (Spec_Curve25519.op_Star_Percent x x) x2)
                  <> Spec_Curve25519.zero
              then Spec_Curve25519.op_Star_Percent x modp_sqrt_m1
              else x in
            if
              (Spec_Curve25519.op_Subtraction_Percent
                 (Spec_Curve25519.op_Star_Percent x1 x1) x2)
                <> Spec_Curve25519.zero
            then FStar_Pervasives_Native.None
            else
              (let x3 =
                 if ((x1 mod (Prims.of_int (2))) = Prims.int_one) <> sign
                 then (Spec_Curve25519.prime - x1) mod Spec_Curve25519.prime
                 else x1 in
               FStar_Pervasives_Native.Some x3)))
let (point_compress : ext_point -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun uu___ ->
    (fun p ->
       let uu___ = p in
       match uu___ with
       | (px, py, pz, pt) ->
           let zinv = modp_inv pz in
           let x = Spec_Curve25519.op_Star_Percent px zinv in
           let y = Spec_Curve25519.op_Star_Percent py zinv in
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Prims.of_int (32))
                (((Prims.pow2 (Prims.of_int (255))) *
                    (x mod (Prims.of_int (2))))
                   + y))) uu___
let (point_decompress :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    ext_point FStar_Pervasives_Native.option)
  =
  fun s ->
    let y =
      Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
        (Obj.magic s) in
    let sign =
      ((y / (Prims.pow2 (Prims.of_int (255)))) mod (Prims.of_int (2))) =
        Prims.int_one in
    let y1 = y mod (Prims.pow2 (Prims.of_int (255))) in
    let x = recover_x y1 sign in
    match x with
    | FStar_Pervasives_Native.Some x1 ->
        FStar_Pervasives_Native.Some
          (x1, y1, Spec_Curve25519.one,
            (Spec_Curve25519.op_Star_Percent x1 y1))
    | uu___ -> FStar_Pervasives_Native.None
let (secret_expand :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
      Lib_Sequence.lseq))
  =
  fun secret ->
    let h = Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_512 secret in
    let h_low =
      Lib_Sequence.slice (Prims.of_int (64)) h Prims.int_zero
        (Prims.of_int (32)) in
    let h_high =
      Lib_Sequence.slice (Prims.of_int (64)) h (Prims.of_int (32))
        (Prims.of_int (64)) in
    let h_low0 = Lib_Sequence.index (Prims.of_int (32)) h_low Prims.int_zero in
    let h_low31 =
      Lib_Sequence.index (Prims.of_int (32)) h_low (Prims.of_int (31)) in
    let h_low1 =
      Lib_Sequence.upd (Prims.of_int (32)) h_low Prims.int_zero
        (FStar_UInt8.logand
           (Lib_Sequence.index (Prims.of_int (32)) h_low Prims.int_zero)
           (FStar_UInt8.uint_to_t (Prims.of_int (0xf8)))) in
    let h_low2 =
      Lib_Sequence.upd (Prims.of_int (32)) h_low1 (Prims.of_int (31))
        (FStar_UInt8.logor
           (FStar_UInt8.logand
              (Lib_Sequence.index (Prims.of_int (32)) h_low1
                 (Prims.of_int (31)))
              (FStar_UInt8.uint_to_t (Prims.of_int (127))))
           (FStar_UInt8.uint_to_t (Prims.of_int (64)))) in
    (h_low2, h_high)
let (secret_to_public :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun secret ->
    let uu___ = secret_expand secret in
    match uu___ with | (a, dummy) -> point_compress (point_mul a g)
let (point_equal : ext_point -> ext_point -> Prims.bool) =
  fun p ->
    fun q1 ->
      let uu___ = p in
      match uu___ with
      | (px, py, pz, pt) ->
          let uu___1 = q1 in
          (match uu___1 with
           | (qx, qy, qz, qt) ->
               if
                 (Spec_Curve25519.op_Star_Percent px qz) <>
                   (Spec_Curve25519.op_Star_Percent qx pz)
               then false
               else
                 if
                   (Spec_Curve25519.op_Star_Percent py qz) <>
                     (Spec_Curve25519.op_Star_Percent qy pz)
                 then false
                 else true)
let (expand_keys :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
      Lib_Sequence.lseq * (FStar_UInt8.t, unit) Lib_Sequence.lseq))
  =
  fun secret ->
    let uu___ = secret_expand secret in
    match uu___ with
    | (s, prefix) -> let pub = secret_to_public secret in (pub, s, prefix)
let (sign_expanded :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        FStar_UInt8.t Lib_Sequence.seq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun pub ->
    fun s ->
      fun prefix ->
        fun msg ->
          let len = Lib_Sequence.length msg in
          let r =
            sha512_modq ((Prims.of_int (32)) + len)
              (Lib_Sequence.concat (Prims.of_int (32))
                 (Lib_Sequence.length msg) prefix msg) in
          let r' =
            point_mul
              (Obj.magic
                 (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                    Lib_IntTypes.SEC (Prims.of_int (32)) r)) g in
          let rs = point_compress r' in
          let h =
            sha512_modq ((Prims.of_int (64)) + len)
              (Lib_Sequence.concat (Prims.of_int (64))
                 (Lib_Sequence.length msg)
                 (Lib_Sequence.concat (Prims.of_int (32)) (Prims.of_int (32))
                    rs pub) msg) in
          let s1 =
            (r +
               ((h *
                   (Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                      Lib_IntTypes.SEC (Obj.magic s)))
                  mod q))
              mod q in
          Lib_Sequence.concat (Prims.of_int (32)) (Prims.of_int (32)) rs
            (Obj.magic
               (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                  Lib_IntTypes.SEC (Prims.of_int (32)) s1))
let (sign :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    FStar_UInt8.t Lib_Sequence.seq -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun secret ->
    fun msg ->
      let uu___ = expand_keys secret in
      match uu___ with | (pub, s, prefix) -> sign_expanded pub s prefix msg
let (verify :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    FStar_UInt8.t Lib_Sequence.seq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun public ->
    fun msg ->
      fun signature ->
        let len = Lib_Sequence.length msg in
        let a' = point_decompress public in
        match a' with
        | FStar_Pervasives_Native.None -> false
        | FStar_Pervasives_Native.Some a'1 ->
            let rs =
              Lib_Sequence.slice (Prims.of_int (64)) signature Prims.int_zero
                (Prims.of_int (32)) in
            let r' = point_decompress rs in
            (match r' with
             | FStar_Pervasives_Native.None -> false
             | FStar_Pervasives_Native.Some r'1 ->
                 let s =
                   Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                     Lib_IntTypes.SEC
                     (Obj.magic
                        (Lib_Sequence.slice (Prims.of_int (64)) signature
                           (Prims.of_int (32)) (Prims.of_int (64)))) in
                 if s >= q
                 then false
                 else
                   (let h =
                      sha512_modq ((Prims.of_int (64)) + len)
                        (Lib_Sequence.concat (Prims.of_int (64))
                           (Lib_Sequence.length msg)
                           (Lib_Sequence.concat (Prims.of_int (32))
                              (Prims.of_int (32)) rs public) msg) in
                    let sB =
                      point_mul
                        (Obj.magic
                           (Lib_ByteSequence.nat_to_intseq_le_
                              Lib_IntTypes.U8 Lib_IntTypes.SEC
                              (Prims.of_int (32)) s)) g in
                    let hA =
                      point_mul
                        (Obj.magic
                           (Lib_ByteSequence.nat_to_intseq_le_
                              Lib_IntTypes.U8 Lib_IntTypes.SEC
                              (Prims.of_int (32)) h)) a'1 in
                    point_equal sB (point_add r'1 hA)))