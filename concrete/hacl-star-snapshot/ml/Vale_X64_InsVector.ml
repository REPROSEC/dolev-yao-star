open Prims

let (va_code_Mem128_lemma :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block []
let (va_codegen_success_Mem128_lemma : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('h, 'base, 'offset, 't, 'b, 'index, 'vaus0, 'vauk) va_wp_Mem128_lemma =
  unit

let (va_quick_Mem128_lemma :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Prims.int ->
        Vale_Arch_HeapTypes_s.taint ->
          Vale_X64_Memory.buffer128 ->
            Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun base ->
      fun offset ->
        fun t ->
          fun b ->
            fun index ->
              Vale_X64_QuickCode.QProc
                ((va_code_Mem128_lemma ()), [], (), ())
let (va_code_Paddd :
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
                       Vale_X64_Instructions_s.ins_Paddd)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Paddd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Paddd = unit

let (va_quick_Paddd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Paddd dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_VPaddd :
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
                           Vale_X64_Instructions_s.ins_VPaddd)) uu___2 uu___1
                       uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1))
                (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VPaddd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VPaddd = unit

let (va_quick_VPaddd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VPaddd dst src1 src2),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_Pxor :
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
                    (Vale_X64_InsLemmas.make_instr_annotate
                       [(Vale_X64_Instruction_s.InOut,
                          (Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOpXmm))]
                       [Vale_X64_Instruction_s.IOpEx
                          Vale_X64_Instruction_s.IOpXmm]
                       Vale_X64_Instruction_s.PreserveFlags
                       Vale_X64_Instructions_s.ins_Pxor
                       (Vale_X64_Machine_Semantics_s.AnnotatePxor ())))
                   uu___1 uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pxor :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Pxor = unit

let (va_quick_Pxor :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pxor dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Pand :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand128 ->
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
                       Vale_X64_Instructions_s.ins_Pand)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst)) (Obj.magic src)))
let (va_codegen_success_Pand :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand128 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Pand = unit

let (va_quick_Pand :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand128 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pand dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_VPxor :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.operand128 ->
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
                        (Vale_X64_InsLemmas.make_instr_annotate
                           [(Vale_X64_Instruction_s.Out,
                              (Vale_X64_Instruction_s.IOpEx
                                 Vale_X64_Instruction_s.IOpXmm))]
                           [Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOpXmm;
                           Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOpXmm]
                           Vale_X64_Instruction_s.PreserveFlags
                           Vale_X64_Instructions_s.ins_VPxor
                           (Vale_X64_Machine_Semantics_s.AnnotateVPxor ())))
                       uu___2 uu___1 uu___)
                (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1)) (Obj.magic src2)))
let (va_codegen_success_VPxor :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.operand128 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VPxor = unit

let (va_quick_VPxor :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.operand128 ->
        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VPxor dst src1 src2),
            [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Pslld :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___ ->
               (Obj.magic
                  (Vale_X64_InsLemmas.make_instr
                     [(Vale_X64_Instruction_s.InOut,
                        (Vale_X64_Instruction_s.IOpEx
                           Vale_X64_Instruction_s.IOpXmm))] []
                     Vale_X64_Instruction_s.PreserveFlags
                     (Vale_X64_Instructions_s.ins_Pslld amt))) uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))))
let (va_codegen_success_Pslld :
  Vale_X64_Machine_s.reg_xmm -> Prims.int -> Vale_X64_Decls.va_pbool) =
  fun dst -> fun amt -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'amt, 'vaus0, 'vauk) va_wp_Pslld = unit

let (va_quick_Pslld :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pslld dst amt), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Psrld :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___ ->
               (Obj.magic
                  (Vale_X64_InsLemmas.make_instr
                     [(Vale_X64_Instruction_s.InOut,
                        (Vale_X64_Instruction_s.IOpEx
                           Vale_X64_Instruction_s.IOpXmm))] []
                     Vale_X64_Instruction_s.PreserveFlags
                     (Vale_X64_Instructions_s.ins_Psrld amt))) uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))))
let (va_codegen_success_Psrld :
  Vale_X64_Machine_s.reg_xmm -> Prims.int -> Vale_X64_Decls.va_pbool) =
  fun dst -> fun amt -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'amt, 'vaus0, 'vauk) va_wp_Psrld = unit

