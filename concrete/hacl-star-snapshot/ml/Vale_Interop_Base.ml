open Prims
type ('src, 't) buf_t = Obj.t LowStar_Buffer.buffer
type ('src, 't) ibuf_t = Obj.t LowStar_ImmutableBuffer.ibuffer

let (default_v_of_typ : Vale_Arch_HeapTypes_s.base_typ -> Obj.t) =
  fun t ->
    match t with
    | Vale_Arch_HeapTypes_s.TUInt8 ->
        Obj.repr (FStar_UInt8.uint_to_t Prims.int_zero)
    | Vale_Arch_HeapTypes_s.TUInt16 ->
        Obj.repr (FStar_UInt16.uint_to_t Prims.int_zero)
    | Vale_Arch_HeapTypes_s.TUInt32 ->
        Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
    | Vale_Arch_HeapTypes_s.TUInt64 ->
        Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)
    | Vale_Arch_HeapTypes_s.TUInt128 ->
        Obj.repr
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = Prims.int_zero;
            Vale_Def_Words_s.hi2 = Prims.int_zero;
            Vale_Def_Words_s.hi3 = Prims.int_zero
          }


let coerce : 'a 'b . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___
type buffer_qualifiers =
  {
  modified: Prims.bool ;
  taint: Vale_Arch_HeapTypes_s.taint ;
  strict_disjointness: Prims.bool }
