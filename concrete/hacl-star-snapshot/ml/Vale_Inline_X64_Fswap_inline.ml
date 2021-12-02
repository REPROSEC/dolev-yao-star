open Prims
type u256 = FStar_UInt64.t LowStar_Buffer.buffer
type u512 = FStar_UInt64.t LowStar_Buffer.buffer
type u1024 = FStar_UInt64.t LowStar_Buffer.buffer

type uint64 = FStar_UInt64.t
let as_t : 'a . 'a -> 'a = fun x -> x
let as_normal_t : 'a . 'a -> 'a = fun x -> x
type b64 = (unit, unit) Vale_Interop_Base.buf_t
let (t64_mod : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_Buffer
    (Vale_Arch_HeapTypes_s.TUInt64, Vale_Arch_HeapTypes_s.TUInt64,
      Vale_Interop_Base.default_bq)
let (t64_no_mod : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_Buffer
    (Vale_Arch_HeapTypes_s.TUInt64, Vale_Arch_HeapTypes_s.TUInt64,
      {
        Vale_Interop_Base.modified = false;
        Vale_Interop_Base.taint = Vale_Arch_HeapTypes_s.Secret;
        Vale_Interop_Base.strict_disjointness = false
      })
let (tuint64 : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64
let (cswap_dom : (unit, Vale_Interop_Base.td) Vale_Interop_X64.arity_ok) =
  let y = [tuint64; t64_mod; t64_mod] in y


let (cswap_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      (((r = (Prims.of_int (5))) || (r = (Prims.of_int (8)))) ||
         (r = (Prims.of_int (9))))
        || (r = (Prims.of_int (10)))
    then true
    else false
let cswap_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_cswap :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastUtil.va_code_Cswap2 ()
let (of_reg :
  Vale_X64_Machine_s.reg_64 ->
    unit Vale_Interop_X64.reg_nat FStar_Pervasives_Native.option)
  =
  fun r ->
    match r with
    | uu___ when uu___ = (Prims.of_int (5)) ->
        FStar_Pervasives_Native.Some Prims.int_zero
    | uu___ when uu___ = (Prims.of_int (4)) ->
        FStar_Pervasives_Native.Some Prims.int_one
    | uu___ when uu___ = (Prims.of_int (3)) ->
        FStar_Pervasives_Native.Some (Prims.of_int (2))
    | uu___ -> FStar_Pervasives_Native.None
let (of_arg : unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) =
  fun i ->
    match i with
    | uu___ when uu___ = Prims.int_zero -> (Prims.of_int (5))
    | uu___ when uu___ = Prims.int_one -> (Prims.of_int (4))
    | uu___ when uu___ = (Prims.of_int (2)) -> (Prims.of_int (3))
let (arg_reg : unit Vale_Interop_X64.arg_reg_relation') =
  Vale_Interop_X64.Rel (of_reg, of_arg)
type lowstar_cswap_t = Obj.t
let (lowstar_cswap : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg cswap_regs_modified
    cswap_xmms_modified (Obj.magic code_cswap) cswap_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_cswap cswap_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_cswap
       cswap_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       cswap_regs_modified cswap_xmms_modified code_cswap cswap_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_cswap_normal_t :
  FStar_UInt64.t ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_cswap)) uu___3 uu___2 uu___1 uu___
let (cswap2 :
  FStar_UInt64.t ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun bit ->
    fun p0 -> fun p1 -> let uu___ = lowstar_cswap_normal_t bit p0 p1 () in ()
let (cswap_comments : Prims.string Prims.list) =
  ["Computes p1 <- bit ? p2 : p1 in constant time"]
let (cswap_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "bit"
    | uu___ when uu___ = Prims.int_one -> "p1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "p2"
    | uu___ -> ""
let (cswap2_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "cswap2" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length cswap_dom)
      cswap_dom cswap_names (Obj.magic code_cswap) of_arg cswap_regs_modified
      cswap_comments