let (va_quick_Psrld :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_QuickCode.QProc
        ((va_code_Psrld dst amt), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Psrldq :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_Taint_Semantics.mk_ins
        (Obj.magic
           ((fun uu___ ->
               (Obj.magic
                  (Vale_X64_InsLemmas.make_instr
                     [(Vale_X64_Instruction_s.InOut,
                        (Vale_X64_Instruction_s.IOpEx
                           Vale_X64_Instruction_s.IOpXmm))] []
                     Vale_X64_Instruction_s.PreserveFlags
                     (Vale_X64_Instructions_s.ins_Psrldq amt))) uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))))
let (va_codegen_success_Psrldq :
  Vale_X64_Machine_s.reg_xmm -> Prims.int -> Vale_X64_Decls.va_pbool) =
  fun dst -> fun amt -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'amt, 'vaus0, 'vauk) va_wp_Psrldq = unit

let (va_quick_Psrldq :
  Vale_X64_Machine_s.reg_xmm ->
    Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun amt ->
      Vale_X64_QuickCode.QProc
        ((va_code_Psrldq dst amt), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Palignr4 :
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
                       (Vale_X64_Instructions_s.ins_Palignr
                          (Prims.of_int (4))))) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Palignr4 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Palignr4 = unit

let (va_quick_Palignr4 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Palignr4 dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_Palignr8 :
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
                       (Vale_X64_Instructions_s.ins_Palignr
                          (Prims.of_int (8))))) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Palignr8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Palignr8 = unit

let (va_quick_Palignr8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Palignr8 dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_VPalignr8 :
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
                           (Vale_X64_Instructions_s.ins_VPalignr
                              (Prims.of_int (8))))) uu___2 uu___1 uu___)
                (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1))
                (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VPalignr8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VPalignr8 = unit

let (va_quick_VPalignr8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VPalignr8 dst src1 src2),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_Shufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun permutation ->
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
                         (Vale_X64_Instructions_s.ins_Shufpd permutation)))
                     uu___1 uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Shufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun permutation -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'permutation, 'vaus0, 'vauk) va_wp_Shufpd = unit

let (va_quick_Shufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun permutation ->
        Vale_X64_QuickCode.QProc
          ((va_code_Shufpd dst src permutation),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_VShufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_Def_Words_s.nat8 ->
          (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
            Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        fun permutation ->
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
                             (Vale_X64_Instructions_s.ins_VShufpd permutation)))
                         uu___2 uu___1 uu___)
                  (Obj.magic (Vale_X64_Machine_s.OReg dst))
                  (Obj.magic (Vale_X64_Machine_s.OReg src1))
                  (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VShufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src1 -> fun src2 -> fun permutation -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'permutation, 'vaus0, 'vauk) va_wp_VShufpd = unit

let (va_quick_VShufpd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        fun permutation ->
          Vale_X64_QuickCode.QProc
            ((va_code_VShufpd dst src1 src2 permutation),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Pshufb :
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
                       Vale_X64_Instructions_s.ins_Pshufb)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pshufb :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Pshufb = unit

let (va_quick_Pshufb :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pshufb dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_VPshufb :
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
                           Vale_X64_Instructions_s.ins_VPshufb)) uu___2
                       uu___1 uu___)
                (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src1))
                (Obj.magic (Vale_X64_Machine_s.OReg src2))))
