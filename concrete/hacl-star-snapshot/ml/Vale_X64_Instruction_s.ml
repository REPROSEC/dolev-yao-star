open Prims
type instr_operand_inout =
  | InOut 
  | Out 
let (uu___is_InOut : instr_operand_inout -> Prims.bool) =
  fun projectee -> match projectee with | InOut -> true | uu___ -> false
let (uu___is_Out : instr_operand_inout -> Prims.bool) =
  fun projectee -> match projectee with | Out -> true | uu___ -> false
type instr_operand_explicit =
  | IOp64 
  | IOpXmm 
let (uu___is_IOp64 : instr_operand_explicit -> Prims.bool) =
  fun projectee -> match projectee with | IOp64 -> true | uu___ -> false
let (uu___is_IOpXmm : instr_operand_explicit -> Prims.bool) =
  fun projectee -> match projectee with | IOpXmm -> true | uu___ -> false
type instr_operand_implicit =
  | IOp64One of Vale_X64_Machine_s.operand64 
  | IOpXmmOne of Vale_X64_Machine_s.operand128 
  | IOpFlagsCf 
  | IOpFlagsOf 
let (uu___is_IOp64One : instr_operand_implicit -> Prims.bool) =
  fun projectee -> match projectee with | IOp64One o -> true | uu___ -> false
