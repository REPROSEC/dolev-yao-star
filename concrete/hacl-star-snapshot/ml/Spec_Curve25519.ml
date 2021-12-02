open Prims
let (prime : Prims.pos) =
  (Prims.pow2 (Prims.of_int (255))) - (Prims.of_int (19))
type elem = Prims.nat
let (zero : elem) = Prims.int_zero
let (one : elem) = Prims.int_one
let (fadd : elem -> elem -> elem) = fun x -> fun y -> (x + y) mod prime
let (fsub : elem -> elem -> elem) = fun x -> fun y -> (x - y) mod prime
let (fmul : elem -> elem -> elem) = fun x -> fun y -> (x * y) mod prime
let (op_Plus_Percent : elem -> elem -> elem) = fadd
let (op_Subtraction_Percent : elem -> elem -> elem) = fsub
let (op_Star_Percent : elem -> elem -> elem) = fmul
let rec (fpow : elem -> Prims.pos -> elem) =
  fun a ->
    fun b ->
      if b = Prims.int_one
      then a
      else
        if (b mod (Prims.of_int (2))) = Prims.int_zero
        then fpow (op_Star_Percent a a) (b / (Prims.of_int (2)))
        else
          op_Star_Percent a
            (fpow (op_Star_Percent a a) (b / (Prims.of_int (2))))
let (op_Star_Star_Percent : elem -> Prims.pos -> elem) = fpow
type scalar = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type serialized_point = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type proj_point = (elem * elem)
let (ith_bit : scalar -> Prims.nat -> FStar_UInt64.t) =
  fun k ->
    fun i ->
      let q = i / (Prims.of_int (8)) in
      let r = FStar_UInt32.uint_to_t (i mod (Prims.of_int (8))) in
      FStar_Int_Cast.uint8_to_uint64
        (FStar_UInt8.logand
           (FStar_UInt8.shift_right
              (Lib_Sequence.index (Prims.of_int (32)) k q) r)
           (FStar_UInt8.uint_to_t Prims.int_one))
let (decodeScalar : scalar -> scalar) =
  fun k ->
    let k1 =
      Lib_Sequence.upd (Prims.of_int (32)) k Prims.int_zero
        (FStar_UInt8.logand
           (Lib_Sequence.index (Prims.of_int (32)) k Prims.int_zero)
           (FStar_UInt8.uint_to_t (Prims.of_int (248)))) in
    let k2 =
      Lib_Sequence.upd (Prims.of_int (32)) k1 (Prims.of_int (31))
        (FStar_UInt8.logand
           (Lib_Sequence.index (Prims.of_int (32)) k1 (Prims.of_int (31)))
           (FStar_UInt8.uint_to_t (Prims.of_int (127)))) in
    let k3 =
      Lib_Sequence.upd (Prims.of_int (32)) k2 (Prims.of_int (31))
        (FStar_UInt8.logor
           (Lib_Sequence.index (Prims.of_int (32)) k2 (Prims.of_int (31)))
           (FStar_UInt8.uint_to_t (Prims.of_int (64)))) in
    k3
let (decodePoint : serialized_point -> Prims.int) =
  fun u ->
    ((Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
        (Obj.magic u))
       mod (Prims.pow2 (Prims.of_int (255))))
      mod prime