let (va_codegen_success_VPshufb :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src1 -> fun src2 -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src1, 'src2, 'vaus0, 'vauk) va_wp_VPshufb = unit

let (va_quick_VPshufb :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src1 ->
      fun src2 ->
        Vale_X64_QuickCode.QProc
          ((va_code_VPshufb dst src1 src2),
            [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
            (), ())
let (va_code_PshufbStable :
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
                       Vale_X64_Instructions_s.ins_Pshufb)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_PshufbStable :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_PshufbStable = unit

let (va_quick_PshufbStable :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_PshufbStable dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_PshufbDup :
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
                       Vale_X64_Instructions_s.ins_Pshufb)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_PshufbDup :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_PshufbDup = unit

let (va_quick_PshufbDup :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_PshufbDup dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_Pshufb64 :
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
                       Vale_X64_Instructions_s.ins_Pshufb)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pshufb64 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Pshufb64 = unit

let (va_quick_Pshufb64 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pshufb64 dst src),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_Pshufd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun permutation ->
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
                         (Vale_X64_Instructions_s.ins_Pshufd permutation)))
                     uu___1 uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pshufd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun permutation -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'permutation, 'vaus0, 'vauk) va_wp_Pshufd = unit

let (va_quick_Pshufd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun permutation ->
        Vale_X64_QuickCode.QProc
          ((va_code_Pshufd dst src permutation),
            [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Pcmpeqd :
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
                       Vale_X64_Instructions_s.ins_Pcmpeqd)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pcmpeqd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Pcmpeqd = unit

let (va_quick_Pcmpeqd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Pcmpeqd dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Pextrq :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun index ->
        Vale_X64_Taint_Semantics.mk_ins
          (Obj.magic
             ((fun uu___1 ->
                 fun uu___ ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOpXmm]
                         Vale_X64_Instruction_s.PreserveFlags
                         (Vale_X64_Instructions_s.ins_Pextrq index))) uu___1
                     uu___) (Obj.magic dst)
                (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Pextrq :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun index -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'index, 'vaus0, 'vauk) va_wp_Pextrq = unit

let (va_quick_Pextrq :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun index ->
        Vale_X64_QuickCode.QProc
          ((va_code_Pextrq dst src index),
            [Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Pinsrd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun index ->
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
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         (Vale_X64_Instructions_s.ins_Pinsrd index))) uu___1
                     uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic src)))
let (va_codegen_success_Pinsrd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun index -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'index, 'vaus0, 'vauk) va_wp_Pinsrd = unit

let (va_quick_Pinsrd :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun index ->
        Vale_X64_QuickCode.QProc
          ((va_code_Pinsrd dst src index),
            [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_PinsrdImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat32 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 ->
          (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
            Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_Machine_s.Block
            [Vale_X64_InsBasic.va_code_Mov64 tmp
               (Vale_X64_Machine_s.OConst immediate);
            va_code_Pinsrd dst tmp index]
let (va_codegen_success_PinsrdImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat32 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64 tmp
               (Vale_X64_Machine_s.OConst immediate))
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Pinsrd dst tmp index)
               (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'immediate, 'index, 'tmp, 'vaus0, 'vauk) va_wp_PinsrdImm = unit

let (va_quick_PinsrdImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat32 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_QuickCode.QProc
            ((va_code_PinsrdImm dst immediate index tmp),
              [Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
              Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Pinsrq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      fun index ->
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
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         (Vale_X64_Instructions_s.ins_Pinsrq index))) uu___1
                     uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                (Obj.magic src)))
let (va_codegen_success_Pinsrq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> fun index -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'index, 'vaus0, 'vauk) va_wp_Pinsrq = unit

let (va_quick_Pinsrq :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.operand64 ->
      Vale_Def_Words_s.nat8 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun index ->
        Vale_X64_QuickCode.QProc
          ((va_code_Pinsrq dst src index),
            [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_PinsrqImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 ->
          (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
            Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_Machine_s.Block
            [Vale_X64_InsBasic.va_code_Mov64 tmp
               (Vale_X64_Machine_s.OConst immediate);
            va_code_Pinsrq dst tmp index]
let (va_codegen_success_PinsrqImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64 tmp
               (Vale_X64_Machine_s.OConst immediate))
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Pinsrq dst tmp index)
               (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'immediate, 'index, 'tmp, 'vaus0, 'vauk) va_wp_PinsrqImm = unit

let (va_quick_PinsrqImm :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Decls.va_operand_reg_opr64 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun immediate ->
      fun index ->
        fun tmp ->
          Vale_X64_QuickCode.QProc
            ((va_code_PinsrqImm dst immediate index tmp),
              [Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
              Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_VPslldq4 :
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
                       (Vale_X64_Instructions_s.ins_VPslldq
                          (Prims.of_int (4))))) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_VPslldq4 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_VPslldq4 = unit

let (va_quick_VPslldq4 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_VPslldq4 dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Vpslldq8 :
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
                       (Vale_X64_Instructions_s.ins_VPslldq
                          (Prims.of_int (8))))) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Vpslldq8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Vpslldq8 = unit

let (va_quick_Vpslldq8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Vpslldq8 dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Vpsrldq8 :
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
                       (Vale_X64_Instructions_s.ins_VPsrldq
                          (Prims.of_int (8))))) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Vpsrldq8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Vpsrldq8 = unit

let (va_quick_Vpsrldq8 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Vpsrldq8 dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Mov128 :
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
                       Vale_X64_Instructions_s.ins_Movdqu)) uu___1 uu___)
              (Obj.magic (Vale_X64_Machine_s.OReg dst))
              (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Mov128 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  = fun dst -> fun src -> Vale_X64_Decls.va_ttrue ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Mov128 = unit

let (va_quick_Mov128 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Mov128 dst src), [Vale_X64_QuickCode.va_mod_xmm dst], (),
          ())
let (va_code_Load128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
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
                             Vale_X64_Instructions_s.ins_Movdqu)) uu___1
                         uu___) (Obj.magic (Vale_X64_Machine_s.OReg dst))
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       src))), offset)), t)))))
let (va_codegen_success_Load128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_Load128_buffer = unit

let (va_quick_Load128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer128 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Load128_buffer h dst src offset t),
                    [Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_LoadBe64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool ->
              (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
                Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun upper ->
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
                               Vale_X64_Instructions_s.ins_MovBe64
                               (Vale_X64_Machine_Semantics_s.AnnotateMovbe64
                                  ()))) uu___1 uu___) (Obj.magic dst)
                      (Obj.magic
                         (Vale_X64_Machine_s.OMem
                            ((Vale_X64_Machine_s.MReg
                                ((Vale_X64_Machine_s.Reg
                                    (Prims.int_zero,
                                      (Vale_X64_Machine_s.__proj__OReg__item__r
                                         src))), offset)), t)))))
