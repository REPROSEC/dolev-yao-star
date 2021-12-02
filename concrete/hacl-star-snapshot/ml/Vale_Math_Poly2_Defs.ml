open Prims
let (max : Prims.int -> Prims.int -> Prims.int) = FStar_Math_Lib.max
type ('a, 'b) poly_equal = unit
type ('a, 'b) op_Equals_Dot = unit
let (op_Plus_Dot :
  Vale_Math_Poly2_Defs_s.poly ->
    Vale_Math_Poly2_Defs_s.poly -> Vale_Math_Poly2_Defs_s.poly)
  = Vale_Math_Poly2_Defs_s.add
let (op_Star_Dot :
  Vale_Math_Poly2_Defs_s.poly ->
    Vale_Math_Poly2_Defs_s.poly -> Vale_Math_Poly2_Defs_s.poly)
  = Vale_Math_Poly2_Defs_s.mul
let (op_Slash_Dot :
  Vale_Math_Poly2_Defs_s.poly ->
    Vale_Math_Poly2_Defs_s.poly -> Vale_Math_Poly2_Defs_s.poly)
  = Vale_Math_Poly2_Defs_s.div
let (op_Percent_Dot :
  Vale_Math_Poly2_Defs_s.poly ->
    Vale_Math_Poly2_Defs_s.poly -> Vale_Math_Poly2_Defs_s.poly)
  = Vale_Math_Poly2_Defs_s.mod1

































