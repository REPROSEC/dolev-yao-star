open Prims

type mod_t =
  | Mod_None 
  | Mod_ok 
  | Mod_reg of Vale_X64_Machine_s.reg 
  | Mod_flags 
  | Mod_mem 
  | Mod_mem_layout 
  | Mod_mem_heaplet of Vale_Arch_HeapImpl.heaplet_id 
  | Mod_stack 
  | Mod_stackTaint 
let (uu___is_Mod_None : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_None -> true | uu___ -> false
let (uu___is_Mod_ok : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_ok -> true | uu___ -> false
let (uu___is_Mod_reg : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_reg _0 -> true | uu___ -> false
let (__proj__Mod_reg__item___0 : mod_t -> Vale_X64_Machine_s.reg) =
  fun projectee -> match projectee with | Mod_reg _0 -> _0
let (uu___is_Mod_flags : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_flags -> true | uu___ -> false
let (uu___is_Mod_mem : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_mem -> true | uu___ -> false
let (uu___is_Mod_mem_layout : mod_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Mod_mem_layout -> true | uu___ -> false
let (uu___is_Mod_mem_heaplet : mod_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Mod_mem_heaplet _0 -> true | uu___ -> false
let (__proj__Mod_mem_heaplet__item___0 :
  mod_t -> Vale_Arch_HeapImpl.heaplet_id) =
  fun projectee -> match projectee with | Mod_mem_heaplet _0 -> _0
let (uu___is_Mod_stack : mod_t -> Prims.bool) =
  fun projectee -> match projectee with | Mod_stack -> true | uu___ -> false
let (uu___is_Mod_stackTaint : mod_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Mod_stackTaint -> true | uu___ -> false
type mods_t = mod_t Prims.list
type va_mods_t = mod_t Prims.list
let (va_Mod_None : mod_t) = Mod_None
let (va_Mod_ok : mod_t) = Mod_ok
let (va_Mod_reg64 : Vale_X64_Machine_s.reg_64 -> mod_t) =
  fun r -> Mod_reg (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
let (va_Mod_xmm : Vale_X64_Machine_s.reg_xmm -> mod_t) =
  fun r -> Mod_reg (Vale_X64_Machine_s.Reg (Prims.int_one, r))
let (va_Mod_flags : mod_t) = Mod_flags
let (va_Mod_mem : mod_t) = Mod_mem
let (va_Mod_mem_layout : mod_t) = Mod_mem_layout
let (va_Mod_mem_heaplet : Vale_Arch_HeapImpl.heaplet_id -> mod_t) =
  fun n -> Mod_mem_heaplet n
let (va_Mod_stack : mod_t) = Mod_stack
let (va_Mod_stackTaint : mod_t) = Mod_stackTaint
let (mod_eq : mod_t -> mod_t -> Prims.bool) =
  fun x ->
    fun y ->
      match x with
      | Mod_None -> (match y with | Mod_None -> true | uu___ -> false)
      | Mod_ok -> (match y with | Mod_ok -> true | uu___ -> false)
      | Mod_reg rx -> (match y with | Mod_reg ry -> rx = ry | uu___ -> false)
      | Mod_flags -> (match y with | Mod_flags -> true | uu___ -> false)
      | Mod_mem -> (match y with | Mod_mem -> true | uu___ -> false)
      | Mod_mem_layout ->
          (match y with | Mod_mem_layout -> true | uu___ -> false)
      | Mod_mem_heaplet nx ->
          (match y with | Mod_mem_heaplet ny -> nx = ny | uu___ -> false)
      | Mod_stack -> (match y with | Mod_stack -> true | uu___ -> false)
      | Mod_stackTaint ->
          (match y with | Mod_stackTaint -> true | uu___ -> false)
let (update_state_mod :
  mod_t ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun m ->
    fun sM ->
      fun sK ->
        match m with
        | Mod_None -> sK
        | Mod_ok -> Vale_X64_Decls.va_upd_ok sM.Vale_X64_State.vs_ok sK
        | Mod_reg r ->
            Vale_X64_Decls.upd_register r
              (Vale_X64_Regs.sel r sM.Vale_X64_State.vs_regs) sK
        | Mod_flags ->
            Vale_X64_Decls.va_upd_flags sM.Vale_X64_State.vs_flags sK
        | Mod_mem ->
            Vale_X64_Decls.va_upd_mem
              (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heap sK
        | Mod_mem_layout ->
            Vale_X64_Decls.va_upd_mem_layout
              (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_layout sK
        | Mod_mem_heaplet n ->
            Vale_X64_Decls.va_upd_mem_heaplet n
              (Vale_Lib_Map16.sel
                 (sM.Vale_X64_State.vs_heap).Vale_Arch_HeapImpl.vf_heaplets n)
              sK
        | Mod_stack ->
            Vale_X64_Decls.va_upd_stack sM.Vale_X64_State.vs_stack sK
        | Mod_stackTaint ->
            Vale_X64_Decls.va_upd_stackTaint sM.Vale_X64_State.vs_stackTaint
              sK
let rec (update_state_mods :
  mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun mods ->
    fun sM ->
      fun sK ->
        match mods with
        | [] -> sK
        | m::mods1 -> update_state_mod m sM (update_state_mods mods1 sM sK)
let (update_state_mods_norm :
  mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_X64_State.vale_state -> Vale_X64_State.vale_state)
  =
  fun mods ->
    fun sM ->
      fun sK ->
        match mods with
        | [] -> sK
        | m::mods1 -> update_state_mod m sM (update_state_mods mods1 sM sK)

let (va_mod_dst_opr64 : Vale_X64_Machine_s.operand64 -> mod_t) =
  fun o ->
    match o with
    | Vale_X64_Machine_s.OConst n -> Mod_None
    | Vale_X64_Machine_s.OReg r ->
        Mod_reg (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
    | Vale_X64_Machine_s.OMem uu___ -> Mod_None
    | Vale_X64_Machine_s.OStack uu___ -> Mod_None
let (va_mod_reg_opr64 : Vale_X64_Decls.reg_operand -> mod_t) =
  fun o ->
    match o with
    | Vale_X64_Machine_s.OReg r ->
        Mod_reg (Vale_X64_Machine_s.Reg (Prims.int_zero, r))
let (va_mod_xmm : Vale_X64_Machine_s.reg_xmm -> mod_t) =
  fun x -> Mod_reg (Vale_X64_Machine_s.Reg (Prims.int_one, x))
let (va_mod_heaplet : Vale_Arch_HeapImpl.heaplet_id -> mod_t) =
  fun h -> Mod_mem_heaplet h
type 'a quickProc_wp = unit
type ('a, 'uuuuu, 'uuuuu1) k_true = unit
type ('a, 'c, 'wp) t_monotone = unit
type ('a, 'c, 'wp) t_compute = unit
type 's0 t_require = unit Vale_X64_Decls.state_inv
type 's0 va_t_require = unit t_require
type ('a, 'c, 'mods, 's0, 'k, 'uuuuu) va_t_ensure = Obj.t
type ('a, 'c, 'mods, 'wp) t_proof = unit
type ('a, 'dummyV0) quickCode =
  | QProc of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode * mod_t Prims.list * unit * unit 
let uu___is_QProc :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      ('a, unit) quickCode -> Prims.bool
  = fun uu___ -> fun projectee -> true
let __proj__QProc__item__c :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      ('a, unit) quickCode ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
  =
  fun uu___ ->
    fun projectee -> match projectee with | QProc (c, mods, wp, proof) -> c
let __proj__QProc__item__mods :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      ('a, unit) quickCode -> mod_t Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QProc (c, mods, wp, proof) -> mods

type ('a, 'uuuuu) va_quickCode = ('a, unit) quickCode
let va_QProc :
  'uuuuu .
    unit ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
        mod_t Prims.list -> unit -> unit -> ('uuuuu, unit) quickCode
  =
  fun uu___ ->
    fun uu___1 ->
      fun uu___2 ->
        fun uu___3 -> fun uu___4 -> QProc (uu___1, uu___2, uu___3, uu___4)