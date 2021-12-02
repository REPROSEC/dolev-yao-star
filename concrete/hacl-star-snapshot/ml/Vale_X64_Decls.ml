open Prims
type vale_heap = Vale_Arch_HeapImpl.vale_heap
type vale_full_heap = Vale_Arch_HeapImpl.vale_full_heap
type heaplet_id = Vale_Arch_HeapImpl.heaplet_id
type quad32 = Vale_Def_Types_s.quad32


let (cf : Vale_X64_Flags.t -> Prims.bool) =
  fun flags ->
    match Vale_X64_Lemmas.cf flags with
    | FStar_Pervasives_Native.Some v -> v
    | FStar_Pervasives_Native.None -> false
let (overflow : Vale_X64_Flags.t -> Prims.bool) =
  fun flags ->
    match Vale_X64_Lemmas.overflow flags with
    | FStar_Pervasives_Native.Some v -> v
    | FStar_Pervasives_Native.None -> false
let (valid_cf : Vale_X64_Flags.t -> Prims.bool) =
  fun flags ->
    match Vale_X64_Lemmas.cf flags with
    | FStar_Pervasives_Native.Some v -> true
    | FStar_Pervasives_Native.None -> false
let (valid_of : Vale_X64_Flags.t -> Prims.bool) =
  fun flags ->
    match Vale_X64_Lemmas.overflow flags with
    | FStar_Pervasives_Native.Some v -> true
    | FStar_Pervasives_Native.None -> false
let (updated_cf : Vale_X64_Flags.t -> Prims.bool -> Prims.bool) =
  fun new_flags ->
    fun new_cf ->
      (Vale_X64_Lemmas.cf new_flags) = (FStar_Pervasives_Native.Some new_cf)
let (updated_of : Vale_X64_Flags.t -> Prims.bool -> Prims.bool) =
  fun new_flags ->
    fun new_cf ->
      (Vale_X64_Lemmas.overflow new_flags) =
        (FStar_Pervasives_Native.Some new_cf)
let (maintained_cf : Vale_X64_Flags.t -> Vale_X64_Flags.t -> Prims.bool) =
  fun new_flags ->
    fun flags -> (Vale_X64_Lemmas.cf new_flags) = (Vale_X64_Lemmas.cf flags)
let (maintained_of : Vale_X64_Flags.t -> Vale_X64_Flags.t -> Prims.bool) =
  fun new_flags ->
    fun flags ->
      (Vale_X64_Lemmas.overflow new_flags) = (Vale_X64_Lemmas.overflow flags)
let va_subscript : 'a 'b . ('a, 'b) FStar_Map.t -> 'a -> 'b =
  fun x -> fun y -> FStar_Map.sel x y
let va_update :
  'uuuuu 'uuuuu1 .
    unit ->
      ('uuuuu, 'uuuuu1) FStar_Map.t ->
        'uuuuu -> 'uuuuu1 -> ('uuuuu, 'uuuuu1) FStar_Map.t
  = fun uu___ -> FStar_Map.upd
let va_hd : 'uuuuu . unit -> 'uuuuu Prims.list -> 'uuuuu =
  fun uu___ -> Prims.__proj__Cons__item__hd
type ('ax, 's, 'x, 'xu) va_reveal_eq = unit


let total_if : 'a . Prims.bool -> 'a -> 'a -> 'a =
  fun b -> fun x -> fun y -> if b then x else y
