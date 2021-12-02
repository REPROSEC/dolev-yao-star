open Prims
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
let (fsqr_dom : (unit, Vale_Interop_Base.td) Vale_Interop_X64.arity_ok) =
  let y = [t64_mod; t64_no_mod; t64_mod] in y


let (fsqr_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      (((((((((((((r = Prims.int_zero) || (r = Prims.int_one)) ||
                   (r = (Prims.of_int (2))))
                  || (r = (Prims.of_int (3))))
                 || (r = (Prims.of_int (5))))
                || (r = (Prims.of_int (4))))
               || (r = (Prims.of_int (8))))
              || (r = (Prims.of_int (9))))
             || (r = (Prims.of_int (10))))
            || (r = (Prims.of_int (11))))
           || (r = (Prims.of_int (12))))
          || (r = (Prims.of_int (13))))
         || (r = (Prims.of_int (14))))
        || (r = (Prims.of_int (15)))
    then true
    else false
let fsqr_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_Fsqr :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastWide.va_code_Fsqr ()
let (of_reg :
  Vale_X64_Machine_s.reg_64 ->
    unit Vale_Interop_X64.reg_nat FStar_Pervasives_Native.option)
  =
  fun r ->
    match r with
    | uu___ when uu___ = (Prims.of_int (12)) ->
        FStar_Pervasives_Native.Some Prims.int_zero
    | uu___ when uu___ = (Prims.of_int (4)) ->
        FStar_Pervasives_Native.Some Prims.int_one
    | uu___ when uu___ = (Prims.of_int (5)) ->
        FStar_Pervasives_Native.Some (Prims.of_int (2))
    | uu___ -> FStar_Pervasives_Native.None
let (of_arg : unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) =
  fun i ->
    match i with
    | uu___ when uu___ = Prims.int_zero -> (Prims.of_int (12))
    | uu___ when uu___ = Prims.int_one -> (Prims.of_int (4))
    | uu___ when uu___ = (Prims.of_int (2)) -> (Prims.of_int (5))
let (arg_reg : unit Vale_Interop_X64.arg_reg_relation') =
  Vale_Interop_X64.Rel (of_reg, of_arg)
type lowstar_Fsqr_t = Obj.t
let (lowstar_Fsqr : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg fsqr_regs_modified
    fsqr_xmms_modified (Obj.magic code_Fsqr) fsqr_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_Fsqr fsqr_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_Fsqr
       fsqr_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       fsqr_regs_modified fsqr_xmms_modified code_Fsqr fsqr_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_Fsqr_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_Fsqr)) uu___3 uu___2 uu___1 uu___
let (fsqr :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 ->
      fun tmp -> let uu___ = lowstar_Fsqr_normal_t out f1 tmp () in ()
let (fsqr_comments : Prims.string Prims.list) =
  ["Computes the square of a field element: out <- f * f";
  "Uses the 8-element buffer tmp for intermediate results"]
let (fsqr_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f"
    | uu___ when uu___ = (Prims.of_int (2)) -> "tmp"
    | uu___ -> ""
let (fsqr_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fsqr" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fsqr_dom)
      fsqr_dom fsqr_names (Obj.magic code_Fsqr) of_arg fsqr_regs_modified
      fsqr_comments




let (code_Fsqr2 :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastWide.va_code_Fsqr2 ()
type lowstar_Fsqr2_t = Obj.t
let (lowstar_Fsqr2 : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg fsqr_regs_modified
    fsqr_xmms_modified (Obj.magic code_Fsqr2) fsqr_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_Fsqr2 fsqr_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_Fsqr2
       fsqr_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       fsqr_regs_modified fsqr_xmms_modified code_Fsqr2 fsqr_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_Fsqr2_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_Fsqr2)) uu___3 uu___2 uu___1 uu___
let (fsqr2 :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 ->
      fun tmp -> let uu___ = lowstar_Fsqr2_normal_t out f1 tmp () in ()
let (fsqr2_comments : Prims.string Prims.list) =
  ["Computes two field squarings:";
  "  out[0] <- f[0] * f[0]";
  "  out[1] <- f[1] * f[1]";
  "Uses the 16-element buffer tmp for intermediate results"]
let (fsqr2_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f"
    | uu___ when uu___ = (Prims.of_int (2)) -> "tmp"
    | uu___ -> ""
let (fsqr2_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fsqr2" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fsqr_dom)
      fsqr_dom fsqr2_names (Obj.magic code_Fsqr2) of_arg fsqr_regs_modified
      fsqr2_comments