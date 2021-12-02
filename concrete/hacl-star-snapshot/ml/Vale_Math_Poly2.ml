open Prims
let (op_Plus_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2_s.add
let (op_Star_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2_s.mul
let (op_Slash_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2_s.div
let (op_Percent_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2_s.mod1
let (size : Vale_Math_Poly2_s.poly -> Prims.int) =
  fun a -> (Vale_Math_Poly2_s.degree a) + Prims.int_one
let (max : Prims.int -> Prims.int -> Prims.int) = FStar_Math_Lib.max
type all_defs = unit

let (poly_and :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      Vale_Math_Poly2_s.of_fun
        (Prims.int_one + (FStar_Math_Lib.max (size a) (size b)))
        (fun i ->
           (Vale_Math_Poly2_s.poly_index a i) &&
             (Vale_Math_Poly2_s.poly_index b i))
let (poly_or :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      Vale_Math_Poly2_s.of_fun (FStar_Math_Lib.max (size a) (size b))
        (fun i ->
           (Vale_Math_Poly2_s.poly_index a i) ||
             (Vale_Math_Poly2_s.poly_index b i))
let (mask : Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun a ->
    fun n ->
      Vale_Math_Poly2_s.of_fun n (fun i -> Vale_Math_Poly2_s.poly_index a i)
let (swap : Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun a ->
    fun n ->
      Vale_Math_Poly2_s.add (Vale_Math_Poly2_s.shift (mask a n) n)
        (Vale_Math_Poly2_s.shift a (- n))
let (ones : Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun n -> Vale_Math_Poly2_s.of_fun n (fun i -> true)
let rec (power :
  Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun a ->
    fun n ->
      if n = Prims.int_zero
      then Vale_Math_Poly2_s.one
      else Vale_Math_Poly2_s.mul a (power a (n - Prims.int_one))






