let total_thunk_if : 'a . Prims.bool -> (unit -> 'a) -> (unit -> 'a) -> 'a =
  fun b -> fun x -> fun y -> if b then x () else y ()
type 'k va_int_at_least = Prims.int
type 'k va_int_at_most = Prims.int
type ('k1, 'k2) va_int_range = Prims.int
type ins = Vale_X64_Machine_Semantics_s.ins
type ocmp = Vale_X64_Machine_Semantics_s.ocmp
type va_code = (ins, ocmp) Vale_X64_Machine_s.precode
type va_codes = (ins, ocmp) Vale_X64_Machine_s.precode Prims.list

type va_state = Vale_X64_State.vale_state
type va_fuel = Prims.nat
type va_operand_opr64 = Vale_X64_Machine_s.operand64
type reg_operand = Vale_X64_Machine_s.operand64
type va_operand_reg_opr64 = Vale_X64_Machine_s.operand64
type va_operand_dst_opr64 = Vale_X64_Machine_s.operand64
type va_operand_shift_amt64 = Vale_X64_Machine_s.operand64
type cmp_operand = Vale_X64_Machine_s.operand64
type va_operand_xmm = Vale_X64_Machine_s.reg_xmm
type va_operand_opr128 = Vale_X64_Machine_s.operand128
type va_operand_heaplet = Vale_Arch_HeapImpl.heaplet_id
type va_pbool = unit Vale_Def_PossiblyMonad.possibly
let (va_ttrue : unit -> va_pbool) = fun uu___ -> Vale_Def_PossiblyMonad.Ok ()
let (va_ffalse : Prims.string -> va_pbool) =
  fun reason -> Vale_Def_PossiblyMonad.Err reason
let (va_pbool_and : va_pbool -> va_pbool -> va_pbool) =
  fun x -> fun y -> Vale_Def_PossiblyMonad.op_Amp_Amp_Dot x y
let (get_reason : va_pbool -> Prims.string FStar_Pervasives_Native.option) =
  fun p ->
    match p with
    | Vale_Def_PossiblyMonad.Ok () -> FStar_Pervasives_Native.None
    | Vale_Def_PossiblyMonad.Err reason ->
        FStar_Pervasives_Native.Some reason
type va_transformation_result =
  {
  success: va_pbool ;
  result: (ins, ocmp) Vale_X64_Machine_s.precode }
let (__proj__Mkva_transformation_result__item__success :
  va_transformation_result -> va_pbool) =
  fun projectee -> match projectee with | { success; result;_} -> success
let (__proj__Mkva_transformation_result__item__result :
  va_transformation_result -> (ins, ocmp) Vale_X64_Machine_s.precode) =
  fun projectee -> match projectee with | { success; result;_} -> result
let (va_get_success : va_transformation_result -> va_pbool) =
  fun r -> r.success
let (va_get_result :
  va_transformation_result -> (ins, ocmp) Vale_X64_Machine_s.precode) =
  fun r -> r.result

let (va_mul_nat : Prims.nat -> Prims.nat -> Prims.nat) =
  fun x -> fun y -> x * y
let (va_expand_state :
  Vale_X64_State.vale_state -> Vale_X64_State.vale_state) =
  fun s -> Vale_X64_State.state_eta s
let (get_reg : reg_operand -> Vale_X64_Machine_s.reg) =
  fun o ->
    Vale_X64_Machine_s.Reg
      (Prims.int_zero, (Vale_X64_Machine_s.__proj__OReg__item__r o))
type ('t, 'h, 'b) buffer_readable =
  (unit, unit, unit) Vale_X64_Memory.buffer_readable
type ('t, 'b) buffer_writeable =
  (unit, unit) Vale_X64_Memory.buffer_writeable






type ('t, 'm, 'b, 'i) valid_src_addr = unit
type ('t, 'm, 'b, 'i) valid_dst_addr = unit


type ('s, 'h1, 'h2) modifies_mem =
  (unit, unit, unit) Vale_X64_Memory.modifies

type 'ls locs_disjoint = Obj.t

type ('addr, 'sumem, 'layout, 'b, 'index, 't) valid_buf_maddr64 = unit
type ('addr, 'sumem, 'layout, 'b, 'index, 't) valid_buf_maddr128 = unit
type ('addr, 't, 'sumem, 'layout) valid_mem_operand64 = unit
type ('addr, 't, 'sumem, 'layout) valid_mem_operand128 = unit
type ('o, 's) valid_operand = unit
type ('o, 's) valid_operand128 = unit
let (va_fuel_default : unit -> va_fuel) = fun uu___ -> Prims.int_zero
let (va_op_xmm_xmm :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Machine_s.reg_xmm) = fun x -> x
let (va_op_opr64_reg64 :
  Vale_X64_Machine_s.reg_64 -> Vale_X64_Machine_s.operand64) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_op_reg64_reg64 :
  Vale_X64_Machine_s.reg_64 -> Vale_X64_Machine_s.operand64) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_op_opr128_xmm :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Machine_s.operand128) =
  fun x -> Vale_X64_Machine_s.OReg x
let (va_const_opr64 : Vale_Def_Words_s.nat64 -> Vale_X64_Machine_s.operand64)
  = fun n -> Vale_X64_Machine_s.OConst n
let (va_const_shift_amt64 :
  Vale_Def_Words_s.nat64 -> Vale_X64_Machine_s.operand64) =
  fun n -> Vale_X64_Machine_s.OConst n
let (va_op_shift_amt64_reg64 :
  Vale_X64_Machine_s.reg_64 -> Vale_X64_Machine_s.operand64) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_op_cmp_reg64 :
  Vale_X64_Machine_s.reg_64 -> Vale_X64_Machine_s.operand64) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_const_cmp : Vale_Def_Words_s.nat64 -> Vale_X64_Machine_s.operand64) =
  fun n -> Vale_X64_Machine_s.OConst n