let (va_codegen_success_LoadBe64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset -> fun t -> fun upper -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'upper, 'b, 'index, 'vaus0,
  'vauk) va_wp_LoadBe64_buffer128 = unit

let (va_quick_LoadBe64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool ->
              Vale_X64_Memory.buffer128 ->
                Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun upper ->
              fun b ->
                fun index ->
                  Vale_X64_QuickCode.QProc
                    ((va_code_LoadBe64_buffer128 h dst src offset t upper),
                      [Vale_X64_QuickCode.va_mod_reg_opr64 dst], (), ())
let (va_code_Store128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
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
                             Vale_X64_Instructions_s.ins_Movdqu)) uu___1
                         uu___)
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       dst))), offset)), t)))
                    (Obj.magic (Vale_X64_Machine_s.OReg src))))
let (va_codegen_success_Store128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_Store128_buffer = unit

let (va_quick_Store128_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Machine_s.reg_xmm ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer128 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Store128_buffer h dst src offset t),
                    [Vale_X64_QuickCode.Mod_mem;
                    Vale_X64_QuickCode.va_mod_heaplet h], (), ())
let (va_code_Store64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool ->
              (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
                Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun upper ->
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
                           uu___1 uu___)
                      (Obj.magic
                         (Vale_X64_Machine_s.OMem
                            ((Vale_X64_Machine_s.MReg
                                ((Vale_X64_Machine_s.Reg
                                    (Prims.int_zero,
                                      (Vale_X64_Machine_s.__proj__OReg__item__r
                                         dst))), offset)), t)))
                      (Obj.magic src)))