let (__proj__IOp64One__item__o :
  instr_operand_implicit -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | IOp64One o -> o
let (uu___is_IOpXmmOne : instr_operand_implicit -> Prims.bool) =
  fun projectee ->
    match projectee with | IOpXmmOne o -> true | uu___ -> false
let (__proj__IOpXmmOne__item__o :
  instr_operand_implicit -> Vale_X64_Machine_s.operand128) =
  fun projectee -> match projectee with | IOpXmmOne o -> o
let (uu___is_IOpFlagsCf : instr_operand_implicit -> Prims.bool) =
  fun projectee -> match projectee with | IOpFlagsCf -> true | uu___ -> false
let (uu___is_IOpFlagsOf : instr_operand_implicit -> Prims.bool) =
  fun projectee -> match projectee with | IOpFlagsOf -> true | uu___ -> false
type instr_operand =
  | IOpEx of instr_operand_explicit 
  | IOpIm of instr_operand_implicit 
let (uu___is_IOpEx : instr_operand -> Prims.bool) =
  fun projectee -> match projectee with | IOpEx _0 -> true | uu___ -> false
let (__proj__IOpEx__item___0 : instr_operand -> instr_operand_explicit) =
  fun projectee -> match projectee with | IOpEx _0 -> _0
let (uu___is_IOpIm : instr_operand -> Prims.bool) =
  fun projectee -> match projectee with | IOpIm _0 -> true | uu___ -> false
let (__proj__IOpIm__item___0 : instr_operand -> instr_operand_implicit) =
  fun projectee -> match projectee with | IOpIm _0 -> _0
type instr_out = (instr_operand_inout * instr_operand)

let normal : 'a . 'a -> 'a = fun x -> x
type ('a, 'b) arrow = 'a -> 'b
let coerce : 'b 'a . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___
let (inOut : instr_operand -> (instr_operand_inout * instr_operand)) =
  fun o -> (InOut, o)
let (out : instr_operand -> (instr_operand_inout * instr_operand)) =
  fun o -> (Out, o)
let (op64 : instr_operand) = IOpEx IOp64
let (opXmm : instr_operand) = IOpEx IOpXmm
let (one64 : Vale_X64_Machine_s.operand64 -> instr_operand) =
  fun o -> IOpIm (IOp64One o)
let (one64Reg : Vale_X64_Machine_s.reg_64 -> instr_operand) =
  fun r -> IOpIm (IOp64One (Vale_X64_Machine_s.OReg r))
let (oneXmm : Vale_X64_Machine_s.operand128 -> instr_operand) =
  fun o -> IOpIm (IOpXmmOne o)
let (opFlagsCf : instr_operand) = IOpIm IOpFlagsCf
let (opFlagsOf : instr_operand) = IOpIm IOpFlagsOf
type 'o instr_val_t = Obj.t
type 'outs instr_ret_t = Obj.t
type ('outs, 'args) instr_args_t = Obj.t
type ('outs, 'inouts, 'args) instr_inouts_t = Obj.t
type ('outs, 'args) instr_eval_t = Obj.t
type 'arg instr_operand_t = Obj.t
type 'args instr_operands_t_args = Obj.t
type ('outs, 'args) instr_operands_t = Obj.t
type instr_print_operand =
  | P8 of Vale_X64_Machine_s.operand64 
  | P16 of Vale_X64_Machine_s.operand64 
  | P32 of Vale_X64_Machine_s.operand64 
  | P64 of Vale_X64_Machine_s.operand64 
  | PXmm of Vale_X64_Machine_s.operand128 
  | PImm of Prims.int 
  | PShift of Vale_X64_Machine_s.operand64 
let (uu___is_P8 : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | P8 _0 -> true | uu___ -> false
let (__proj__P8__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | P8 _0 -> _0
let (uu___is_P16 : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | P16 _0 -> true | uu___ -> false
let (__proj__P16__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | P16 _0 -> _0
let (uu___is_P32 : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | P32 _0 -> true | uu___ -> false
let (__proj__P32__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | P32 _0 -> _0
let (uu___is_P64 : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | P64 _0 -> true | uu___ -> false
let (__proj__P64__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | P64 _0 -> _0
let (uu___is_PXmm : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | PXmm _0 -> true | uu___ -> false
let (__proj__PXmm__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand128) =
  fun projectee -> match projectee with | PXmm _0 -> _0
let (uu___is_PImm : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | PImm _0 -> true | uu___ -> false
let (__proj__PImm__item___0 : instr_print_operand -> Prims.int) =
  fun projectee -> match projectee with | PImm _0 -> _0
let (uu___is_PShift : instr_print_operand -> Prims.bool) =
  fun projectee -> match projectee with | PShift _0 -> true | uu___ -> false
let (__proj__PShift__item___0 :
  instr_print_operand -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | PShift _0 -> _0
type instr_print_kind =
  | POpcode 
  | PSuffix 
  | PrintPSha256rnds2 
let (uu___is_POpcode : instr_print_kind -> Prims.bool) =
  fun projectee -> match projectee with | POpcode -> true | uu___ -> false
let (uu___is_PSuffix : instr_print_kind -> Prims.bool) =
  fun projectee -> match projectee with | PSuffix -> true | uu___ -> false
let (uu___is_PrintPSha256rnds2 : instr_print_kind -> Prims.bool) =
  fun projectee ->
    match projectee with | PrintPSha256rnds2 -> true | uu___ -> false
type instr_print =
  | Print of Prims.string * instr_print_kind * instr_print_operand Prims.list 
let (uu___is_Print : instr_print -> Prims.bool) = fun projectee -> true
let (__proj__Print__item___0 : instr_print -> Prims.string) =
  fun projectee -> match projectee with | Print (_0, _1, _2) -> _0
let (__proj__Print__item___1 : instr_print -> instr_print_kind) =
  fun projectee -> match projectee with | Print (_0, _1, _2) -> _1
let (__proj__Print__item___2 : instr_print -> instr_print_operand Prims.list)
  = fun projectee -> match projectee with | Print (_0, _1, _2) -> _2
type flag_havoc =
  | HavocFlags 
  | PreserveFlags 
let (uu___is_HavocFlags : flag_havoc -> Prims.bool) =
  fun projectee -> match projectee with | HavocFlags -> true | uu___ -> false
let (uu___is_PreserveFlags : flag_havoc -> Prims.bool) =
  fun projectee ->
    match projectee with | PreserveFlags -> true | uu___ -> false
type 'args instr_print_t_args = Obj.t
type ('outs, 'args) instr_print_t = Obj.t
type ('outs, 'args, 'havocuflags) instr_t =
  {
  i_eval: Obj.t ;
  i_printer: Obj.t }
let (__proj__Mkinstr_t__item__i_eval :
  instr_out Prims.list ->
    instr_operand Prims.list ->
      flag_havoc -> (unit, unit, unit) instr_t -> Obj.t)
  =
  fun outs ->
    fun args ->
      fun havoc_flags ->
        fun projectee ->
          match projectee with | { i_eval; i_printer;_} -> i_eval
let (__proj__Mkinstr_t__item__i_printer :
  instr_out Prims.list ->
    instr_operand Prims.list ->
      flag_havoc -> (unit, unit, unit) instr_t -> Obj.t)
  =
  fun outs ->
    fun args ->
      fun havoc_flags ->
        fun projectee ->
          match projectee with | { i_eval; i_printer;_} -> i_printer
type instr_t_record =
  | InstrTypeRecord of instr_out Prims.list * instr_operand Prims.list *
  flag_havoc * (unit, unit, unit) instr_t 
let (uu___is_InstrTypeRecord : instr_t_record -> Prims.bool) =
  fun projectee -> true
let (__proj__InstrTypeRecord__item__outs :
  instr_t_record -> instr_out Prims.list) =
  fun projectee ->
    match projectee with
    | InstrTypeRecord (outs, args, havoc_flags, i) -> outs
let (__proj__InstrTypeRecord__item__args :
  instr_t_record -> instr_operand Prims.list) =
  fun projectee ->
    match projectee with
    | InstrTypeRecord (outs, args, havoc_flags, i) -> args
let (__proj__InstrTypeRecord__item__havoc_flags :
  instr_t_record -> flag_havoc) =
  fun projectee ->
    match projectee with
    | InstrTypeRecord (outs, args, havoc_flags, i) -> havoc_flags
let (__proj__InstrTypeRecord__item__i :
  instr_t_record -> (unit, unit, unit) instr_t) =
  fun projectee ->
    match projectee with | InstrTypeRecord (outs, args, havoc_flags, i) -> i
let (instr_eval :
  instr_out Prims.list ->
    instr_operand Prims.list ->
      flag_havoc -> (unit, unit, unit) instr_t -> Obj.t)
  = fun uu___ -> fun uu___1 -> fun uu___2 -> fun ins -> ins.i_eval
let rec (instr_printer_args :
  instr_operand Prims.list -> Obj.t -> Obj.t -> instr_print) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun args ->
           fun f ->
             fun oprs ->
               match args with
               | [] -> Obj.magic (Obj.repr f)
               | i::args1 ->
                   Obj.magic
                     (Obj.repr
                        (match i with
                         | IOpEx i1 ->
                             let uu___ = Obj.magic oprs in
                             (match uu___ with
                              | (o, oprs1) ->
                                  instr_printer_args args1
                                    ((fun uu___1 -> (Obj.magic (f )) uu___1)
                                       o) oprs1)
                         | IOpIm uu___ -> instr_printer_args args1 f oprs)))
          uu___2 uu___1 uu___
let rec (instr_printer_outs :
  instr_out Prims.list ->
    instr_operand Prims.list -> Obj.t -> Obj.t -> instr_print)
  =
  fun outs ->
    fun args ->
      fun f ->
        fun oprs ->
          match outs with
          | [] -> instr_printer_args args f oprs
          | (b, i)::outs1 ->
              (match i with
               | IOpEx i1 ->
                   let uu___ = Obj.magic oprs in
                   (match uu___ with
                    | (o, oprs1) ->
                        instr_printer_outs outs1 args
                          ((fun uu___1 -> (Obj.magic (f )) uu___1) o) oprs1)
               | IOpIm uu___ -> instr_printer_outs outs1 args f oprs)
let (instr_printer :
  instr_out Prims.list ->
    instr_operand Prims.list ->
      flag_havoc -> (unit, unit, unit) instr_t -> Obj.t -> instr_print)
  =
  fun outs ->
    fun args ->
      fun uu___ ->
        fun ins ->
          fun oprs -> instr_printer_outs outs args ins.i_printer oprs
type ('outs, 'args, 'havocuflags, 'f) instr_dep = (unit, unit, unit) instr_t
let (make_ins :
  instr_out Prims.list ->
    instr_operand Prims.list ->
      flag_havoc -> Obj.t -> Obj.t -> (unit, unit, unit, unit) instr_dep)
  =
  fun outs ->
    fun args ->
      fun havoc_flags ->
        fun f -> fun print -> { i_eval = f; i_printer = print }
let (print : Prims.string -> instr_print_operand Prims.list -> instr_print) =
  fun name -> fun oprs -> Print (name, POpcode, oprs)
let (print_s : Prims.string -> instr_print_operand Prims.list -> instr_print)
  = fun name -> fun oprs -> Print (name, PSuffix, oprs)