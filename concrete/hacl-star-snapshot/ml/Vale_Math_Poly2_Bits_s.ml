open Prims
let (to_uint : Prims.pos -> Vale_Math_Poly2_s.poly -> unit FStar_UInt.uint_t)
  =
  fun n ->
    fun a ->
      FStar_UInt.from_vec n
        (Vale_Math_Poly2_s.to_seq
           (Vale_Math_Poly2_s.reverse a (n - Prims.int_one)) n)
let (of_uint : Prims.pos -> unit FStar_UInt.uint_t -> Vale_Math_Poly2_s.poly)
  =
  fun n ->
    fun u ->
      Vale_Math_Poly2_s.reverse
        (Vale_Math_Poly2_s.of_seq (FStar_UInt.to_vec n u))
        (n - Prims.int_one)
let (to_double32_def : Vale_Math_Poly2_s.poly -> Vale_Def_Types_s.double32) =
  fun a ->
    let s =
      Vale_Math_Poly2_s.to_seq
        (Vale_Math_Poly2_s.reverse a (Prims.of_int (63))) (Prims.of_int (64)) in
    {
      Vale_Def_Words_s.lo =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s (Prims.of_int (32)) (Prims.of_int (64))));
      Vale_Def_Words_s.hi =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s Prims.int_zero (Prims.of_int (32))))
    }
let (of_double32_def : Vale_Def_Types_s.double32 -> Vale_Math_Poly2_s.poly) =
  fun d ->
    let uu___ = d in
    match uu___ with
    | { Vale_Def_Words_s.lo = d0; Vale_Def_Words_s.hi = d1;_} ->
        let s =
          FStar_Seq_Base.append (FStar_UInt.to_vec (Prims.of_int (32)) d1)
            (FStar_UInt.to_vec (Prims.of_int (32)) d0) in
        Vale_Math_Poly2_s.reverse (Vale_Math_Poly2_s.of_seq s)
          (Prims.of_int (63))
let (to_quad32_def : Vale_Math_Poly2_s.poly -> Vale_Def_Types_s.quad32) =
  fun a ->
    let s =
      Vale_Math_Poly2_s.to_seq
        (Vale_Math_Poly2_s.reverse a (Prims.of_int (127)))
        (Prims.of_int (128)) in
    {
      Vale_Def_Words_s.lo0 =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s (Prims.of_int (96)) (Prims.of_int (128))));
      Vale_Def_Words_s.lo1 =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s (Prims.of_int (64)) (Prims.of_int (96))));
      Vale_Def_Words_s.hi2 =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s (Prims.of_int (32)) (Prims.of_int (64))));
      Vale_Def_Words_s.hi3 =
        (FStar_UInt.from_vec (Prims.of_int (32))
           (FStar_Seq_Base.slice s Prims.int_zero (Prims.of_int (32))))
    }
let (of_quad32_def : Vale_Def_Types_s.quad32 -> Vale_Math_Poly2_s.poly) =
  fun q ->
    let uu___ = q in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = q0; Vale_Def_Words_s.lo1 = q1;
        Vale_Def_Words_s.hi2 = q2; Vale_Def_Words_s.hi3 = q3;_} ->
        let s =
          FStar_Seq_Base.append
            (FStar_Seq_Base.append
               (FStar_Seq_Base.append
                  (FStar_UInt.to_vec (Prims.of_int (32)) q3)
                  (FStar_UInt.to_vec (Prims.of_int (32)) q2))
               (FStar_UInt.to_vec (Prims.of_int (32)) q1))
            (FStar_UInt.to_vec (Prims.of_int (32)) q0) in
        Vale_Math_Poly2_s.reverse (Vale_Math_Poly2_s.of_seq s)
          (Prims.of_int (127))
let (to_double32 : Vale_Math_Poly2_s.poly -> Vale_Def_Types_s.double32) =
  fun a -> to_double32_def a
let (of_double32 : Vale_Def_Types_s.double32 -> Vale_Math_Poly2_s.poly) =
  fun d -> of_double32_def d
let (to_quad32 : Vale_Math_Poly2_s.poly -> Vale_Def_Types_s.quad32) =
  fun a -> to_quad32_def a
let (of_quad32 : Vale_Def_Types_s.quad32 -> Vale_Math_Poly2_s.poly) =
  fun q -> of_quad32_def q



