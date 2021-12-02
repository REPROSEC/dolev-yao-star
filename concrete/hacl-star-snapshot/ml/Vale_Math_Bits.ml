open Prims
let (b_i2b : Prims.pos -> unit FStar_UInt.uint_t -> unit FStar_BV.bv_t) =
  fun n -> fun num -> FStar_BV.int2bv n num
let (b_b2i : Prims.pos -> unit FStar_BV.bv_t -> unit FStar_UInt.uint_t) =
  fun n -> fun vec -> FStar_BV.bv2int n vec
let (b_uext :
  Prims.pos -> Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t) =
  fun n -> fun m -> fun a -> FStar_BV.bv_uext n m a
let (b_and :
  Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvand n a b
let (b_or :
  Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvor n a b
let (b_xor :
  Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvxor n a b
let (b_not : Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t) =
  fun n -> fun a -> FStar_BV.bvnot n a
let (b_shl :
  Prims.pos -> unit FStar_BV.bv_t -> Prims.nat -> unit FStar_BV.bv_t) =
  fun n -> fun a -> fun s -> FStar_BV.bvshl n a s
let (b_shr :
  Prims.pos -> unit FStar_BV.bv_t -> Prims.nat -> unit FStar_BV.bv_t) =
  fun n -> fun a -> fun s -> FStar_BV.bvshr n a s
let (b_add :
  Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvadd n a b
let (b_sub :
  Prims.pos -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvsub n a b
let (b_mul :
  Prims.pos ->
    unit FStar_BV.bv_t -> unit FStar_UInt.uint_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvmul n a b
let (b_div :
  Prims.pos ->
    unit FStar_BV.bv_t -> unit FStar_UInt.uint_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvdiv n a b
let (b_mod :
  Prims.pos ->
    unit FStar_BV.bv_t -> unit FStar_UInt.uint_t -> unit FStar_BV.bv_t)
  = fun n -> fun a -> fun b -> FStar_BV.bvmod n a b

let (uext : Prims.pos -> Prims.pos -> unit FStar_UInt.uint_t -> Prims.int) =
  fun n -> fun m -> fun a -> a












let (add_hide :
  Prims.pos ->
    unit FStar_UInt.uint_t ->
      unit FStar_UInt.uint_t -> unit FStar_UInt.uint_t)
  = fun n -> fun a -> fun b -> FStar_UInt.add_mod n a b
let (sub_hide :
  Prims.pos ->
    unit FStar_UInt.uint_t ->
      unit FStar_UInt.uint_t -> unit FStar_UInt.uint_t)
  = fun n -> fun a -> fun b -> FStar_UInt.sub_mod n a b
let (mul_hide :
  Prims.pos ->
    unit FStar_UInt.uint_t ->
      unit FStar_UInt.uint_t -> unit FStar_UInt.uint_t)
  = fun n -> fun a -> fun b -> FStar_UInt.mul_mod n a b
type lemmas_i2b_all = unit



type ('n, 'a) is_bv8 = unit
type ('n, 'a) is_bv16 = unit
type ('n, 'a) is_bv32 = unit
type ('n, 'a) is_bv64 = unit
type ('n, 'a, 'b) bveq = unit


