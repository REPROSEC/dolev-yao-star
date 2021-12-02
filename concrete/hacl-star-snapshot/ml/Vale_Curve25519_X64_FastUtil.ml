open Prims
let (va_code_Fast_mul1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
let (va_codegen_success_Fast_mul1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Secret)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Store64_buffer Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Xor64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mulx64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Vale_X64_Machine_s.OMem
                           ((Vale_X64_Machine_s.MReg
                               ((Vale_X64_Machine_s.Reg
                                   (Prims.int_zero, (Prims.of_int (4)))),
                                 (Prims.of_int (8)))),
                             Vale_Arch_HeapTypes_s.Secret)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                              Prims.int_zero
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                              (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                 ())
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (13)))
                                    (Vale_X64_Machine_s.OReg Prims.int_one)
                                    (Vale_X64_Machine_s.OMem
                                       ((Vale_X64_Machine_s.MReg
                                           ((Vale_X64_Machine_s.Reg
                                               (Prims.int_zero,
                                                 (Prims.of_int (4)))),
                                             (Prims.of_int (16)))),
                                         Vale_Arch_HeapTypes_s.Secret)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                       (Vale_X64_Machine_s.OReg Prims.int_one)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (11))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                          Prims.int_zero
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (5)))
                                          (Vale_X64_Machine_s.OReg
                                             Prims.int_one)
                                          (Prims.of_int (16))
                                          Vale_Arch_HeapTypes_s.Secret)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_zero)
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (14)))
                                                (Vale_X64_Machine_s.OMem
                                                   ((Vale_X64_Machine_s.MReg
                                                       ((Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (4)))),
                                                         (Prims.of_int (24)))),
                                                     Vale_Arch_HeapTypes_s.Secret)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (14)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (13))))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                      Prims.int_zero
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (5)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (14)))
                                                      (Prims.of_int (24))
                                                      Vale_Arch_HeapTypes_s.Secret)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_zero)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (8))))
                                                      (Vale_X64_Decls.va_ttrue
                                                         ())))))))))))))))))
let (va_qcode_Fast_mul1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Xor64
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Add64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (16))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (24))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))] va_mods ()

type ('dstub, 'inAub, 'vaus0, 'vauk) va_wp_Fast_mul1 = unit

let (va_quick_Fast_mul1 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_mul1 ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_add1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_Comment
        "Clear registers to propagate the carry bit";
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Begin addition chain";
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Return the carry bit in a register";
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fast_add1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Comment
            "Clear registers to propagate the carry bit")
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Xor64
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Xor64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Xor64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Xor64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Xor64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OReg Prims.int_zero))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Newline ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Comment
                                 "Begin addition chain")
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                    ())
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (3)))
                                       (Vale_X64_Machine_s.OMem
                                          ((Vale_X64_Machine_s.MReg
                                              ((Vale_X64_Machine_s.Reg
                                                  (Prims.int_zero,
                                                    (Prims.of_int (4)))),
                                                Prims.int_zero)),
                                            Vale_Arch_HeapTypes_s.Secret)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                          Prims.int_zero
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (5)))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (3)))
                                          Prims.int_zero
                                          Vale_Arch_HeapTypes_s.Secret)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (8)))
                                                (Vale_X64_Machine_s.OMem
                                                   ((Vale_X64_Machine_s.MReg
                                                       ((Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (4)))),
                                                         (Prims.of_int (8)))),
                                                     Vale_Arch_HeapTypes_s.Secret)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                   Prims.int_zero
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (5)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (8)))
                                                   (Prims.of_int (8))
                                                   Vale_Arch_HeapTypes_s.Secret)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                      ())
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (9)))
                                                         (Vale_X64_Machine_s.OMem
                                                            ((Vale_X64_Machine_s.MReg
                                                                ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                  (Prims.of_int (16)))),
                                                              Vale_Arch_HeapTypes_s.Secret)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                            Prims.int_zero
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (5)))
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (9)))
                                                            (Prims.of_int (16))
                                                            Vale_Arch_HeapTypes_s.Secret)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                  (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                    (Prims.of_int (24)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                    (Prims.of_int (24))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "Return the carry bit in a register")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                                                    ())
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ())))))))))))))))))))))))))
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inB) va_req_Fast_add1 = unit
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inB, 'vausM,
  'vaufM) va_ens_Fast_add1 = unit
