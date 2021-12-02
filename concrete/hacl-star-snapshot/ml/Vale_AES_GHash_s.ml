open Prims
type ghash_plain_LE = Vale_Def_Types_s.quad32 FStar_Seq_Base.seq
let (gf128_mul_LE :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun a_LE ->
    fun b_LE ->
      let a_BE = Vale_Def_Types_s.reverse_bytes_quad32 a_LE in
      let b_BE = Vale_Def_Types_s.reverse_bytes_quad32 b_LE in
      let ab_BE =
        Vale_AES_GF128_s.gf128_to_quad32
          (Vale_AES_GF128_s.gf128_mul (Vale_AES_GF128_s.gf128_of_quad32 a_BE)
             (Vale_AES_GF128_s.gf128_of_quad32 b_BE)) in
      Vale_Def_Types_s.reverse_bytes_quad32 ab_BE
let rec (ghash_LE_def :
  Vale_Def_Types_s.quad32 -> ghash_plain_LE -> Vale_Def_Types_s.quad32) =
  fun h_LE ->
    fun x ->
      let y_i_minus_1 =
        if (FStar_Seq_Base.length x) = Prims.int_one
        then
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = Prims.int_zero;
            Vale_Def_Words_s.hi2 = Prims.int_zero;
            Vale_Def_Words_s.hi3 = Prims.int_zero
          }
        else ghash_LE_def h_LE (Vale_Lib_Seqs_s.all_but_last x) in
      let x_i = FStar_Seq_Properties.last x in
      let xor_LE = Vale_Def_Types_s.quad32_xor y_i_minus_1 x_i in
      gf128_mul_LE xor_LE h_LE
let (ghash_LE :
  Vale_Def_Types_s.quad32 -> ghash_plain_LE -> Vale_Def_Types_s.quad32) =
  Vale_Def_Opaque_s.opaque_make ghash_LE_def
