open Prims
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
type ('hkeys, 'huBE) hkeys_reqs_pub = unit
let (get_hkeys_reqs :
  Vale_Def_Types_s.quad32 ->
    (Vale_Def_Types_s.quad32, unit) FStar_Seq_Properties.lseq)
  =
  fun h_BE ->
    let h =
      Vale_Math_Poly2_Bits_s.of_quad32
        (Vale_Def_Types_s.reverse_bytes_quad32
           (Vale_Def_Types_s.reverse_bytes_quad32 h_BE)) in
    let l =
      [Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h Prims.int_one);
      Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h (Prims.of_int (2)));
      h_BE;
      Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h (Prims.of_int (3)));
      Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h (Prims.of_int (4)));
      {
        Vale_Def_Words_s.lo0 = Prims.int_zero;
        Vale_Def_Words_s.lo1 = Prims.int_zero;
        Vale_Def_Words_s.hi2 = Prims.int_zero;
        Vale_Def_Words_s.hi3 = Prims.int_zero
      };
      Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h (Prims.of_int (5)));
      Vale_Math_Poly2_Bits_s.to_quad32 (gf128_power h (Prims.of_int (6)))] in
    let s = FStar_Seq_Properties.seq_of_list l in s