let (encodePoint : proj_point -> serialized_point) =
  fun uu___ ->
    (fun p ->
       let uu___ = p in
       match uu___ with
       | (x, z) ->
           let p1 =
             op_Star_Percent x
               (op_Star_Star_Percent z (prime - (Prims.of_int (2)))) in
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Prims.of_int (32)) p1)) uu___
let add_and_double :
  'uuuuu .
    (elem * 'uuuuu) ->
      (elem * elem) -> (elem * elem) -> ((elem * elem) * (elem * elem))
  =
  fun q ->
    fun nq ->
      fun nqp1 ->
        let uu___ = q in
        match uu___ with
        | (x_1, z_1) ->
            let uu___1 = nq in
            (match uu___1 with
             | (x_2, z_2) ->
                 let uu___2 = nqp1 in
                 (match uu___2 with
                  | (x_3, z_3) ->
                      let a = op_Plus_Percent x_2 z_2 in
                      let b = op_Subtraction_Percent x_2 z_2 in
                      let c = op_Plus_Percent x_3 z_3 in
                      let d = op_Subtraction_Percent x_3 z_3 in
                      let da = op_Star_Percent d a in
                      let cb = op_Star_Percent c b in
                      let x_31 = op_Plus_Percent da cb in
                      let z_31 = op_Subtraction_Percent da cb in
                      let aa = op_Star_Percent a a in
                      let bb = op_Star_Percent b b in
                      let x_32 = op_Star_Percent x_31 x_31 in
                      let z_32 = op_Star_Percent z_31 z_31 in
                      let e = op_Subtraction_Percent aa bb in
                      let e121665 =
                        op_Star_Percent e (Prims.parse_int "121665") in
                      let aa_e121665 = op_Plus_Percent e121665 aa in
                      let x_21 = op_Star_Percent aa bb in
                      let z_21 = op_Star_Percent e aa_e121665 in
                      let z_33 = op_Star_Percent z_32 x_1 in
                      ((x_21, z_21), (x_32, z_33))))
let (double : (elem * elem) -> (elem * elem)) =
  fun nq ->
    let uu___ = nq in
    match uu___ with
    | (x_2, z_2) ->
        let a = op_Plus_Percent x_2 z_2 in
        let b = op_Subtraction_Percent x_2 z_2 in
        let aa = op_Star_Percent a a in
        let bb = op_Star_Percent b b in
        let e = op_Subtraction_Percent aa bb in
        let e121665 = op_Star_Percent e (Prims.parse_int "121665") in
        let aa_e121665 = op_Plus_Percent e121665 aa in
        let x_21 = op_Star_Percent aa bb in
        let z_21 = op_Star_Percent e aa_e121665 in (x_21, z_21)
let (cswap2 :
  FStar_UInt64.t -> proj_point -> proj_point -> (proj_point * proj_point)) =
  fun sw ->
    fun nq ->
      fun nqp1 ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic sw)) =
            Prims.int_one
        then (nqp1, nq)
        else (nq, nqp1)
let (ladder_step :
  scalar ->
    proj_point ->
      Prims.nat ->
        (proj_point * proj_point * FStar_UInt64.t) ->
          ((elem * elem) * (elem * elem) * FStar_UInt64.t))
  =
  fun k ->
    fun q ->
      fun i ->
        fun uu___ ->
          match uu___ with
          | (nq, nqp1, swap) ->
              let bit = ith_bit k ((Prims.of_int (253)) - i) in
              let sw = FStar_UInt64.logxor swap bit in
              let uu___1 = cswap2 sw nq nqp1 in
              (match uu___1 with
               | (nq1, nqp11) ->
                   let uu___2 = add_and_double q nq1 nqp11 in
                   (match uu___2 with | (nq2, nqp12) -> (nq2, nqp12, bit)))
let (montgomery_ladder : elem -> scalar -> proj_point) =
  fun init ->
    fun k ->
      let q = (init, one) in
      let nq = (one, zero) in
      let nqp1 = (init, one) in
      let uu___ = cswap2 (FStar_UInt64.uint_to_t Prims.int_one) nq nqp1 in
      match uu___ with
      | (nq1, nqp11) ->
          let uu___1 = add_and_double q nq1 nqp11 in
          (match uu___1 with
           | (nq2, nqp12) ->
               let swap = FStar_UInt64.uint_to_t Prims.int_one in
               let uu___2 =
                 Lib_LoopCombinators.repeati (Prims.of_int (251))
                   (ladder_step k q) (nq2, nqp12, swap) in
               (match uu___2 with
                | (nq3, nqp13, swap1) ->
                    let uu___3 = cswap2 swap1 nq3 nqp13 in
                    (match uu___3 with
                     | (nq4, nqp14) ->
                         let nq5 = double nq4 in
                         let nq6 = double nq5 in let nq7 = double nq6 in nq7)))
let (scalarmult : scalar -> serialized_point -> serialized_point) =
  fun k ->
    fun u ->
      let u1 = decodePoint u in
      let res = montgomery_ladder u1 k in encodePoint res
let (basepoint_list : FStar_UInt8.t Prims.list) =
  [FStar_UInt8.uint_to_t (Prims.of_int (9));
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero;
  FStar_UInt8.uint_to_t Prims.int_zero]
let (basepoint_lseq : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    [FStar_UInt8.uint_to_t (Prims.of_int (9));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero]
let (secret_to_public :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun kpriv ->
    let basepoint =
      Lib_Sequence.map (Prims.of_int (32)) (fun x -> x) basepoint_lseq in
    scalarmult kpriv basepoint