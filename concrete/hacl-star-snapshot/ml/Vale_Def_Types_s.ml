open Prims
type nat8 = Vale_Def_Words_s.nat8
type nat16 = Vale_Def_Words_s.nat16
type nat32 = Vale_Def_Words_s.nat32
type nat64 = Vale_Def_Words_s.nat64
let (add_wrap :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN)
  = fun n -> fun x -> fun y -> if (x + y) < n then x + y else (x + y) - n
let (sub_wrap :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN)
  =
  fun n ->
    fun x ->
      fun y -> if (x - y) >= Prims.int_zero then x - y else (x - y) + n
let (iand :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN)
  = fun n -> fun a -> fun b -> failwith "Not yet implemented:iand"
let (ixor :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN)
  = fun n -> fun a -> fun b -> failwith "Not yet implemented:ixor"
let (ior :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN)
  = fun n -> fun a -> fun b -> failwith "Not yet implemented:ior"
let (inot :
  Prims.nat -> unit Vale_Def_Words_s.natN -> unit Vale_Def_Words_s.natN) =
  fun n -> fun a -> failwith "Not yet implemented:inot"
let (ishl :
  Prims.nat ->
    unit Vale_Def_Words_s.natN -> Prims.int -> unit Vale_Def_Words_s.natN)
  = fun n -> fun a -> fun s -> failwith "Not yet implemented:ishl"
let (ishr :
  Prims.nat ->
    unit Vale_Def_Words_s.natN -> Prims.int -> unit Vale_Def_Words_s.natN)
  = fun n -> fun a -> fun s -> failwith "Not yet implemented:ishr"
let (nat32_xor :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  = fun x -> fun y -> ixor (Prims.parse_int "0x100000000") x y
type twobits = unit Vale_Def_Words_s.natN
type bits_of_byte = twobits Vale_Def_Words_s.four
let (byte_to_twobits : Vale_Def_Words_s.nat8 -> bits_of_byte) =
  fun b ->
    let n1 = (Prims.of_int (4)) in
    let n2 = (Prims.of_int (16)) in
    let n3 = (Prims.of_int (64)) in
    let n4 = (Prims.of_int (256)) in
    {
      Vale_Def_Words_s.lo0 = (b mod n1);
      Vale_Def_Words_s.lo1 = ((b / n1) mod n1);
      Vale_Def_Words_s.hi2 = ((b / n2) mod n1);
      Vale_Def_Words_s.hi3 = ((b / n3) mod n1)
    }
type double32 = Vale_Def_Words_s.nat32 Vale_Def_Words_s.two
type quad32 = Vale_Def_Words_s.nat32 Vale_Def_Words_s.four
let (quad32_xor_def : quad32 -> quad32 -> quad32) =
  fun x ->
    fun y ->
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          let uu___1 = y in
          (match uu___1 with
           | { Vale_Def_Words_s.lo0 = y0; Vale_Def_Words_s.lo1 = y1;
               Vale_Def_Words_s.hi2 = y2; Vale_Def_Words_s.hi3 = y3;_} ->
               {
                 Vale_Def_Words_s.lo0 =
                   (ixor (Prims.parse_int "0x100000000") x0 y0);
                 Vale_Def_Words_s.lo1 =
                   (ixor (Prims.parse_int "0x100000000") x1 y1);
                 Vale_Def_Words_s.hi2 =
                   (ixor (Prims.parse_int "0x100000000") x2 y2);
                 Vale_Def_Words_s.hi3 =
                   (ixor (Prims.parse_int "0x100000000") x3 y3)
               })
let (quad32_xor : quad32 -> quad32 -> quad32) =
  Vale_Def_Opaque_s.opaque_make quad32_xor_def

let (select_word : quad32 -> twobits -> Vale_Def_Words_s.nat32) =
  fun q -> fun selector -> Vale_Def_Words_Four_s.four_select q selector
let (insert_nat32 : quad32 -> Vale_Def_Words_s.nat32 -> twobits -> quad32) =
  fun q -> fun n -> fun i -> Vale_Def_Words_Four_s.four_insert q n i
let (insert_nat64_def :
  quad32 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat1 -> quad32) =
  fun q ->
    fun n ->
      fun i ->
        Vale_Def_Words_Four_s.two_two_to_four
          (Vale_Def_Words_Two_s.two_insert
             (Vale_Def_Words_Four_s.four_to_two_two q)
             (Vale_Def_Words_Two_s.nat_to_two (Prims.of_int (32)) n) i)
let (insert_nat64 :
  quad32 -> Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat1 -> quad32) =
  Vale_Def_Opaque_s.opaque_make insert_nat64_def

let (le_bytes_to_nat32 :
  Vale_Def_Words_s.nat8 Vale_Def_Words_Seq_s.seq4 -> Vale_Def_Words_s.nat32)
  =
  fun b ->
    Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
      (Vale_Def_Words_Seq_s.seq_to_four_LE b)
let (nat32_to_le_bytes :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat8 Vale_Def_Words_Seq_s.seq4)
  =
  fun n ->
    let b =
      Vale_Def_Words_Seq_s.four_to_seq_LE
        (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)) n) in
    b
