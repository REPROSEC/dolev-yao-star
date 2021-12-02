open Prims
let (op_Star_Hat :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun x -> fun y -> Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") x y
let (op_Star_Hat_Hat :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  = Vale_Def_Types_s.quad32_xor
let (add_wrap32 :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun x ->
    fun y -> Vale_Def_Types_s.add_wrap (Prims.parse_int "0x100000000") x y
let (add_wrap64 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  =
  fun x ->
    fun y ->
      Vale_Def_Types_s.add_wrap (Prims.parse_int "0x10000000000000000") x y
let (sub_wrap32 :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun x ->
    fun y -> Vale_Def_Types_s.sub_wrap (Prims.parse_int "0x100000000") x y
let (sub_wrap64 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  =
  fun x ->
    fun y ->
      Vale_Def_Types_s.sub_wrap (Prims.parse_int "0x10000000000000000") x y
let (iand32 :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun a -> fun b -> Vale_Def_Types_s.iand (Prims.parse_int "0x100000000") a b
let (ixor32 :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun a -> fun b -> Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") a b
let (ior32 :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun a -> fun b -> Vale_Def_Types_s.ior (Prims.parse_int "0x100000000") a b
let (inot32 : Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32) =
  fun a -> Vale_Def_Types_s.inot (Prims.parse_int "0x100000000") a
let (ishl32 : Vale_Def_Words_s.nat32 -> Prims.int -> Vale_Def_Words_s.nat32)
  =
  fun a -> fun s -> Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") a s
let (ishr32 : Vale_Def_Words_s.nat32 -> Prims.int -> Vale_Def_Words_s.nat32)
  =
  fun a -> fun s -> Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") a s
let (iand64 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  =
  fun a ->
    fun b ->
      Vale_Def_Types_s.iand (Prims.parse_int "0x10000000000000000") a b
let (ixor64 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  =
  fun a ->
    fun b ->
      Vale_Def_Types_s.ixor (Prims.parse_int "0x10000000000000000") a b
let (ior64 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  =
  fun a ->
    fun b -> Vale_Def_Types_s.ior (Prims.parse_int "0x10000000000000000") a b
let (inot64 : Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64) =
  fun a -> Vale_Def_Types_s.inot (Prims.parse_int "0x10000000000000000") a
let (ishl64 : Vale_Def_Words_s.nat64 -> Prims.int -> Vale_Def_Words_s.nat64)
  =
  fun a ->
    fun s ->
      Vale_Def_Types_s.ishl (Prims.parse_int "0x10000000000000000") a s
let (ishr64 : Vale_Def_Words_s.nat64 -> Prims.int -> Vale_Def_Words_s.nat64)
  =
  fun a ->
    fun s ->
      Vale_Def_Types_s.ishr (Prims.parse_int "0x10000000000000000") a s
let (iand128 :
  Vale_Def_Words_s.nat128 ->
    Vale_Def_Words_s.nat128 -> Vale_Def_Words_s.nat128)
  =
  fun a ->
    fun b ->
      Vale_Def_Types_s.iand
        (Prims.parse_int "0x100000000000000000000000000000000") a b
let (ixor128 :
  Vale_Def_Words_s.nat128 ->
    Vale_Def_Words_s.nat128 -> Vale_Def_Words_s.nat128)
  =
  fun a ->
    fun b ->
      Vale_Def_Types_s.ixor
        (Prims.parse_int "0x100000000000000000000000000000000") a b
let (ior128 :
  Vale_Def_Words_s.nat128 ->
    Vale_Def_Words_s.nat128 -> Vale_Def_Words_s.nat128)
  =
  fun a ->
    fun b ->
      Vale_Def_Types_s.ior
        (Prims.parse_int "0x100000000000000000000000000000000") a b
let (inot128 : Vale_Def_Words_s.nat128 -> Vale_Def_Words_s.nat128) =
  fun a ->
    Vale_Def_Types_s.inot
      (Prims.parse_int "0x100000000000000000000000000000000") a
let (ishl128 :
  Vale_Def_Words_s.nat128 -> Prims.int -> Vale_Def_Words_s.nat128) =
  fun a ->
    fun s ->
      Vale_Def_Types_s.ishl
        (Prims.parse_int "0x100000000000000000000000000000000") a s
let (ishr128 :
  Vale_Def_Words_s.nat128 -> Prims.int -> Vale_Def_Words_s.nat128) =
  fun a ->
    fun s ->
      Vale_Def_Types_s.ishr
        (Prims.parse_int "0x100000000000000000000000000000000") a s
let (two_to_nat32 :
  Vale_Def_Words_s.nat32 Vale_Def_Words_s.two -> Vale_Def_Words_s.nat64) =
  fun x -> Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32)) x

let (quad32_shl32 : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    let uu___ = q in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = v0; Vale_Def_Words_s.lo1 = v1;
        Vale_Def_Words_s.hi2 = v2; Vale_Def_Words_s.hi3 = v3;_} ->
        {
          Vale_Def_Words_s.lo0 = Prims.int_zero;
          Vale_Def_Words_s.lo1 = v0;
          Vale_Def_Words_s.hi2 = v1;
          Vale_Def_Words_s.hi3 = v2
        }
let (add_wrap_quad32 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun q0 ->
    fun q1 ->
      {
        Vale_Def_Words_s.lo0 =
          (Vale_Def_Types_s.add_wrap (Prims.parse_int "0x100000000")
             q0.Vale_Def_Words_s.lo0 q1.Vale_Def_Words_s.lo0);
        Vale_Def_Words_s.lo1 =
          (Vale_Def_Types_s.add_wrap (Prims.parse_int "0x100000000")
             q0.Vale_Def_Words_s.lo1 q1.Vale_Def_Words_s.lo1);
        Vale_Def_Words_s.hi2 =
          (Vale_Def_Types_s.add_wrap (Prims.parse_int "0x100000000")
             q0.Vale_Def_Words_s.hi2 q1.Vale_Def_Words_s.hi2);
        Vale_Def_Words_s.hi3 =
          (Vale_Def_Types_s.add_wrap (Prims.parse_int "0x100000000")
             q0.Vale_Def_Words_s.hi3 q1.Vale_Def_Words_s.hi3)
      }







let (quad32_double_lo : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.double32)
  = fun q -> (Vale_Def_Words_Four_s.four_to_two_two q).Vale_Def_Words_s.lo
let (quad32_double_hi : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.double32)
  = fun q -> (Vale_Def_Words_Four_s.four_to_two_two q).Vale_Def_Words_s.hi





let (quad32_to_seq :
  Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat32 FStar_Seq_Base.seq) =
  fun q -> Vale_Def_Words_Seq_s.four_to_seq_LE q


let (lo64_def : Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat64) =
  fun q ->
    Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
      (Vale_Def_Words_Two_s.two_select
         (Vale_Def_Words_Four_s.four_to_two_two q) Prims.int_zero)
let (lo64 : Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat64) =
  Vale_Def_Opaque_s.opaque_make lo64_def

let (hi64_def : Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat64) =
  fun q ->
    Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
      (Vale_Def_Words_Two_s.two_select
         (Vale_Def_Words_Four_s.four_to_two_two q) Prims.int_one)
let (hi64 : Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat64) =
  Vale_Def_Opaque_s.opaque_make hi64_def























let (be_quad32_to_bytes :
  Vale_Def_Types_s.quad32 -> Vale_Def_Words_s.nat8 Vale_Def_Words_Seq_s.seq16)
  =
  fun q ->
    Vale_Def_Words_Seq_s.seq_four_to_seq_BE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)))
         (Vale_Def_Words_Seq_s.four_to_seq_BE q))

let (reverse_bytes_nat32_quad32 :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    let uu___ = q in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
        Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
        {
          Vale_Def_Words_s.lo0 = (Vale_Def_Types_s.reverse_bytes_nat32 x0);
          Vale_Def_Words_s.lo1 = (Vale_Def_Types_s.reverse_bytes_nat32 x1);
          Vale_Def_Words_s.hi2 = (Vale_Def_Types_s.reverse_bytes_nat32 x2);
          Vale_Def_Words_s.hi3 = (Vale_Def_Types_s.reverse_bytes_nat32 x3)
        }

let (reverse_bytes_nat32_quad32_seq :
  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq)
  = fun q -> Vale_Lib_Seqs_s.seq_map reverse_bytes_nat32_quad32 q

let (reverse_bytes_quad32_seq :
  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq)
  = fun s -> Vale_Lib_Seqs_s.seq_map Vale_Def_Types_s.reverse_bytes_quad32 s






