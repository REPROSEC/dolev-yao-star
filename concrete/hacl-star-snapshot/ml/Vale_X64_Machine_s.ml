open Prims

let (pow2_32 : Prims.int) = (Prims.parse_int "0x100000000")
let (pow2_64 : Prims.int) = (Prims.parse_int "0x10000000000000000")
let (pow2_128 : Prims.int) =
  (Prims.parse_int "0x100000000000000000000000000000000")
type nat64 = Vale_Def_Words_s.nat64
let (int_to_nat64 : Prims.int -> Vale_Def_Words_s.nat64) =
  fun i ->
    Vale_Def_Words_s.int_to_natN (Prims.parse_int "0x10000000000000000") i
type nat128 = Vale_Def_Words_s.nat128
type quad32 = Vale_Def_Types_s.quad32
type flag = Prims.int
let (fCarry : flag) = Prims.int_zero
let (fOverflow : flag) = (Prims.of_int (11))
let (n_reg_files : Prims.int) = (Prims.of_int (2))
type reg_file_id = Prims.nat
let (n_regs : reg_file_id -> Prims.nat) =
  fun rf ->
    match rf with
    | uu___ when uu___ = Prims.int_zero -> (Prims.of_int (16))
    | uu___ when uu___ = Prims.int_one -> (Prims.of_int (16))
type 'rf t_reg_file = Obj.t
type 'rf reg_id = Prims.nat
type reg =
  | Reg of reg_file_id * unit reg_id 
let (uu___is_Reg : reg -> Prims.bool) = fun projectee -> true
let (__proj__Reg__item__rf : reg -> reg_file_id) =
  fun projectee -> match projectee with | Reg (rf, r) -> rf
let (__proj__Reg__item__r : reg -> unit reg_id) =
  fun projectee -> match projectee with | Reg (rf, r) -> r
type 'r t_reg = Obj.t
let (t_reg_to_int : reg_file_id -> Obj.t -> Prims.int) =
  fun uu___1 ->
    fun uu___ ->
      (fun rf ->
         fun v ->
           match rf with
           | uu___ when uu___ = Prims.int_zero -> Obj.magic (Obj.repr v)
           | uu___ when uu___ = Prims.int_one ->
               Obj.magic (Obj.repr Prims.int_zero)) uu___1 uu___
type maddr =
  | MConst of Prims.int 
  | MReg of reg * Prims.int 
  | MIndex of reg * Prims.int * reg * Prims.int 
let (uu___is_MConst : maddr -> Prims.bool) =
  fun projectee -> match projectee with | MConst n -> true | uu___ -> false
let (__proj__MConst__item__n : maddr -> Prims.int) =
  fun projectee -> match projectee with | MConst n -> n
let (uu___is_MReg : maddr -> Prims.bool) =
  fun projectee ->
    match projectee with | MReg (r, offset) -> true | uu___ -> false
let (__proj__MReg__item__r : maddr -> reg) =
  fun projectee -> match projectee with | MReg (r, offset) -> r
let (__proj__MReg__item__offset : maddr -> Prims.int) =
  fun projectee -> match projectee with | MReg (r, offset) -> offset
let (uu___is_MIndex : maddr -> Prims.bool) =
  fun projectee ->
    match projectee with
    | MIndex (base, scale, index, offset) -> true
    | uu___ -> false
let (__proj__MIndex__item__base : maddr -> reg) =
  fun projectee ->
    match projectee with | MIndex (base, scale, index, offset) -> base
let (__proj__MIndex__item__scale : maddr -> Prims.int) =
  fun projectee ->
    match projectee with | MIndex (base, scale, index, offset) -> scale
let (__proj__MIndex__item__index : maddr -> reg) =
  fun projectee ->
    match projectee with | MIndex (base, scale, index, offset) -> index
let (__proj__MIndex__item__offset : maddr -> Prims.int) =
  fun projectee ->
    match projectee with | MIndex (base, scale, index, offset) -> offset
type tmaddr = (maddr * Vale_Arch_HeapTypes_s.taint)
type ('tc, 'tr) operand =
  | OConst of 'tc 
  | OReg of 'tr 
  | OMem of tmaddr 
  | OStack of tmaddr 
let uu___is_OConst : 'tc 'tr . ('tc, 'tr) operand -> Prims.bool =
  fun projectee -> match projectee with | OConst n -> true | uu___ -> false
let __proj__OConst__item__n : 'tc 'tr . ('tc, 'tr) operand -> 'tc =
  fun projectee -> match projectee with | OConst n -> n
let uu___is_OReg : 'tc 'tr . ('tc, 'tr) operand -> Prims.bool =
  fun projectee -> match projectee with | OReg r -> true | uu___ -> false
let __proj__OReg__item__r : 'tc 'tr . ('tc, 'tr) operand -> 'tr =
  fun projectee -> match projectee with | OReg r -> r
let uu___is_OMem : 'tc 'tr . ('tc, 'tr) operand -> Prims.bool =
  fun projectee -> match projectee with | OMem m -> true | uu___ -> false
let __proj__OMem__item__m : 'tc 'tr . ('tc, 'tr) operand -> tmaddr =
  fun projectee -> match projectee with | OMem m -> m
let uu___is_OStack : 'tc 'tr . ('tc, 'tr) operand -> Prims.bool =
  fun projectee -> match projectee with | OStack m -> true | uu___ -> false
let __proj__OStack__item__m : 'tc 'tr . ('tc, 'tr) operand -> tmaddr =
  fun projectee -> match projectee with | OStack m -> m
