open Prims
let (has_taint128 :
  Vale_X64_Machine_s.operand128 -> Vale_Arch_HeapTypes_s.taint -> Prims.bool)
  =
  fun o ->
    fun t ->
      match o with
      | Vale_X64_Machine_s.OMem (uu___, t') -> t = t'
      | Vale_X64_Machine_s.OStack (uu___, t') -> t = t'
      | uu___ -> true


type 'args make_instr_t_args = Obj.t
type ('outs, 'args) make_instr_t = Obj.t
let rec (make_instr_args :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    (Obj.t, Vale_X64_Machine_Semantics_s.ins) Vale_X64_Instruction_s.arrow ->
      Obj.t)
  =
  fun args ->
    fun k ->
      match args with
      | [] -> Obj.repr (k (Obj.repr ()))
      | (Vale_X64_Instruction_s.IOpEx i)::args1 ->
          Obj.repr
            (fun o ->
               let k1 = Obj.magic k in
               let k2 oprs = k1 (o, oprs) in make_instr_args args1 k2)
      | (Vale_X64_Instruction_s.IOpIm i)::args1 ->
          Obj.repr (make_instr_args args1 k)
let rec (make_instr_outs :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      (Obj.t, Vale_X64_Machine_Semantics_s.ins) Vale_X64_Instruction_s.arrow
        -> Obj.t)
  =
  fun outs ->
    fun args ->
      fun k ->
        match outs with
        | [] -> Obj.repr (make_instr_args args k)
        | (b, Vale_X64_Instruction_s.IOpEx i)::outs1 ->
            Obj.repr
              (fun o ->
                 let k1 = Obj.magic k in
                 let k2 oprs = k1 (o, oprs) in make_instr_outs outs1 args k2)
        | (uu___, Vale_X64_Instruction_s.IOpIm i)::outs1 ->
            Obj.repr (make_instr_outs outs1 args k)
let (make_instr :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Vale_X64_Instruction_s.flag_havoc ->
        (unit, unit, unit) Vale_X64_Instruction_s.instr_t -> Obj.t)
  =
  fun outs ->
    fun args ->
      fun havoc_flags ->
        fun i ->
          make_instr_outs outs args
            (fun oprs ->
               Vale_X64_Bytes_Code_s.Instr
                 ((Vale_X64_Instruction_s.InstrTypeRecord
                     (outs, args, havoc_flags, i)), oprs,
                   Vale_X64_Machine_Semantics_s.AnnotateNone))
let (make_instr_annotate :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Vale_X64_Instruction_s.flag_havoc ->
        (unit, unit, unit) Vale_X64_Instruction_s.instr_t ->
          unit Vale_X64_Machine_Semantics_s.instr_annotation -> Obj.t)
  =
  fun outs ->
    fun args ->
      fun havoc_flags ->
        fun i ->
          fun ann ->
            make_instr_outs outs args
              (fun oprs ->
                 Vale_X64_Bytes_Code_s.Instr
                   ((Vale_X64_Instruction_s.InstrTypeRecord
                       (outs, args, havoc_flags, i)), oprs, ann))