let (va_qcode_Fast_add1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      fun inA_b ->
        fun inB ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_X64_InsBasic.va_code_Comment
              "Clear registers to propagate the carry bit";
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "Begin addition chain";
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8))) (Prims.of_int (8))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment
              "Return the carry bit in a register";
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('dstub, 'inAub, 'inB, 'vaus0, 'vauk) va_wp_Fast_add1 = unit

let (va_quick_Fast_add1 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_add1 ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_add1_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
      else Vale_X64_Machine_s.Block [];
      va_code_Fast_add1 ();
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]
let (va_codegen_success_Fast_add1_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
         (Vale_X64_Decls.va_pbool_and
            (if win
             then
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
                       (Vale_X64_Decls.va_ttrue ())))
             else Vale_X64_Decls.va_ttrue ())
            (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fast_add1 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                     (Vale_X64_Decls.va_ttrue ()))))))
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub,
  'inBuin) va_req_Fast_add1_stdcall = unit
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBuin, 'vausM,
  'vaufM) va_ens_Fast_add1_stdcall = unit
let (va_qcode_Fast_add1_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst_b ->
        fun inA_b ->
          fun inB_in ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsStack.va_code_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                (Vale_X64_Machine_s.Block []);
              va_code_Fast_add1 ();
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))] va_mods ()

type ('win, 'dstub, 'inAub, 'inBuin, 'vaus0, 'vauk) va_wp_Fast_add1_stdcall =
  unit

let (va_quick_Fast_add1_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst_b ->
      fun inA_b ->
        fun inB_in ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_add1_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_sub1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_zero)]
let (va_codegen_success_Fast_sub1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Xor64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
                  Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                     Prims.int_zero
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Sbb64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OConst Prims.int_zero))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                           (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                              Prims.int_zero
                              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                              (Prims.of_int (16))
                              Vale_Arch_HeapTypes_s.Secret)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                                 (Vale_X64_Machine_s.OConst Prims.int_zero))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                    Prims.int_zero
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (5)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (10)))
                                    (Prims.of_int (16))
                                    Vale_Arch_HeapTypes_s.Secret)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                       Prims.int_zero
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (11)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (4)))
                                       (Prims.of_int (24))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (11)))
                                          (Vale_X64_Machine_s.OConst
                                             Prims.int_zero))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                             Prims.int_zero
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (5)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (11)))
                                             (Prims.of_int (24))
                                             Vale_Arch_HeapTypes_s.Secret)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_zero)
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_zero))
                                             (Vale_X64_Decls.va_ttrue ()))))))))))))))
let (va_qcode_Fast_sub1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsBasic.va_code_Xor64
             (Vale_X64_Machine_s.OReg Prims.int_zero)
             (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Sub64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Sbb64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OConst Prims.int_zero);
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Sbb64
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OConst Prims.int_zero);
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (16))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Sbb64
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OConst Prims.int_zero);
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Adc64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg Prims.int_zero)] va_mods ()

type ('dstub, 'inAub, 'vaus0, 'vauk) va_wp_Fast_sub1 = unit

