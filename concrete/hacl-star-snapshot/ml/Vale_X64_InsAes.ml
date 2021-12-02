open Prims
let (va_code_Pclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Prims.bool ->
        Prims.bool ->
          (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
            Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun dstHi ->
        fun srcHi ->
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
                           (Vale_X64_Instructions_s.ins_Pclmulqdq
                              ((if dstHi
                                then Prims.int_one
                                else Prims.int_zero) +
                                 (if srcHi
                                  then (Prims.of_int (16))
                                  else Prims.int_zero))))) uu___1 uu___)
                  (Obj.magic (Vale_X64_Machine_s.OReg dst))
                  (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Prims.bool -> Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun dst -> fun src -> fun dstHi -> fun srcHi -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'dstHi, 'srcHi, 'vaus0, 'vauk) va_wp_Pclmulqdq = unit

let (va_quick_Pclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Prims.bool -> Prims.bool -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun dstHi ->
        fun srcHi ->
          Vale_X64_QuickCode.QProc
            ((va_code_Pclmulqdq dst src dstHi srcHi),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_VPclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.bool ->
          Prims.bool ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        fun src1Hi ->
          fun src2Hi ->
            Vale_X64_Taint_Semantics.mk_ins
              (Obj.magic
                 ((fun uu___2 ->
                     fun uu___1 ->
                       fun uu___ ->
                         (Obj.magic
                            (Vale_X64_InsLemmas.make_instr
                               [(Vale_X64_Instruction_s.Out,
                                  (Vale_X64_Instruction_s.IOpEx
                                     Vale_X64_Instruction_s.IOpXmm))]
                               [Vale_X64_Instruction_s.IOpEx
                                  Vale_X64_Instruction_s.IOpXmm;
                               Vale_X64_Instruction_s.IOpEx
                                 Vale_X64_Instruction_s.IOpXmm]
                               Vale_X64_Instruction_s.PreserveFlags
                               (Vale_X64_Instructions_s.ins_VPclmulqdq
                                  ((if src1Hi
                                    then Prims.int_one
                                    else Prims.int_zero) +
                                     (if src2Hi
                                      then (Prims.of_int (16))
                                      else Prims.int_zero))))) uu___2 uu___1
                           uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                    (Obj.magic (Vale_X64_Machine_s.OReg src1))
                    (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VPclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.bool -> Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src1 ->
      fun src2 -> fun src1Hi -> fun src2Hi -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'src1Hi, 'src2Hi, 'vaus0, 'vauk) va_wp_VPclmulqdq =
  unit

let (va_quick_VPclmulqdq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.bool -> Prims.bool -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        fun src1Hi ->
          fun src2Hi ->
            Vale_X64_QuickCode.QProc
              ((va_code_VPclmulqdq dst src1 src2 src1Hi src2Hi),
                [Vale_X64_QuickCode.Mod_flags;
                Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_AESNI_enc :
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
                       Vale_X64_Instructions_s.ins_AESNI_enc)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_enc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_AESNI_enc = unit

let (va_quick_AESNI_enc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_AESNI_enc dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_VAESNI_enc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
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
                                 Vale_X64_Instruction_s.IOpXmm))]
                           [Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOpXmm;
                           Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOpXmm]
                           Vale_X64_Instruction_s.PreserveFlags
                           Vale_X64_Instructions_s.ins_VAESNI_enc)) uu___2
                       uu___1 uu___)
                (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1))
                (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VAESNI_enc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VAESNI_enc = unit

let (va_quick_VAESNI_enc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VAESNI_enc dst src1 src2),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_AESNI_enc_last :
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
                       Vale_X64_Instructions_s.ins_AESNI_enc_last)) uu___1
                   uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_enc_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_AESNI_enc_last = unit

let (va_quick_AESNI_enc_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_AESNI_enc_last dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_VAESNI_enc_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
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
                                 Vale_X64_Instruction_s.IOpXmm))]
                           [Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOpXmm;
                           Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOpXmm]
                           Vale_X64_Instruction_s.PreserveFlags
                           Vale_X64_Instructions_s.ins_VAESNI_enc_last))
                       uu___2 uu___1 uu___)
                (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1))
                (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VAESNI_enc_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VAESNI_enc_last = unit

let (va_quick_VAESNI_enc_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VAESNI_enc_last dst src1 src2),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_AESNI_dec :
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
                       Vale_X64_Instructions_s.ins_AESNI_dec)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_dec :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_AESNI_dec = unit

let (va_quick_AESNI_dec :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_AESNI_dec dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_AESNI_dec_last :
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
                       Vale_X64_Instructions_s.ins_AESNI_dec_last)) uu___1
                   uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_dec_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_AESNI_dec_last = unit

let (va_quick_AESNI_dec_last :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_AESNI_dec_last dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_AESNI_imc :
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
                       [(Vale_X64_Instruction_s.Out,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOpXmm))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOpXmm]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_AESNI_imc)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_imc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_AESNI_imc = unit

let (va_quick_AESNI_imc :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_AESNI_imc dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_AESNI_keygen_assist :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun imm ->
        Vale_X64_Taint_Semantics.mk_ins
          (Obj.magic
             ((fun uu___1 ->
                 fun uu___ ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOpXmm))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOpXmm]
                         Vale_X64_Instruction_s.PreserveFlags
                         (Vale_X64_Instructions_s.ins_AESNI_keygen_assist imm)))
                     uu___1 uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_AESNI_keygen_assist :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun imm -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'imm, 'vaus0, 'vauk) va_wp_AESNI_keygen_assist = unit

let (va_quick_AESNI_keygen_assist :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun imm ->
        Vale_X64_QuickCode.QProc
          ((va_code_AESNI_keygen_assist dst src imm),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())