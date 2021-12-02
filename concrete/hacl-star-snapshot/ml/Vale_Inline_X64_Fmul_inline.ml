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
let (fmul_dom : (unit, Vale_Interop_Base.td) Vale_Interop_X64.arity_ok) =
  let y = [t64_mod; t64_no_mod; t64_no_mod; t64_mod] in y


let (fmul_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      ((((((((((((r = Prims.int_zero) || (r = Prims.int_one)) ||
                  (r = (Prims.of_int (2))))
                 || (r = (Prims.of_int (3))))
                || (r = (Prims.of_int (5))))
               || (r = (Prims.of_int (4))))
              || (r = (Prims.of_int (8))))
             || (r = (Prims.of_int (9))))
            || (r = (Prims.of_int (10))))
           || (r = (Prims.of_int (11))))
          || (r = (Prims.of_int (13))))
         || (r = (Prims.of_int (14))))
        || (r = (Prims.of_int (15)))
    then true
    else false
let fmul_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_Fmul :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastWide.va_code_Fmul ()
let (fmul_of_reg :
  Vale_X64_Machine_s.reg_64 ->
    unit Vale_Interop_X64.reg_nat FStar_Pervasives_Native.option)
  =
  fun r ->
    match r with
    | uu___ when uu___ = (Prims.of_int (15)) ->
        FStar_Pervasives_Native.Some Prims.int_zero
    | uu___ when uu___ = (Prims.of_int (4)) ->
        FStar_Pervasives_Native.Some Prims.int_one
    | uu___ when uu___ = (Prims.of_int (2)) ->
        FStar_Pervasives_Native.Some (Prims.of_int (2))
    | uu___ when uu___ = (Prims.of_int (5)) ->
        FStar_Pervasives_Native.Some (Prims.of_int (3))
    | uu___ -> FStar_Pervasives_Native.None
let (fmul_of_arg :
  unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) =
  fun i ->
    match i with
    | uu___ when uu___ = Prims.int_zero -> (Prims.of_int (15))
    | uu___ when uu___ = Prims.int_one -> (Prims.of_int (4))
    | uu___ when uu___ = (Prims.of_int (2)) -> (Prims.of_int (2))
    | uu___ when uu___ = (Prims.of_int (3)) -> (Prims.of_int (5))
let (fmul_arg_reg : unit Vale_Interop_X64.arg_reg_relation') =
  Vale_Interop_X64.Rel (fmul_of_reg, fmul_of_arg)
let (lowstar_fmul : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (4)) fmul_arg_reg
    fmul_regs_modified fmul_xmms_modified (Obj.magic code_Fmul) fmul_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (4)) fmul_arg_reg
       code_Fmul fmul_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (4)) code_Fmul
       fmul_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (4)) fmul_arg_reg
       fmul_regs_modified fmul_xmms_modified code_Fmul fmul_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_fmul_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        FStar_UInt64.t LowStar_Buffer.buffer ->
          unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (Obj.magic (as_normal_t lowstar_fmul)) uu___4 uu___3 uu___2
              uu___1 uu___

let (fmul :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 ->
      fun f2 ->
        fun tmp -> let uu___ = lowstar_fmul_normal_t out f1 f2 tmp () in ()
let (fmul_comments : Prims.string Prims.list) =
  ["Computes a field multiplication: out <- f1 * f2";
  "Uses the 8-element buffer tmp for intermediate results"]
let (fmul_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ when uu___ = (Prims.of_int (3)) -> "tmp"
    | uu___ -> ""
let (fmul_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fmul" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fmul_dom)
      fmul_dom fmul_names (Obj.magic code_Fmul) fmul_of_arg
      fmul_regs_modified fmul_comments




let (code_Fmul2 :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastWide.va_code_Fmul2 ()
type lowstar_fmul2_t = Obj.t
let (lowstar_fmul2 : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (4)) fmul_arg_reg
    fmul_regs_modified fmul_xmms_modified (Obj.magic code_Fmul2) fmul_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (4)) fmul_arg_reg
       code_Fmul2 fmul_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (4)) code_Fmul2
       fmul_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (4)) fmul_arg_reg
       fmul_regs_modified fmul_xmms_modified code_Fmul2 fmul_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_fmul2_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        FStar_UInt64.t LowStar_Buffer.buffer ->
          unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (Obj.magic (as_normal_t lowstar_fmul2)) uu___4 uu___3 uu___2
              uu___1 uu___
let (fmul2 :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 ->
      fun f2 ->
        fun tmp -> let uu___ = lowstar_fmul2_normal_t out f1 f2 tmp () in ()
let (fmul2_comments : Prims.string Prims.list) =
  ["Computes two field multiplications:";
  "  out[0] <- f1[0] * f2[0]";
  "  out[1] <- f1[1] * f2[1]";
  "Uses the 16-element buffer tmp for intermediate results:"]
let (fmul2_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ when uu___ = (Prims.of_int (3)) -> "tmp"
    | uu___ -> ""
let (fmul2_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fmul2" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fmul_dom)
      fmul_dom fmul2_names (Obj.magic code_Fmul2) fmul_of_arg
      fmul_regs_modified fmul2_comments
let (fmul1_dom : (unit, Vale_Interop_Base.td) Vale_Interop_X64.arity_ok) =
  let y = [t64_mod; t64_no_mod; tuint64] in y


let (fmul1_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      ((((((((r = Prims.int_zero) || (r = Prims.int_one)) ||
              (r = (Prims.of_int (2))))
             || (r = (Prims.of_int (3))))
            || (r = (Prims.of_int (8))))
           || (r = (Prims.of_int (9))))
          || (r = (Prims.of_int (10))))
         || (r = (Prims.of_int (11))))
        || (r = (Prims.of_int (13)))
    then true
    else false
let fmul1_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_Fmul1 :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastHybrid.va_code_Fmul1 ()
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
type lowstar_fmul1_t = Obj.t
let (lowstar_fmul1 : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg fmul1_regs_modified
    fmul1_xmms_modified (Obj.magic code_Fmul1) fmul1_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_Fmul1 fmul1_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_Fmul1
       fmul1_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       fmul1_regs_modified fmul1_xmms_modified code_Fmul1 fmul1_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_fmul1_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t -> unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_fmul1)) uu___3 uu___2 uu___1 uu___
let (fmul_scalar :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer -> FStar_UInt64.t -> unit)
  =
  fun out ->
    fun f1 -> fun f2 -> let uu___ = lowstar_fmul1_normal_t out f1 f2 () in ()
let (fmul1_comments : Prims.string Prims.list) =
  ["Computes the field multiplication of four-element f1 with value in f2";
  "Requires f2 to be smaller than 2^17"]
let (fmul1_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ -> ""
let (fmul1_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fmul_scalar" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fmul1_dom)
      fmul1_dom fmul1_names (Obj.magic code_Fmul1) of_arg fmul1_regs_modified
      fmul1_comments