let (va_quick_Fast_sub1 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_sub1 ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_add :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
let (va_codegen_success_Fast_add : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Xor64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (4)))),
                              Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                        Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                           (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                                 (Vale_X64_Machine_s.OMem
                                    ((Vale_X64_Machine_s.MReg
                                        ((Vale_X64_Machine_s.Reg
                                            (Prims.int_zero,
                                              (Prims.of_int (4)))),
                                          (Prims.of_int (8)))),
                                      Vale_Arch_HeapTypes_s.Secret)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                    Prims.int_zero
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (5)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (10)))
                                    (Prims.of_int (8))
                                    Vale_Arch_HeapTypes_s.Secret)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                       Prims.int_zero
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (11)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (2)))
                                       (Prims.of_int (16))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (11)))
                                             (Vale_X64_Machine_s.OMem
                                                ((Vale_X64_Machine_s.MReg
                                                    ((Vale_X64_Machine_s.Reg
                                                        (Prims.int_zero,
                                                          (Prims.of_int (4)))),
                                                      (Prims.of_int (16)))),
                                                  Vale_Arch_HeapTypes_s.Secret)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                Prims.int_zero
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (5)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (11)))
                                                (Prims.of_int (16))
                                                Vale_Arch_HeapTypes_s.Secret)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                   Prims.int_zero
                                                   (Vale_X64_Machine_s.OReg
                                                      Prims.int_one)
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (2)))
                                                   (Prims.of_int (24))
                                                   Vale_Arch_HeapTypes_s.Secret)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                      ())
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_one)
                                                         (Vale_X64_Machine_s.OMem
                                                            ((Vale_X64_Machine_s.MReg
                                                                ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                  (Prims.of_int (24)))),
                                                              Vale_Arch_HeapTypes_s.Secret)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                            Prims.int_zero
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (5)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one)
                                                            (Prims.of_int (24))
                                                            Vale_Arch_HeapTypes_s.Secret)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                               (Vale_X64_Machine_s.OReg
                                                                  Prims.int_zero)
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (8))))
                                                            (Vale_X64_Decls.va_ttrue
                                                               ())))))))))))))))))))
let (va_qcode_Fast_add :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsBasic.va_code_Xor64
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
            Vale_X64_InsBasic.va_code_Xor64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (8))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg Prims.int_one)
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg Prims.int_one)
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (4)))),
                       (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (24))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))] va_mods ()

type ('dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_add = unit

let (va_quick_Fast_add :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_add ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_sub :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_zero)]
let (va_codegen_success_Fast_sub : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Xor64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                  (Vale_X64_Machine_s.OMem
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (2)))),
                           Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                     Prims.int_zero
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                        Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                        (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Sbb64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Vale_X64_Machine_s.OMem
                                 ((Vale_X64_Machine_s.MReg
                                     ((Vale_X64_Machine_s.Reg
                                         (Prims.int_zero, (Prims.of_int (2)))),
                                       (Prims.of_int (8)))),
                                   Vale_Arch_HeapTypes_s.Secret)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                 Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                                 (Prims.of_int (8))
                                 Vale_Arch_HeapTypes_s.Secret)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                    Prims.int_zero
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (10)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (4)))
                                    (Prims.of_int (16))
                                    Vale_Arch_HeapTypes_s.Secret)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                       ())
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (10)))
                                          (Vale_X64_Machine_s.OMem
                                             ((Vale_X64_Machine_s.MReg
                                                 ((Vale_X64_Machine_s.Reg
                                                     (Prims.int_zero,
                                                       (Prims.of_int (2)))),
                                                   (Prims.of_int (16)))),
                                               Vale_Arch_HeapTypes_s.Secret)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                             Prims.int_zero
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (5)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (10)))
                                             (Prims.of_int (16))
                                             Vale_Arch_HeapTypes_s.Secret)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                Prims.int_zero
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (11)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (4)))
                                                (Prims.of_int (24))
                                                Vale_Arch_HeapTypes_s.Secret)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                   ())
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (11)))
                                                      (Vale_X64_Machine_s.OMem
                                                         ((Vale_X64_Machine_s.MReg
                                                             ((Vale_X64_Machine_s.Reg
                                                                 (Prims.int_zero,
                                                                   (Prims.of_int (2)))),
                                                               (Prims.of_int (24)))),
                                                           Vale_Arch_HeapTypes_s.Secret)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                         Prims.int_zero
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (5)))
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (11)))
                                                         (Prims.of_int (24))
                                                         Vale_Arch_HeapTypes_s.Secret)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_zero)
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_zero))
                                                         (Vale_X64_Decls.va_ttrue
                                                            ()))))))))))))))))))
