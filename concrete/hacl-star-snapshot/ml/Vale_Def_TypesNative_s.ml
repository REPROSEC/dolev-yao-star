open Prims
type 'n natN = unit Vale_Def_Words_s.natN
let (pow2_norm : Prims.nat -> Prims.pos) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> Prims.int_one
    | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (n - Prims.int_one))