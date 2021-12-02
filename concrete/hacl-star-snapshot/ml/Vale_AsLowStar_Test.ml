open Prims
let as_t : 'a . 'a -> 'a = fun x -> x
let as_normal_t : 'a . 'a -> 'a = fun x -> x
type b64 = (unit, unit) Vale_Interop_Base.buf_t
type ib64 = (unit, unit) Vale_Interop_Base.ibuf_t
let (t64_mod : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_Buffer
    (Vale_Arch_HeapTypes_s.TUInt8, Vale_Arch_HeapTypes_s.TUInt64,
      Vale_Interop_Base.default_bq)
let (t64_no_mod : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_Buffer
    (Vale_Arch_HeapTypes_s.TUInt8, Vale_Arch_HeapTypes_s.TUInt64,
      {
        Vale_Interop_Base.modified = false;
        Vale_Interop_Base.taint = Vale_Arch_HeapTypes_s.Secret;
        Vale_Interop_Base.strict_disjointness = false
      })
let (t64_imm : Vale_Interop_Base.td) =
  Vale_Interop_Base.TD_ImmBuffer
    (Vale_Arch_HeapTypes_s.TUInt8, Vale_Arch_HeapTypes_s.TUInt64,
      {
        Vale_Interop_Base.modified = false;
        Vale_Interop_Base.taint = Vale_Arch_HeapTypes_s.Secret;
        Vale_Interop_Base.strict_disjointness = false
      })
let (dom : Vale_Interop_Base.td Prims.list) = let y = [t64_mod; t64_imm] in y
let (c :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Obj.magic (fun uu___ -> failwith "Not yet implemented:c")
type call_c_t = Obj.t
let (call_c : Obj.t) =
  Vale_Interop_X64.wrap_weak_stdcall (Obj.magic c) dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall c dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic Vale_Interop_X64.max_stdcall c
       dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall
       Vale_Interop_X64.regs_modified_stdcall
       Vale_Interop_X64.xmms_modified_stdcall c dom [] (Obj.repr ())
       (Obj.repr ()) (Obj.repr ()))
let (call_c_normal_t :
  FStar_UInt8.t LowStar_Buffer.buffer ->
    FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
      unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ -> (Obj.magic (as_normal_t call_c)) uu___2 uu___1 uu___
let (vm_dom : Vale_Interop_Base.td Prims.list) = [t64_mod; t64_imm]




let (code_Memcpy :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Test_X64_Vale_memcpy.va_code_Memcpy Vale_Interop_Assumptions.win
type lowstar_Memcpy_t = Obj.t
let (lowstar_Memcpy : Obj.t) =
  Vale_Interop_X64.wrap_weak_stdcall (Obj.magic code_Memcpy) vm_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall code_Memcpy vm_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic Vale_Interop_X64.max_stdcall
       code_Memcpy vm_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall
       Vale_Interop_X64.regs_modified_stdcall
       Vale_Interop_X64.xmms_modified_stdcall code_Memcpy vm_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_Memcpy_normal_t :
  FStar_UInt8.t LowStar_Buffer.buffer ->
    FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
      unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (Obj.magic (as_normal_t lowstar_Memcpy)) uu___2 uu___1 uu___


let (memcpy_Test :
  FStar_UInt8.t LowStar_Buffer.buffer ->
    FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer -> FStar_UInt64.t)
  =
  fun dst ->
    fun src ->
      let uu___ = lowstar_Memcpy_normal_t dst src () in
      match uu___ with
      | (x, uu___1) -> let h1 = FStar_HyperStack_ST.get () in x
let empty_list : 'a . unit -> 'a Prims.list = fun uu___ -> []
let (aesni_dom : Vale_Interop_Base.td Vale_Interop_X64.arity_ok_stdcall) = []


let with_len : 'a . 'a Prims.list -> 'a Prims.list = fun l -> l


let (code_aesni :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Lib_X64_Cpuidstdcall.va_code_Check_aesni_stdcall
    Vale_Interop_Assumptions.win
type lowstar_aesni_t = Obj.t
let (lowstar_aesni : Obj.t) =
  Vale_Interop_X64.wrap_weak_stdcall (Obj.magic code_aesni) aesni_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall code_aesni aesni_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic Vale_Interop_X64.max_stdcall
       code_aesni aesni_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall
       Vale_Interop_X64.regs_modified_stdcall
       Vale_Interop_X64.xmms_modified_stdcall code_aesni aesni_dom []
       (Obj.repr ()) (Obj.repr ()) (Obj.repr ()))
let (lowstar_aesni_normal_t : unit -> Vale_Interop_X64.als_ret) =
  fun uu___ -> (Obj.magic (as_normal_t lowstar_aesni)) uu___
let (aesni_Test : unit -> FStar_UInt64.t) =
  fun uu___ ->
    let uu___1 = lowstar_aesni_normal_t () in
    match uu___1 with | (x, uu___2) -> x
let (ta_dom : Vale_Interop_Base.td Prims.list) =
  let y =
    [t64_imm; t64_imm; t64_imm; t64_imm; t64_imm; t64_imm; t64_imm; t64_imm] in
  y




let (code_ta :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode) =
  Vale_Test_X64_Args.va_code_Test Vale_Interop_Assumptions.win
type lowstar_ta_t = Obj.t
let (lowstar_ta : Obj.t) =
  Vale_Interop_X64.wrap_weak_stdcall (Obj.magic code_ta) ta_dom
    (Vale_AsLowStar_Wrapper.pre_rel_generic Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall code_ta ta_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.post_rel_generic Vale_Interop_X64.max_stdcall
       code_ta ta_dom [] (Obj.repr ()))
    (Vale_AsLowStar_Wrapper.mk_prediction Vale_Interop_X64.max_stdcall
       Vale_Interop_X64.arg_reg_stdcall
       Vale_Interop_X64.regs_modified_stdcall
       Vale_Interop_X64.xmms_modified_stdcall code_ta ta_dom [] (Obj.repr ())
       (Obj.repr ()) (Obj.repr ()))
let (lowstar_ta_normal_t :
  FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
    FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
      FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
        FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
          FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
            FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
              FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
                FStar_UInt8.t LowStar_ImmutableBuffer.ibuffer ->
                  unit -> Vale_Interop_X64.als_ret)
  =
  fun uu___8 ->
    fun uu___7 ->
      fun uu___6 ->
        fun uu___5 ->
          fun uu___4 ->
            fun uu___3 ->
              fun uu___2 ->
                fun uu___1 ->
                  fun uu___ ->
                    (Obj.magic (as_normal_t lowstar_ta)) uu___8 uu___7 uu___6
                      uu___5 uu___4 uu___3 uu___2 uu___1 uu___