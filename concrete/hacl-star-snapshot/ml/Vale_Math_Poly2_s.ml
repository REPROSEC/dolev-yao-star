open Prims
type poly = Vale_Math_Poly2_Defs_s.poly
let (degree : poly -> Prims.int) = fun p -> Vale_Math_Poly2_Defs_s.degree p
let (zero : poly) = Vale_Math_Poly2_Defs_s.zero
let (one : poly) = Vale_Math_Poly2_Defs_s.one
let (monomial : Prims.nat -> poly) =
  fun n -> Vale_Math_Poly2_Defs_s.monomial n
let (shift : poly -> Prims.int -> poly) =
  fun p -> fun n -> Vale_Math_Poly2_Defs_s.shift p n
let (reverse : poly -> Prims.nat -> poly) =
  fun p -> fun n -> Vale_Math_Poly2_Defs_s.reverse p n
let (poly_index : poly -> Prims.int -> Prims.bool) =
  fun p -> fun n -> Vale_Math_Poly2_Defs_s.poly_index p n
let (op_String_Access : poly -> Prims.int -> Prims.bool) = poly_index
let (to_seq : poly -> Prims.nat -> Prims.bool FStar_Seq_Base.seq) =
  fun s -> fun n -> Vale_Math_Poly2_Defs_s.to_seq s n
let (of_seq : Prims.bool FStar_Seq_Base.seq -> poly) =
  fun s -> Vale_Math_Poly2_Defs_s.of_seq s
let (of_fun : Prims.nat -> (Prims.nat -> Prims.bool) -> poly) =
  fun len -> fun f -> Vale_Math_Poly2_Defs_s.of_fun len f
let (add : poly -> poly -> poly) =
  fun a -> fun b -> Vale_Math_Poly2_Defs_s.add a b
let (mul : poly -> poly -> poly) =
  fun a -> fun b -> Vale_Math_Poly2_Defs_s.mul a b
let (undefined_div_by_zero : poly -> poly) =
  fun a -> failwith "Not yet implemented:undefined_div_by_zero"
let (undefined_mod_by_zero : poly -> poly) =
  fun a -> failwith "Not yet implemented:undefined_mod_by_zero"
let (div : poly -> poly -> poly) =
  fun a ->
    fun b ->
      if (degree b) >= Prims.int_zero
      then Vale_Math_Poly2_Defs_s.div a b
      else undefined_div_by_zero a
let (mod1 : poly -> poly -> poly) =
  fun a ->
    fun b ->
      if (degree b) >= Prims.int_zero
      then Vale_Math_Poly2_Defs_s.mod1 a b
      else undefined_mod_by_zero a
let coerce : 'a 'b . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___
let (to_poly : poly -> Vale_Math_Poly2_Defs_s.poly) = fun p -> p
let (of_poly : Vale_Math_Poly2_Defs_s.poly -> poly) = fun p -> p
