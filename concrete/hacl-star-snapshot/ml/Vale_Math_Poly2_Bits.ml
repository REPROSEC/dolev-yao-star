open Prims

let rec (of_nat : Prims.nat -> Vale_Math_Poly2_s.poly) =
  fun x ->
    if x = Prims.int_zero
    then Vale_Math_Poly2_s.zero
    else
      (let p =
         Vale_Math_Poly2_s.shift (of_nat (x / (Prims.of_int (2))))
           Prims.int_one in
       if (x mod (Prims.of_int (2))) = Prims.int_zero
       then p
       else Vale_Math_Poly2_s.add p Vale_Math_Poly2_s.one)
let (of_uint_ :
  Prims.nat -> unit FStar_UInt.uint_t -> Vale_Math_Poly2_s.poly) =
  fun n ->
    fun u ->
      if n = Prims.int_zero
      then Vale_Math_Poly2_s.zero
      else Vale_Math_Poly2_Bits_s.of_uint n u



let rec (poly_nat_eq_rec :
  Prims.nat -> Vale_Math_Poly2_s.poly -> Prims.nat -> Prims.nat -> Prims.bool)
  =
  fun len ->
    fun p ->
      fun c ->
        fun n ->
          if n = Prims.int_zero
          then c = Prims.int_zero
          else
            ((c mod (Prims.of_int (2))) =
               (if Vale_Math_Poly2_s.poly_index p (len - n)
                then Prims.int_one
                else Prims.int_zero))
              &&
              (poly_nat_eq_rec len p (c / (Prims.of_int (2)))
                 (n - Prims.int_one))


let (of_nat32 : Vale_Def_Words_s.nat32 -> Vale_Math_Poly2_s.poly) =
  fun n -> Vale_Math_Poly2_Bits_s.of_uint (Prims.of_int (32)) n






let (poly128_of_poly32s :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly ->
        Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a0 ->
    fun a1 ->
      fun a2 ->
        fun a3 ->
          Vale_Math_Poly2_s.add
            (Vale_Math_Poly2_s.add
               (Vale_Math_Poly2_s.add a0
                  (Vale_Math_Poly2_s.shift a1 (Prims.of_int (32))))
               (Vale_Math_Poly2_s.shift a2 (Prims.of_int (64))))
            (Vale_Math_Poly2_s.shift a3 (Prims.of_int (96)))
let (poly128_of_nat32s :
  Vale_Def_Words_s.nat32 ->
    Vale_Def_Words_s.nat32 ->
      Vale_Def_Words_s.nat32 ->
        Vale_Def_Words_s.nat32 -> Vale_Math_Poly2_s.poly)
  =
  fun a0 ->
    fun a1 ->
      fun a2 ->
        fun a3 ->
          poly128_of_poly32s (of_nat32 a0) (of_nat32 a1) (of_nat32 a2)
            (of_nat32 a3)