let (va_codegen_success_Store64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset -> fun t -> fun upper -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'upper, 'b, 'index, 'vaus0,
  'vauk) va_wp_Store64_buffer128 = unit

let (va_quick_Store64_buffer128 :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Prims.bool ->
              Vale_X64_Memory.buffer128 ->
                Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun upper ->
              fun b ->
                fun index ->
                  Vale_X64_QuickCode.QProc
                    ((va_code_Store64_buffer128 h dst src offset t upper),
                      [Vale_X64_QuickCode.Mod_mem;
                      Vale_X64_QuickCode.va_mod_heaplet h], (), ())
let (va_code_ZeroXmm :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun dst -> Vale_X64_Machine_s.Block [va_code_Pxor dst dst]
let (va_codegen_success_ZeroXmm :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Pxor dst dst)
      (Vale_X64_Decls.va_ttrue ())

type ('dst, 'vaus0, 'vauk) va_wp_ZeroXmm = unit

let (va_quick_ZeroXmm :
  Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst ->
    Vale_X64_QuickCode.QProc
      ((va_code_ZeroXmm dst),
        [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
        (), ())
let (va_code_InitPshufbMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Machine_s.Block
        [va_code_PinsrqImm dst (Prims.parse_int "579005069656919567")
           Prims.int_zero tmp;
        va_code_PinsrqImm dst (Prims.parse_int "283686952306183")
          Prims.int_one tmp]
let (va_codegen_success_InitPshufbMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Decls.va_pbool_and
        (va_codegen_success_PinsrqImm dst
           (Prims.parse_int "579005069656919567") Prims.int_zero tmp)
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_PinsrqImm dst
              (Prims.parse_int "283686952306183") Prims.int_one tmp)
           (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'tmp, 'vaus0, 'vauk) va_wp_InitPshufbMask = unit

let (va_quick_InitPshufbMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_QuickCode.QProc
        ((va_code_InitPshufbMask dst tmp),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_InitPshufbStableMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Machine_s.Block
        [va_code_PinsrqImm dst (Prims.parse_int "289644378169868803")
           Prims.int_zero tmp;
        va_code_PinsrqImm dst (Prims.parse_int "868365760874482187")
          Prims.int_one tmp]
let (va_codegen_success_InitPshufbStableMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Decls.va_pbool_and
        (va_codegen_success_PinsrqImm dst
           (Prims.parse_int "289644378169868803") Prims.int_zero tmp)
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_PinsrqImm dst
              (Prims.parse_int "868365760874482187") Prims.int_one tmp)
           (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'tmp, 'vaus0, 'vauk) va_wp_InitPshufbStableMask = unit

let (va_quick_InitPshufbStableMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_QuickCode.QProc
        ((va_code_InitPshufbStableMask dst tmp),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_InitPshufbDupMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Machine_s.Block
        [va_code_PinsrqImm dst (Prims.parse_int "579005069656919567")
           Prims.int_zero tmp;
        va_code_PinsrqImm dst (Prims.parse_int "579005069656919567")
          Prims.int_one tmp]
let (va_codegen_success_InitPshufbDupMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Decls.va_pbool_and
        (va_codegen_success_PinsrqImm dst
           (Prims.parse_int "579005069656919567") Prims.int_zero tmp)
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_PinsrqImm dst
              (Prims.parse_int "579005069656919567") Prims.int_one tmp)
           (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'tmp, 'vaus0, 'vauk) va_wp_InitPshufbDupMask = unit

let (va_quick_InitPshufbDupMask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_QuickCode.QProc
        ((va_code_InitPshufbDupMask dst tmp),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_InitPshufb64Mask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Machine_s.Block
        [va_code_PinsrqImm dst (Prims.parse_int "283686952306183")
           Prims.int_zero tmp;
        va_code_PinsrqImm dst (Prims.parse_int "579005069656919567")
          Prims.int_one tmp]
let (va_codegen_success_InitPshufb64Mask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_Decls.va_pbool_and
        (va_codegen_success_PinsrqImm dst (Prims.parse_int "283686952306183")
           Prims.int_zero tmp)
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_PinsrqImm dst
              (Prims.parse_int "579005069656919567") Prims.int_one tmp)
           (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'tmp, 'vaus0, 'vauk) va_wp_InitPshufb64Mask = unit

let (va_quick_InitPshufb64Mask :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun tmp ->
      Vale_X64_QuickCode.QProc
        ((va_code_InitPshufb64Mask dst tmp),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_reg_opr64 tmp;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_XmmEqual :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun x1 ->
    fun x2 ->
      Vale_X64_Machine_s.Block
        [va_code_Pcmpeqd x1 x2;
        va_code_Pextrq (Vale_X64_Machine_s.OReg (Prims.of_int (3))) x1
          Prims.int_zero;
        Vale_X64_InsBasic.va_code_Nat64Equal
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        va_code_Pextrq (Vale_X64_Machine_s.OReg (Prims.of_int (3))) x1
          Prims.int_one;
        Vale_X64_InsBasic.va_code_Nat64Equal
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_Add64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
let (va_codegen_success_XmmEqual :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  =
  fun x1 ->
    fun x2 ->
      Vale_X64_Decls.va_pbool_and (va_codegen_success_Pcmpeqd x1 x2)
        (Vale_X64_Decls.va_pbool_and
           (va_codegen_success_Pextrq
              (Vale_X64_Machine_s.OReg (Prims.of_int (3))) x1 Prims.int_zero)
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsBasic.va_codegen_success_Nat64Equal
                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                 (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
              (Vale_X64_Decls.va_pbool_and
                 (va_codegen_success_Pextrq
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))) x1
                    Prims.int_one)
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsBasic.va_codegen_success_Nat64Equal
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Add64
                          (Vale_X64_Machine_s.OReg Prims.int_zero)
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                       (Vale_X64_Decls.va_ttrue ()))))))

type ('x1, 'x2, 'vaus0, 'vauk) va_wp_XmmEqual = unit

let (va_quick_XmmEqual :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun x1 ->
    fun x2 ->
      Vale_X64_QuickCode.QProc
        ((va_code_XmmEqual x1 x2),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
          Vale_X64_QuickCode.va_mod_xmm x1], (), ())