let (be_bytes_to_nat32 :
  Vale_Def_Words_s.nat8 Vale_Def_Words_Seq_s.seq4 -> Vale_Def_Words_s.nat32)
  =
  fun b ->
    Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
      (Vale_Def_Words_Seq_s.seq_to_four_BE b)
let (nat32_to_be_bytes :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat8 Vale_Def_Words_Seq_s.seq4)
  =
  fun n ->
    let b =
      Vale_Def_Words_Seq_s.four_to_seq_BE
        (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)) n) in
    b
let (le_bytes_to_nat64_def :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> Vale_Def_Words_s.nat64) =
  fun b ->
    Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
      (Vale_Def_Words_Seq_s.seq_to_two_LE
         (Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE b))
let (le_bytes_to_nat64 :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> Vale_Def_Words_s.nat64) =
  Vale_Def_Opaque_s.opaque_make le_bytes_to_nat64_def

let (le_nat64_to_bytes_def :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat8 FStar_Seq_Base.seq) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_nat32_to_seq_nat8_LE
      (Vale_Def_Words_Seq_s.two_to_seq_LE
         (Vale_Def_Words_Two_s.nat_to_two (Prims.of_int (32)) b))
let (le_nat64_to_bytes :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat8 FStar_Seq_Base.seq) =
  Vale_Def_Opaque_s.opaque_make le_nat64_to_bytes_def

let (le_bytes_to_quad32_def :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_to_four_LE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8)))
         (Vale_Def_Words_Seq_s.seq_to_seq_four_LE b))
let (le_bytes_to_quad32 : Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32)
  = Vale_Def_Opaque_s.opaque_make le_bytes_to_quad32_def

let (be_bytes_to_quad32_def :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_to_four_BE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8)))
         (Vale_Def_Words_Seq_s.seq_to_seq_four_BE b))
let (be_bytes_to_quad32 : Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32)
  = Vale_Def_Opaque_s.opaque_make be_bytes_to_quad32_def

let (le_quad32_to_bytes : quad32 -> Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun b ->
    Vale_Def_Words_Seq_s.seq_four_to_seq_LE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)))
         (Vale_Def_Words_Seq_s.four_to_seq_LE b))
let (le_seq_quad32_to_bytes_def :
  quad32 FStar_Seq_Base.seq -> Vale_Def_Words_s.nat8 FStar_Seq_Base.seq) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_nat32_to_seq_nat8_LE
      (Vale_Def_Words_Seq_s.seq_four_to_seq_LE b)
let (le_seq_quad32_to_bytes :
  quad32 FStar_Seq_Base.seq -> Vale_Def_Words_s.nat8 FStar_Seq_Base.seq) =
  Vale_Def_Opaque_s.opaque_make le_seq_quad32_to_bytes_def


let (le_bytes_to_seq_quad32 :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32 FStar_Seq_Base.seq) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_to_seq_four_LE
      (Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE b)
let (be_bytes_to_seq_quad32 :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> quad32 FStar_Seq_Base.seq) =
  fun b ->
    Vale_Def_Words_Seq_s.seq_to_seq_four_BE
      (Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_BE b)
let (reverse_bytes_nat32_def :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32) =
  fun n ->
    be_bytes_to_nat32 (Vale_Lib_Seqs_s.reverse_seq (nat32_to_be_bytes n))
let (reverse_bytes_nat32 : Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  = Vale_Def_Opaque_s.opaque_make reverse_bytes_nat32_def

let (reverse_bytes_nat64_def :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64) =
  fun n ->
    let uu___ = Vale_Def_Words_Two_s.nat_to_two (Prims.of_int (32)) n in
    match uu___ with
    | { Vale_Def_Words_s.lo = n0; Vale_Def_Words_s.hi = n1;_} ->
        Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
          {
            Vale_Def_Words_s.lo = (reverse_bytes_nat32 n1);
            Vale_Def_Words_s.hi = (reverse_bytes_nat32 n0)
          }
let (reverse_bytes_nat64 : Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat64)
  = Vale_Def_Opaque_s.opaque_make reverse_bytes_nat64_def

let (reverse_bytes_quad32 : quad32 -> quad32) =
  fun q -> failwith "Not yet implemented:reverse_bytes_quad32"
let (reverse_bytes_nat32_seq :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq)
  = fun s -> failwith "Not yet implemented:reverse_bytes_nat32_seq"