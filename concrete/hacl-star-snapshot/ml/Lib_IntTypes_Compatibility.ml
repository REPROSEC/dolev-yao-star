open Prims

type inttype = Lib_IntTypes.inttype

let (nat_to_uint :
  Lib_IntTypes.inttype -> Lib_IntTypes.secrecy_level -> Prims.nat -> Obj.t) =
  fun t -> fun l -> fun n -> Lib_IntTypes.mk_int t l n
let (zeroes : Lib_IntTypes.inttype -> Lib_IntTypes.secrecy_level -> Obj.t) =
  fun t -> fun l -> Lib_IntTypes.mk_int t l Prims.int_zero