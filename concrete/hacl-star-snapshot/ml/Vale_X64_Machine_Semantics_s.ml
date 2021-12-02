open Prims
let op_String_Access :
  'uuuuu 'uuuuu1 . unit -> ('uuuuu, 'uuuuu1) FStar_Map.t -> 'uuuuu -> 'uuuuu1
  = fun uu___ -> FStar_Map.sel
let op_String_Assignment :
  'uuuuu 'uuuuu1 .
    unit ->
      ('uuuuu, 'uuuuu1) FStar_Map.t ->
        'uuuuu -> 'uuuuu1 -> ('uuuuu, 'uuuuu1) FStar_Map.t
  = fun uu___ -> FStar_Map.upd
type ('x1, 'x2) equals_instr = unit
type 'it instr_annotation =
  | AnnotateNone 
  | AnnotateXor64 of unit 
  | AnnotatePxor of unit 
  | AnnotateVPxor of unit 
  | AnnotateGhost of unit 
  | AnnotateComment of Prims.string 
  | AnnotateLargeComment of Prims.string 
  | AnnotateNewline of unit 
  | AnnotateSpace of Prims.nat 
  | AnnotateMovbe64 of unit 
  | AnnotateMov64 of unit 
  | AnnotatePrefetchnta of unit 
let (uu___is_AnnotateNone :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateNone -> true | uu___ -> false
let (uu___is_AnnotateXor64 :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateXor64 _0 -> true | uu___ -> false

let (uu___is_AnnotatePxor :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotatePxor _0 -> true | uu___ -> false

let (uu___is_AnnotateVPxor :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateVPxor _0 -> true | uu___ -> false

let (uu___is_AnnotateGhost :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateGhost _0 -> true | uu___ -> false

let (uu___is_AnnotateComment :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateComment s -> true | uu___ -> false
let (__proj__AnnotateComment__item__s :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.string)
  = fun it -> fun projectee -> match projectee with | AnnotateComment s -> s
let (uu___is_AnnotateLargeComment :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateLargeComment s -> true | uu___ -> false
let (__proj__AnnotateLargeComment__item__s :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.string)
  =
  fun it ->
    fun projectee -> match projectee with | AnnotateLargeComment s -> s
let (uu___is_AnnotateNewline :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateNewline _0 -> true | uu___ -> false

let (uu___is_AnnotateSpace :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateSpace n -> true | uu___ -> false
let (__proj__AnnotateSpace__item__n :
  Vale_X64_Instruction_s.instr_t_record -> unit instr_annotation -> Prims.nat)
  = fun it -> fun projectee -> match projectee with | AnnotateSpace n -> n
let (uu___is_AnnotateMovbe64 :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateMovbe64 _0 -> true | uu___ -> false

let (uu___is_AnnotateMov64 :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotateMov64 _0 -> true | uu___ -> false

let (uu___is_AnnotatePrefetchnta :
  Vale_X64_Instruction_s.instr_t_record ->
    unit instr_annotation -> Prims.bool)
  =
  fun it ->
    fun projectee ->
      match projectee with | AnnotatePrefetchnta _0 -> true | uu___ -> false

type ins = unit instr_annotation Vale_X64_Bytes_Code_s.instruction_t
type ocmp = Vale_X64_Bytes_Code_s.ocmp
type code = unit instr_annotation Vale_X64_Bytes_Code_s.code_t
type codes = unit instr_annotation Vale_X64_Bytes_Code_s.codes_t
type machine_stack =
  | Machine_stack of Vale_Def_Words_s.nat64 * (Prims.int,
  Vale_Def_Words_s.nat8) FStar_Map.t 
let (uu___is_Machine_stack : machine_stack -> Prims.bool) =
  fun projectee -> true
let (__proj__Machine_stack__item__initial_rsp :
  machine_stack -> Vale_Def_Words_s.nat64) =
  fun projectee ->
    match projectee with
    | Machine_stack (initial_rsp, stack_mem) -> initial_rsp
let (__proj__Machine_stack__item__stack_mem :
  machine_stack -> (Prims.int, Vale_Def_Words_s.nat8) FStar_Map.t) =
  fun projectee ->
    match projectee with
    | Machine_stack (initial_rsp, stack_mem) -> stack_mem
type flag_val_t = Prims.bool FStar_Pervasives_Native.option
type flags_t =
  (Vale_X64_Machine_s.flag, Prims.bool FStar_Pervasives_Native.option)
    FStar_FunctionalExtensionality.restricted_t
type regs_t =
  (Vale_X64_Machine_s.reg, Obj.t) FStar_FunctionalExtensionality.restricted_t
type machine_state =
  {
  ms_ok: Prims.bool ;
  ms_regs: regs_t ;
  ms_flags: flags_t ;
  ms_heap: Vale_Arch_Heap.heap_impl ;
  ms_stack: machine_stack ;
  ms_stackTaint: Vale_Arch_HeapTypes_s.memTaint_t ;
  ms_trace: Vale_X64_Machine_s.observation Prims.list }
let (__proj__Mkmachine_state__item__ms_ok : machine_state -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_ok
let (__proj__Mkmachine_state__item__ms_regs : machine_state -> regs_t) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_regs
let (__proj__Mkmachine_state__item__ms_flags : machine_state -> flags_t) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_flags
let (__proj__Mkmachine_state__item__ms_heap :
  machine_state -> Vale_Arch_Heap.heap_impl) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_heap
let (__proj__Mkmachine_state__item__ms_stack :
  machine_state -> machine_stack) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_stack
let (__proj__Mkmachine_state__item__ms_stackTaint :
  machine_state -> Vale_Arch_HeapTypes_s.memTaint_t) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_stackTaint
let (__proj__Mkmachine_state__item__ms_trace :
  machine_state -> Vale_X64_Machine_s.observation Prims.list) =
  fun projectee ->
    match projectee with
    | { ms_ok; ms_regs; ms_flags; ms_heap; ms_stack; ms_stackTaint;
        ms_trace;_} -> ms_trace
let (get_fst_ocmp : ocmp -> Vale_X64_Machine_s.operand64) =
  fun o ->
    match o with
    | Vale_X64_Bytes_Code_s.OEq (o1, uu___) -> o1
    | Vale_X64_Bytes_Code_s.ONe (o1, uu___) -> o1
    | Vale_X64_Bytes_Code_s.OLe (o1, uu___) -> o1
    | Vale_X64_Bytes_Code_s.OGe (o1, uu___) -> o1
    | Vale_X64_Bytes_Code_s.OLt (o1, uu___) -> o1
    | Vale_X64_Bytes_Code_s.OGt (o1, uu___) -> o1
let (get_snd_ocmp : ocmp -> Vale_X64_Machine_s.operand64) =
  fun o ->
    match o with
    | Vale_X64_Bytes_Code_s.OEq (uu___, o2) -> o2
    | Vale_X64_Bytes_Code_s.ONe (uu___, o2) -> o2
    | Vale_X64_Bytes_Code_s.OLe (uu___, o2) -> o2
    | Vale_X64_Bytes_Code_s.OGe (uu___, o2) -> o2
    | Vale_X64_Bytes_Code_s.OLt (uu___, o2) -> o2
    | Vale_X64_Bytes_Code_s.OGt (uu___, o2) -> o2
let (eval_reg : Vale_X64_Machine_s.reg -> machine_state -> Obj.t) =
  fun r -> fun s -> s.ms_regs r
let (eval_reg_64 :
  Vale_X64_Machine_s.reg_64 -> machine_state -> Vale_Def_Words_s.nat64) =
  fun uu___1 ->
    fun uu___ ->
      (fun r ->
         fun s ->
           Obj.magic (s.ms_regs (Vale_X64_Machine_s.Reg (Prims.int_zero, r))))
        uu___1 uu___
let (eval_reg_xmm :
  Vale_X64_Machine_s.reg_xmm -> machine_state -> Vale_Def_Types_s.quad32) =
  fun uu___1 ->
    fun uu___ ->
      (fun r ->
         fun s ->
           Obj.magic (s.ms_regs (Vale_X64_Machine_s.Reg (Prims.int_one, r))))
        uu___1 uu___
let (eval_reg_int : Vale_X64_Machine_s.reg -> machine_state -> Prims.int) =
  fun r ->
    fun s ->
      Vale_X64_Machine_s.t_reg_to_int
        (Vale_X64_Machine_s.__proj__Reg__item__rf r) (s.ms_regs r)
let (eval_mem : Prims.int -> machine_state -> Vale_Def_Words_s.nat64) =
  fun ptr ->
    fun s ->
      Vale_Arch_MachineHeap_s.get_heap_val64 ptr
        (Vale_Arch_Heap.heap_get s.ms_heap)
let (eval_mem128 : Prims.int -> machine_state -> Vale_Def_Types_s.quad32) =
  fun ptr ->
    fun s ->
      Vale_Arch_MachineHeap_s.get_heap_val128 ptr
        (Vale_Arch_Heap.heap_get s.ms_heap)
let (eval_stack : Prims.int -> machine_stack -> Vale_Def_Words_s.nat64) =
  fun ptr ->
    fun s ->
      let uu___ = s in
      match uu___ with
      | Machine_stack (uu___1, mem) ->
          Vale_Arch_MachineHeap_s.get_heap_val64 ptr mem
let (eval_stack128 : Prims.int -> machine_stack -> Vale_Def_Types_s.quad32) =
  fun ptr ->
    fun s ->
      let uu___ = s in
      match uu___ with
      | Machine_stack (uu___1, mem) ->
          Vale_Arch_MachineHeap_s.get_heap_val128 ptr mem
let (eval_maddr : Vale_X64_Machine_s.maddr -> machine_state -> Prims.int) =
  fun m ->
    fun s ->
      match m with
      | Vale_X64_Machine_s.MConst n -> n
      | Vale_X64_Machine_s.MReg (r, offset) ->
          (Vale_X64_Machine_s.t_reg_to_int
             (Vale_X64_Machine_s.__proj__Reg__item__rf r) (s.ms_regs r))
            + offset
      | Vale_X64_Machine_s.MIndex (base, scale, index, offset) ->
          ((Vale_X64_Machine_s.t_reg_to_int
              (Vale_X64_Machine_s.__proj__Reg__item__rf base)
              (s.ms_regs base))
             +
             (scale *
                (Vale_X64_Machine_s.t_reg_to_int
                   (Vale_X64_Machine_s.__proj__Reg__item__rf index)
                   (s.ms_regs index))))
            + offset
let (eval_operand :
  Vale_X64_Machine_s.operand64 -> machine_state -> Vale_Def_Words_s.nat64) =
  fun uu___1 ->
    fun uu___ ->
      (fun o ->
         fun s ->
           match o with
           | Vale_X64_Machine_s.OConst n -> Obj.magic (Obj.repr n)
           | Vale_X64_Machine_s.OReg r ->
               Obj.magic
                 (Obj.repr
                    (s.ms_regs (Vale_X64_Machine_s.Reg (Prims.int_zero, r))))
           | Vale_X64_Machine_s.OMem (m, uu___) ->
               Obj.magic
                 (Obj.repr
                    (Vale_Arch_MachineHeap_s.get_heap_val64 (eval_maddr m s)
                       (Vale_Arch_Heap.heap_get s.ms_heap)))
           | Vale_X64_Machine_s.OStack (m, uu___) ->
               Obj.magic
                 (Obj.repr
                    (let uu___1 = s.ms_stack in
                     match uu___1 with
                     | Machine_stack (uu___2, mem) ->
                         Vale_Arch_MachineHeap_s.get_heap_val64
                           (eval_maddr m s) mem))) uu___1 uu___
let (eval_mov128_op :
  Vale_X64_Machine_s.operand128 -> machine_state -> Vale_Def_Types_s.quad32)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun o ->
         fun s ->
           match o with
           | Vale_X64_Machine_s.OConst c -> Obj.magic (Obj.repr c)
           | Vale_X64_Machine_s.OReg i ->
               Obj.magic
                 (Obj.repr
                    (s.ms_regs (Vale_X64_Machine_s.Reg (Prims.int_one, i))))
           | Vale_X64_Machine_s.OMem (m, uu___) ->
               Obj.magic
                 (Obj.repr
                    (Vale_Arch_MachineHeap_s.get_heap_val128 (eval_maddr m s)
                       (Vale_Arch_Heap.heap_get s.ms_heap)))
           | Vale_X64_Machine_s.OStack (m, uu___) ->
               Obj.magic
                 (Obj.repr
                    (let uu___1 = s.ms_stack in
                     match uu___1 with
                     | Machine_stack (uu___2, mem) ->
                         Vale_Arch_MachineHeap_s.get_heap_val128
                           (eval_maddr m s) mem))) uu___1 uu___
let (eval_ocmp : machine_state -> ocmp -> Prims.bool) =
  fun s ->
    fun c ->
      match c with
      | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
          (eval_operand o1 s) = (eval_operand o2 s)
      | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
          (eval_operand o1 s) <> (eval_operand o2 s)
      | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
          (eval_operand o1 s) <= (eval_operand o2 s)
      | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
          (eval_operand o1 s) >= (eval_operand o2 s)
      | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
          (eval_operand o1 s) < (eval_operand o2 s)
      | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
          (eval_operand o1 s) > (eval_operand o2 s)
let (eval_ocmp_opaque : machine_state -> ocmp -> Prims.bool) =
  fun s -> fun c -> eval_ocmp s c
let (update_reg' :
  Vale_X64_Machine_s.reg -> Obj.t -> machine_state -> machine_state) =
  fun r ->
    fun v ->
      fun s ->
        let uu___ = s in
        {
          ms_ok = (uu___.ms_ok);
          ms_regs = (fun r' -> if r' = r then v else s.ms_regs r');
          ms_flags = (uu___.ms_flags);
          ms_heap = (uu___.ms_heap);
          ms_stack = (uu___.ms_stack);
          ms_stackTaint = (uu___.ms_stackTaint);
          ms_trace = (uu___.ms_trace)
        }
let (update_reg_64' :
  Vale_X64_Machine_s.reg_64 ->
    Vale_Def_Words_s.nat64 -> machine_state -> machine_state)
  =
  fun r ->
    fun v ->
      fun s ->
        update_reg' (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
          (Obj.magic v) s
let (update_reg_xmm' :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Types_s.quad32 -> machine_state -> machine_state)
  =
  fun r ->
    fun v ->
      fun s ->
        update_reg' (Vale_X64_Machine_s.Reg (Prims.int_one, r)) (Obj.magic v)
          s
let rec (match_n :
  Prims.int ->
    Prims.nat ->
      Vale_Arch_HeapTypes_s.memTaint_t ->
        Vale_Arch_HeapTypes_s.taint -> Prims.bool)
  =
  fun addr ->
    fun n ->
      fun memTaint ->
        fun t ->
          if n = Prims.int_zero
          then true
          else
            if (FStar_Map.sel memTaint addr) <> t
            then false
            else
              match_n (addr + Prims.int_one) (n - Prims.int_one) memTaint t
let rec (update_n :
  Prims.int ->
    Prims.nat ->
      Vale_Arch_HeapTypes_s.memTaint_t ->
        Vale_Arch_HeapTypes_s.taint -> Vale_Arch_HeapTypes_s.memTaint_t)
  =
  fun addr ->
    fun n ->
      fun memTaint ->
        fun t ->
          if n = Prims.int_zero
          then memTaint
          else
            update_n (addr + Prims.int_one) (n - Prims.int_one)
              (FStar_Map.upd memTaint addr t) t

let (update_mem_and_taint :
  Prims.int ->
    Vale_Def_Words_s.nat64 ->
      machine_state -> Vale_Arch_HeapTypes_s.taint -> machine_state)
  =
  fun ptr ->
    fun v ->
      fun s ->
        fun t ->
          if
            Vale_Arch_MachineHeap_s.valid_addr64 ptr
              (Vale_Arch_Heap.heap_get s.ms_heap)
          then
            let uu___ = s in
            {
              ms_ok = (uu___.ms_ok);
              ms_regs = (uu___.ms_regs);
              ms_flags = (uu___.ms_flags);
              ms_heap =
                (Vale_Arch_Heap.heap_upd s.ms_heap
                   (Vale_Arch_MachineHeap_s.update_heap64 ptr v
                      (Vale_Arch_Heap.heap_get s.ms_heap))
                   (update_n ptr (Prims.of_int (8))
                      (Vale_Arch_Heap.heap_taint s.ms_heap) t));
              ms_stack = (uu___.ms_stack);
              ms_stackTaint = (uu___.ms_stackTaint);
              ms_trace = (uu___.ms_trace)
            }
          else s

let (update_mem128_and_taint :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      machine_state -> Vale_Arch_HeapTypes_s.taint -> machine_state)
  =
  fun ptr ->
    fun v ->
      fun s ->
        fun t ->
          if
            Vale_Arch_MachineHeap_s.valid_addr128 ptr
              (Vale_Arch_Heap.heap_get s.ms_heap)
          then
            let uu___ = s in
            {
              ms_ok = (uu___.ms_ok);
              ms_regs = (uu___.ms_regs);
              ms_flags = (uu___.ms_flags);
              ms_heap =
                (Vale_Arch_Heap.heap_upd s.ms_heap
                   (Vale_Arch_MachineHeap_s.update_heap128 ptr v
                      (Vale_Arch_Heap.heap_get s.ms_heap))
                   (update_n ptr (Prims.of_int (16))
                      (Vale_Arch_Heap.heap_taint s.ms_heap) t));
              ms_stack = (uu___.ms_stack);
              ms_stackTaint = (uu___.ms_stackTaint);
              ms_trace = (uu___.ms_trace)
            }
          else s
let (update_stack64' :
  Prims.int -> Vale_Def_Words_s.nat64 -> machine_stack -> machine_stack) =
  fun ptr ->
    fun v ->
      fun s ->
        let uu___ = s in
        match uu___ with
        | Machine_stack (init_rsp, mem) ->
            let mem1 = Vale_Arch_MachineHeap_s.update_heap64 ptr v mem in
            Machine_stack (init_rsp, mem1)
let (update_stack128' :
  Prims.int -> Vale_Def_Types_s.quad32 -> machine_stack -> machine_stack) =
  fun ptr ->
    fun v ->
      fun s ->
        let uu___ = s in
        match uu___ with
        | Machine_stack (init_rsp, mem) ->
            let mem1 = Vale_Arch_MachineHeap_s.update_heap128 ptr v mem in
            Machine_stack (init_rsp, mem1)
let (update_stack_and_taint :
  Prims.int ->
    Vale_Def_Words_s.nat64 ->
      machine_state -> Vale_Arch_HeapTypes_s.taint -> machine_state)
  =
  fun ptr ->
    fun v ->
      fun s ->
        fun t ->
          let uu___ = s.ms_stack in
          match uu___ with
          | Machine_stack (init_rsp, mem) ->
              let uu___1 = s in
              {
                ms_ok = (uu___1.ms_ok);
                ms_regs = (uu___1.ms_regs);
                ms_flags = (uu___1.ms_flags);
                ms_heap = (uu___1.ms_heap);
                ms_stack =
                  (let uu___2 = s.ms_stack in
                   (match uu___2 with
                    | Machine_stack (init_rsp1, mem1) ->
                        let mem2 =
                          Vale_Arch_MachineHeap_s.update_heap64 ptr v mem1 in
                        Machine_stack (init_rsp1, mem2)));
                ms_stackTaint =
                  (update_n ptr (Prims.of_int (8)) s.ms_stackTaint t);
                ms_trace = (uu___1.ms_trace)
              }
let (update_stack128_and_taint :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      machine_state -> Vale_Arch_HeapTypes_s.taint -> machine_state)
  =
  fun ptr ->
    fun v ->
      fun s ->
        fun t ->
          let uu___ = s.ms_stack in
          match uu___ with
          | Machine_stack (init_rsp, mem) ->
              let uu___1 = s in
              {
                ms_ok = (uu___1.ms_ok);
                ms_regs = (uu___1.ms_regs);
                ms_flags = (uu___1.ms_flags);
                ms_heap = (uu___1.ms_heap);
                ms_stack =
                  (let uu___2 = s.ms_stack in
                   (match uu___2 with
                    | Machine_stack (init_rsp1, mem1) ->
                        let mem2 =
                          Vale_Arch_MachineHeap_s.update_heap128 ptr v mem1 in
                        Machine_stack (init_rsp1, mem2)));
                ms_stackTaint =
                  (update_n ptr (Prims.of_int (16)) s.ms_stackTaint t);
                ms_trace = (uu___1.ms_trace)
              }
let (valid_src_stack64 : Prims.int -> machine_stack -> Prims.bool) =
  fun ptr ->
    fun st ->
      let uu___ = st in
      match uu___ with
      | Machine_stack (init_rsp, mem) ->
          Vale_Arch_MachineHeap_s.valid_addr64 ptr mem
let (valid_src_stack128 : Prims.int -> machine_stack -> Prims.bool) =
  fun ptr ->
    fun st ->
      let uu___ = st in
      match uu___ with
      | Machine_stack (init_rsp, mem) ->
          Vale_Arch_MachineHeap_s.valid_addr128 ptr mem
let (valid_src_operand :
  Vale_X64_Machine_s.operand64 -> machine_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OConst n -> true
      | Vale_X64_Machine_s.OReg r -> true
      | Vale_X64_Machine_s.OMem (m, t) ->
          Vale_Arch_MachineHeap_s.valid_addr64 (eval_maddr m s)
            (Vale_Arch_Heap.heap_get s.ms_heap)
      | Vale_X64_Machine_s.OStack (m, t) ->
          let uu___ = s.ms_stack in
          (match uu___ with
           | Machine_stack (init_rsp, mem) ->
               Vale_Arch_MachineHeap_s.valid_addr64 (eval_maddr m s) mem)
let (valid_src_operand64_and_taint :
  Vale_X64_Machine_s.operand64 -> machine_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OConst n -> true
      | Vale_X64_Machine_s.OReg r -> true
      | Vale_X64_Machine_s.OMem (m, t) ->
          let ptr = eval_maddr m s in
          (Vale_Arch_MachineHeap_s.valid_addr64 ptr
             (Vale_Arch_Heap.heap_get s.ms_heap))
            &&
            (match_n ptr (Prims.of_int (8))
               (Vale_Arch_Heap.heap_taint s.ms_heap) t)
      | Vale_X64_Machine_s.OStack (m, t) ->
          let ptr = eval_maddr m s in
          (let uu___ = s.ms_stack in
           match uu___ with
           | Machine_stack (init_rsp, mem) ->
               Vale_Arch_MachineHeap_s.valid_addr64 ptr mem)
            && (match_n ptr (Prims.of_int (8)) s.ms_stackTaint t)
let (valid_src_operand128_and_taint :
  Vale_X64_Machine_s.operand128 -> machine_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ -> false
      | Vale_X64_Machine_s.OReg i -> true
      | Vale_X64_Machine_s.OMem (m, t) ->
          let ptr = eval_maddr m s in
          (Vale_Arch_MachineHeap_s.valid_addr128 ptr
             (Vale_Arch_Heap.heap_get s.ms_heap))
            &&
            (match_n ptr (Prims.of_int (16))
               (Vale_Arch_Heap.heap_taint s.ms_heap) t)
      | Vale_X64_Machine_s.OStack (m, t) ->
          let ptr = eval_maddr m s in
          (let uu___ = s.ms_stack in
           match uu___ with
           | Machine_stack (init_rsp, mem) ->
               Vale_Arch_MachineHeap_s.valid_addr128 ptr mem)
            && (match_n ptr (Prims.of_int (16)) s.ms_stackTaint t)
let (valid_ocmp : ocmp -> machine_state -> Prims.bool) =
  fun c ->
    fun s ->
      match c with
      | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
      | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
      | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
      | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
      | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
      | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
          (valid_src_operand64_and_taint o1 s) &&
            (valid_src_operand64_and_taint o2 s)
let (valid_ocmp_opaque : ocmp -> machine_state -> Prims.bool) =
  fun c -> fun s -> valid_ocmp c s
let (valid_dst_stack64 :
  Vale_Def_Words_s.nat64 -> Prims.int -> machine_stack -> Prims.bool) =
  fun rsp ->
    fun ptr ->
      fun st ->
        let uu___ = st in
        match uu___ with
        | Machine_stack (init_rsp, mem) ->
            (ptr >= rsp) && ((ptr + (Prims.of_int (8))) <= init_rsp)
let (valid_dst_stack128 :
  Vale_Def_Words_s.nat64 -> Prims.int -> machine_stack -> Prims.bool) =
  fun rsp ->
    fun ptr ->
      fun st ->
        let uu___ = st in
        match uu___ with
        | Machine_stack (init_rsp, mem) ->
            (ptr >= rsp) && ((ptr + (Prims.of_int (16))) <= init_rsp)
let (valid_dst_operand64 :
  Vale_X64_Machine_s.operand64 -> machine_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OConst n -> false
      | Vale_X64_Machine_s.OReg r ->
          Prims.op_Negation ((Prims.of_int (7)) = r)
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          Vale_Arch_MachineHeap_s.valid_addr64 (eval_maddr m s)
            (Vale_Arch_Heap.heap_get s.ms_heap)
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          let uu___1 = s.ms_stack in
          (match uu___1 with
           | Machine_stack (init_rsp, mem) ->
               ((eval_maddr m s) >=
                  (Obj.magic
                     (s.ms_regs
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (7)))))))
                 && (((eval_maddr m s) + (Prims.of_int (8))) <= init_rsp))
let (valid_dst_operand128 :
  Vale_X64_Machine_s.operand128 -> machine_state -> Prims.bool) =
  fun o ->
    fun s ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ -> false
      | Vale_X64_Machine_s.OReg i -> true
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          Vale_Arch_MachineHeap_s.valid_addr128 (eval_maddr m s)
            (Vale_Arch_Heap.heap_get s.ms_heap)
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          let uu___1 = s.ms_stack in
          (match uu___1 with
           | Machine_stack (init_rsp, mem) ->
               ((eval_maddr m s) >=
                  (Obj.magic
                     (s.ms_regs
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (7)))))))
                 && (((eval_maddr m s) + (Prims.of_int (16))) <= init_rsp))
let (update_operand64_preserve_flags'' :
  Vale_X64_Machine_s.operand64 ->
    Vale_Def_Words_s.nat64 -> machine_state -> machine_state -> machine_state)
  =
  fun o ->
    fun v ->
      fun s_orig ->
        fun s ->
          match o with
          | Vale_X64_Machine_s.OConst uu___ ->
              let uu___1 = s in
              {
                ms_ok = false;
                ms_regs = (uu___1.ms_regs);
                ms_flags = (uu___1.ms_flags);
                ms_heap = (uu___1.ms_heap);
                ms_stack = (uu___1.ms_stack);
                ms_stackTaint = (uu___1.ms_stackTaint);
                ms_trace = (uu___1.ms_trace)
              }
          | Vale_X64_Machine_s.OReg r -> update_reg_64' r v s
          | Vale_X64_Machine_s.OMem (m, t) ->
              update_mem_and_taint (eval_maddr m s_orig) v s t
          | Vale_X64_Machine_s.OStack (m, t) ->
              update_stack_and_taint (eval_maddr m s_orig) v s t
let (update_operand64_preserve_flags' :
  Vale_X64_Machine_s.operand64 ->
    Vale_Def_Words_s.nat64 -> machine_state -> machine_state)
  = fun o -> fun v -> fun s -> update_operand64_preserve_flags'' o v s s
let (update_operand128_preserve_flags'' :
  Vale_X64_Machine_s.operand128 ->
    Vale_Def_Types_s.quad32 ->
      machine_state -> machine_state -> machine_state)
  =
  fun o ->
    fun v ->
      fun s_orig ->
        fun s ->
          match o with
          | Vale_X64_Machine_s.OConst uu___ ->
              let uu___1 = s in
              {
                ms_ok = false;
                ms_regs = (uu___1.ms_regs);
                ms_flags = (uu___1.ms_flags);
                ms_heap = (uu___1.ms_heap);
                ms_stack = (uu___1.ms_stack);
                ms_stackTaint = (uu___1.ms_stackTaint);
                ms_trace = (uu___1.ms_trace)
              }
          | Vale_X64_Machine_s.OReg i -> update_reg_xmm' i v s
          | Vale_X64_Machine_s.OMem (m, t) ->
              update_mem128_and_taint (eval_maddr m s_orig) v s t
          | Vale_X64_Machine_s.OStack (m, t) ->
              update_stack128_and_taint (eval_maddr m s_orig) v s t
let (update_operand128_preserve_flags' :
  Vale_X64_Machine_s.operand128 ->
    Vale_Def_Types_s.quad32 -> machine_state -> machine_state)
  = fun o -> fun v -> fun s -> update_operand128_preserve_flags'' o v s s
let (flags_none :
  Vale_X64_Machine_s.flag -> Prims.bool FStar_Pervasives_Native.option) =
  fun f -> FStar_Pervasives_Native.None
let (havoc_flags : flags_t) = flags_none
let (update_operand64' :
  Vale_X64_Machine_s.operand64 ->
    ins -> Vale_Def_Words_s.nat64 -> machine_state -> machine_state)
  =
  fun o ->
    fun ins1 ->
      fun v ->
        fun s ->
          let uu___ = update_operand64_preserve_flags' o v s in
          {
            ms_ok = (uu___.ms_ok);
            ms_regs = (uu___.ms_regs);
            ms_flags = havoc_flags;
            ms_heap = (uu___.ms_heap);
            ms_stack = (uu___.ms_stack);
            ms_stackTaint = (uu___.ms_stackTaint);
            ms_trace = (uu___.ms_trace)
          }
let (update_rsp' : Prims.int -> machine_state -> machine_state) =
  fun new_rsp ->
    fun s ->
      let uu___ = s.ms_stack in
      match uu___ with
      | Machine_stack (init_rsp, mem) ->
          if
            (new_rsp >= (init_rsp - (Prims.of_int (4096)))) &&
              (new_rsp <= init_rsp)
          then update_reg_64' (Prims.of_int (7)) new_rsp s
          else s
let (cf : flags_t -> Prims.bool FStar_Pervasives_Native.option) =
  fun flags -> flags Prims.int_zero
let (overflow : flags_t -> Prims.bool FStar_Pervasives_Native.option) =
  fun flags -> flags (Prims.of_int (11))
let (update_cf' : flags_t -> Prims.bool -> flags_t) =
  fun flags ->
    fun new_cf ->
      fun f ->
        if f = Prims.int_zero
        then FStar_Pervasives_Native.Some new_cf
        else flags f
let (update_of' : flags_t -> Prims.bool -> flags_t) =
  fun flags ->
    fun new_of ->
      fun f ->
        if f = (Prims.of_int (11))
        then FStar_Pervasives_Native.Some new_of
        else flags f
let (free_stack' : Prims.int -> Prims.int -> machine_stack -> machine_stack)
  =
  fun start ->
    fun finish ->
      fun st ->
        let uu___ = st in
        match uu___ with
        | Machine_stack (init_rsp, mem) ->
            let domain = FStar_Map.domain mem in
            let restricted_domain =
              Vale_Lib_Set.remove_between domain start finish in
            let new_mem = FStar_Map.restrict restricted_domain mem in
            Machine_stack (init_rsp, new_mem)
type 'a st = machine_state -> ('a * machine_state)
let return : 'a . 'a -> 'a st = fun x -> fun s -> (x, s)
let bind : 'a 'b . 'a st -> ('a -> 'b st) -> 'b st =
  fun m ->
    fun f ->
      fun s0 ->
        let uu___ = m s0 in
        match uu___ with
        | (x, s1) ->
            let uu___1 = f x s1 in
            (match uu___1 with
             | (y, s2) ->
                 (y,
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let (get : machine_state st) = fun s -> (s, s)
let (set : machine_state -> unit st) = fun s -> fun uu___ -> ((), s)
let (fail : unit st) =
  fun s ->
    ((),
      (let uu___ = s in
       {
         ms_ok = false;
         ms_regs = (uu___.ms_regs);
         ms_flags = (uu___.ms_flags);
         ms_heap = (uu___.ms_heap);
         ms_stack = (uu___.ms_stack);
         ms_stackTaint = (uu___.ms_stackTaint);
         ms_trace = (uu___.ms_trace)
       }))
let (check_imm : Prims.bool -> unit st) =
  fun valid ->
    if valid
    then fun s -> ((), s)
    else
      (fun s ->
         ((),
           (let uu___1 = s in
            {
              ms_ok = false;
              ms_regs = (uu___1.ms_regs);
              ms_flags = (uu___1.ms_flags);
              ms_heap = (uu___1.ms_heap);
              ms_stack = (uu___1.ms_stack);
              ms_stackTaint = (uu___1.ms_stackTaint);
              ms_trace = (uu___1.ms_trace)
            })))
let (check : (machine_state -> Prims.bool) -> unit st) =
  fun valid ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            if valid x
            then ((), s1)
            else
              ((),
                {
                  ms_ok = false;
                  ms_regs = (s1.ms_regs);
                  ms_flags = (s1.ms_flags);
                  ms_heap = (s1.ms_heap);
                  ms_stack = (s1.ms_stack);
                  ms_stackTaint = (s1.ms_stackTaint);
                  ms_trace = (s1.ms_trace)
                }) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let try_option :
  'a . 'a FStar_Pervasives_Native.option -> ('a -> unit st) -> unit st =
  fun o ->
    fun f ->
      match o with
      | FStar_Pervasives_Native.None ->
          (fun s ->
             ((),
               (let uu___ = s in
                {
                  ms_ok = false;
                  ms_regs = (uu___.ms_regs);
                  ms_flags = (uu___.ms_flags);
                  ms_heap = (uu___.ms_heap);
                  ms_stack = (uu___.ms_stack);
                  ms_stackTaint = (uu___.ms_stackTaint);
                  ms_trace = (uu___.ms_trace)
                })))
      | FStar_Pervasives_Native.Some x -> f x
let apply_option :
  'a . 'a FStar_Pervasives_Native.option -> ('a -> unit st) -> unit st =
  fun o ->
    fun f ->
      match o with
      | FStar_Pervasives_Native.None ->
          (fun s ->
             ((),
               (let uu___ = s in
                {
                  ms_ok = false;
                  ms_regs = (uu___.ms_regs);
                  ms_flags = (uu___.ms_flags);
                  ms_heap = (uu___.ms_heap);
                  ms_stack = (uu___.ms_stack);
                  ms_stackTaint = (uu___.ms_stackTaint);
                  ms_trace = (uu___.ms_trace)
                })))
      | FStar_Pervasives_Native.Some x -> f x
let (run : unit st -> machine_state -> machine_state) =
  fun f -> fun s -> FStar_Pervasives_Native.snd (f s)
let (update_operand64_preserve_flags :
  Vale_X64_Machine_s.operand64 -> Vale_Def_Words_s.nat64 -> unit st) =
  fun dst ->
    fun v ->
      fun s0 ->
        let uu___ =
          let uu___1 = (s0, s0) in
          match uu___1 with
          | (x, s1) ->
              let uu___2 =
                if valid_dst_operand64 dst x
                then ((), s1)
                else
                  ((),
                    {
                      ms_ok = false;
                      ms_regs = (s1.ms_regs);
                      ms_flags = (s1.ms_flags);
                      ms_heap = (s1.ms_heap);
                      ms_stack = (s1.ms_stack);
                      ms_stackTaint = (s1.ms_stackTaint);
                      ms_trace = (s1.ms_trace)
                    }) in
              (match uu___2 with
               | (y, s2) ->
                   ((),
                     (let uu___3 = s2 in
                      {
                        ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                        ms_regs = (uu___3.ms_regs);
                        ms_flags = (uu___3.ms_flags);
                        ms_heap = (uu___3.ms_heap);
                        ms_stack = (uu___3.ms_stack);
                        ms_stackTaint = (uu___3.ms_stackTaint);
                        ms_trace = (uu___3.ms_trace)
                      }))) in
        match uu___ with
        | (x, s1) ->
            let uu___1 =
              let uu___2 = (s1, s1) in
              match uu___2 with
              | (x1, s11) ->
                  let uu___3 =
                    ((), (update_operand64_preserve_flags' dst v x1)) in
                  (match uu___3 with
                   | (y, s2) ->
                       ((),
                         (let uu___4 = s2 in
                          {
                            ms_ok = ((s1.ms_ok && s11.ms_ok) && s2.ms_ok);
                            ms_regs = (uu___4.ms_regs);
                            ms_flags = (uu___4.ms_flags);
                            ms_heap = (uu___4.ms_heap);
                            ms_stack = (uu___4.ms_stack);
                            ms_stackTaint = (uu___4.ms_stackTaint);
                            ms_trace = (uu___4.ms_trace)
                          }))) in
            (match uu___1 with
             | (y, s2) ->
                 ((),
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let (update_rsp : Prims.int -> unit st) =
  fun i ->
    fun s0 ->
      let uu___ =
        let uu___1 = (s0, s0) in
        match uu___1 with
        | (x, s1) ->
            let uu___2 =
              if
                i >=
                  ((__proj__Machine_stack__item__initial_rsp x.ms_stack) -
                     (Prims.of_int (4096)))
              then ((), s1)
              else
                ((),
                  {
                    ms_ok = false;
                    ms_regs = (s1.ms_regs);
                    ms_flags = (s1.ms_flags);
                    ms_heap = (s1.ms_heap);
                    ms_stack = (s1.ms_stack);
                    ms_stackTaint = (s1.ms_stackTaint);
                    ms_trace = (s1.ms_trace)
                  }) in
            (match uu___2 with
             | (y, s2) ->
                 ((),
                   (let uu___3 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___3.ms_regs);
                      ms_flags = (uu___3.ms_flags);
                      ms_heap = (uu___3.ms_heap);
                      ms_stack = (uu___3.ms_stack);
                      ms_stackTaint = (uu___3.ms_stackTaint);
                      ms_trace = (uu___3.ms_trace)
                    }))) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            let uu___2 =
              let uu___3 = (s1, s1) in
              match uu___3 with
              | (x1, s11) ->
                  let uu___4 =
                    if
                      i <=
                        (__proj__Machine_stack__item__initial_rsp x1.ms_stack)
                    then ((), s11)
                    else
                      ((),
                        {
                          ms_ok = false;
                          ms_regs = (s11.ms_regs);
                          ms_flags = (s11.ms_flags);
                          ms_heap = (s11.ms_heap);
                          ms_stack = (s11.ms_stack);
                          ms_stackTaint = (s11.ms_stackTaint);
                          ms_trace = (s11.ms_trace)
                        }) in
                  (match uu___4 with
                   | (y, s2) ->
                       ((),
                         (let uu___5 = s2 in
                          {
                            ms_ok = ((s1.ms_ok && s11.ms_ok) && s2.ms_ok);
                            ms_regs = (uu___5.ms_regs);
                            ms_flags = (uu___5.ms_flags);
                            ms_heap = (uu___5.ms_heap);
                            ms_stack = (uu___5.ms_stack);
                            ms_stackTaint = (uu___5.ms_stackTaint);
                            ms_trace = (uu___5.ms_trace)
                          }))) in
            match uu___2 with
            | (x1, s11) ->
                let uu___3 =
                  let uu___4 = (s11, s11) in
                  match uu___4 with
                  | (x2, s12) ->
                      let uu___5 = ((), (update_rsp' i x2)) in
                      (match uu___5 with
                       | (y, s2) ->
                           ((),
                             (let uu___6 = s2 in
                              {
                                ms_ok =
                                  ((s11.ms_ok && s12.ms_ok) && s2.ms_ok);
                                ms_regs = (uu___6.ms_regs);
                                ms_flags = (uu___6.ms_flags);
                                ms_heap = (uu___6.ms_heap);
                                ms_stack = (uu___6.ms_stack);
                                ms_stackTaint = (uu___6.ms_stackTaint);
                                ms_trace = (uu___6.ms_trace)
                              }))) in
                (match uu___3 with
                 | (y, s2) ->
                     ((),
                       (let uu___4 = s2 in
                        {
                          ms_ok = ((s1.ms_ok && s11.ms_ok) && s2.ms_ok);
                          ms_regs = (uu___4.ms_regs);
                          ms_flags = (uu___4.ms_flags);
                          ms_heap = (uu___4.ms_heap);
                          ms_stack = (uu___4.ms_stack);
                          ms_stackTaint = (uu___4.ms_stackTaint);
                          ms_trace = (uu___4.ms_trace)
                        }))) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let (update_reg_64 :
  Vale_X64_Machine_s.reg_64 -> Vale_Def_Words_s.nat64 -> unit st) =
  fun r ->
    fun v ->
      fun s0 ->
        let uu___ = (s0, s0) in
        match uu___ with
        | (x, s1) ->
            let uu___1 = ((), (update_reg_64' r v x)) in
            (match uu___1 with
             | (y, s2) ->
                 ((),
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let (update_reg_xmm :
  Vale_X64_Machine_s.reg_xmm -> ins -> Vale_Def_Types_s.quad32 -> unit st) =
  fun x ->
    fun ins1 ->
      fun v ->
        fun s0 ->
          let uu___ = (s0, s0) in
          match uu___ with
          | (x1, s1) ->
              let uu___1 =
                ((),
                  (let uu___2 = update_reg_xmm' x v x1 in
                   {
                     ms_ok = (uu___2.ms_ok);
                     ms_regs = (uu___2.ms_regs);
                     ms_flags = havoc_flags;
                     ms_heap = (uu___2.ms_heap);
                     ms_stack = (uu___2.ms_stack);
                     ms_stackTaint = (uu___2.ms_stackTaint);
                     ms_trace = (uu___2.ms_trace)
                   })) in
              (match uu___1 with
               | (y, s2) ->
                   ((),
                     (let uu___2 = s2 in
                      {
                        ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                        ms_regs = (uu___2.ms_regs);
                        ms_flags = (uu___2.ms_flags);
                        ms_heap = (uu___2.ms_heap);
                        ms_stack = (uu___2.ms_stack);
                        ms_stackTaint = (uu___2.ms_stackTaint);
                        ms_trace = (uu___2.ms_trace)
                      })))
let (update_xmm_preserve_flags :
  Vale_X64_Machine_s.reg_xmm -> Vale_Def_Types_s.quad32 -> unit st) =
  fun x ->
    fun v ->
      fun s0 ->
        let uu___ = (s0, s0) in
        match uu___ with
        | (x1, s1) ->
            let uu___1 = ((), (update_reg_xmm' x v x1)) in
            (match uu___1 with
             | (y, s2) ->
                 ((),
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let (update_flags : flags_t -> unit st) =
  fun new_flags ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            ((),
              (let uu___2 = x in
               {
                 ms_ok = (uu___2.ms_ok);
                 ms_regs = (uu___2.ms_regs);
                 ms_flags = new_flags;
                 ms_heap = (uu___2.ms_heap);
                 ms_stack = (uu___2.ms_stack);
                 ms_stackTaint = (uu___2.ms_stackTaint);
                 ms_trace = (uu___2.ms_trace)
               })) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let (update_cf : Prims.bool -> unit st) =
  fun new_cf ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            ((),
              (let uu___2 = x in
               {
                 ms_ok = (uu___2.ms_ok);
                 ms_regs = (uu___2.ms_regs);
                 ms_flags = (update_cf' x.ms_flags new_cf);
                 ms_heap = (uu___2.ms_heap);
                 ms_stack = (uu___2.ms_stack);
                 ms_stackTaint = (uu___2.ms_stackTaint);
                 ms_trace = (uu___2.ms_trace)
               })) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let (update_of : Prims.bool -> unit st) =
  fun new_of ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            ((),
              (let uu___2 = x in
               {
                 ms_ok = (uu___2.ms_ok);
                 ms_regs = (uu___2.ms_regs);
                 ms_flags = (update_of' x.ms_flags new_of);
                 ms_heap = (uu___2.ms_heap);
                 ms_stack = (uu___2.ms_stack);
                 ms_stackTaint = (uu___2.ms_stackTaint);
                 ms_trace = (uu___2.ms_trace)
               })) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let (update_cf_of : Prims.bool -> Prims.bool -> unit st) =
  fun new_cf ->
    fun new_of ->
      fun s0 ->
        let uu___ = (s0, s0) in
        match uu___ with
        | (x, s1) ->
            let uu___1 =
              ((),
                (let uu___2 = x in
                 {
                   ms_ok = (uu___2.ms_ok);
                   ms_regs = (uu___2.ms_regs);
                   ms_flags =
                     (update_cf' (update_of' x.ms_flags new_of) new_cf);
                   ms_heap = (uu___2.ms_heap);
                   ms_stack = (uu___2.ms_stack);
                   ms_stackTaint = (uu___2.ms_stackTaint);
                   ms_trace = (uu___2.ms_trace)
                 })) in
            (match uu___1 with
             | (y, s2) ->
                 ((),
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let (free_stack : Prims.int -> Prims.int -> unit st) =
  fun start ->
    fun finish ->
      fun s0 ->
        let uu___ = (s0, s0) in
        match uu___ with
        | (x, s1) ->
            let uu___1 =
              ((),
                (let uu___2 = x in
                 {
                   ms_ok = (uu___2.ms_ok);
                   ms_regs = (uu___2.ms_regs);
                   ms_flags = (uu___2.ms_flags);
                   ms_heap = (uu___2.ms_heap);
                   ms_stack = (free_stack' start finish x.ms_stack);
                   ms_stackTaint = (uu___2.ms_stackTaint);
                   ms_trace = (uu___2.ms_trace)
                 })) in
            (match uu___1 with
             | (y, s2) ->
                 ((),
                   (let uu___2 = s2 in
                    {
                      ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                      ms_regs = (uu___2.ms_regs);
                      ms_flags = (uu___2.ms_flags);
                      ms_heap = (uu___2.ms_heap);
                      ms_stack = (uu___2.ms_stack);
                      ms_stackTaint = (uu___2.ms_stackTaint);
                      ms_trace = (uu___2.ms_trace)
                    })))
let bind_option :
  'a 'b .
    'a FStar_Pervasives_Native.option ->
      ('a -> 'b FStar_Pervasives_Native.option) ->
        'b FStar_Pervasives_Native.option
  =
  fun v ->
    fun f ->
      match v with
      | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some x -> f x
let (operand_obs :
  machine_state ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Machine_s.observation Prims.list)
  =
  fun s ->
    fun o ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ -> []
      | Vale_X64_Machine_s.OReg uu___ -> []
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          [Vale_X64_Machine_s.MemAccess (eval_maddr m s)]
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          [Vale_X64_Machine_s.MemAccess (eval_maddr m s)]
let (operand_obs128 :
  machine_state ->
    Vale_X64_Machine_s.operand128 ->
      Vale_X64_Machine_s.observation Prims.list)
  =
  fun s ->
    fun op ->
      match op with
      | Vale_X64_Machine_s.OConst uu___ -> []
      | Vale_X64_Machine_s.OReg uu___ -> []
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          [Vale_X64_Machine_s.MemAccess (eval_maddr m s)]
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          [Vale_X64_Machine_s.MemAccess (eval_maddr m s)]
let (obs_operand_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t -> machine_state -> Vale_X64_Machine_s.observation Prims.list)
  =
  fun i ->
    fun o ->
      fun s ->
        match i with
        | Vale_X64_Instruction_s.IOp64 -> operand_obs s (Obj.magic o)
        | Vale_X64_Instruction_s.IOpXmm -> operand_obs128 s (Obj.magic o)
let (obs_operand_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    machine_state -> Vale_X64_Machine_s.observation Prims.list)
  =
  fun i ->
    fun s ->
      match i with
      | Vale_X64_Instruction_s.IOp64One o -> operand_obs s o
      | Vale_X64_Instruction_s.IOpXmmOne o -> operand_obs128 s o
      | Vale_X64_Instruction_s.IOpFlagsCf -> []
      | Vale_X64_Instruction_s.IOpFlagsOf -> []
let rec (obs_args :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    Obj.t -> machine_state -> Vale_X64_Machine_s.observation Prims.list)
  =
  fun args ->
    fun oprs ->
      fun s ->
        match args with
        | [] -> []
        | i::args1 ->
            (match i with
             | Vale_X64_Instruction_s.IOpEx i1 ->
                 let oprs1 = Obj.magic oprs in
                 FStar_List_Tot_Base.append
                   (obs_operand_explicit i1
                      (FStar_Pervasives_Native.fst oprs1) s)
                   (obs_args args1 (FStar_Pervasives_Native.snd oprs1) s)
             | Vale_X64_Instruction_s.IOpIm i1 ->
                 FStar_List_Tot_Base.append (obs_operand_implicit i1 s)
                   (obs_args args1 oprs s))
let rec (obs_inouts :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> machine_state -> Vale_X64_Machine_s.observation Prims.list)
  =
  fun inouts ->
    fun args ->
      fun oprs ->
        fun s ->
          match inouts with
          | [] -> obs_args args oprs s
          | (uu___, i)::inouts1 ->
              let uu___1 =
                match i with
                | Vale_X64_Instruction_s.IOpEx i1 ->
                    let oprs1 = Obj.magic oprs in
                    ((obs_operand_explicit i1
                        (FStar_Pervasives_Native.fst oprs1) s),
                      (FStar_Pervasives_Native.snd oprs1))
                | Vale_X64_Instruction_s.IOpIm i1 ->
                    ((obs_operand_implicit i1 s), oprs) in
              (match uu___1 with
               | (v, oprs1) ->
                   FStar_List_Tot_Base.append v
                     (obs_inouts inouts1 args oprs1 s))
let (ins_obs :
  ins -> machine_state -> Vale_X64_Machine_s.observation Prims.list) =
  fun ins1 ->
    fun s ->
      match ins1 with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord
           (outs, args, uu___, uu___1), oprs, uu___2)
          -> obs_inouts outs args oprs s
      | Vale_X64_Bytes_Code_s.Push (src, uu___) -> operand_obs s src
      | Vale_X64_Bytes_Code_s.Pop (dst, uu___) -> operand_obs s dst
      | Vale_X64_Bytes_Code_s.Alloc uu___ -> []
      | Vale_X64_Bytes_Code_s.Dealloc uu___ -> []
let (instr_eval_operand_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t -> machine_state -> Obj.t FStar_Pervasives_Native.option)
  =
  fun i ->
    fun o ->
      fun s ->
        match i with
        | Vale_X64_Instruction_s.IOp64 ->
            if valid_src_operand64_and_taint (Obj.magic o) s
            then
              FStar_Pervasives_Native.Some
                (Obj.magic (eval_operand (Obj.magic o) s))
            else FStar_Pervasives_Native.None
        | Vale_X64_Instruction_s.IOpXmm ->
            if valid_src_operand128_and_taint (Obj.magic o) s
            then
              FStar_Pervasives_Native.Some
                (Obj.magic (eval_mov128_op (Obj.magic o) s))
            else FStar_Pervasives_Native.None
let (instr_eval_operand_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    machine_state -> Obj.t FStar_Pervasives_Native.option)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun i ->
         fun s ->
           match i with
           | Vale_X64_Instruction_s.IOp64One o ->
               Obj.magic
                 (Obj.repr
                    (if valid_src_operand64_and_taint o s
                     then
                       FStar_Pervasives_Native.Some
                         (Obj.magic (eval_operand o s))
                     else FStar_Pervasives_Native.None))
           | Vale_X64_Instruction_s.IOpXmmOne o ->
               Obj.magic
                 (Obj.repr
                    (if valid_src_operand128_and_taint o s
                     then
                       FStar_Pervasives_Native.Some
                         (Obj.magic (eval_mov128_op o s))
                     else FStar_Pervasives_Native.None))
           | Vale_X64_Instruction_s.IOpFlagsCf ->
               Obj.magic (Obj.repr (cf s.ms_flags))
           | Vale_X64_Instruction_s.IOpFlagsOf ->
               Obj.magic (Obj.repr (overflow s.ms_flags))) uu___1 uu___
let rec (instr_apply_eval_args :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> Obj.t -> machine_state -> Obj.t FStar_Pervasives_Native.option)
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (fun outs ->
               fun args ->
                 fun f ->
                   fun oprs ->
                     fun s ->
                       match args with
                       | [] -> Obj.magic (Obj.repr f)
                       | i::args1 ->
                           Obj.magic
                             (Obj.repr
                                (let uu___ =
                                   match i with
                                   | Vale_X64_Instruction_s.IOpEx i1 ->
                                       let oprs1 = Obj.magic oprs in
                                       ((instr_eval_operand_explicit i1
                                           (FStar_Pervasives_Native.fst oprs1)
                                           s),
                                         (FStar_Pervasives_Native.snd oprs1))
                                   | Vale_X64_Instruction_s.IOpIm i1 ->
                                       ((instr_eval_operand_implicit i1 s),
                                         oprs) in
                                 match uu___ with
                                 | (v, oprs1) ->
                                     let f1 = Obj.magic f in
                                     bind_option v
                                       (fun v1 ->
                                          instr_apply_eval_args outs args1
                                            (f1 v1) oprs1 s)))) uu___4 uu___3
              uu___2 uu___1 uu___
let rec (instr_apply_eval_inouts :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_out Prims.list ->
      Vale_X64_Instruction_s.instr_operand Prims.list ->
        Obj.t ->
          Obj.t -> machine_state -> Obj.t FStar_Pervasives_Native.option)
  =
  fun outs ->
    fun inouts ->
      fun args ->
        fun f ->
          fun oprs ->
            fun s ->
              match inouts with
              | [] -> instr_apply_eval_args outs args f oprs s
              | (Vale_X64_Instruction_s.Out, i)::inouts1 ->
                  let oprs1 =
                    match i with
                    | Vale_X64_Instruction_s.IOpEx i1 ->
                        FStar_Pervasives_Native.snd (Obj.magic oprs)
                    | Vale_X64_Instruction_s.IOpIm i1 -> oprs in
                  instr_apply_eval_inouts outs inouts1 args f oprs1 s
              | (Vale_X64_Instruction_s.InOut, i)::inouts1 ->
                  let uu___ =
                    match i with
                    | Vale_X64_Instruction_s.IOpEx i1 ->
                        let oprs1 = Obj.magic oprs in
                        ((instr_eval_operand_explicit i1
                            (FStar_Pervasives_Native.fst oprs1) s),
                          (FStar_Pervasives_Native.snd oprs1))
                    | Vale_X64_Instruction_s.IOpIm i1 ->
                        ((instr_eval_operand_implicit i1 s), oprs) in
                  (match uu___ with
                   | (v, oprs1) ->
                       let f1 = Obj.magic f in
                       bind_option v
                         (fun v1 ->
                            instr_apply_eval_inouts outs inouts1 args (
                              f1 v1) oprs1 s))
let (instr_apply_eval :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> Obj.t -> machine_state -> Obj.t FStar_Pervasives_Native.option)
  =
  fun outs ->
    fun args ->
      fun f ->
        fun oprs -> fun s -> instr_apply_eval_inouts outs outs args f oprs s
let (state_or_fail :
  machine_state -> Prims.bool -> machine_state -> machine_state) =
  fun s ->
    fun b ->
      fun s' ->
        if b
        then s'
        else
          (let uu___1 = s in
           {
             ms_ok = false;
             ms_regs = (uu___1.ms_regs);
             ms_flags = (uu___1.ms_flags);
             ms_heap = (uu___1.ms_heap);
             ms_stack = (uu___1.ms_stack);
             ms_stackTaint = (uu___1.ms_stackTaint);
             ms_trace = (uu___1.ms_trace)
           })
let (instr_write_output_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t -> Obj.t -> machine_state -> machine_state -> machine_state)
  =
  fun i ->
    fun v ->
      fun o ->
        fun s_orig ->
          fun s ->
            match i with
            | Vale_X64_Instruction_s.IOp64 ->
                state_or_fail s (valid_dst_operand64 (Obj.magic o) s_orig)
                  (update_operand64_preserve_flags'' (Obj.magic o)
                     (Obj.magic v) s_orig s)
            | Vale_X64_Instruction_s.IOpXmm ->
                state_or_fail s (valid_dst_operand128 (Obj.magic o) s_orig)
                  (update_operand128_preserve_flags'' (Obj.magic o)
                     (Obj.magic v) s_orig s)
let (instr_write_output_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    Obj.t -> machine_state -> machine_state -> machine_state)
  =
  fun i ->
    fun v ->
      fun s_orig ->
        fun s ->
          match i with
          | Vale_X64_Instruction_s.IOp64One o ->
              state_or_fail s (valid_dst_operand64 o s_orig)
                (update_operand64_preserve_flags'' o (Obj.magic v) s_orig s)
          | Vale_X64_Instruction_s.IOpXmmOne o ->
              state_or_fail s (valid_dst_operand128 o s_orig)
                (update_operand128_preserve_flags'' o (Obj.magic v) s_orig s)
          | Vale_X64_Instruction_s.IOpFlagsCf ->
              let uu___ = s in
              {
                ms_ok = (uu___.ms_ok);
                ms_regs = (uu___.ms_regs);
                ms_flags = (update_cf' s.ms_flags (Obj.magic v));
                ms_heap = (uu___.ms_heap);
                ms_stack = (uu___.ms_stack);
                ms_stackTaint = (uu___.ms_stackTaint);
                ms_trace = (uu___.ms_trace)
              }
          | Vale_X64_Instruction_s.IOpFlagsOf ->
              let uu___ = s in
              {
                ms_ok = (uu___.ms_ok);
                ms_regs = (uu___.ms_regs);
                ms_flags = (update_of' s.ms_flags (Obj.magic v));
                ms_heap = (uu___.ms_heap);
                ms_stack = (uu___.ms_stack);
                ms_stackTaint = (uu___.ms_stackTaint);
                ms_trace = (uu___.ms_trace)
              }
let rec (instr_write_outputs :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> Obj.t -> machine_state -> machine_state -> machine_state)
  =
  fun outs ->
    fun args ->
      fun vs ->
        fun oprs ->
          fun s_orig ->
            fun s ->
              match outs with
              | [] -> s
              | (uu___, i)::outs1 ->
                  let uu___1 =
                    match outs1 with
                    | [] -> (vs, (Obj.repr ()))
                    | uu___2::uu___3 ->
                        let vs1 = Obj.magic vs in
                        ((FStar_Pervasives_Native.fst vs1),
                          (FStar_Pervasives_Native.snd vs1)) in
                  (match uu___1 with
                   | (v, vs1) ->
                       let v1 = v in
                       (match i with
                        | Vale_X64_Instruction_s.IOpEx i1 ->
                            let oprs1 = Obj.magic oprs in
                            let s1 =
                              instr_write_output_explicit i1 v1
                                (FStar_Pervasives_Native.fst oprs1) s_orig s in
                            instr_write_outputs outs1 args vs1
                              (FStar_Pervasives_Native.snd oprs1) s_orig s1
                        | Vale_X64_Instruction_s.IOpIm i1 ->
                            let s1 =
                              instr_write_output_implicit i1 v1 s_orig s in
                            instr_write_outputs outs1 args vs1 oprs s_orig s1))
let (eval_instr :
  Vale_X64_Instruction_s.instr_t_record ->
    Obj.t ->
      unit instr_annotation ->
        machine_state -> machine_state FStar_Pervasives_Native.option)
  =
  fun it ->
    fun oprs ->
      fun ann ->
        fun s0 ->
          let uu___ = it in
          match uu___ with
          | Vale_X64_Instruction_s.InstrTypeRecord
              (outs, args, havoc_flags', i) ->
              let vs =
                instr_apply_eval outs args
                  (Vale_X64_Instruction_s.instr_eval outs args havoc_flags' i)
                  oprs s0 in
              let s1 =
                match havoc_flags' with
                | Vale_X64_Instruction_s.HavocFlags ->
                    let uu___1 = s0 in
                    {
                      ms_ok = (uu___1.ms_ok);
                      ms_regs = (uu___1.ms_regs);
                      ms_flags = havoc_flags;
                      ms_heap = (uu___1.ms_heap);
                      ms_stack = (uu___1.ms_stack);
                      ms_stackTaint = (uu___1.ms_stackTaint);
                      ms_trace = (uu___1.ms_trace)
                    }
                | Vale_X64_Instruction_s.PreserveFlags -> s0 in
              (match vs with
               | FStar_Pervasives_Native.Some x ->
                   FStar_Pervasives_Native.Some
                     (instr_write_outputs outs args x oprs s0 s1)
               | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None)
let (machine_eval_ins_st : ins -> unit st) =
  fun ins1 ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 =
            match ins1 with
            | Vale_X64_Bytes_Code_s.Instr (it, oprs, ann) ->
                (apply_option (eval_instr it oprs ann x)
                   (fun s -> fun uu___2 -> ((), s))) s1
            | Vale_X64_Bytes_Code_s.Push (src, t) ->
                (match match if valid_src_operand64_and_taint src s1
                             then ((), s1)
                             else
                               ((),
                                 {
                                   ms_ok = false;
                                   ms_regs = (s1.ms_regs);
                                   ms_flags = (s1.ms_flags);
                                   ms_heap = (s1.ms_heap);
                                   ms_stack = (s1.ms_stack);
                                   ms_stackTaint = (s1.ms_stackTaint);
                                   ms_trace = (s1.ms_trace)
                                 })
                       with
                       | (y, s2) ->
                           ((),
                             {
                               ms_ok = ((s1.ms_ok && s1.ms_ok) && s2.ms_ok);
                               ms_regs = (s2.ms_regs);
                               ms_flags = (s2.ms_flags);
                               ms_heap = (s2.ms_heap);
                               ms_stack = (s2.ms_stack);
                               ms_stackTaint = (s2.ms_stackTaint);
                               ms_trace = (s2.ms_trace)
                             })
                 with
                 | (x1, s11) ->
                     (match match match match if
                                                ((Obj.magic
                                                    (x.ms_regs
                                                       (Vale_X64_Machine_s.Reg
                                                          (Prims.int_zero,
                                                            (Prims.of_int (7))))))
                                                   - (Prims.of_int (8)))
                                                  >=
                                                  ((__proj__Machine_stack__item__initial_rsp
                                                      s11.ms_stack)
                                                     - (Prims.of_int (4096)))
                                              then ((), s11)
                                              else
                                                ((),
                                                  {
                                                    ms_ok = false;
                                                    ms_regs = (s11.ms_regs);
                                                    ms_flags = (s11.ms_flags);
                                                    ms_heap = (s11.ms_heap);
                                                    ms_stack = (s11.ms_stack);
                                                    ms_stackTaint =
                                                      (s11.ms_stackTaint);
                                                    ms_trace = (s11.ms_trace)
                                                  })
                                        with
                                        | (y, s2) ->
                                            ((),
                                              {
                                                ms_ok =
                                                  ((s11.ms_ok && s11.ms_ok)
                                                     && s2.ms_ok);
                                                ms_regs = (s2.ms_regs);
                                                ms_flags = (s2.ms_flags);
                                                ms_heap = (s2.ms_heap);
                                                ms_stack = (s2.ms_stack);
                                                ms_stackTaint =
                                                  (s2.ms_stackTaint);
                                                ms_trace = (s2.ms_trace)
                                              })
                                  with
                                  | (x2, s12) ->
                                      (match match match if
                                                           ((Obj.magic
                                                               (x.ms_regs
                                                                  (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                              -
                                                              (Prims.of_int (8)))
                                                             <=
                                                             (__proj__Machine_stack__item__initial_rsp
                                                                s12.ms_stack)
                                                         then ((), s12)
                                                         else
                                                           ((),
                                                             {
                                                               ms_ok = false;
                                                               ms_regs =
                                                                 (s12.ms_regs);
                                                               ms_flags =
                                                                 (s12.ms_flags);
                                                               ms_heap =
                                                                 (s12.ms_heap);
                                                               ms_stack =
                                                                 (s12.ms_stack);
                                                               ms_stackTaint
                                                                 =
                                                                 (s12.ms_stackTaint);
                                                               ms_trace =
                                                                 (s12.ms_trace)
                                                             })
                                                   with
                                                   | (y, s2) ->
                                                       ((),
                                                         {
                                                           ms_ok =
                                                             ((s12.ms_ok &&
                                                                 s12.ms_ok)
                                                                && s2.ms_ok);
                                                           ms_regs =
                                                             (s2.ms_regs);
                                                           ms_flags =
                                                             (s2.ms_flags);
                                                           ms_heap =
                                                             (s2.ms_heap);
                                                           ms_stack =
                                                             (s2.ms_stack);
                                                           ms_stackTaint =
                                                             (s2.ms_stackTaint);
                                                           ms_trace =
                                                             (s2.ms_trace)
                                                         })
                                             with
                                             | (x3, s13) ->
                                                 ((),
                                                   {
                                                     ms_ok =
                                                       ((s12.ms_ok &&
                                                           s13.ms_ok)
                                                          &&
                                                          {
                                                            ms_ok =
                                                              ((s13.ms_ok &&
                                                                  s13.ms_ok)
                                                                 &&
                                                                 (update_rsp'
                                                                    (
                                                                    (Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                    s13).ms_ok);
                                                            ms_regs =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_regs);
                                                            ms_flags =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_flags);
                                                            ms_heap =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_heap);
                                                            ms_stack =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_stack);
                                                            ms_stackTaint =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_stackTaint);
                                                            ms_trace =
                                                              ((update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_trace)
                                                          }.ms_ok);
                                                     ms_regs =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_regs);
                                                     ms_flags =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_flags);
                                                     ms_heap =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_heap);
                                                     ms_stack =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_stack);
                                                     ms_stackTaint =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_stackTaint);
                                                     ms_trace =
                                                       ({
                                                          ms_ok =
                                                            ((s13.ms_ok &&
                                                                s13.ms_ok)
                                                               &&
                                                               (update_rsp'
                                                                  ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))
                                                                  s13).ms_ok);
                                                          ms_regs =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_regs);
                                                          ms_flags =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_flags);
                                                          ms_heap =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_heap);
                                                          ms_stack =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stack);
                                                          ms_stackTaint =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_stackTaint);
                                                          ms_trace =
                                                            ((update_rsp'
                                                                ((Obj.magic
                                                                    (
                                                                    x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                   -
                                                                   (Prims.of_int (8)))
                                                                s13).ms_trace)
                                                        }.ms_trace)
                                                   })
                                       with
                                       | (y, s2) ->
                                           ((),
                                             {
                                               ms_ok =
                                                 ((s11.ms_ok && s12.ms_ok) &&
                                                    s2.ms_ok);
                                               ms_regs = (s2.ms_regs);
                                               ms_flags = (s2.ms_flags);
                                               ms_heap = (s2.ms_heap);
                                               ms_stack = (s2.ms_stack);
                                               ms_stackTaint =
                                                 (s2.ms_stackTaint);
                                               ms_trace = (s2.ms_trace)
                                             }))
                            with
                            | (x2, s12) ->
                                (match match match if
                                                     valid_dst_operand64
                                                       (Vale_X64_Machine_s.OStack
                                                          ((Vale_X64_Machine_s.MConst
                                                              ((Obj.magic
                                                                  (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                 -
                                                                 (Prims.of_int (8)))),
                                                            t)) s12
                                                   then ((), s12)
                                                   else
                                                     ((),
                                                       {
                                                         ms_ok = false;
                                                         ms_regs =
                                                           (s12.ms_regs);
                                                         ms_flags =
                                                           (s12.ms_flags);
                                                         ms_heap =
                                                           (s12.ms_heap);
                                                         ms_stack =
                                                           (s12.ms_stack);
                                                         ms_stackTaint =
                                                           (s12.ms_stackTaint);
                                                         ms_trace =
                                                           (s12.ms_trace)
                                                       })
                                             with
                                             | (y, s2) ->
                                                 ((),
                                                   {
                                                     ms_ok =
                                                       ((s12.ms_ok &&
                                                           s12.ms_ok)
                                                          && s2.ms_ok);
                                                     ms_regs = (s2.ms_regs);
                                                     ms_flags = (s2.ms_flags);
                                                     ms_heap = (s2.ms_heap);
                                                     ms_stack = (s2.ms_stack);
                                                     ms_stackTaint =
                                                       (s2.ms_stackTaint);
                                                     ms_trace = (s2.ms_trace)
                                                   })
                                       with
                                       | (x3, s13) ->
                                           ((),
                                             {
                                               ms_ok =
                                                 ((s12.ms_ok && s13.ms_ok) &&
                                                    {
                                                      ms_ok =
                                                        ((s13.ms_ok &&
                                                            s13.ms_ok)
                                                           &&
                                                           (update_operand64_preserve_flags'
                                                              (Vale_X64_Machine_s.OStack
                                                                 ((Vale_X64_Machine_s.MConst
                                                                    ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                   t))
                                                              (eval_operand
                                                                 src x) s13).ms_ok);
                                                      ms_regs =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_regs);
                                                      ms_flags =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_flags);
                                                      ms_heap =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_heap);
                                                      ms_stack =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_stack);
                                                      ms_stackTaint =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_stackTaint);
                                                      ms_trace =
                                                        ((update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_trace)
                                                    }.ms_ok);
                                               ms_regs =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_regs);
                                               ms_flags =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_flags);
                                               ms_heap =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_heap);
                                               ms_stack =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_stack);
                                               ms_stackTaint =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_stackTaint);
                                               ms_trace =
                                                 ({
                                                    ms_ok =
                                                      ((s13.ms_ok &&
                                                          s13.ms_ok)
                                                         &&
                                                         (update_operand64_preserve_flags'
                                                            (Vale_X64_Machine_s.OStack
                                                               ((Vale_X64_Machine_s.MConst
                                                                   ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                                 t))
                                                            (eval_operand src
                                                               x) s13).ms_ok);
                                                    ms_regs =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_regs);
                                                    ms_flags =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_flags);
                                                    ms_heap =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_heap);
                                                    ms_stack =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stack);
                                                    ms_stackTaint =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_stackTaint);
                                                    ms_trace =
                                                      ((update_operand64_preserve_flags'
                                                          (Vale_X64_Machine_s.OStack
                                                             ((Vale_X64_Machine_s.MConst
                                                                 ((Obj.magic
                                                                    (x.ms_regs
                                                                    (Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (7))))))
                                                                    -
                                                                    (Prims.of_int (8)))),
                                                               t))
                                                          (eval_operand src x)
                                                          s13).ms_trace)
                                                  }.ms_trace)
                                             })
                                 with
                                 | (y, s2) ->
                                     ((),
                                       {
                                         ms_ok =
                                           ((s11.ms_ok && s12.ms_ok) &&
                                              s2.ms_ok);
                                         ms_regs = (s2.ms_regs);
                                         ms_flags = (s2.ms_flags);
                                         ms_heap = (s2.ms_heap);
                                         ms_stack = (s2.ms_stack);
                                         ms_stackTaint = (s2.ms_stackTaint);
                                         ms_trace = (s2.ms_trace)
                                       }))
                      with
                      | (y, s2) ->
                          ((),
                            {
                              ms_ok = ((s1.ms_ok && s11.ms_ok) && s2.ms_ok);
                              ms_regs = (s2.ms_regs);
                              ms_flags = (s2.ms_flags);
                              ms_heap = (s2.ms_heap);
                              ms_stack = (s2.ms_stack);
                              ms_stackTaint = (s2.ms_stackTaint);
                              ms_trace = (s2.ms_trace)
                            })))
            | Vale_X64_Bytes_Code_s.Pop (dst, t) ->
                (let stack_op =
                   Vale_X64_Machine_s.OStack
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (7)))),
                           Prims.int_zero)), t) in
                 (fun s01 ->
                    let uu___2 =
                      let uu___3 = (s01, s01) in
                      match uu___3 with
                      | (x1, s11) ->
                          let uu___4 =
                            if valid_src_operand64_and_taint stack_op x1
                            then ((), s11)
                            else
                              ((),
                                {
                                  ms_ok = false;
                                  ms_regs = (s11.ms_regs);
                                  ms_flags = (s11.ms_flags);
                                  ms_heap = (s11.ms_heap);
                                  ms_stack = (s11.ms_stack);
                                  ms_stackTaint = (s11.ms_stackTaint);
                                  ms_trace = (s11.ms_trace)
                                }) in
                          (match uu___4 with
                           | (y, s2) ->
                               ((),
                                 (let uu___5 = s2 in
                                  {
                                    ms_ok =
                                      ((s01.ms_ok && s11.ms_ok) && s2.ms_ok);
                                    ms_regs = (uu___5.ms_regs);
                                    ms_flags = (uu___5.ms_flags);
                                    ms_heap = (uu___5.ms_heap);
                                    ms_stack = (uu___5.ms_stack);
                                    ms_stackTaint = (uu___5.ms_stackTaint);
                                    ms_trace = (uu___5.ms_trace)
                                  }))) in
                    match uu___2 with
                    | (x1, s11) ->
                        let uu___3 =
                          (let new_dst = eval_operand stack_op x in
                           let new_rsp =
                             ((Obj.magic
                                 (x.ms_regs
                                    (Vale_X64_Machine_s.Reg
                                       (Prims.int_zero, (Prims.of_int (7))))))
                                + (Prims.of_int (8)))
                               mod (Prims.parse_int "0x10000000000000000") in
                           fun s02 ->
                             let uu___4 =
                               let uu___5 =
                                 let uu___6 = (s02, s02) in
                                 match uu___6 with
                                 | (x2, s12) ->
                                     let uu___7 =
                                       if valid_dst_operand64 dst x2
                                       then ((), s12)
                                       else
                                         ((),
                                           {
                                             ms_ok = false;
                                             ms_regs = (s12.ms_regs);
                                             ms_flags = (s12.ms_flags);
                                             ms_heap = (s12.ms_heap);
                                             ms_stack = (s12.ms_stack);
                                             ms_stackTaint =
                                               (s12.ms_stackTaint);
                                             ms_trace = (s12.ms_trace)
                                           }) in
                                     (match uu___7 with
                                      | (y, s2) ->
                                          ((),
                                            (let uu___8 = s2 in
                                             {
                                               ms_ok =
                                                 ((s02.ms_ok && s12.ms_ok) &&
                                                    s2.ms_ok);
                                               ms_regs = (uu___8.ms_regs);
                                               ms_flags = (uu___8.ms_flags);
                                               ms_heap = (uu___8.ms_heap);
                                               ms_stack = (uu___8.ms_stack);
                                               ms_stackTaint =
                                                 (uu___8.ms_stackTaint);
                                               ms_trace = (uu___8.ms_trace)
                                             }))) in
                               match uu___5 with
                               | (x2, s12) ->
                                   let uu___6 =
                                     let uu___7 = (s12, s12) in
                                     match uu___7 with
                                     | (x3, s13) ->
                                         let uu___8 =
                                           ((),
                                             (update_operand64_preserve_flags'
                                                dst new_dst x3)) in
                                         (match uu___8 with
                                          | (y, s2) ->
                                              ((),
                                                (let uu___9 = s2 in
                                                 {
                                                   ms_ok =
                                                     ((s12.ms_ok && s13.ms_ok)
                                                        && s2.ms_ok);
                                                   ms_regs = (uu___9.ms_regs);
                                                   ms_flags =
                                                     (uu___9.ms_flags);
                                                   ms_heap = (uu___9.ms_heap);
                                                   ms_stack =
                                                     (uu___9.ms_stack);
                                                   ms_stackTaint =
                                                     (uu___9.ms_stackTaint);
                                                   ms_trace =
                                                     (uu___9.ms_trace)
                                                 }))) in
                                   (match uu___6 with
                                    | (y, s2) ->
                                        ((),
                                          (let uu___7 = s2 in
                                           {
                                             ms_ok =
                                               ((s02.ms_ok && s12.ms_ok) &&
                                                  s2.ms_ok);
                                             ms_regs = (uu___7.ms_regs);
                                             ms_flags = (uu___7.ms_flags);
                                             ms_heap = (uu___7.ms_heap);
                                             ms_stack = (uu___7.ms_stack);
                                             ms_stackTaint =
                                               (uu___7.ms_stackTaint);
                                             ms_trace = (uu___7.ms_trace)
                                           }))) in
                             match uu___4 with
                             | (x2, s12) ->
                                 let uu___5 =
                                   let uu___6 =
                                     free_stack
                                       (new_rsp - (Prims.of_int (8))) new_rsp
                                       s12 in
                                   match uu___6 with
                                   | (x3, s13) ->
                                       let uu___7 =
                                         let uu___8 =
                                           let uu___9 = (s13, s13) in
                                           match uu___9 with
                                           | (x4, s14) ->
                                               let uu___10 =
                                                 if
                                                   new_rsp >=
                                                     ((__proj__Machine_stack__item__initial_rsp
                                                         x4.ms_stack)
                                                        -
                                                        (Prims.of_int (4096)))
                                                 then ((), s14)
                                                 else
                                                   ((),
                                                     {
                                                       ms_ok = false;
                                                       ms_regs =
                                                         (s14.ms_regs);
                                                       ms_flags =
                                                         (s14.ms_flags);
                                                       ms_heap =
                                                         (s14.ms_heap);
                                                       ms_stack =
                                                         (s14.ms_stack);
                                                       ms_stackTaint =
                                                         (s14.ms_stackTaint);
                                                       ms_trace =
                                                         (s14.ms_trace)
                                                     }) in
                                               (match uu___10 with
                                                | (y, s2) ->
                                                    ((),
                                                      (let uu___11 = s2 in
                                                       {
                                                         ms_ok =
                                                           ((s13.ms_ok &&
                                                               s14.ms_ok)
                                                              && s2.ms_ok);
                                                         ms_regs =
                                                           (uu___11.ms_regs);
                                                         ms_flags =
                                                           (uu___11.ms_flags);
                                                         ms_heap =
                                                           (uu___11.ms_heap);
                                                         ms_stack =
                                                           (uu___11.ms_stack);
                                                         ms_stackTaint =
                                                           (uu___11.ms_stackTaint);
                                                         ms_trace =
                                                           (uu___11.ms_trace)
                                                       }))) in
                                         match uu___8 with
                                         | (x4, s14) ->
                                             let uu___9 =
                                               let uu___10 =
                                                 let uu___11 = (s14, s14) in
                                                 match uu___11 with
                                                 | (x5, s15) ->
                                                     let uu___12 =
                                                       if
                                                         new_rsp <=
                                                           (__proj__Machine_stack__item__initial_rsp
                                                              x5.ms_stack)
                                                       then ((), s15)
                                                       else
                                                         ((),
                                                           {
                                                             ms_ok = false;
                                                             ms_regs =
                                                               (s15.ms_regs);
                                                             ms_flags =
                                                               (s15.ms_flags);
                                                             ms_heap =
                                                               (s15.ms_heap);
                                                             ms_stack =
                                                               (s15.ms_stack);
                                                             ms_stackTaint =
                                                               (s15.ms_stackTaint);
                                                             ms_trace =
                                                               (s15.ms_trace)
                                                           }) in
                                                     (match uu___12 with
                                                      | (y, s2) ->
                                                          ((),
                                                            (let uu___13 = s2 in
                                                             {
                                                               ms_ok =
                                                                 ((s14.ms_ok
                                                                    &&
                                                                    s15.ms_ok)
                                                                    &&
                                                                    s2.ms_ok);
                                                               ms_regs =
                                                                 (uu___13.ms_regs);
                                                               ms_flags =
                                                                 (uu___13.ms_flags);
                                                               ms_heap =
                                                                 (uu___13.ms_heap);
                                                               ms_stack =
                                                                 (uu___13.ms_stack);
                                                               ms_stackTaint
                                                                 =
                                                                 (uu___13.ms_stackTaint);
                                                               ms_trace =
                                                                 (uu___13.ms_trace)
                                                             }))) in
                                               match uu___10 with
                                               | (x5, s15) ->
                                                   let uu___11 =
                                                     let uu___12 = (s15, s15) in
                                                     match uu___12 with
                                                     | (x6, s16) ->
                                                         let uu___13 =
                                                           ((),
                                                             (update_rsp'
                                                                new_rsp x6)) in
                                                         (match uu___13 with
                                                          | (y, s2) ->
                                                              ((),
                                                                (let uu___14
                                                                   = s2 in
                                                                 {
                                                                   ms_ok =
                                                                    ((s15.ms_ok
                                                                    &&
                                                                    s16.ms_ok)
                                                                    &&
                                                                    s2.ms_ok);
                                                                   ms_regs =
                                                                    (uu___14.ms_regs);
                                                                   ms_flags =
                                                                    (uu___14.ms_flags);
                                                                   ms_heap =
                                                                    (uu___14.ms_heap);
                                                                   ms_stack =
                                                                    (uu___14.ms_stack);
                                                                   ms_stackTaint
                                                                    =
                                                                    (uu___14.ms_stackTaint);
                                                                   ms_trace =
                                                                    (uu___14.ms_trace)
                                                                 }))) in
                                                   (match uu___11 with
                                                    | (y, s2) ->
                                                        ((),
                                                          (let uu___12 = s2 in
                                                           {
                                                             ms_ok =
                                                               ((s14.ms_ok &&
                                                                   s15.ms_ok)
                                                                  && 
                                                                  s2.ms_ok);
                                                             ms_regs =
                                                               (uu___12.ms_regs);
                                                             ms_flags =
                                                               (uu___12.ms_flags);
                                                             ms_heap =
                                                               (uu___12.ms_heap);
                                                             ms_stack =
                                                               (uu___12.ms_stack);
                                                             ms_stackTaint =
                                                               (uu___12.ms_stackTaint);
                                                             ms_trace =
                                                               (uu___12.ms_trace)
                                                           }))) in
                                             (match uu___9 with
                                              | (y, s2) ->
                                                  ((),
                                                    (let uu___10 = s2 in
                                                     {
                                                       ms_ok =
                                                         ((s13.ms_ok &&
                                                             s14.ms_ok)
                                                            && s2.ms_ok);
                                                       ms_regs =
                                                         (uu___10.ms_regs);
                                                       ms_flags =
                                                         (uu___10.ms_flags);
                                                       ms_heap =
                                                         (uu___10.ms_heap);
                                                       ms_stack =
                                                         (uu___10.ms_stack);
                                                       ms_stackTaint =
                                                         (uu___10.ms_stackTaint);
                                                       ms_trace =
                                                         (uu___10.ms_trace)
                                                     }))) in
                                       (match uu___7 with
                                        | (y, s2) ->
                                            ((),
                                              (let uu___8 = s2 in
                                               {
                                                 ms_ok =
                                                   ((s12.ms_ok && s13.ms_ok)
                                                      && s2.ms_ok);
                                                 ms_regs = (uu___8.ms_regs);
                                                 ms_flags = (uu___8.ms_flags);
                                                 ms_heap = (uu___8.ms_heap);
                                                 ms_stack = (uu___8.ms_stack);
                                                 ms_stackTaint =
                                                   (uu___8.ms_stackTaint);
                                                 ms_trace = (uu___8.ms_trace)
                                               }))) in
                                 (match uu___5 with
                                  | (y, s2) ->
                                      ((),
                                        (let uu___6 = s2 in
                                         {
                                           ms_ok =
                                             ((s02.ms_ok && s12.ms_ok) &&
                                                s2.ms_ok);
                                           ms_regs = (uu___6.ms_regs);
                                           ms_flags = (uu___6.ms_flags);
                                           ms_heap = (uu___6.ms_heap);
                                           ms_stack = (uu___6.ms_stack);
                                           ms_stackTaint =
                                             (uu___6.ms_stackTaint);
                                           ms_trace = (uu___6.ms_trace)
                                         })))) s11 in
                        (match uu___3 with
                         | (y, s2) ->
                             ((),
                               (let uu___4 = s2 in
                                {
                                  ms_ok =
                                    ((s01.ms_ok && s11.ms_ok) && s2.ms_ok);
                                  ms_regs = (uu___4.ms_regs);
                                  ms_flags = (uu___4.ms_flags);
                                  ms_heap = (uu___4.ms_heap);
                                  ms_stack = (uu___4.ms_stack);
                                  ms_stackTaint = (uu___4.ms_stackTaint);
                                  ms_trace = (uu___4.ms_trace)
                                }))))) s1
            | Vale_X64_Bytes_Code_s.Alloc n ->
                (match match if
                               ((Obj.magic
                                   (x.ms_regs
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_zero, (Prims.of_int (7))))))
                                  - n)
                                 >=
                                 ((__proj__Machine_stack__item__initial_rsp
                                     s1.ms_stack)
                                    - (Prims.of_int (4096)))
                             then ((), s1)
                             else
                               ((),
                                 {
                                   ms_ok = false;
                                   ms_regs = (s1.ms_regs);
                                   ms_flags = (s1.ms_flags);
                                   ms_heap = (s1.ms_heap);
                                   ms_stack = (s1.ms_stack);
                                   ms_stackTaint = (s1.ms_stackTaint);
                                   ms_trace = (s1.ms_trace)
                                 })
                       with
                       | (y, s2) ->
                           ((),
                             {
                               ms_ok = ((s1.ms_ok && s1.ms_ok) && s2.ms_ok);
                               ms_regs = (s2.ms_regs);
                               ms_flags = (s2.ms_flags);
                               ms_heap = (s2.ms_heap);
                               ms_stack = (s2.ms_stack);
                               ms_stackTaint = (s2.ms_stackTaint);
                               ms_trace = (s2.ms_trace)
                             })
                 with
                 | (x1, s11) ->
                     (match match match if
                                          ((Obj.magic
                                              (x.ms_regs
                                                 (Vale_X64_Machine_s.Reg
                                                    (Prims.int_zero,
                                                      (Prims.of_int (7))))))
                                             - n)
                                            <=
                                            (__proj__Machine_stack__item__initial_rsp
                                               s11.ms_stack)
                                        then ((), s11)
                                        else
                                          ((),
                                            {
                                              ms_ok = false;
                                              ms_regs = (s11.ms_regs);
                                              ms_flags = (s11.ms_flags);
                                              ms_heap = (s11.ms_heap);
                                              ms_stack = (s11.ms_stack);
                                              ms_stackTaint =
                                                (s11.ms_stackTaint);
                                              ms_trace = (s11.ms_trace)
                                            })
                                  with
                                  | (y, s2) ->
                                      ((),
                                        {
                                          ms_ok =
                                            ((s11.ms_ok && s11.ms_ok) &&
                                               s2.ms_ok);
                                          ms_regs = (s2.ms_regs);
                                          ms_flags = (s2.ms_flags);
                                          ms_heap = (s2.ms_heap);
                                          ms_stack = (s2.ms_stack);
                                          ms_stackTaint = (s2.ms_stackTaint);
                                          ms_trace = (s2.ms_trace)
                                        })
                            with
                            | (x2, s12) ->
                                ((),
                                  {
                                    ms_ok =
                                      ((s11.ms_ok && s12.ms_ok) &&
                                         {
                                           ms_ok =
                                             ((s12.ms_ok && s12.ms_ok) &&
                                                (update_rsp'
                                                   ((Obj.magic
                                                       (x.ms_regs
                                                          (Vale_X64_Machine_s.Reg
                                                             (Prims.int_zero,
                                                               (Prims.of_int (7))))))
                                                      - n) s12).ms_ok);
                                           ms_regs =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_regs);
                                           ms_flags =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_flags);
                                           ms_heap =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_heap);
                                           ms_stack =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_stack);
                                           ms_stackTaint =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_stackTaint);
                                           ms_trace =
                                             ((update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_trace)
                                         }.ms_ok);
                                    ms_regs =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_regs);
                                    ms_flags =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_flags);
                                    ms_heap =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_heap);
                                    ms_stack =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_stack);
                                    ms_stackTaint =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_stackTaint);
                                    ms_trace =
                                      ({
                                         ms_ok =
                                           ((s12.ms_ok && s12.ms_ok) &&
                                              (update_rsp'
                                                 ((Obj.magic
                                                     (x.ms_regs
                                                        (Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (7))))))
                                                    - n) s12).ms_ok);
                                         ms_regs =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_regs);
                                         ms_flags =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_flags);
                                         ms_heap =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_heap);
                                         ms_stack =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stack);
                                         ms_stackTaint =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_stackTaint);
                                         ms_trace =
                                           ((update_rsp'
                                               ((Obj.magic
                                                   (x.ms_regs
                                                      (Vale_X64_Machine_s.Reg
                                                         (Prims.int_zero,
                                                           (Prims.of_int (7))))))
                                                  - n) s12).ms_trace)
                                       }.ms_trace)
                                  })
                      with
                      | (y, s2) ->
                          ((),
                            {
                              ms_ok = ((s1.ms_ok && s11.ms_ok) && s2.ms_ok);
                              ms_regs = (s2.ms_regs);
                              ms_flags = (s2.ms_flags);
                              ms_heap = (s2.ms_heap);
                              ms_stack = (s2.ms_stack);
                              ms_stackTaint = (s2.ms_stackTaint);
                              ms_trace = (s2.ms_trace)
                            })))
            | Vale_X64_Bytes_Code_s.Dealloc n ->
                (let old_rsp =
                   Obj.magic
                     (x.ms_regs
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (7))))) in
                 let new_rsp = old_rsp + n in
                 (fun s01 ->
                    let uu___2 =
                      let uu___3 =
                        let uu___4 = (s01, s01) in
                        match uu___4 with
                        | (x1, s11) ->
                            let uu___5 =
                              if
                                new_rsp >=
                                  ((__proj__Machine_stack__item__initial_rsp
                                      x1.ms_stack)
                                     - (Prims.of_int (4096)))
                              then ((), s11)
                              else
                                ((),
                                  {
                                    ms_ok = false;
                                    ms_regs = (s11.ms_regs);
                                    ms_flags = (s11.ms_flags);
                                    ms_heap = (s11.ms_heap);
                                    ms_stack = (s11.ms_stack);
                                    ms_stackTaint = (s11.ms_stackTaint);
                                    ms_trace = (s11.ms_trace)
                                  }) in
                            (match uu___5 with
                             | (y, s2) ->
                                 ((),
                                   (let uu___6 = s2 in
                                    {
                                      ms_ok =
                                        ((s01.ms_ok && s11.ms_ok) && s2.ms_ok);
                                      ms_regs = (uu___6.ms_regs);
                                      ms_flags = (uu___6.ms_flags);
                                      ms_heap = (uu___6.ms_heap);
                                      ms_stack = (uu___6.ms_stack);
                                      ms_stackTaint = (uu___6.ms_stackTaint);
                                      ms_trace = (uu___6.ms_trace)
                                    }))) in
                      match uu___3 with
                      | (x1, s11) ->
                          let uu___4 =
                            let uu___5 =
                              let uu___6 = (s11, s11) in
                              match uu___6 with
                              | (x2, s12) ->
                                  let uu___7 =
                                    if
                                      new_rsp <=
                                        (__proj__Machine_stack__item__initial_rsp
                                           x2.ms_stack)
                                    then ((), s12)
                                    else
                                      ((),
                                        {
                                          ms_ok = false;
                                          ms_regs = (s12.ms_regs);
                                          ms_flags = (s12.ms_flags);
                                          ms_heap = (s12.ms_heap);
                                          ms_stack = (s12.ms_stack);
                                          ms_stackTaint = (s12.ms_stackTaint);
                                          ms_trace = (s12.ms_trace)
                                        }) in
                                  (match uu___7 with
                                   | (y, s2) ->
                                       ((),
                                         (let uu___8 = s2 in
                                          {
                                            ms_ok =
                                              ((s11.ms_ok && s12.ms_ok) &&
                                                 s2.ms_ok);
                                            ms_regs = (uu___8.ms_regs);
                                            ms_flags = (uu___8.ms_flags);
                                            ms_heap = (uu___8.ms_heap);
                                            ms_stack = (uu___8.ms_stack);
                                            ms_stackTaint =
                                              (uu___8.ms_stackTaint);
                                            ms_trace = (uu___8.ms_trace)
                                          }))) in
                            match uu___5 with
                            | (x2, s12) ->
                                let uu___6 =
                                  let uu___7 = (s12, s12) in
                                  match uu___7 with
                                  | (x3, s13) ->
                                      let uu___8 =
                                        ((), (update_rsp' new_rsp x3)) in
                                      (match uu___8 with
                                       | (y, s2) ->
                                           ((),
                                             (let uu___9 = s2 in
                                              {
                                                ms_ok =
                                                  ((s12.ms_ok && s13.ms_ok)
                                                     && s2.ms_ok);
                                                ms_regs = (uu___9.ms_regs);
                                                ms_flags = (uu___9.ms_flags);
                                                ms_heap = (uu___9.ms_heap);
                                                ms_stack = (uu___9.ms_stack);
                                                ms_stackTaint =
                                                  (uu___9.ms_stackTaint);
                                                ms_trace = (uu___9.ms_trace)
                                              }))) in
                                (match uu___6 with
                                 | (y, s2) ->
                                     ((),
                                       (let uu___7 = s2 in
                                        {
                                          ms_ok =
                                            ((s11.ms_ok && s12.ms_ok) &&
                                               s2.ms_ok);
                                          ms_regs = (uu___7.ms_regs);
                                          ms_flags = (uu___7.ms_flags);
                                          ms_heap = (uu___7.ms_heap);
                                          ms_stack = (uu___7.ms_stack);
                                          ms_stackTaint =
                                            (uu___7.ms_stackTaint);
                                          ms_trace = (uu___7.ms_trace)
                                        }))) in
                          (match uu___4 with
                           | (y, s2) ->
                               ((),
                                 (let uu___5 = s2 in
                                  {
                                    ms_ok =
                                      ((s01.ms_ok && s11.ms_ok) && s2.ms_ok);
                                    ms_regs = (uu___5.ms_regs);
                                    ms_flags = (uu___5.ms_flags);
                                    ms_heap = (uu___5.ms_heap);
                                    ms_stack = (uu___5.ms_stack);
                                    ms_stackTaint = (uu___5.ms_stackTaint);
                                    ms_trace = (uu___5.ms_trace)
                                  }))) in
                    match uu___2 with
                    | (x1, s11) ->
                        let uu___3 = free_stack old_rsp new_rsp s11 in
                        (match uu___3 with
                         | (y, s2) ->
                             ((),
                               (let uu___4 = s2 in
                                {
                                  ms_ok =
                                    ((s01.ms_ok && s11.ms_ok) && s2.ms_ok);
                                  ms_regs = (uu___4.ms_regs);
                                  ms_flags = (uu___4.ms_flags);
                                  ms_heap = (uu___4.ms_heap);
                                  ms_stack = (uu___4.ms_stack);
                                  ms_stackTaint = (uu___4.ms_stackTaint);
                                  ms_trace = (uu___4.ms_trace)
                                }))))) s1 in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    ms_ok = ((s0.ms_ok && s1.ms_ok) && s2.ms_ok);
                    ms_regs = (uu___2.ms_regs);
                    ms_flags = (uu___2.ms_flags);
                    ms_heap = (uu___2.ms_heap);
                    ms_stack = (uu___2.ms_stack);
                    ms_stackTaint = (uu___2.ms_stackTaint);
                    ms_trace = (uu___2.ms_trace)
                  })))
