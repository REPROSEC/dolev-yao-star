open Prims
let (gf128_modulus_low_terms : Vale_Math_Poly2_s.poly) =
  Vale_Math_Poly2_s.of_fun (Prims.of_int (8))
    (fun i ->
       (((i = Prims.int_zero) || (i = Prims.int_one)) ||
          (i = (Prims.of_int (2))))
         || (i = (Prims.of_int (7))))
let (gf128_modulus : Vale_Math_Poly2_s.poly) =
  Vale_Math_Poly2_s.add (Vale_Math_Poly2_s.monomial (Prims.of_int (128)))
    gf128_modulus_low_terms
let (gf128_add :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = fun a -> fun b -> Vale_Math_Poly2_s.add a b
let (gf128_mul :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b -> Vale_Math_Poly2_s.mod1 (Vale_Math_Poly2_s.mul a b) gf128_modulus
let (gf128_to_quad32 : Vale_Math_Poly2_s.poly -> Vale_Def_Types_s.quad32) =
  fun a ->
    Vale_Math_Poly2_Bits_s.to_quad32
      (Vale_Math_Poly2_s.reverse a (Prims.of_int (127)))
let (gf128_of_quad32 : Vale_Def_Types_s.quad32 -> Vale_Math_Poly2_s.poly) =
  fun q ->
    Vale_Math_Poly2_s.reverse (Vale_Math_Poly2_Bits_s.of_quad32 q)
      (Prims.of_int (127))