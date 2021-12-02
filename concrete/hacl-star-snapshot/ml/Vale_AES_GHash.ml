open Prims
type poly128 = Vale_Math_Poly2_s.poly
let (fun_seq_quad32_LE_poly128 :
  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> Prims.int -> poly128) =
  fun s ->
    fun i ->
      if (Prims.int_zero <= i) && (i < (FStar_Seq_Base.length s))
      then
        Vale_Math_Poly2_Bits_s.of_quad32
          (Vale_Def_Types_s.reverse_bytes_quad32 (FStar_Seq_Base.index s i))
      else Vale_Math_Poly2_s.zero
let rec (ghash_poly :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      (Prims.int -> poly128) ->
        Prims.int -> Prims.int -> Vale_Math_Poly2_s.poly)
  =
  fun h ->
    fun init ->
      fun data ->
        fun j ->
          fun k ->
            if k <= j
            then init
            else
              Vale_AES_GF128.gf128_mul_rev
                (Vale_Math_Poly2_s.add
                   (ghash_poly h init data j (k - Prims.int_one))
                   (data (k - Prims.int_one))) h
let (shift_gf128_key_1 : Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly) =
  fun h ->
    Vale_AES_GF128.shift_key_1 (Prims.of_int (128))
      Vale_AES_GF128_s.gf128_modulus_low_terms h
let rec (g_power :
  Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun a ->
    fun n ->
      if n = Prims.int_zero
      then Vale_Math_Poly2_s.zero
      else
        if n = Prims.int_one
        then a
        else Vale_AES_GF128.op_Star_Tilde a (g_power a (n - Prims.int_one))


let (gf128_power :
  Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun h -> fun n -> shift_gf128_key_1 (g_power h n)

type ('hkeys, 'huBE) hkeys_reqs_priv = unit
let rec (ghash_poly_unroll :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      (Prims.int -> poly128) ->
        Prims.int -> Prims.nat -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun h ->
    fun prev ->
      fun data ->
        fun k ->
          fun m ->
            fun n ->
              let d = data (k + m) in
              let p = g_power h (n + Prims.int_one) in
              if m = Prims.int_zero
              then
                Vale_AES_GF128.op_Star_Tilde (Vale_Math_Poly2_s.add prev d) p
              else
                Vale_Math_Poly2_s.add
                  (ghash_poly_unroll h prev data k (m - Prims.int_one)
                     (n + Prims.int_one)) (Vale_AES_GF128.op_Star_Tilde d p)

let rec (ghash_unroll :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      (Prims.int -> poly128) ->
        Prims.int -> Prims.nat -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun h ->
    fun prev ->
      fun data ->
        fun k ->
          fun m ->
            fun n ->
              let d = data (k + m) in
              let p = gf128_power h (n + Prims.int_one) in
              if m = Prims.int_zero
              then Vale_Math_Poly2_s.mul (Vale_Math_Poly2_s.add prev d) p
              else
                Vale_Math_Poly2_s.add
                  (ghash_unroll h prev data k (m - Prims.int_one)
                     (n + Prims.int_one)) (Vale_Math_Poly2_s.mul d p)
let rec (ghash_unroll_back :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      (Prims.int -> poly128) ->
        Prims.int -> Prims.nat -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun h ->
    fun prev ->
      fun data ->
        fun k ->
          fun n ->
            fun m ->
              let d = data (k + ((n - Prims.int_one) - m)) in
              let p = gf128_power h (m + Prims.int_one) in
              let v =
                if m = (n - Prims.int_one)
                then Vale_Math_Poly2_s.add prev d
                else d in
              if m = Prims.int_zero
              then Vale_Math_Poly2_s.mul v p
              else
                Vale_Math_Poly2_s.add
                  (ghash_unroll_back h prev data k n (m - Prims.int_one))
                  (Vale_Math_Poly2_s.mul v p)









let rec (ghash_incremental_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> Vale_Def_Types_s.quad32)
  =
  fun h_LE ->
    fun y_prev ->
      fun x ->
        if (FStar_Seq_Base.length x) = Prims.int_zero
        then y_prev
        else
          (let y_i_minus_1 =
             ghash_incremental_def h_LE y_prev
               (Vale_Lib_Seqs_s.all_but_last x) in
           let x_i = FStar_Seq_Properties.last x in
           let xor_LE = Vale_Def_Types_s.quad32_xor y_i_minus_1 x_i in
           Vale_AES_GHash_s.gf128_mul_LE xor_LE h_LE)
let (ghash_incremental :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make ghash_incremental_def







let (ghash_incremental0 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> Vale_Def_Types_s.quad32)
  =
  fun h ->
    fun y_prev ->
      fun x ->
        if (FStar_Seq_Base.length x) > Prims.int_zero
        then ghash_incremental h y_prev x
        else y_prev






