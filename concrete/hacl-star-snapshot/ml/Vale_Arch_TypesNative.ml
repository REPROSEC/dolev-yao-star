open Prims
let (nth : Prims.pos -> unit FStar_UInt.uint_t -> Prims.nat -> Prims.bool) =
  fun n -> fun a -> fun i -> FStar_Seq_Base.index (FStar_UInt.to_vec n a) i
type 'n natN = unit Vale_Def_Words_s.natN
let (pow2_norm : Prims.nat -> Prims.pos) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> Prims.int_one
    | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (n - Prims.int_one))



































let (not : Prims.bool -> Prims.bool) = fun b -> if b then false else true




