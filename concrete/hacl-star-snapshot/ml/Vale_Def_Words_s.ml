open Prims
type 'a two = {
  lo: 'a ;
  hi: 'a }
let __proj__Mktwo__item__lo : 'a . 'a two -> 'a =
  fun projectee -> match projectee with | { lo; hi;_} -> lo
let __proj__Mktwo__item__hi : 'a . 'a two -> 'a =
  fun projectee -> match projectee with | { lo; hi;_} -> hi
type 'a four = {
  lo0: 'a ;
  lo1: 'a ;
  hi2: 'a ;
  hi3: 'a }
let __proj__Mkfour__item__lo0 : 'a . 'a four -> 'a =
  fun projectee -> match projectee with | { lo0; lo1; hi2; hi3;_} -> lo0
let __proj__Mkfour__item__lo1 : 'a . 'a four -> 'a =
  fun projectee -> match projectee with | { lo0; lo1; hi2; hi3;_} -> lo1
let __proj__Mkfour__item__hi2 : 'a . 'a four -> 'a =
  fun projectee -> match projectee with | { lo0; lo1; hi2; hi3;_} -> hi2
let __proj__Mkfour__item__hi3 : 'a . 'a four -> 'a =
  fun projectee -> match projectee with | { lo0; lo1; hi2; hi3;_} -> hi3
type 'a eight =
  {
  lo_0: 'a ;
  lo_1: 'a ;
  lo_2: 'a ;
  lo_3: 'a ;
  hi_4: 'a ;
  hi_5: 'a ;
  hi_6: 'a ;
  hi_7: 'a }
let __proj__Mkeight__item__lo_0 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> lo_0
let __proj__Mkeight__item__lo_1 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> lo_1
let __proj__Mkeight__item__lo_2 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> lo_2
let __proj__Mkeight__item__lo_3 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> lo_3
let __proj__Mkeight__item__hi_4 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> hi_4
let __proj__Mkeight__item__hi_5 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> hi_5
let __proj__Mkeight__item__hi_6 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> hi_6
let __proj__Mkeight__item__hi_7 : 'a . 'a eight -> 'a =
  fun projectee ->
    match projectee with
    | { lo_0; lo_1; lo_2; lo_3; hi_4; hi_5; hi_6; hi_7;_} -> hi_7
let (pow2_norm : Prims.nat -> Prims.pos) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> Prims.int_one
    | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (n - Prims.int_one))
let (pow2_1 : Prims.int) = (Prims.of_int (0x2))
let (pow2_2 : Prims.int) = (Prims.of_int (0x4))
let (pow2_4 : Prims.int) = (Prims.of_int (0x10))
let (pow2_8 : Prims.int) = (Prims.of_int (0x100))
let (pow2_16 : Prims.int) = (Prims.parse_int "0x10000")
let (pow2_32 : Prims.int) = (Prims.parse_int "0x100000000")
let (pow2_64 : Prims.int) = (Prims.parse_int "0x10000000000000000")
let (pow2_128 : Prims.int) =
  (Prims.parse_int "0x100000000000000000000000000000000")
type 'n natN = Prims.nat
type nat1 = unit natN
type nat2 = unit natN
type nat4 = unit natN
type nat8 = unit natN
type nat16 = unit natN
type nat32 = unit natN
type nat64 = unit natN
type nat128 = unit natN





let (int_to_natN : Prims.pos -> Prims.int -> unit natN) =
  fun n -> fun i -> i mod n