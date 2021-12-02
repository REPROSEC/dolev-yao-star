open Prims
type vale_heap = Vale_Arch_HeapImpl.vale_heap
type vale_stack = Vale_X64_Stack_i.vale_stack
let (va_code_Mov64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr_annotate
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_Mov64
                       (Vale_X64_Machine_Semantics_s.AnnotateMov64 ())))
                   uu___1 uu___) (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Mov64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Mov64 = unit

let (va_quick_Mov64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Mov64 dst src), [Vale_X64_QuickCode.va_mod_dst_opr64 dst],
          (), ())
let (va_code_Cmovc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64;
                       Vale_X64_Instruction_s.IOpIm
                         Vale_X64_Instruction_s.IOpFlagsCf]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_Cmovc64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Cmovc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Cmovc64 = unit

let (va_quick_Cmovc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Cmovc64 dst src),
          [Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Add64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Add64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Add64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Add64 = unit

let (va_quick_Add64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Add64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Add64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Add64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Add64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Add64Wrap = unit

let (va_quick_Add64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Add64Wrap dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_AddLea64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_Taint_Semantics.mk_ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   fun uu___ ->
                     (Obj.magic
                        (Vale_X64_InsLemmas.make_instr
                           [(Vale_X64_Instruction_s.Out,
                              (Vale_X64_Instruction_s.IOpEx
                                 Vale_X64_Instruction_s.IOp64))]
                           [Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64;
                           Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                           Vale_X64_Instruction_s.PreserveFlags
                           Vale_X64_Instructions_s.ins_AddLea64)) uu___2
                       uu___1 uu___) (Obj.magic dst) (Obj.magic src1)
                (Obj.magic src2)))
let (va_codegen_success_AddLea64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_AddLea64 = unit

let (va_quick_AddLea64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 ->
        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_AddLea64 dst src1 src2),
            [Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Adc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_AddCarry64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Adc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adc64 = unit

let (va_quick_Adc64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adc64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Adc64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_AddCarry64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Adc64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adc64Wrap = unit

let (va_quick_Adc64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adc64Wrap dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Adcx64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_Adcx64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Adcx64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adcx64Wrap = unit

let (va_quick_Adcx64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adcx64Wrap dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Adox64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsOf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_Adox64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Adox64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adox64Wrap = unit

let (va_quick_Adox64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adox64Wrap dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Sub64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Sub64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Sub64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Sub64 = unit

let (va_quick_Sub64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Sub64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Sub64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Sub64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Sub64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Sub64Wrap = unit

let (va_quick_Sub64Wrap :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Sub64Wrap dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Sbb64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpIm
                             Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.InOut,
                         (Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Sbb64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Sbb64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Sbb64 = unit

let (va_quick_Sbb64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Sbb64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())

let (va_code_Mul64Wrap :
  Vale_X64_Machine_s.operand64 ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun src ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         ((fun uu___ ->
             (Obj.magic
                (Vale_X64_InsLemmas.make_instr
                   [(Vale_X64_Instruction_s.Out,
                      (Vale_X64_Instruction_s.IOpIm
                         (Vale_X64_Instruction_s.IOp64One
                            (Vale_X64_Machine_s.OReg (Prims.of_int (3))))));
                   (Vale_X64_Instruction_s.InOut,
                     (Vale_X64_Instruction_s.IOpIm
                        (Vale_X64_Instruction_s.IOp64One
                           (Vale_X64_Machine_s.OReg Prims.int_zero))))]
                   [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
                   Vale_X64_Instruction_s.HavocFlags
                   Vale_X64_Instructions_s.ins_Mul64)) uu___) (Obj.magic src)))
let (va_codegen_success_Mul64Wrap :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool) =
  fun src -> Vale_X64_Decls.va_ttrue ()

type ('src, 'vaus0, 'vauk) va_wp_Mul64Wrap = unit

let (va_quick_Mul64Wrap :
  Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun src ->
    Vale_X64_QuickCode.QProc
      ((va_code_Mul64Wrap src),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Mulx64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst_hi ->
    fun dst_lo ->
      fun src ->
        Vale_X64_Taint_Semantics.mk_ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   fun uu___ ->
                     (Obj.magic
                        (Vale_X64_InsLemmas.make_instr
                           [(Vale_X64_Instruction_s.Out,
                              (Vale_X64_Instruction_s.IOpEx
                                 Vale_X64_Instruction_s.IOp64));
                           (Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                           [Vale_X64_Instruction_s.IOpIm
                              (Vale_X64_Instruction_s.IOp64One
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (3))));
                           Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                           Vale_X64_Instruction_s.PreserveFlags
                           Vale_X64_Instructions_s.ins_Mulx64)) uu___2 uu___1
                       uu___) (Obj.magic dst_hi) (Obj.magic dst_lo)
                (Obj.magic src)))
let (va_codegen_success_Mulx64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst_hi -> fun dst_lo -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dstuhi, 'dstulo, 'src, 'vaus0, 'vauk) va_wp_Mulx64 = unit

let (va_quick_Mulx64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 ->
        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_hi ->
    fun dst_lo ->
      fun src ->
        Vale_X64_QuickCode.QProc
          ((va_code_Mulx64 dst_hi dst_lo src),
            [Vale_X64_QuickCode.va_mod_dst_opr64 dst_lo;
            Vale_X64_QuickCode.va_mod_dst_opr64 dst_hi], (), ())
let (va_code_IMul64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_IMul64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_IMul64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_IMul64 = unit

let (va_quick_IMul64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_IMul64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Xor64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr_annotate
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64));
                       (Vale_X64_Instruction_s.Out,
                         (Vale_X64_Instruction_s.IOpIm
                            Vale_X64_Instruction_s.IOpFlagsCf));
                       (Vale_X64_Instruction_s.Out,
                         (Vale_X64_Instruction_s.IOpIm
                            Vale_X64_Instruction_s.IOpFlagsOf))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Xor64
                       (Vale_X64_Machine_Semantics_s.AnnotateXor64 ())))
                   uu___1 uu___) (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_Xor64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Xor64 = unit

let (va_quick_Xor64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Xor64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_And64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_And64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic src)))
let (va_codegen_success_And64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_And64 = unit

let (va_quick_And64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_And64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Shl64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Shl64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic amt)))
let (va_codegen_success_Shl64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun amt -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'amt, 'vaus0, 'vauk) va_wp_Shl64 = unit

let (va_quick_Shl64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_QuickCode.QProc
        ((va_code_Shl64 dst amt),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Shr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    (Vale_X64_InsLemmas.make_instr
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOp64]
                       Vale_X64_Instruction_s.HavocFlags
                       Vale_X64_Instructions_s.ins_Shr64)) uu___1 uu___)
              (Obj.magic dst) (Obj.magic amt)))
let (va_codegen_success_Shr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun amt -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'amt, 'vaus0, 'vauk) va_wp_Shr64 = unit

let (va_quick_Shr64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_QuickCode.QProc
        ((va_code_Shr64 dst amt),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Cpuid_AES :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_AES : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_AES = unit

let (va_quick_Cpuid_AES : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_AES ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Sha :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Sha : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Sha = unit

let (va_quick_Cpuid_Sha : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Sha ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Adx_Bmi2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Adx_Bmi2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Adx_Bmi2 = unit

let (va_quick_Cpuid_Adx_Bmi2 :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Adx_Bmi2 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Avx :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Avx : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Avx = unit

let (va_quick_Cpuid_Avx : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Avx ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Avx2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Avx2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Avx2 = unit

let (va_quick_Cpuid_Avx2 : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Avx2 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Sse :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Sse : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Sse = unit

let (va_quick_Cpuid_Sse : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Sse ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Movbe :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Movbe : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Movbe = unit

let (va_quick_Cpuid_Movbe :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Movbe ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Rdrand :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Rdrand : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Rdrand = unit

let (va_quick_Cpuid_Rdrand :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Rdrand ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Avx512 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Avx512 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Avx512 = unit

let (va_quick_Cpuid_Avx512 :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Avx512 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Cpuid_Osxsave :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.InOut,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg Prims.int_one))));
            (Vale_X64_Instruction_s.InOut,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Cpuid))
let (va_codegen_success_Cpuid_Osxsave : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Cpuid_Osxsave = unit

let (va_quick_Cpuid_Osxsave :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Cpuid_Osxsave ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Xgetbv_Avx :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.Out,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))]
            [Vale_X64_Instruction_s.IOpIm
               (Vale_X64_Instruction_s.IOp64One
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))))]
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Xgetbv))
let (va_codegen_success_Xgetbv_Avx : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Xgetbv_Avx = unit

let (va_quick_Xgetbv_Avx : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Xgetbv_Avx ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Xgetbv_Avx512 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr
            [(Vale_X64_Instruction_s.Out,
               (Vale_X64_Instruction_s.IOpIm
                  (Vale_X64_Instruction_s.IOp64One
                     (Vale_X64_Machine_s.OReg Prims.int_zero))));
            (Vale_X64_Instruction_s.Out,
              (Vale_X64_Instruction_s.IOpIm
                 (Vale_X64_Instruction_s.IOp64One
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))]
            [Vale_X64_Instruction_s.IOpIm
               (Vale_X64_Instruction_s.IOp64One
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))))]
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Xgetbv))
let (va_codegen_success_Xgetbv_Avx512 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Xgetbv_Avx512 = unit

let (va_quick_Xgetbv_Avx512 :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Xgetbv_Avx512 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Nat64Equal :
  Vale_X64_Decls.va_operand_reg_opr64 ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Machine_s.Block
        [va_code_Sub64Wrap src
           (Vale_X64_Machine_s.OConst
              (Prims.parse_int "18446744073709551615"));
        va_code_Mov64 dst (Vale_X64_Machine_s.OConst Prims.int_zero);
        va_code_Adc64 dst (Vale_X64_Machine_s.OConst Prims.int_zero)]
let (va_codegen_success_Nat64Equal :
  Vale_X64_Decls.va_operand_reg_opr64 ->
    Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src ->
      Vale_X64_Decls.va_pbool_and
        (va_codegen_success_Sub64Wrap src
           (Vale_X64_Machine_s.OConst
              (Prims.parse_int "18446744073709551615")))
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_Mov64 dst
              (Vale_X64_Machine_s.OConst Prims.int_zero))
           (Vale_X64_Decls.va_pbool_and
              (va_codegen_success_Adc64 dst
                 (Vale_X64_Machine_s.OConst Prims.int_zero))
              (Vale_X64_Decls.va_ttrue ())))

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Nat64Equal = unit

let (va_quick_Nat64Equal :
  Vale_X64_Decls.va_operand_reg_opr64 ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Nat64Equal dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_reg_opr64 src;
          Vale_X64_QuickCode.va_mod_reg_opr64 dst], (), ())
let (va_code_Comment :
  Prims.string ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun c ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            (Vale_X64_Instructions_s.ins_Comment c)
            (Vale_X64_Machine_Semantics_s.AnnotateComment c)))
let (va_codegen_success_Comment : Prims.string -> Vale_X64_Decls.va_pbool) =
  fun c -> Vale_X64_Decls.va_ttrue ()

type ('c, 'vaus0, 'vauk) va_wp_Comment = unit

let (va_quick_Comment :
  Prims.string -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun c -> Vale_X64_QuickCode.QProc ((va_code_Comment c), [], (), ())
let (va_code_LargeComment :
  Prims.string ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun c ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            (Vale_X64_Instructions_s.ins_LargeComment c)
            (Vale_X64_Machine_Semantics_s.AnnotateLargeComment c)))
let (va_codegen_success_LargeComment :
  Prims.string -> Vale_X64_Decls.va_pbool) =
  fun c -> Vale_X64_Decls.va_ttrue ()

type ('c, 'vaus0, 'vauk) va_wp_LargeComment = unit

let (va_quick_LargeComment :
  Prims.string -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun c -> Vale_X64_QuickCode.QProc ((va_code_LargeComment c), [], (), ())
let (va_code_NoNewline :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            (Vale_X64_Instructions_s.ins_Space Prims.int_zero)
            (Vale_X64_Machine_Semantics_s.AnnotateSpace Prims.int_zero)))
let (va_codegen_success_NoNewline : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_NoNewline = unit

let (va_quick_NoNewline : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ -> Vale_X64_QuickCode.QProc ((va_code_NoNewline ()), [], (), ())
let (va_code_Newline :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Newline
            (Vale_X64_Machine_Semantics_s.AnnotateNewline ())))
let (va_codegen_success_Newline : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_Newline = unit

let (va_quick_Newline : unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ -> Vale_X64_QuickCode.QProc ((va_code_Newline ()), [], (), ())
let (va_code_Space :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun n ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            (Vale_X64_Instructions_s.ins_Space n)
            (Vale_X64_Machine_Semantics_s.AnnotateSpace n)))
let (va_codegen_success_Space : Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun n -> Vale_X64_Decls.va_ttrue ()

type ('n, 'vaus0, 'vauk) va_wp_Space = unit

let (va_quick_Space : Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  = fun n -> Vale_X64_QuickCode.QProc ((va_code_Space n), [], (), ())
let (va_code_Prefetchnta :
  Vale_X64_Machine_s.operand64 ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun v ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         ((fun uu___ ->
             (Obj.magic
                (Vale_X64_InsLemmas.make_instr_annotate []
                   [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
                   Vale_X64_Instruction_s.PreserveFlags
                   Vale_X64_Instructions_s.ins_Prefetchnta
                   (Vale_X64_Machine_Semantics_s.AnnotatePrefetchnta ())))
               uu___) (Obj.magic v)))
let (va_codegen_success_Prefetchnta :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool) =
  fun v -> Vale_X64_Decls.va_ttrue ()

type ('v, 'vaus0, 'vauk) va_wp_Prefetchnta = unit

let (va_quick_Prefetchnta :
  Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  = fun v -> Vale_X64_QuickCode.QProc ((va_code_Prefetchnta v), [], (), ())