let (va_coerce_reg64_opr64_to_cmp :
  va_operand_reg_opr64 -> Vale_X64_Machine_s.operand64) = fun r -> r
let (va_coerce_reg_opr64_to_dst_opr64 :
  va_operand_reg_opr64 -> Vale_X64_Machine_s.operand64) = fun o -> o
let (va_coerce_reg_opr64_to_opr64 :
  va_operand_reg_opr64 -> Vale_X64_Machine_s.operand64) = fun o -> o
let (va_coerce_opr64_to_cmp :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64) = fun o -> o
let (va_op_reg_opr64_reg64 : Vale_X64_Machine_s.reg_64 -> reg_operand) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_op_dst_opr64_reg64 :
  Vale_X64_Machine_s.reg_64 -> Vale_X64_Machine_s.operand64) =
  fun r -> Vale_X64_Machine_s.OReg r
let (va_coerce_dst_opr64_to_opr64 :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64) = fun o -> o
let (va_coerce_xmm_to_opr128 :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Machine_s.operand128) =
  fun x -> Vale_X64_Machine_s.OReg x
let (va_op_heaplet_mem_heaplet :
  Vale_Arch_HeapImpl.heaplet_id -> Vale_Arch_HeapImpl.heaplet_id) =
  fun h -> h
let (va_opr_code_Mem64 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Prims.int ->
        Vale_Arch_HeapTypes_s.taint -> Vale_X64_Machine_s.operand64)
  =
  fun h ->
    fun o ->
      fun offset ->
        fun t ->
          match o with
          | Vale_X64_Machine_s.OConst n ->
              Vale_X64_Machine_s.OMem
                ((Vale_X64_Machine_s.MConst (n + offset)), t)
          | Vale_X64_Machine_s.OReg r ->
              Vale_X64_Machine_s.OMem
                ((Vale_X64_Machine_s.MReg
                    ((Vale_X64_Machine_s.Reg (Prims.int_zero, r)), offset)),
                  t)
          | uu___ ->
              Vale_X64_Machine_s.OMem
                ((Vale_X64_Machine_s.MConst (Prims.of_int (42))), t)
let (va_opr_code_Stack :
  Vale_X64_Machine_s.operand64 ->
    Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Machine_s.operand64)
  =
  fun o ->
    fun offset ->
      fun t ->
        match o with
        | Vale_X64_Machine_s.OConst n ->
            Vale_X64_Machine_s.OStack
              ((Vale_X64_Machine_s.MConst (n + offset)), t)
        | Vale_X64_Machine_s.OReg r ->
            Vale_X64_Machine_s.OStack
              ((Vale_X64_Machine_s.MReg
                  ((Vale_X64_Machine_s.Reg (Prims.int_zero, r)), offset)), t)
        | uu___ ->
            Vale_X64_Machine_s.OStack
              ((Vale_X64_Machine_s.MConst (Prims.of_int (42))), t)
