open Prims
type code = Vale_X64_Machine_Semantics_s.code
type codes = Vale_X64_Machine_Semantics_s.codes
type ocmp = Vale_X64_Machine_Semantics_s.ocmp
type fuel = Prims.nat
let (cf : Vale_X64_Flags.t -> Prims.bool FStar_Pervasives_Native.option) =
  fun flags -> Vale_X64_Flags.sel Prims.int_zero flags
let (overflow :
  Vale_X64_Flags.t -> Prims.bool FStar_Pervasives_Native.option) =
  fun flags -> Vale_X64_Flags.sel (Prims.of_int (11)) flags
let (update_cf : Vale_X64_Flags.t -> Prims.bool -> Vale_X64_Flags.t) =
  fun flags ->
    fun new_cf ->
      Vale_X64_Flags.upd Prims.int_zero (FStar_Pervasives_Native.Some new_cf)
        flags
let (update_of : Vale_X64_Flags.t -> Prims.bool -> Vale_X64_Flags.t) =
  fun flags ->
    fun new_of ->
      Vale_X64_Flags.upd (Prims.of_int (11))
        (FStar_Pervasives_Native.Some new_of) flags
type machine_state = Vale_X64_Machine_Semantics_s.machine_state
let (machine_eval_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state
          FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_code
let rec (code_modifies_ghost :
  Vale_X64_Machine_Semantics_s.code -> Prims.bool) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
        (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateGhost uu___2))
        -> true
    | Vale_X64_Machine_s.Ins uu___ -> false
    | Vale_X64_Machine_s.Block cs -> codes_modifies_ghost cs
    | Vale_X64_Machine_s.IfElse (uu___, c1, c2) ->
        (code_modifies_ghost c1) || (code_modifies_ghost c2)
    | Vale_X64_Machine_s.While (uu___, c1) -> code_modifies_ghost c1
and (codes_modifies_ghost : Vale_X64_Machine_Semantics_s.codes -> Prims.bool)
  =
  fun cs ->
    match cs with
    | [] -> false
    | c::cs1 -> (code_modifies_ghost c) || (codes_modifies_ghost cs1)
let (core_state :
  Prims.bool ->
    Vale_X64_Machine_Semantics_s.machine_state ->
      Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun ignore_ghost ->
    fun s ->
      let uu___ = s in
      {
        Vale_X64_Machine_Semantics_s.ms_ok =
          (uu___.Vale_X64_Machine_Semantics_s.ms_ok);
        Vale_X64_Machine_Semantics_s.ms_regs =
          (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
        Vale_X64_Machine_Semantics_s.ms_flags =
          (uu___.Vale_X64_Machine_Semantics_s.ms_flags);
        Vale_X64_Machine_Semantics_s.ms_heap =
          (if ignore_ghost
           then
             Vale_Arch_HeapLemmas.heap_ignore_ghost_machine
               s.Vale_X64_Machine_Semantics_s.ms_heap
           else s.Vale_X64_Machine_Semantics_s.ms_heap);
        Vale_X64_Machine_Semantics_s.ms_stack =
          (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
        Vale_X64_Machine_Semantics_s.ms_stackTaint =
          (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
        Vale_X64_Machine_Semantics_s.ms_trace = []
      }
type ('ignoreughost, 's1, 's2) state_eq_S = unit
type ('ignoreughost, 's1, 's2) state_eq_opt = Obj.t
type ('c, 's0, 'f0, 's1) eval_code = Obj.t



let (havoc_flags : Vale_X64_Flags.t) =
  Vale_X64_Flags.of_fun Vale_X64_Machine_Semantics_s.havoc_flags















type ('g, 'c, 's0, 'f0, 's1) eval_code_ts = Obj.t













let (compute_merge_total : Prims.nat -> Prims.nat -> Prims.nat) =
  fun f0 -> fun fM -> if f0 > fM then f0 else fM






type ('c, 's0, 'fW, 'sW) eval_while_inv_temp = unit
type ('c, 's0, 'fW, 'sW) eval_while_inv = unit



