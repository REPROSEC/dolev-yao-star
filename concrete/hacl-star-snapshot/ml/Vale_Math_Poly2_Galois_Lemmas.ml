open Prims
let (fadd : Spec_GaloisField.field -> Obj.t -> Obj.t -> Obj.t) =
  fun f -> fun a -> fun b -> Spec_GaloisField.fadd f a b
let (fmul : Spec_GaloisField.field -> Obj.t -> Obj.t -> Obj.t) =
  fun f -> fun a -> fun b -> Spec_GaloisField.fmul f a b