let (va_opr_code_Mem128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Prims.int ->
        Vale_Arch_HeapTypes_s.taint -> Vale_X64_Machine_s.operand128)
  =
  fun h ->
    fun o ->
      fun offset ->
        fun t ->
          match o with
          | Vale_X64_Machine_s.OReg r ->
              Vale_X64_Machine_s.OMem
                ((Vale_X64_Machine_s.MReg
                    ((Vale_X64_Machine_s.Reg (Prims.int_zero, r)), offset)),
                  t)
          | uu___ ->
              Vale_X64_Machine_s.OMem
                ((Vale_X64_Machine_s.MConst (Prims.of_int (42))), t)


let (taint_at :
  Vale_X64_Memory.memtaint -> Prims.int -> Vale_Arch_HeapTypes_s.taint) =
  fun memTaint -> fun addr -> FStar_Map.sel memTaint addr
let (va_get_ok : Vale_X64_State.vale_state -> Prims.bool) =
  fun s -> s.Vale_X64_State.vs_ok
let (va_get_flags : Vale_X64_State.vale_state -> Vale_X64_Flags.t) =
  fun s -> s.Vale_X64_State.vs_flags
let (va_get_reg64 :
  Vale_X64_Machine_s.reg_64 ->
    Vale_X64_State.vale_state -> Vale_Def_Words_s.nat64)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun r ->
         fun s ->
           Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
                s.Vale_X64_State.vs_regs)) uu___1 uu___
let (va_get_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_State.vale_state -> Vale_Def_Types_s.quad32)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun x ->
         fun s ->
           Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_one, x))
                s.Vale_X64_State.vs_regs)) uu___1 uu___
let (va_get_mem : Vale_X64_State.vale_state -> Vale_Arch_HeapImpl.vale_heap)
  = fun s -> Vale_X64_Memory.get_vale_heap s.Vale_X64_State.vs_heap
