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
let (dom : (unit, Vale_Interop_Base.td) Vale_Interop_X64.arity_ok) =
  let y = [t64_mod; t64_no_mod; tuint64] in y


let (add1_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      (((((r = Prims.int_zero) || (r = (Prims.of_int (3)))) ||
           (r = (Prims.of_int (8))))
          || (r = (Prims.of_int (9))))
         || (r = (Prims.of_int (10))))
        || (r = (Prims.of_int (11)))
    then true
    else false
let add1_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_add1 :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastUtil.va_code_Fast_add1 ()
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
type lowstar_add1_t = Obj.t
let (lowstar_add1 : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg add1_regs_modified
    add1_xmms_modified (Obj.magic code_add1) dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_add1 dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_add1 dom
       [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       add1_regs_modified add1_xmms_modified code_add1 dom [] (Obj.repr ())
       (Obj.repr ()) (Obj.repr ()))
let (lowstar_add1_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t -> unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_add1)) uu___3 uu___2 uu___1 uu___
let (add_scalar :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer -> FStar_UInt64.t -> FStar_UInt64.t)
  =
  fun out ->
    fun f1 ->
      fun f2 ->
        let uu___ = lowstar_add1_normal_t out f1 f2 () in
        match uu___ with | (x, uu___1) -> x
let (add1_comments : Prims.string Prims.list) =
  ["Computes the addition of four-element f1 with value in f2";
  "and returns the carry (if any)"]
let (add1_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ -> ""
let (add1_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "add_scalar" Prims.int_zero
      (FStar_Pervasives_Native.Some "carry_r")
      (FStar_List_Tot_Base.length dom) dom add1_names (Obj.magic code_add1)
      of_arg add1_regs_modified add1_comments
let (fadd_dom : Vale_Interop_Base.td Vale_Interop_X64.arity_ok_stdcall) =
  let y = [t64_mod; t64_no_mod; t64_no_mod] in y


let (fadd_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      ((((((r = Prims.int_zero) || (r = (Prims.of_int (2)))) ||
            (r = (Prims.of_int (3))))
           || (r = (Prims.of_int (8))))
          || (r = (Prims.of_int (9))))
         || (r = (Prims.of_int (10))))
        || (r = (Prims.of_int (11)))
    then true
    else false
let fadd_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_Fadd :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastHybrid.va_code_Fadd ()
type lowstar_fadd_t = Obj.t
let (lowstar_fadd : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg fadd_regs_modified
    fadd_xmms_modified (Obj.magic code_Fadd) fadd_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_Fadd fadd_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_Fadd
       fadd_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       fadd_regs_modified fadd_xmms_modified code_Fadd fadd_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_fadd_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_fadd)) uu___3 uu___2 uu___1 uu___
let (fadd :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 -> fun f2 -> let uu___ = lowstar_fadd_normal_t out f1 f2 () in ()
let (fadd_comments : Prims.string Prims.list) =
  ["Computes the field addition of two field elements"]
let (fadd_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ -> ""
let (fadd_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fadd" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fadd_dom)
      fadd_dom fadd_names (Obj.magic code_Fadd) of_arg fadd_regs_modified
      fadd_comments
let (fsub_dom : Vale_Interop_Base.td Vale_Interop_X64.arity_ok_stdcall) =
  let y = [t64_mod; t64_no_mod; t64_no_mod] in y


let (fsub_regs_modified : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if
      (((((r = Prims.int_zero) || (r = (Prims.of_int (2)))) ||
           (r = (Prims.of_int (8))))
          || (r = (Prims.of_int (9))))
         || (r = (Prims.of_int (10))))
        || (r = (Prims.of_int (11)))
    then true
    else false
let fsub_xmms_modified : 'uuuuu . 'uuuuu -> Prims.bool = fun uu___ -> false


let (code_Fsub :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Curve25519_X64_FastHybrid.va_code_Fsub ()
type lowstar_Fsub_t = Obj.t
let (lowstar_Fsub : Obj.t) =
  Vale_Interop_X64.wrap_weak (Prims.of_int (3)) arg_reg fsub_regs_modified
    fsub_xmms_modified (Obj.magic code_Fsub) fsub_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic (Prims.of_int (3)) arg_reg
       code_Fsub fsub_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic (Prims.of_int (3)) code_Fsub
       fsub_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction (Prims.of_int (3)) arg_reg
       fsub_regs_modified fsub_xmms_modified code_Fsub fsub_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_Fsub_normal_t :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer ->
        unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (Obj.magic (as_normal_t lowstar_Fsub)) uu___3 uu___2 uu___1 uu___
let (fsub :
  FStar_UInt64.t LowStar_Buffer.buffer ->
    FStar_UInt64.t LowStar_Buffer.buffer ->
      FStar_UInt64.t LowStar_Buffer.buffer -> unit)
  =
  fun out ->
    fun f1 -> fun f2 -> let uu___ = lowstar_Fsub_normal_t out f1 f2 () in ()
let (fsub_comments : Prims.string Prims.list) =
  ["Computes the field substraction of two field elements"]
let (fsub_names : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> "out"
    | uu___ when uu___ = Prims.int_one -> "f1"
    | uu___ when uu___ = (Prims.of_int (2)) -> "f2"
    | uu___ -> ""
let (fsub_code_inline : unit -> Prims.int) =
  fun uu___ ->
    Vale_X64_Print_Inline_s.print_inline "fsub" Prims.int_zero
      FStar_Pervasives_Native.None (FStar_List_Tot_Base.length fsub_dom)
      fsub_dom fsub_names (Obj.magic code_Fsub) of_arg fsub_regs_modified
      fsub_comments