let (__proj__Mkbuffer_qualifiers__item__modified :
  buffer_qualifiers -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { modified; taint; strict_disjointness;_} -> modified
let (__proj__Mkbuffer_qualifiers__item__taint :
  buffer_qualifiers -> Vale_Arch_HeapTypes_s.taint) =
  fun projectee ->
    match projectee with | { modified; taint; strict_disjointness;_} -> taint
let (__proj__Mkbuffer_qualifiers__item__strict_disjointness :
  buffer_qualifiers -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { modified; taint; strict_disjointness;_} -> strict_disjointness
let (default_bq : buffer_qualifiers) =
  {
    modified = true;
    taint = Vale_Arch_HeapTypes_s.Secret;
    strict_disjointness = false
  }
let (stack_bq : buffer_qualifiers) =
  {
    modified = true;
    taint = Vale_Arch_HeapTypes_s.Public;
    strict_disjointness = true
  }
type valid_base_type = Vale_Arch_HeapTypes_s.base_typ
type td =
  | TD_Base of valid_base_type 
  | TD_Buffer of Vale_Arch_HeapTypes_s.base_typ *
  Vale_Arch_HeapTypes_s.base_typ * buffer_qualifiers 
  | TD_ImmBuffer of Vale_Arch_HeapTypes_s.base_typ *
  Vale_Arch_HeapTypes_s.base_typ * buffer_qualifiers 
let (uu___is_TD_Base : td -> Prims.bool) =
  fun projectee -> match projectee with | TD_Base _0 -> true | uu___ -> false
let (__proj__TD_Base__item___0 : td -> valid_base_type) =
  fun projectee -> match projectee with | TD_Base _0 -> _0
let (uu___is_TD_Buffer : td -> Prims.bool) =
  fun projectee ->
    match projectee with | TD_Buffer (_0, _1, _2) -> true | uu___ -> false
let (__proj__TD_Buffer__item___0 : td -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee -> match projectee with | TD_Buffer (_0, _1, _2) -> _0
let (__proj__TD_Buffer__item___1 : td -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee -> match projectee with | TD_Buffer (_0, _1, _2) -> _1
let (__proj__TD_Buffer__item___2 : td -> buffer_qualifiers) =
  fun projectee -> match projectee with | TD_Buffer (_0, _1, _2) -> _2
let (uu___is_TD_ImmBuffer : td -> Prims.bool) =
  fun projectee ->
    match projectee with | TD_ImmBuffer (_0, _1, _2) -> true | uu___ -> false
let (__proj__TD_ImmBuffer__item___0 : td -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee -> match projectee with | TD_ImmBuffer (_0, _1, _2) -> _0
let (__proj__TD_ImmBuffer__item___1 : td -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee -> match projectee with | TD_ImmBuffer (_0, _1, _2) -> _1
let (__proj__TD_ImmBuffer__item___2 : td -> buffer_qualifiers) =
  fun projectee -> match projectee with | TD_ImmBuffer (_0, _1, _2) -> _2
let normal : 'a . 'a -> 'a = fun x -> x
type 'uuuuu td_as_type = Obj.t
type arg = (td, Obj.t) Prims.dtuple2
type ('dom, 'codom) n_arrow = Obj.t
type ('dom, 'codom) arr = 'dom -> 'codom
let (elim_1 : td Prims.list -> unit -> Obj.t -> Obj.t -> Obj.t) =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun dom -> fun r -> fun f -> Obj.magic f) uu___3 uu___2 uu___1
            uu___
let (elim_nil : td Prims.list -> unit -> Obj.t -> Obj.t) =
  fun dom -> fun r -> fun f -> f
let intro_n_arrow_nil : 'a . 'a -> Obj.t =
  fun uu___ -> (fun x -> Obj.magic x) uu___
let (intro_n_arrow_cons :
  td -> unit -> td Prims.list -> (Obj.t -> Obj.t) -> Obj.t) =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun hd -> fun b -> fun tl -> fun x -> Obj.magic x) uu___3 uu___2
            uu___1 uu___
type ('dom, 'codom) n_dep_arrow = Obj.t
let intro_dep_arrow_nil : 'b . 'b -> Obj.t =
  fun uu___ -> (fun f -> Obj.magic f) uu___
let (intro_dep_arrow_1 : td -> unit -> (Obj.t -> Obj.t) -> Obj.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a -> fun b -> fun f -> Obj.magic f) uu___2 uu___1 uu___
let (intro_dep_arrow_cons :
  td -> td Prims.list -> Obj.t -> (Obj.t -> Obj.t) -> Obj.t) =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun hd -> fun tl -> fun b -> fun f -> Obj.magic f) uu___3 uu___2
            uu___1 uu___
let (elim_dep_arrow_nil : unit -> Obj.t -> Obj.t) = fun codom -> fun f -> f
let (elim_dep_arrow_cons :
  td -> td Prims.list -> Obj.t -> Obj.t -> Obj.t -> Obj.t) =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (fun hd -> fun tl -> fun codom -> fun f -> Obj.magic f) uu___4
              uu___3 uu___2 uu___1 uu___
let (__test : Obj.t) = Obj.magic (fun x -> intro_dep_arrow_nil x)
type ('src1, 'src2, 'rel1, 'rrel1, 'rel2, 'rrel2, 'x, 'y) disjoint_not_eq =
  unit
type ('a, 'b) disjoint_or_eq_1 = Obj.t
type 'l disjoint_or_eq = Obj.t
type ('h, 'x) live_arg = Obj.t
type ('h, 'bs) all_live = Obj.t
type ('h0, 'args) mem_roots_p = unit
type 'args mem_roots = FStar_Monotonic_HyperStack.mem















let (arg_of_lb :
  Vale_Arch_HeapTypes_s.base_typ ->
    Vale_Arch_HeapTypes_s.base_typ -> (unit, unit) buf_t -> arg)
  =
  fun src ->
    fun t ->
      fun x ->
        Prims.Mkdtuple2 ((TD_Buffer (src, t, default_bq)), (Obj.magic x))
let (arg_of_sb : Vale_Arch_HeapTypes_s.base_typ -> (unit, unit) buf_t -> arg)
  =
  fun t ->
    fun x ->
      Prims.Mkdtuple2
        ((TD_Buffer (Vale_Arch_HeapTypes_s.TUInt64, t, stack_bq)),
          (Obj.magic x))