let (machine_eval_ins : ins -> machine_state -> machine_state) =
  fun i -> fun s -> FStar_Pervasives_Native.snd (machine_eval_ins_st i s)
let (machine_eval_code_ins_def :
  ins -> machine_state -> machine_state FStar_Pervasives_Native.option) =
  fun i ->
    fun s ->
      let obs = ins_obs i s in
      FStar_Pervasives_Native.Some
        (let uu___ =
           machine_eval_ins i
             (let uu___1 = s in
              {
                ms_ok = (uu___1.ms_ok);
                ms_regs = (uu___1.ms_regs);
                ms_flags = (uu___1.ms_flags);
                ms_heap = (uu___1.ms_heap);
                ms_stack = (uu___1.ms_stack);
                ms_stackTaint = (uu___1.ms_stackTaint);
                ms_trace = []
              }) in
         {
           ms_ok = (uu___.ms_ok);
           ms_regs = (uu___.ms_regs);
           ms_flags = (uu___.ms_flags);
           ms_heap = (uu___.ms_heap);
           ms_stack = (uu___.ms_stack);
           ms_stackTaint = (uu___.ms_stackTaint);
           ms_trace = (FStar_List_Tot_Base.append obs s.ms_trace)
         })
let (machine_eval_code_ins :
  ins -> machine_state -> machine_state FStar_Pervasives_Native.option) =
  fun i -> fun s -> machine_eval_code_ins_def i s