type 'rf operand_rf = (Obj.t, unit reg_id) operand
let (oreg : reg -> unit operand_rf) = fun r -> OReg (__proj__Reg__item__r r)
type reg_64 = Prims.nat
type reg_xmm = Prims.nat
let (rRax : reg_64) = Prims.int_zero
let (rRbx : reg_64) = Prims.int_one
let (rRcx : reg_64) = (Prims.of_int (2))
let (rRdx : reg_64) = (Prims.of_int (3))
let (rRsi : reg_64) = (Prims.of_int (4))
let (rRdi : reg_64) = (Prims.of_int (5))
let (rRbp : reg_64) = (Prims.of_int (6))
let (rRsp : reg_64) = (Prims.of_int (7))
let (rR8 : reg_64) = (Prims.of_int (8))
let (rR9 : reg_64) = (Prims.of_int (9))
let (rR10 : reg_64) = (Prims.of_int (10))
let (rR11 : reg_64) = (Prims.of_int (11))
let (rR12 : reg_64) = (Prims.of_int (12))
let (rR13 : reg_64) = (Prims.of_int (13))
let (rR14 : reg_64) = (Prims.of_int (14))
let (rR15 : reg_64) = (Prims.of_int (15))
let (reg_Rax : reg) = Reg (Prims.int_zero, Prims.int_zero)
let (reg_Rbx : reg) = Reg (Prims.int_zero, Prims.int_one)
let (reg_Rcx : reg) = Reg (Prims.int_zero, (Prims.of_int (2)))
let (reg_Rdx : reg) = Reg (Prims.int_zero, (Prims.of_int (3)))
let (reg_Rsi : reg) = Reg (Prims.int_zero, (Prims.of_int (4)))
let (reg_Rdi : reg) = Reg (Prims.int_zero, (Prims.of_int (5)))
let (reg_Rbp : reg) = Reg (Prims.int_zero, (Prims.of_int (6)))
let (reg_Rsp : reg) = Reg (Prims.int_zero, (Prims.of_int (7)))
let (reg_R8 : reg) = Reg (Prims.int_zero, (Prims.of_int (8)))
let (reg_R9 : reg) = Reg (Prims.int_zero, (Prims.of_int (9)))
let (reg_R10 : reg) = Reg (Prims.int_zero, (Prims.of_int (10)))
let (reg_R11 : reg) = Reg (Prims.int_zero, (Prims.of_int (11)))
let (reg_R12 : reg) = Reg (Prims.int_zero, (Prims.of_int (12)))
let (reg_R13 : reg) = Reg (Prims.int_zero, (Prims.of_int (13)))
let (reg_R14 : reg) = Reg (Prims.int_zero, (Prims.of_int (14)))
let (reg_R15 : reg) = Reg (Prims.int_zero, (Prims.of_int (15)))
type operand64 = (Vale_Def_Words_s.nat64, reg_64) operand
type operand128 = (Vale_Def_Types_s.quad32, reg_xmm) operand
type ('tuins, 'tuocmp) precode =
  | Ins of 'tuins 
  | Block of ('tuins, 'tuocmp) precode Prims.list 
  | IfElse of 'tuocmp * ('tuins, 'tuocmp) precode * ('tuins, 'tuocmp) precode
  
  | While of 'tuocmp * ('tuins, 'tuocmp) precode 
let uu___is_Ins : 'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> Prims.bool =
  fun projectee -> match projectee with | Ins ins -> true | uu___ -> false
let __proj__Ins__item__ins :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> 'tuins =
  fun projectee -> match projectee with | Ins ins -> ins
let uu___is_Block : 'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> Prims.bool
  =
  fun projectee ->
    match projectee with | Block block -> true | uu___ -> false
let __proj__Block__item__block :
  'tuins 'tuocmp .
    ('tuins, 'tuocmp) precode -> ('tuins, 'tuocmp) precode Prims.list
  = fun projectee -> match projectee with | Block block -> block
let uu___is_IfElse : 'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> Prims.bool
  =
  fun projectee ->
    match projectee with
    | IfElse (ifCond, ifTrue, ifFalse) -> true
    | uu___ -> false
let __proj__IfElse__item__ifCond :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> 'tuocmp =
  fun projectee ->
    match projectee with | IfElse (ifCond, ifTrue, ifFalse) -> ifCond
let __proj__IfElse__item__ifTrue :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> ('tuins, 'tuocmp) precode =
  fun projectee ->
    match projectee with | IfElse (ifCond, ifTrue, ifFalse) -> ifTrue
let __proj__IfElse__item__ifFalse :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> ('tuins, 'tuocmp) precode =
  fun projectee ->
    match projectee with | IfElse (ifCond, ifTrue, ifFalse) -> ifFalse
let uu___is_While : 'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> Prims.bool
  =
  fun projectee ->
    match projectee with
    | While (whileCond, whileBody) -> true
    | uu___ -> false
let __proj__While__item__whileCond :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> 'tuocmp =
  fun projectee ->
    match projectee with | While (whileCond, whileBody) -> whileCond
let __proj__While__item__whileBody :
  'tuins 'tuocmp . ('tuins, 'tuocmp) precode -> ('tuins, 'tuocmp) precode =
  fun projectee ->
    match projectee with | While (whileCond, whileBody) -> whileBody
type observation =
  | BranchPredicate of Prims.bool 
  | MemAccess of Prims.int 
let (uu___is_BranchPredicate : observation -> Prims.bool) =
  fun projectee ->
    match projectee with | BranchPredicate pred -> true | uu___ -> false
let (__proj__BranchPredicate__item__pred : observation -> Prims.bool) =
  fun projectee -> match projectee with | BranchPredicate pred -> pred
let (uu___is_MemAccess : observation -> Prims.bool) =
  fun projectee ->
    match projectee with | MemAccess addr -> true | uu___ -> false
let (__proj__MemAccess__item__addr : observation -> Prims.int) =
  fun projectee -> match projectee with | MemAccess addr -> addr