open Prims
type vale_state =
  {
  vs_ok: Prims.bool ;
  vs_regs: Vale_X64_Regs.t ;
  vs_flags: Vale_X64_Flags.t ;
  vs_heap: Vale_Arch_HeapImpl.vale_full_heap ;
  vs_stack: Vale_X64_Stack_i.vale_stack ;
  vs_stackTaint: Vale_X64_Memory.memtaint }
let (__proj__Mkvale_state__item__vs_ok : vale_state -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_ok
let (__proj__Mkvale_state__item__vs_regs : vale_state -> Vale_X64_Regs.t) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_regs
let (__proj__Mkvale_state__item__vs_flags : vale_state -> Vale_X64_Flags.t) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_flags
let (__proj__Mkvale_state__item__vs_heap :
  vale_state -> Vale_Arch_HeapImpl.vale_full_heap) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_heap
let (__proj__Mkvale_state__item__vs_stack :
  vale_state -> Vale_X64_Stack_i.vale_stack) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_stack
let (__proj__Mkvale_state__item__vs_stackTaint :
  vale_state -> Vale_X64_Memory.memtaint) =
  fun projectee ->
    match projectee with
    | { vs_ok; vs_regs; vs_flags; vs_heap; vs_stack; vs_stackTaint;_} ->
        vs_stackTaint
let (vs_get_vale_heap : vale_state -> Vale_Arch_HeapImpl.vale_heap) =
  fun s -> Vale_X64_Memory.get_vale_heap s.vs_heap
let (eval_reg : Vale_X64_Machine_s.reg -> vale_state -> Obj.t) =
  fun r -> fun s -> Vale_X64_Regs.sel r s.vs_regs
let (eval_reg_int : Vale_X64_Machine_s.reg -> vale_state -> Prims.int) =
  fun r ->
    fun s ->
      Vale_X64_Machine_s.t_reg_to_int
        (Vale_X64_Machine_s.__proj__Reg__item__rf r)
        (Vale_X64_Regs.sel r s.vs_regs)
let (eval_flag :
  Vale_X64_Machine_s.flag ->
    vale_state -> Prims.bool FStar_Pervasives_Native.option)
  = fun f -> fun s -> Vale_X64_Flags.sel f s.vs_flags




let (eval_reg_64 :
  Vale_X64_Machine_s.reg_64 -> vale_state -> Vale_Def_Words_s.nat64) =
  fun uu___1 ->
    fun uu___ ->
      (fun r ->
         fun s ->
           Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
                s.vs_regs)) uu___1 uu___
let (eval_reg_xmm :
  Vale_X64_Machine_s.reg_xmm -> vale_state -> Vale_Def_Types_s.quad32) =
  fun uu___1 ->
    fun uu___ ->
      (fun r ->
         fun s ->
           Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_one, r))
                s.vs_regs)) uu___1 uu___
let (eval_maddr : Vale_X64_Machine_s.maddr -> vale_state -> Prims.int) =
  fun m ->
    fun s ->
      match m with
      | Vale_X64_Machine_s.MConst n -> n
      | Vale_X64_Machine_s.MReg (r, offset) ->
          (Vale_X64_Machine_s.t_reg_to_int
             (Vale_X64_Machine_s.__proj__Reg__item__rf r)
             (Vale_X64_Regs.sel r s.vs_regs))
            + offset
      | Vale_X64_Machine_s.MIndex (base, scale, index, offset) ->
          ((Vale_X64_Machine_s.t_reg_to_int
              (Vale_X64_Machine_s.__proj__Reg__item__rf base)
              (Vale_X64_Regs.sel base s.vs_regs))
             +
             (scale *
                (Vale_X64_Machine_s.t_reg_to_int
                   (Vale_X64_Machine_s.__proj__Reg__item__rf index)
                   (Vale_X64_Regs.sel index s.vs_regs))))
            + offset


let (update_reg :
  Vale_X64_Machine_s.reg -> Obj.t -> vale_state -> vale_state) =
  fun r ->
    fun v ->
      fun s ->
        let uu___ = s in
        {
          vs_ok = (uu___.vs_ok);
          vs_regs = (Vale_X64_Regs.upd r v s.vs_regs);
          vs_flags = (uu___.vs_flags);
          vs_heap = (uu___.vs_heap);
          vs_stack = (uu___.vs_stack);
          vs_stackTaint = (uu___.vs_stackTaint)
        }
let (update_reg_64 :
  Vale_X64_Machine_s.reg_64 ->
    Vale_Def_Words_s.nat64 -> vale_state -> vale_state)
  =
  fun r ->
    fun v ->
      fun s ->
        update_reg (Vale_X64_Machine_s.Reg (Prims.int_zero, r)) (Obj.magic v)
          s
let (update_flag :
  Vale_X64_Machine_s.flag ->
    Prims.bool FStar_Pervasives_Native.option -> vale_state -> vale_state)
  =
  fun f ->
    fun v ->
      fun s ->
        let uu___ = s in
        {
          vs_ok = (uu___.vs_ok);
          vs_regs = (uu___.vs_regs);
          vs_flags = (Vale_X64_Flags.upd f v s.vs_flags);
          vs_heap = (uu___.vs_heap);
          vs_stack = (uu___.vs_stack);
          vs_stackTaint = (uu___.vs_stackTaint)
        }
let (update_reg_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Types_s.quad32 -> vale_state -> vale_state)
  =
  fun r ->
    fun v ->
      fun s ->
        update_reg (Vale_X64_Machine_s.Reg (Prims.int_one, r)) (Obj.magic v)
          s

type ('m, 's) valid_maddr = unit
type ('m, 's) valid_maddr128 = unit
type ('o, 's) valid_src_operand = Obj.t
type ('o, 's) valid_src_operand128 = Obj.t
let (state_eta : vale_state -> vale_state) =
  fun s ->
    let uu___ = s in
    {
      vs_ok = (uu___.vs_ok);
      vs_regs = (Vale_X64_Regs.eta s.vs_regs);
      vs_flags = (uu___.vs_flags);
      vs_heap =
        (let uu___1 = s.vs_heap in
         {
           Vale_Arch_HeapImpl.vf_layout =
             (uu___1.Vale_Arch_HeapImpl.vf_layout);
           Vale_Arch_HeapImpl.vf_heap = (uu___1.Vale_Arch_HeapImpl.vf_heap);
           Vale_Arch_HeapImpl.vf_heaplets =
             (Vale_Lib_Map16.eta (s.vs_heap).Vale_Arch_HeapImpl.vf_heaplets)
         });
      vs_stack = (uu___.vs_stack);
      vs_stackTaint = (uu___.vs_stackTaint)
    }
type ('s0, 's1) state_eq = unit