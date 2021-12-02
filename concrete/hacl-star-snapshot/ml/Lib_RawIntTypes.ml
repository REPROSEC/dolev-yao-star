open Prims
let (u8_from_UInt8 : FStar_UInt8.t -> FStar_UInt8.t) = fun x -> x
let (u16_from_UInt16 : FStar_UInt16.t -> FStar_UInt16.t) = fun x -> x
let (u32_from_UInt32 : FStar_UInt32.t -> FStar_UInt32.t) = fun x -> x
let (u64_from_UInt64 : FStar_UInt64.t -> FStar_UInt64.t) = fun x -> x
let (u128_from_UInt128 : FStar_UInt128.t -> FStar_UInt128.t) = fun x -> x
let (size_from_UInt32 : FStar_UInt32.t -> FStar_UInt32.t) = fun x -> x
let (u8_to_UInt8 : FStar_UInt8.t -> FStar_UInt8.t) = fun x -> x
let (u16_to_UInt16 : FStar_UInt16.t -> FStar_UInt16.t) = fun x -> x
let (u32_to_UInt32 : FStar_UInt32.t -> FStar_UInt32.t) = fun x -> x
let (u64_to_UInt64 : FStar_UInt64.t -> FStar_UInt64.t) = fun x -> x
let (u128_to_UInt128 : FStar_UInt128.t -> FStar_UInt128.t) = fun x -> x
let (size_to_UInt32 : FStar_UInt32.t -> FStar_UInt32.t) = fun x -> x
let (uint_to_nat :
  Lib_IntTypes.inttype -> Lib_IntTypes.secrecy_level -> Obj.t -> Prims.nat) =
  fun t -> fun l -> fun x -> Lib_IntTypes.v t l x