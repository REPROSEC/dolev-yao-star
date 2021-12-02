open Prims
let (va_code_SHA256_rnds2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
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
                             Vale_X64_Instruction_s.IOpXmm))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOpXmm;
                       Vale_X64_Instruction_s.IOpIm
                         (Vale_X64_Instruction_s.IOpXmmOne
                            (Vale_X64_Machine_s.OReg Prims.int_zero))]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_SHA256_rnds2)) uu___1
                   uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_SHA256_rnds2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 't, 'block, 'hashuorig, 'vaus0, 'vauk) va_wp_SHA256_rnds2 =
  unit

let (va_quick_SHA256_rnds2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_SHA_SHA_helpers.counter ->
        Vale_SHA_SHA_helpers.block_w ->
          Vale_SHA_SHA_helpers.hash256 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun t ->
        fun block ->
          fun hash_orig ->
            Vale_X64_QuickCode.QProc
              ((va_code_SHA256_rnds2 dst src),
                [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_SHA256_msg1 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
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
                             Vale_X64_Instruction_s.IOpXmm))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOpXmm]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_SHA256_msg1)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_SHA256_msg1 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 't, 'block, 'vaus0, 'vauk) va_wp_SHA256_msg1 = unit

let (va_quick_SHA256_msg1 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_SHA_SHA_helpers.counter ->
        Vale_SHA_SHA_helpers.block_w ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun t ->
        fun block ->
          Vale_X64_QuickCode.QProc
            ((va_code_SHA256_msg1 dst src),
              [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_SHA256_msg2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
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
                             Vale_X64_Instruction_s.IOpXmm))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOpXmm]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_SHA256_msg2)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_SHA256_msg2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 't, 'block, 'vaus0, 'vauk) va_wp_SHA256_msg2 = unit

let (va_quick_SHA256_msg2 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_SHA_SHA_helpers.counter ->
        Vale_SHA_SHA_helpers.block_w ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun t ->
        fun block ->
          Vale_X64_QuickCode.QProc
            ((va_code_SHA256_msg2 dst src),
              [Vale_X64_QuickCode.va_mod_xmm dst], (), ())