let (va_get_mem_layout :
  Vale_X64_State.vale_state -> Vale_Arch_HeapImpl.vale_heap_layout) =
  fun s -> (s.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_layout
let (va_get_mem_heaplet :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_State.vale_state -> Vale_Arch_HeapImpl.vale_heap)
  =
  fun n ->
    fun s ->
      Vale_Lib_Map16.sel
        (s.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets n
let (va_get_stack : Vale_X64_State.vale_state -> Vale_X64_Stack_i.vale_stack)
  = fun s -> s.Vale_X64_State.vs_stack
let (va_get_stackTaint :
  Vale_X64_State.vale_state -> Vale_X64_Memory.memtaint) =
  fun s -> s.Vale_X64_State.vs_stackTaint
let (va_upd_ok :
  Prims.bool -> Vale_X64_State.vale_state -> Vale_X64_State.vale_state) =
  fun ok ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = ok;
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
        Vale_X64_State.vs_heap = (uu___.Vale_X64_State.vs_heap);
        Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
        Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
      }
let (va_upd_flags :
  Vale_X64_Flags.t -> Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun flags ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = flags;
        Vale_X64_State.vs_heap = (uu___.Vale_X64_State.vs_heap);
        Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
        Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
      }
let (upd_register :
  Vale_X64_Machine_s.reg ->
    Obj.t -> Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun r -> fun v -> fun s -> Vale_X64_State.update_reg r v s
let (va_upd_reg64 :
  Vale_X64_Machine_s.reg_64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun r -> fun v -> fun s -> Vale_X64_State.update_reg_64 r v s
let (va_upd_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Types_s.quad32 ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun x -> fun v -> fun s -> Vale_X64_State.update_reg_xmm x v s
let (va_upd_mem :
  Vale_Arch_HeapImpl.vale_heap ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun mem ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
        Vale_X64_State.vs_heap =
          (Vale_X64_Memory.set_vale_heap s.Vale_X64_State.vs_heap mem);
        Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
        Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
      }
let (va_upd_mem_layout :
  Vale_Arch_HeapImpl.vale_heap_layout ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun layout ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
        Vale_X64_State.vs_heap =
          (let uu___1 = s.Vale_X64_State.vs_heap in
           {
             Vale_Arch_HeapImpl.vf_layout = layout;
             Vale_Arch_HeapImpl.vf_heap = (uu___1.Vale_Arch_HeapImpl.vf_heap);
             Vale_Arch_HeapImpl.vf_heaplets =
               (uu___1.Vale_Arch_HeapImpl.vf_heaplets)
           });
        Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
        Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
      }
let (va_upd_mem_heaplet :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_Arch_HeapImpl.vale_heap ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun n ->
    fun h ->
      fun s ->
        let uu___ = s in
        {
          Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
          Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
          Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
          Vale_X64_State.vs_heap =
            (let uu___1 = s.Vale_X64_State.vs_heap in
             {
               Vale_Arch_HeapImpl.vf_layout =
                 (uu___1.Vale_Arch_HeapImpl.vf_layout);
               Vale_Arch_HeapImpl.vf_heap =
                 (uu___1.Vale_Arch_HeapImpl.vf_heap);
               Vale_Arch_HeapImpl.vf_heaplets =
                 (Vale_Lib_Map16.upd
                    (s.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets
                    n h)
             });
          Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
          Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
        }
let (va_upd_stack :
  Vale_X64_Stack_i.vale_stack ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun stack ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
        Vale_X64_State.vs_heap = (uu___.Vale_X64_State.vs_heap);
        Vale_X64_State.vs_stack = stack;
        Vale_X64_State.vs_stackTaint = (uu___.Vale_X64_State.vs_stackTaint)
      }
let (va_upd_stackTaint :
  Vale_X64_Memory.memtaint ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun stackTaint ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_State.vs_ok = (uu___.Vale_X64_State.vs_ok);
        Vale_X64_State.vs_regs = (uu___.Vale_X64_State.vs_regs);
        Vale_X64_State.vs_flags = (uu___.Vale_X64_State.vs_flags);
        Vale_X64_State.vs_heap = (uu___.Vale_X64_State.vs_heap);
        Vale_X64_State.vs_stack = (uu___.Vale_X64_State.vs_stack);
        Vale_X64_State.vs_stackTaint = stackTaint
      }







let (va_eval_heaplet :
  Vale_X64_State.vale_state ->
    Vale_Arch_HeapImpl.heaplet_id -> Vale_Arch_HeapImpl.vale_heap)
  =
  fun s ->
    fun h ->
      Vale_Lib_Map16.sel
        (s.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets h
type ('o, 's) va_is_src_opr64 = unit
let (va_is_dst_opr64 :
  Vale_X64_Machine_s.operand64 -> Vale_X64_State.vale_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OReg r ->
          Prims.op_Negation (r = (Prims.of_int (7)))
      | uu___ -> false
let (va_is_dst_dst_opr64 :
  Vale_X64_Machine_s.operand64 -> Vale_X64_State.vale_state -> Prims.bool) =
  fun o -> fun s -> va_is_dst_opr64 o s
type ('o, 's) va_is_src_shift_amt64 = unit
let (va_is_src_reg_opr64 :
  Vale_X64_Machine_s.operand64 -> Vale_X64_State.vale_state -> Prims.bool) =
  fun o -> fun s -> Vale_X64_Machine_s.uu___is_OReg o
type ('o, 's) va_is_dst_reg_opr64 = unit
type ('x, 's) va_is_src_xmm = unit
type ('x, 's) va_is_dst_xmm = unit
type ('o, 's) va_is_src_opr128 = unit
type ('o, 's) va_is_dst_opr128 = unit
type ('h, 's) va_is_src_heaplet = unit
type ('h, 's) va_is_dst_heaplet = unit
let (va_update_ok :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun sM -> fun sK -> va_upd_ok sM.Vale_X64_State.vs_ok sK
let (va_update_flags :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun sM -> fun sK -> va_upd_flags sM.Vale_X64_State.vs_flags sK
let (update_register :
  Vale_X64_Machine_s.reg ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun r ->
    fun sM ->
      fun sK ->
        upd_register r (Vale_X64_Regs.sel r sM.Vale_X64_State.vs_regs) sK
let (va_update_reg64 :
  Vale_X64_Machine_s.reg_64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun r ->
    fun sM ->
      fun sK ->
        va_upd_reg64 r
          (Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
                sM.Vale_X64_State.vs_regs)) sK
let (va_update_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun x ->
    fun sM ->
      fun sK ->
        va_upd_xmm x
          (Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_one, x))
                sM.Vale_X64_State.vs_regs)) sK
let (va_update_mem :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun sM ->
    fun sK ->
      va_upd_mem (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heap sK
let (va_update_mem_layout :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun sM ->
    fun sK ->
      va_upd_mem_layout
        (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_layout sK
let (va_update_mem_heaplet :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun n ->
    fun sM ->
      fun sK ->
        va_upd_mem_heaplet n
          (Vale_Lib_Map16.sel
             (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets n) sK
let (va_update_stack :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun sM -> fun sK -> va_upd_stack sM.Vale_X64_State.vs_stack sK
let (va_update_stackTaint :
  Vale_X64_State.vale_state ->
    Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun sM -> fun sK -> va_upd_stackTaint sM.Vale_X64_State.vs_stackTaint sK
let (update_operand :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun o ->
    fun sM ->
      fun sK ->
        match o with
        | Vale_X64_Machine_s.OConst n -> sK
        | Vale_X64_Machine_s.OReg r ->
            va_upd_reg64 r
              (Obj.magic
                 (Vale_X64_Regs.sel
                    (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
                    sM.Vale_X64_State.vs_regs)) sK
        | Vale_X64_Machine_s.OMem (m, uu___) ->
            va_upd_mem (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heap
              sK
        | Vale_X64_Machine_s.OStack (m, uu___) ->
            va_upd_stack sM.Vale_X64_State.vs_stack sK
let (update_dst_operand :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun o -> fun sM -> fun sK -> update_operand o sM sK
let (va_update_operand_dst_opr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun o -> fun sM -> fun sK -> update_operand o sM sK
let (va_update_operand_opr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun o -> fun sM -> fun sK -> update_operand o sM sK
let (va_update_operand_reg_opr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun o -> fun sM -> fun sK -> update_operand o sM sK
let (va_update_operand_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun x ->
    fun sM ->
      fun sK ->
        Vale_X64_State.update_reg_xmm x
          (Obj.magic
             (Vale_X64_Regs.sel (Vale_X64_Machine_s.Reg (Prims.int_one, x))
                sM.Vale_X64_State.vs_regs)) sK
let (va_update_operand_heaplet :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun h ->
    fun sM ->
      fun sK ->
        va_upd_mem_heaplet h
          (Vale_Lib_Map16.sel
             (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets h) sK
type va_value_opr64 = Vale_Def_Words_s.nat64
type va_value_dst_opr64 = Vale_Def_Words_s.nat64
type va_value_reg_opr64 = Vale_Def_Words_s.nat64
type va_value_xmm = Vale_Def_Types_s.quad32
type va_value_heaplet = Vale_Arch_HeapImpl.vale_heap
let (va_upd_operand_xmm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Types_s.quad32 ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun x -> fun v -> fun s -> Vale_X64_State.update_reg_xmm x v s
let (va_upd_operand_dst_opr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun o ->
    fun v ->
      fun s ->
        match o with
        | Vale_X64_Machine_s.OConst n -> s
        | Vale_X64_Machine_s.OReg r -> Vale_X64_State.update_reg_64 r v s
        | Vale_X64_Machine_s.OMem (m, uu___) -> s
        | Vale_X64_Machine_s.OStack (m, uu___) -> s
let (va_upd_operand_reg_opr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun o ->
    fun v ->
      fun s ->
        match o with
        | Vale_X64_Machine_s.OConst n -> s
        | Vale_X64_Machine_s.OReg r -> Vale_X64_State.update_reg_64 r v s
        | Vale_X64_Machine_s.OMem (m, uu___) -> s
        | Vale_X64_Machine_s.OStack (m, uu___) -> s
let (va_upd_operand_heaplet :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_Arch_HeapImpl.vale_heap ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  = fun h -> fun v -> fun s -> va_upd_mem_heaplet h v s

let (va_CNil : unit -> (ins, ocmp) Vale_X64_Machine_s.precode Prims.list) =
  fun uu___ -> []
let (va_CCons :
  (ins, ocmp) Vale_X64_Machine_s.precode ->
    (ins, ocmp) Vale_X64_Machine_s.precode Prims.list ->
      (ins, ocmp) Vale_X64_Machine_s.precode Prims.list)
  = fun hd -> fun tl -> hd :: tl
let (va_Block :
  (ins, ocmp) Vale_X64_Machine_s.precode Prims.list ->
    (ins, ocmp) Vale_X64_Machine_s.precode)
  = fun block -> Vale_X64_Machine_s.Block block
let (va_IfElse :
  ocmp ->
    (ins, ocmp) Vale_X64_Machine_s.precode ->
      (ins, ocmp) Vale_X64_Machine_s.precode ->
        (ins, ocmp) Vale_X64_Machine_s.precode)
  =
  fun ifCond ->
    fun ifTrue ->
      fun ifFalse -> Vale_X64_Machine_s.IfElse (ifCond, ifTrue, ifFalse)
let (va_While :
  ocmp ->
    (ins, ocmp) Vale_X64_Machine_s.precode ->
      (ins, ocmp) Vale_X64_Machine_s.precode)
  =
  fun whileCond ->
    fun whileBody -> Vale_X64_Machine_s.While (whileCond, whileBody)
let (va_cmp_eq :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.OEq (o1, o2)
let (va_cmp_ne :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.ONe (o1, o2)
let (va_cmp_le :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.OLe (o1, o2)
let (va_cmp_ge :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.OGe (o1, o2)
let (va_cmp_lt :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.OLt (o1, o2)
let (va_cmp_gt :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.operand64 -> ocmp) =
  fun o1 -> fun o2 -> Vale_X64_Bytes_Code_s.OGt (o1, o2)
let (va_get_block :
  (ins, ocmp) Vale_X64_Machine_s.precode ->
    (ins, ocmp) Vale_X64_Machine_s.precode Prims.list)
  = fun c -> Vale_X64_Machine_s.__proj__Block__item__block c
let (va_get_ifCond : (ins, ocmp) Vale_X64_Machine_s.precode -> ocmp) =
  fun c -> Vale_X64_Machine_s.__proj__IfElse__item__ifCond c
let (va_get_ifTrue :
  (ins, ocmp) Vale_X64_Machine_s.precode ->
    (ins, ocmp) Vale_X64_Machine_s.precode)
  = fun c -> Vale_X64_Machine_s.__proj__IfElse__item__ifTrue c
let (va_get_ifFalse :
  (ins, ocmp) Vale_X64_Machine_s.precode ->
    (ins, ocmp) Vale_X64_Machine_s.precode)
  = fun c -> Vale_X64_Machine_s.__proj__IfElse__item__ifFalse c
let (va_get_whileCond : (ins, ocmp) Vale_X64_Machine_s.precode -> ocmp) =
  fun c -> Vale_X64_Machine_s.__proj__While__item__whileCond c
let (va_get_whileBody :
  (ins, ocmp) Vale_X64_Machine_s.precode ->
    (ins, ocmp) Vale_X64_Machine_s.precode)
  = fun c -> Vale_X64_Machine_s.__proj__While__item__whileBody c
type ('h, 'l) buffers_readable = Obj.t
type ('b, 'h1, 'h2) modifies_buffer =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('b1, 'b2, 'h1, 'h2) modifies_buffer_2 =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('b1, 'b2, 'b3, 'h1, 'h2) modifies_buffer_3 =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('b, 'h1, 'h2) modifies_buffer128 =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('b1, 'b2, 'h1, 'h2) modifies_buffer128_2 =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('b1, 'b2, 'b3, 'h1, 'h2) modifies_buffer128_3 =
  (unit, unit, unit) Vale_X64_Memory.modifies
type ('t, 'h, 'addr, 'b, 'len, 'layout, 'tn) validSrcAddrs = unit
type ('t, 'h, 'addr, 'b, 'len, 'layout, 'tn) validDstAddrs = unit
type ('h, 'addr, 'b, 'len, 'layout, 'tn) validSrcAddrs64 = unit
type ('h, 'addr, 'b, 'len, 'layout, 'tn) validDstAddrs64 = unit
type ('h, 'addr, 'b, 'len, 'layout, 'tn) validSrcAddrs128 = unit
type ('h, 'addr, 'b, 'len, 'layout, 'tn) validDstAddrs128 = unit
type ('h, 'addr, 'b, 'offset, 'len, 'layout, 'tn) validSrcAddrsOffset128 =
  unit
type ('h, 'addr, 'b, 'offset, 'len, 'layout, 'tn) validDstAddrsOffset128 =
  unit
type ('b, 'h1, 'h2, 'start, 'last) modifies_buffer_specific128 = unit
type ('b, 'h1, 'h2, 'start, 'last) buffer_modifies_specific128 = unit
type ('b, 'h1, 'h2, 'start, 'last) modifies_buffer_specific = unit
type ('b1, 'b2) buffers_disjoint = unit
type ('b1, 'b2) buffers_disjoint128 = unit
type ('l, 'ls) loc_locs_disjoint_rec128 = Obj.t
type ('l, 'ls) buffer_disjoints128 = Obj.t
type ('b1, 'b2, 'b3) buffers3_disjoint128 = unit
type ('c, 's0, 'f0, 'sN) eval_code = Obj.t
type ('c, 's0, 'fW, 'sW) eval_while_inv =
  (unit, unit, unit, unit) Vale_X64_Lemmas.eval_while_inv
type ('s0, 's1) va_state_eq = unit
type 's state_inv = unit Vale_X64_Memory.mem_inv
type vale_state_with_inv = Vale_X64_State.vale_state
type ('c0, 'c1, 's0) va_require_total = unit
type ('c0, 's0, 's1, 'f1) va_ensure_total = unit




let (havoc_flags : Vale_X64_Flags.t) = Vale_X64_Lemmas.havoc_flags













let (va_compute_merge_total : va_fuel -> va_fuel -> va_fuel) =
  Vale_X64_Lemmas.compute_merge_total





type ('b, 'c, 's0, 'sN, 'f0) va_whileInv_total = unit




type printer = Vale_X64_Print_s.printer
let (print_string : Prims.string -> unit) = FStar_IO.print_string
let (print_header : printer -> unit) = Vale_X64_Print_s.print_header
let (print_proc :
  Prims.string ->
    (ins, ocmp) Vale_X64_Machine_s.precode ->
      Prims.int -> printer -> Prims.int)
  = Vale_X64_Print_s.print_proc
let (print_footer : printer -> unit) = Vale_X64_Print_s.print_footer
let (masm : printer) = Vale_X64_Print_s.masm
let (gcc : printer) = Vale_X64_Print_s.gcc
type memTaint_type = (Prims.int, Vale_Arch_HeapTypes_s.taint) FStar_Map.t
type ('o1, 'o2) max_one_mem = Obj.t