let (va_qcode_Fast_sub :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsBasic.va_code_Xor64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Sub64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (2)))),
                       Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Sbb64
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (2)))),
                       (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Sbb64
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (2)))),
                       (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Mem64_lemma ();
            Vale_X64_InsBasic.va_code_Sbb64
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OMem
                 ((Vale_X64_Machine_s.MReg
                     ((Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (2)))),
                       (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Adc64Wrap
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg Prims.int_zero)] va_mods ()

type ('dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_sub = unit

let (va_quick_Fast_sub :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_sub ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Cswap_single :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
         (Prims.int_zero + (offset * (Prims.of_int (8))))
         Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Prims.int_zero + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Cmovc64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Cmovc64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Prims.int_zero + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.int_zero + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Cswap_single : Prims.nat -> Vale_X64_Decls.va_pbool)
  =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
         (Prims.int_zero + (offset * (Prims.of_int (8))))
         Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Prims.int_zero + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cmovc64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Cmovc64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                        Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                        (Prims.int_zero + (offset * (Prims.of_int (8))))
                        Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                           (Prims.int_zero + (offset * (Prims.of_int (8))))
                           Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_Cswap_single :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun p0_b ->
        fun p1_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
               (Prims.int_zero + (offset * (Prims.of_int (8))))
               Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Prims.int_zero + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
            Vale_X64_InsBasic.va_code_Cmovc64
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
            Vale_X64_InsBasic.va_code_Cmovc64
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Prims.int_zero + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Prims.int_zero + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('offset, 'p0ub, 'p1ub, 'vaus0, 'vauk) va_wp_Cswap_single = unit

let (va_quick_Cswap_single :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun p0_b ->
      fun p1_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Cswap_single offset),
            [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Cswap2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_Comment "Transfer bit into CF flag";
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "18446744073709551615"));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[0], p2[0]";
      va_code_Cswap_single Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[1], p2[1]";
      va_code_Cswap_single Prims.int_one;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[2], p2[2]";
      va_code_Cswap_single (Prims.of_int (2));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[3], p2[3]";
      va_code_Cswap_single (Prims.of_int (3));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[4], p2[4]";
      va_code_Cswap_single (Prims.of_int (4));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[5], p2[5]";
      va_code_Cswap_single (Prims.of_int (5));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[6], p2[6]";
      va_code_Cswap_single (Prims.of_int (6));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "cswap p1[7], p2[7]";
      va_code_Cswap_single (Prims.of_int (7));
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Cswap2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Comment
            "Transfer bit into CF flag")
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Vale_X64_Machine_s.OConst
                  (Prims.parse_int "18446744073709551615")))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Newline ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Comment
                     "cswap p1[0], p2[0]")
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Cswap_single Prims.int_zero)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Newline ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Comment
                              "cswap p1[1], p2[1]")
                           (Vale_X64_Decls.va_pbool_and
                              (va_codegen_success_Cswap_single Prims.int_one)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Newline
                                    ())
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                       "cswap p1[2], p2[2]")
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_Cswap_single
                                          (Prims.of_int (2)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Newline
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Comment
                                                "cswap p1[3], p2[3]")
                                             (Vale_X64_Decls.va_pbool_and
                                                (va_codegen_success_Cswap_single
                                                   (Prims.of_int (3)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Newline
                                                      ())
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Comment
                                                         "cswap p1[4], p2[4]")
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (va_codegen_success_Cswap_single
                                                            (Prims.of_int (4)))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Newline
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                  "cswap p1[5], p2[5]")
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (va_codegen_success_Cswap_single
                                                                    (Prims.of_int (5)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "cswap p1[6], p2[6]")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Cswap_single
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "cswap p1[7], p2[7]")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Cswap_single
                                                                    (Prims.of_int (7)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                                                    ())
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))
type ('vaub0, 'vaus0, 'bituin, 'p0ub, 'p1ub) va_req_Cswap2 = unit
type ('vaub0, 'vaus0, 'bituin, 'p0ub, 'p1ub, 'vausM, 'vaufM) va_ens_Cswap2 =
  unit
let (va_qcode_Cswap2 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun bit_in ->
      fun p0_b ->
        fun p1_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_X64_InsBasic.va_code_Comment "Transfer bit into CF flag";
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OConst
                 (Prims.parse_int "18446744073709551615"));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[0], p2[0]";
            va_code_Cswap_single Prims.int_zero;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[1], p2[1]";
            va_code_Cswap_single Prims.int_one;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[2], p2[2]";
            va_code_Cswap_single (Prims.of_int (2));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[3], p2[3]";
            va_code_Cswap_single (Prims.of_int (3));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[4], p2[4]";
            va_code_Cswap_single (Prims.of_int (4));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[5], p2[5]";
            va_code_Cswap_single (Prims.of_int (5));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[6], p2[6]";
            va_code_Cswap_single (Prims.of_int (6));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "cswap p1[7], p2[7]";
            va_code_Cswap_single (Prims.of_int (7));
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('bituin, 'p0ub, 'p1ub, 'vaus0, 'vauk) va_wp_Cswap2 = unit

let (va_quick_Cswap2 :
  Vale_Def_Words_s.nat64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun bit_in ->
    fun p0_b ->
      fun p1_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Cswap2 ()),
            [Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Cswap2_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [if win
       then
         Vale_X64_Machine_s.Block
           [Vale_X64_InsStack.va_code_Push_Secret
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
           Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
           Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
           Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
           Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
       else Vale_X64_Machine_s.Block [];
      va_code_Cswap2 ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]
      else Vale_X64_Machine_s.Block []]
let (va_codegen_success_Cswap2_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (if win
       then
         Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsStack.va_codegen_success_Push_Secret
              (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsStack.va_codegen_success_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
                       (Vale_X64_Decls.va_ttrue ())))))
       else Vale_X64_Decls.va_ttrue ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Cswap2 ())
         (Vale_X64_Decls.va_pbool_and
            (if win
             then
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                    (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                    (Vale_X64_Decls.va_ttrue ()))
             else Vale_X64_Decls.va_ttrue ()) (Vale_X64_Decls.va_ttrue ())))
type ('vaub0, 'vaus0, 'win, 'bituin, 'p0ub, 'p1ub) va_req_Cswap2_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'bituin, 'p0ub, 'p1ub, 'vausM,
  'vaufM) va_ens_Cswap2_stdcall = unit
let (va_qcode_Cswap2_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_Def_Words_s.nat64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun bit_in ->
        fun p0_b ->
          fun p1_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_QuickCodes.if_code win
                 (Vale_X64_Machine_s.Block
                    [Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                    Vale_X64_InsStack.va_code_Push_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                    Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                    Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                    Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                 (Vale_X64_Machine_s.Block []);
              va_code_Cswap2 ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsStack.va_code_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))])
                (Vale_X64_Machine_s.Block [])] va_mods ()

type ('win, 'bituin, 'p0ub, 'p1ub, 'vaus0, 'vauk) va_wp_Cswap2_stdcall = unit

let (va_quick_Cswap2_stdcall :
  Prims.bool ->
    Vale_Def_Words_s.nat64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun bit_in ->
      fun p0_b ->
        fun p1_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Cswap2_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_mem], (), ())