let (machine_eval_ocmp :
  machine_state -> ocmp -> (machine_state * Prims.bool)) =
  fun s ->
    fun c ->
      let s1 =
        FStar_Pervasives_Native.snd
          (let uu___ = (s, s) in
           match uu___ with
           | (x, s11) ->
               let uu___1 =
                 if valid_ocmp_opaque c x
                 then ((), s11)
                 else
                   ((),
                     {
                       ms_ok = false;
                       ms_regs = (s11.ms_regs);
                       ms_flags = (s11.ms_flags);
                       ms_heap = (s11.ms_heap);
                       ms_stack = (s11.ms_stack);
                       ms_stackTaint = (s11.ms_stackTaint);
                       ms_trace = (s11.ms_trace)
                     }) in
               (match uu___1 with
                | (y, s2) ->
                    ((),
                      (let uu___2 = s2 in
                       {
                         ms_ok = ((s.ms_ok && s11.ms_ok) && s2.ms_ok);
                         ms_regs = (uu___2.ms_regs);
                         ms_flags = (uu___2.ms_flags);
                         ms_heap = (uu___2.ms_heap);
                         ms_stack = (uu___2.ms_stack);
                         ms_stackTaint = (uu___2.ms_stackTaint);
                         ms_trace = (uu___2.ms_trace)
                       })))) in
      let b = eval_ocmp_opaque s1 c in
      let s2 =
        let uu___ = s1 in
        {
          ms_ok = (uu___.ms_ok);
          ms_regs = (uu___.ms_regs);
          ms_flags = havoc_flags;
          ms_heap = (uu___.ms_heap);
          ms_stack = (uu___.ms_stack);
          ms_stackTaint = (uu___.ms_stackTaint);
          ms_trace = ((Vale_X64_Machine_s.BranchPredicate b) ::
            (s1.ms_trace))
        } in
      (s2, b)
