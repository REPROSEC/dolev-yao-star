open Prims
type instr_annotation_t = unit
type 'a instruction_t =
  | Instr of Vale_X64_Instruction_s.instr_t_record * Obj.t * 'a 
  | Push of Vale_X64_Machine_s.operand64 * Vale_Arch_HeapTypes_s.taint 
  | Pop of Vale_X64_Machine_s.operand64 * Vale_Arch_HeapTypes_s.taint 
  | Alloc of Vale_Def_Words_s.nat64 
  | Dealloc of Vale_Def_Words_s.nat64 
let uu___is_Instr : 'a . 'a instruction_t -> Prims.bool =
  fun projectee ->
    match projectee with
    | Instr (i, oprs, annotation) -> true
    | uu___ -> false
let __proj__Instr__item__i :
  'a . 'a instruction_t -> Vale_X64_Instruction_s.instr_t_record =
  fun projectee -> match projectee with | Instr (i, oprs, annotation) -> i
let __proj__Instr__item__oprs : 'a . 'a instruction_t -> Obj.t =
  fun projectee -> match projectee with | Instr (i, oprs, annotation) -> oprs
let __proj__Instr__item__annotation : 'a . 'a instruction_t -> 'a =
  fun projectee ->
    match projectee with | Instr (i, oprs, annotation) -> annotation
let uu___is_Push : 'a . 'a instruction_t -> Prims.bool =
  fun projectee ->
    match projectee with | Push (src, t) -> true | uu___ -> false
let __proj__Push__item__src :
  'a . 'a instruction_t -> Vale_X64_Machine_s.operand64 =
  fun projectee -> match projectee with | Push (src, t) -> src
let __proj__Push__item__t :
  'a . 'a instruction_t -> Vale_Arch_HeapTypes_s.taint =
  fun projectee -> match projectee with | Push (src, t) -> t
let uu___is_Pop : 'a . 'a instruction_t -> Prims.bool =
  fun projectee ->
    match projectee with | Pop (dst, t) -> true | uu___ -> false
let __proj__Pop__item__dst :
  'a . 'a instruction_t -> Vale_X64_Machine_s.operand64 =
  fun projectee -> match projectee with | Pop (dst, t) -> dst
let __proj__Pop__item__t :
  'a . 'a instruction_t -> Vale_Arch_HeapTypes_s.taint =
  fun projectee -> match projectee with | Pop (dst, t) -> t
let uu___is_Alloc : 'a . 'a instruction_t -> Prims.bool =
  fun projectee -> match projectee with | Alloc n -> true | uu___ -> false
let __proj__Alloc__item__n : 'a . 'a instruction_t -> Vale_Def_Words_s.nat64
  = fun projectee -> match projectee with | Alloc n -> n
let uu___is_Dealloc : 'a . 'a instruction_t -> Prims.bool =
  fun projectee -> match projectee with | Dealloc n -> true | uu___ -> false
let __proj__Dealloc__item__n :
  'a . 'a instruction_t -> Vale_Def_Words_s.nat64 =
  fun projectee -> match projectee with | Dealloc n -> n
type ocmp =
  | OEq of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | ONe of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | OLe of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | OGe of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | OLt of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | OGt of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
let (uu___is_OEq : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | OEq (o1, o2) -> true | uu___ -> false
let (__proj__OEq__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OEq (o1, o2) -> o1
let (__proj__OEq__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OEq (o1, o2) -> o2
let (uu___is_ONe : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | ONe (o1, o2) -> true | uu___ -> false
let (__proj__ONe__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | ONe (o1, o2) -> o1
let (__proj__ONe__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | ONe (o1, o2) -> o2
let (uu___is_OLe : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | OLe (o1, o2) -> true | uu___ -> false
let (__proj__OLe__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OLe (o1, o2) -> o1
let (__proj__OLe__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OLe (o1, o2) -> o2
let (uu___is_OGe : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | OGe (o1, o2) -> true | uu___ -> false
let (__proj__OGe__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OGe (o1, o2) -> o1
let (__proj__OGe__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OGe (o1, o2) -> o2
let (uu___is_OLt : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | OLt (o1, o2) -> true | uu___ -> false
let (__proj__OLt__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OLt (o1, o2) -> o1
let (__proj__OLt__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OLt (o1, o2) -> o2
let (uu___is_OGt : ocmp -> Prims.bool) =
  fun projectee ->
    match projectee with | OGt (o1, o2) -> true | uu___ -> false
let (__proj__OGt__item__o1 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OGt (o1, o2) -> o1
let (__proj__OGt__item__o2 : ocmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | OGt (o1, o2) -> o2
type 'a code_t = ('a instruction_t, ocmp) Vale_X64_Machine_s.precode
type 'a codes_t = 'a code_t Prims.list