let rec (machine_eval_code :
  code ->
    Prims.nat ->
      machine_state -> machine_state FStar_Pervasives_Native.option)
  =
  fun c ->
    fun fuel ->
      fun s ->
        match c with
        | Vale_X64_Machine_s.Ins i -> machine_eval_code_ins i s
        | Vale_X64_Machine_s.Block cs -> machine_eval_codes cs fuel s
        | Vale_X64_Machine_s.IfElse (cond, ct, cf1) ->
            let uu___ = machine_eval_ocmp s cond in
            (match uu___ with
             | (s', b) ->
                 if b
                 then machine_eval_code ct fuel s'
                 else machine_eval_code cf1 fuel s')
        | Vale_X64_Machine_s.While (cond, body) ->
            machine_eval_while cond body fuel s
and (machine_eval_codes :
  codes ->
    Prims.nat ->
      machine_state -> machine_state FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun fuel ->
      fun s ->
        match cs with
        | [] -> FStar_Pervasives_Native.Some s
        | c'::cs' ->
            (match machine_eval_code c' fuel s with
             | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
             | FStar_Pervasives_Native.Some s' ->
                 machine_eval_codes cs' fuel s')
and (machine_eval_while :
  ocmp ->
    code ->
      Prims.nat ->
        machine_state -> machine_state FStar_Pervasives_Native.option)
  =
  fun cond ->
    fun body ->
      fun fuel ->
        fun s0 ->
          if fuel = Prims.int_zero
          then FStar_Pervasives_Native.None
          else
            (let uu___1 = machine_eval_ocmp s0 cond in
             match uu___1 with
             | (s1, b) ->
                 if Prims.op_Negation b
                 then FStar_Pervasives_Native.Some s1
                 else
                   (match machine_eval_code body (fuel - Prims.int_one) s1
                    with
                    | FStar_Pervasives_Native.None ->
                        FStar_Pervasives_Native.None
                    | FStar_Pervasives_Native.Some s2 ->
                        if Prims.op_Negation s2.ms_ok
                        then FStar_Pervasives_Native.Some s2
                        else
                          machine_eval_while cond body (fuel - Prims.int_one)
                            s2))