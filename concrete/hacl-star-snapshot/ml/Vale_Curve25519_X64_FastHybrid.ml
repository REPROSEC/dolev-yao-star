open Prims
let (va_code_Fast_mul1 :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment
         "Compute the raw multiplication of f1*f2";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.int_zero + ((Prims.of_int (8)) * offset)))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
      Vale_X64_InsBasic.va_code_Comment "f1[0]*f2";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (8)) + ((Prims.of_int (8)) * offset)))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
      Vale_X64_InsBasic.va_code_Comment "f1[1]*f2";
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (16)) + ((Prims.of_int (8)) * offset)))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Comment "f1[2]*f2";
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (24)) + ((Prims.of_int (8)) * offset)))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Comment "f1[3]*f2";
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
let (va_codegen_success_Fast_mul1 : Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment
         "Compute the raw multiplication of f1*f2")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mulx64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                  (Vale_X64_Machine_s.OMem
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (4)))),
                           (Prims.int_zero + ((Prims.of_int (8)) * offset)))),
                       Vale_Arch_HeapTypes_s.Secret)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Space
                     (Prims.of_int (2)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Comment "f1[0]*f2")
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                 (Vale_X64_Machine_s.OReg Prims.int_one)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                                 (Vale_X64_Machine_s.OMem
                                    ((Vale_X64_Machine_s.MReg
                                        ((Vale_X64_Machine_s.Reg
                                            (Prims.int_zero,
                                              (Prims.of_int (4)))),
                                          ((Prims.of_int (8)) +
                                             ((Prims.of_int (8)) * offset)))),
                                      Vale_Arch_HeapTypes_s.Secret)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Space
                                    (Prims.of_int (2)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                       "f1[1]*f2")
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (9)))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (2))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (2)))
                                             (Vale_X64_Machine_s.OConst
                                                Prims.int_zero))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                ())
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                   ())
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (13)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (10)))
                                                      (Vale_X64_Machine_s.OMem
                                                         ((Vale_X64_Machine_s.MReg
                                                             ((Vale_X64_Machine_s.Reg
                                                                 (Prims.int_zero,
                                                                   (Prims.of_int (4)))),
                                                               ((Prims.of_int (16))
                                                                  +
                                                                  ((Prims.of_int (8))
                                                                    * offset)))),
                                                           Vale_Arch_HeapTypes_s.Secret)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Comment
                                                         "f1[2]*f2")
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (10)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                                  ())
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    ((Prims.of_int (8))
                                                                    * offset)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f1[3]*f2")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))
let (va_qcode_Fast_mul1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun inA_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsBasic.va_code_Comment
             "Compute the raw multiplication of f1*f2";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.int_zero + ((Prims.of_int (8)) * offset)))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
          Vale_X64_InsBasic.va_code_Comment "f1[0]*f2";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (8)) + ((Prims.of_int (8)) * offset)))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
          Vale_X64_InsBasic.va_code_Comment "f1[1]*f2";
          Vale_X64_InsBasic.va_code_Add64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero);
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (16)) + ((Prims.of_int (8)) * offset)))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Comment "f1[2]*f2";
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg Prims.int_one);
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (24)) + ((Prims.of_int (8)) * offset)))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Comment "f1[3]*f2";
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))] va_mods ()

type ('offset, 'inAub, 'vaus0, 'vauk) va_wp_Fast_mul1 = unit

let (va_quick_Fast_mul1 :
  Prims.nat ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun inA_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_mul1 offset),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (),
          ())
let (va_code_Fast_add_after_mul1_regs :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
let (va_codegen_success_Fast_add_after_mul1_regs :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OConst Prims.int_zero))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                     Prims.int_zero
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                           (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                              (Vale_X64_Machine_s.OReg Prims.int_one))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                 Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                                 (Prims.of_int (24))
                                 Vale_Arch_HeapTypes_s.Secret)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (11)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (13))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (2))))
                                    (Vale_X64_Decls.va_ttrue ())))))))))))
let (va_qcode_Fast_add_after_mul1_regs :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun inB_b ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsBasic.va_code_Xor64
           (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
           (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
        Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adox64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
          (Vale_X64_Machine_s.OConst Prims.int_zero);
        Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adox64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg Prims.int_one)
          (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adox64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OReg Prims.int_one);
        Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adox64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
        Vale_X64_InsBasic.va_code_Adox64Wrap
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)))] va_mods ()

type ('inBub, 'vaus0, 'vauk) va_wp_Fast_add_after_mul1_regs = unit

let (va_quick_Fast_add_after_mul1_regs :
  Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun inB_b ->
    Vale_X64_QuickCode.QProc
      ((va_code_Fast_add_after_mul1_regs ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Fast_mul1_add :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (32)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.int_zero + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (40)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (48)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (56)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
let (va_codegen_success_Fast_mul1_add : Prims.nat -> Vale_X64_Decls.va_pbool)
  =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (32)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Xor64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (4)))),
                              (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mulx64
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                           (Vale_X64_Machine_s.OMem
                              ((Vale_X64_Machine_s.MReg
                                  ((Vale_X64_Machine_s.Reg
                                      (Prims.int_zero, (Prims.of_int (4)))),
                                    ((Prims.of_int (40)) +
                                       (offset * (Prims.of_int (8)))))),
                                Vale_Arch_HeapTypes_s.Secret)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                 ())
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (9)))
                                    (Vale_X64_Machine_s.OMem
                                       ((Vale_X64_Machine_s.MReg
                                           ((Vale_X64_Machine_s.Reg
                                               (Prims.int_zero,
                                                 (Prims.of_int (4)))),
                                             ((Prims.of_int (8)) +
                                                (offset * (Prims.of_int (8)))))),
                                         Vale_Arch_HeapTypes_s.Secret)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                       ())
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (13)))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (10)))
                                          (Vale_X64_Machine_s.OMem
                                             ((Vale_X64_Machine_s.MReg
                                                 ((Vale_X64_Machine_s.Reg
                                                     (Prims.int_zero,
                                                       (Prims.of_int (4)))),
                                                   ((Prims.of_int (48)) +
                                                      (offset *
                                                         (Prims.of_int (8)))))),
                                               Vale_Arch_HeapTypes_s.Secret)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (10)))
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_one))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                ())
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (10)))
                                                   (Vale_X64_Machine_s.OMem
                                                      ((Vale_X64_Machine_s.MReg
                                                          ((Vale_X64_Machine_s.Reg
                                                              (Prims.int_zero,
                                                                (Prims.of_int (4)))),
                                                            ((Prims.of_int (16))
                                                               +
                                                               (offset *
                                                                  (Prims.of_int (8)))))),
                                                        Vale_Arch_HeapTypes_s.Secret)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                      ())
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_zero)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (11)))
                                                         (Vale_X64_Machine_s.OMem
                                                            ((Vale_X64_Machine_s.MReg
                                                                ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                  ((Prims.of_int (56))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                              Vale_Arch_HeapTypes_s.Secret)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (11)))
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (13))))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                  (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))
let (va_qcode_Fast_mul1_add :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun inA_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (32)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Xor64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adox64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (40)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adox64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (48)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg Prims.int_one);
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adox64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (56)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adox64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Adox64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))] va_mods ()

type ('offset, 'inAub, 'vaus0, 'vauk) va_wp_Fast_mul1_add = unit

let (va_quick_Fast_mul1_add :
  Prims.nat ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun inA_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_mul1_add offset),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
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
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))))],
          (), ())
let (va_code_Store4 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Store the result";
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Store4 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Newline ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Comment "Store the result")
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Store64_buffer Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                     Prims.int_zero
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                     (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                        Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                        (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_ttrue ()))))))
let (va_qcode_Store4 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst_b ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsBasic.va_code_Newline ();
        Vale_X64_InsBasic.va_code_Comment "Store the result";
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (16))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
          Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('dstub, 'vaus0, 'vauk) va_wp_Store4 = unit

let (va_quick_Store4 :
  Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst_b ->
    Vale_X64_QuickCode.QProc
      ((va_code_Store4 ()),
        [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
        Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Carry_times_38 :
  Vale_X64_Machine_s.operand64 ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun tmp ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64 tmp
         (Vale_X64_Machine_s.OConst (Prims.of_int (38)));
      Vale_X64_InsBasic.va_code_Cmovc64
        (Vale_X64_Machine_s.OReg Prims.int_zero) tmp]
let (va_codegen_success_Carry_times_38 :
  Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool) =
  fun tmp ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64 tmp
         (Vale_X64_Machine_s.OConst (Prims.of_int (38))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Cmovc64
            (Vale_X64_Machine_s.OReg Prims.int_zero) tmp)
         (Vale_X64_Decls.va_ttrue ()))

type ('tmp, 'vaus0, 'vauk) va_wp_Carry_times_38 = unit

let (va_quick_Carry_times_38 :
  Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun tmp ->
    Vale_X64_QuickCode.QProc
      ((va_code_Carry_times_38 tmp),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
        Vale_X64_QuickCode.va_mod_dst_opr64 tmp], (), ())
let (va_code_Carry_pass :
  Prims.bool ->
    Prims.nat ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun use_cf ->
    fun offset ->
      Vale_X64_Machine_s.Block
        [if use_cf
         then
           Vale_X64_Machine_s.Block
             [Vale_X64_InsBasic.va_code_Comment "Step 1: Compute carry*38";
             Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_zero);
             va_code_Carry_times_38
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
             Vale_X64_InsBasic.va_code_Newline ();
             Vale_X64_InsBasic.va_code_Comment
               "Step 2: Add carry*38 to the original sum";
             Vale_X64_InsBasic.va_code_Xor64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
         else
           Vale_X64_Machine_s.Block
             [Vale_X64_InsBasic.va_code_IMul64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
             Vale_X64_InsBasic.va_code_Newline ();
             Vale_X64_InsBasic.va_code_Comment
               "Step 2: Fold the carry back into dst"];
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsBasic.va_code_Adcx64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adcx64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Adcx64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
          ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
          Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsBasic.va_code_Newline ();
        Vale_X64_InsBasic.va_code_Comment
          "Step 3: Fold the carry bit back in; guaranteed not to carry at this point";
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OConst Prims.int_zero);
        Vale_X64_InsBasic.va_code_Cmovc64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Prims.int_zero + (offset * (Prims.of_int (8))))
          Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Carry_pass :
  Prims.bool -> Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun use_cf ->
    fun offset ->
      Vale_X64_Decls.va_pbool_and
        (if use_cf
         then
           Vale_X64_Decls.va_pbool_and
             (Vale_X64_InsBasic.va_codegen_success_Comment
                "Step 1: Compute carry*38")
             (Vale_X64_Decls.va_pbool_and
                (Vale_X64_InsBasic.va_codegen_success_Mov64
                   (Vale_X64_Machine_s.OReg Prims.int_zero)
                   (Vale_X64_Machine_s.OConst Prims.int_zero))
                (Vale_X64_Decls.va_pbool_and
                   (va_codegen_success_Carry_times_38
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                   (Vale_X64_Decls.va_pbool_and
                      (Vale_X64_InsBasic.va_codegen_success_Newline ())
                      (Vale_X64_Decls.va_pbool_and
                         (Vale_X64_InsBasic.va_codegen_success_Comment
                            "Step 2: Add carry*38 to the original sum")
                         (Vale_X64_Decls.va_pbool_and
                            (Vale_X64_InsBasic.va_codegen_success_Xor64
                               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                               (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                            (Vale_X64_Decls.va_ttrue ()))))))
         else
           Vale_X64_Decls.va_pbool_and
             (Vale_X64_InsBasic.va_codegen_success_IMul64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
             (Vale_X64_Decls.va_pbool_and
                (Vale_X64_InsBasic.va_codegen_success_Newline ())
                (Vale_X64_Decls.va_pbool_and
                   (Vale_X64_InsBasic.va_codegen_success_Comment
                      "Step 2: Fold the carry back into dst")
                   (Vale_X64_Decls.va_ttrue ()))))
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg Prims.int_zero))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                 (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                    Prims.int_zero
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                    ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
                    Vale_Arch_HeapTypes_s.Secret)
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                       (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                          Prims.int_zero
                          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                          ((Prims.of_int (16)) +
                             (offset * (Prims.of_int (8))))
                          Vale_Arch_HeapTypes_s.Secret)
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                             (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                Prims.int_zero
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                                ((Prims.of_int (24)) +
                                   (offset * (Prims.of_int (8))))
                                Vale_Arch_HeapTypes_s.Secret)
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsBasic.va_codegen_success_Newline
                                   ())
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsBasic.va_codegen_success_Comment
                                      "Step 3: Fold the carry bit back in; guaranteed not to carry at this point")
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsBasic.va_codegen_success_Mov64
                                         (Vale_X64_Machine_s.OReg
                                            Prims.int_zero)
                                         (Vale_X64_Machine_s.OConst
                                            Prims.int_zero))
                                      (Vale_X64_Decls.va_pbool_and
                                         (Vale_X64_InsBasic.va_codegen_success_Cmovc64
                                            (Vale_X64_Machine_s.OReg
                                               Prims.int_zero)
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (3))))
                                         (Vale_X64_Decls.va_pbool_and
                                            (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (8)))
                                               (Vale_X64_Machine_s.OReg
                                                  Prims.int_zero))
                                            (Vale_X64_Decls.va_pbool_and
                                               (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                  Prims.int_zero
                                                  (Vale_X64_Machine_s.OReg
                                                     (Prims.of_int (5)))
                                                  (Vale_X64_Machine_s.OReg
                                                     (Prims.of_int (8)))
                                                  (Prims.int_zero +
                                                     (offset *
                                                        (Prims.of_int (8))))
                                                  Vale_Arch_HeapTypes_s.Secret)
                                               (Vale_X64_Decls.va_ttrue ()))))))))))))))
let (va_qcode_Carry_pass :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Prims.nat ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun use_cf ->
      fun offset ->
        fun dst_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_QuickCodes.if_code use_cf
               (Vale_X64_Machine_s.Block
                  [Vale_X64_InsBasic.va_code_Comment
                     "Step 1: Compute carry*38";
                  Vale_X64_InsBasic.va_code_Mov64
                    (Vale_X64_Machine_s.OReg Prims.int_zero)
                    (Vale_X64_Machine_s.OConst Prims.int_zero);
                  va_code_Carry_times_38
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                  Vale_X64_InsBasic.va_code_Newline ();
                  Vale_X64_InsBasic.va_code_Comment
                    "Step 2: Add carry*38 to the original sum";
                  Vale_X64_InsBasic.va_code_Xor64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))])
               (Vale_X64_Machine_s.Block
                  [Vale_X64_InsBasic.va_code_IMul64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                  Vale_X64_InsBasic.va_code_Newline ();
                  Vale_X64_InsBasic.va_code_Comment
                    "Step 2: Fold the carry back into dst"]);
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment
              "Step 3: Fold the carry bit back in; guaranteed not to carry at this point";
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OConst Prims.int_zero);
            Vale_X64_InsBasic.va_code_Cmovc64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Prims.int_zero + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('useucf, 'offset, 'dstub, 'vaus0, 'vauk) va_wp_Carry_pass = unit

let (va_quick_Carry_pass :
  Prims.bool ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun use_cf ->
    fun offset ->
      fun dst_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Carry_pass use_cf offset),
            [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Carry_wide :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment
         "Step 1: Compute dst + carry == tmp_hi * 38 + tmp_lo";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (38)));
      va_code_Fast_mul1_add (offset * (Prims.of_int (2)));
      va_code_Carry_pass false offset]
let (va_codegen_success_Carry_wide : Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment
         "Step 1: Compute dst + carry == tmp_hi * 38 + tmp_lo")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OConst (Prims.of_int (38))))
         (Vale_X64_Decls.va_pbool_and
            (va_codegen_success_Fast_mul1_add (offset * (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Carry_pass false offset)
               (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_Carry_wide :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsBasic.va_code_Comment
               "Step 1: Compute dst + carry == tmp_hi * 38 + tmp_lo";
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OConst (Prims.of_int (38)));
            va_code_Fast_mul1_add (offset * (Prims.of_int (2)));
            va_code_Carry_pass false offset] va_mods ()

type ('offset, 'dstub, 'inAub, 'vaus0, 'vauk) va_wp_Carry_wide = unit

let (va_quick_Carry_wide :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Carry_wide offset),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Carry_sub_pass :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_LargeComment
         "Wrap the result back into the field";
      Vale_X64_InsBasic.va_code_Comment "Step 1: Compute carry*38";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      va_code_Carry_times_38 (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 2: Substract carry*38 from the original difference";
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 3: Fold the carry bit back in; guaranteed not to carry at this point";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cmovc64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)]
let (va_codegen_success_Carry_sub_pass : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_LargeComment
         "Wrap the result back into the field")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Comment
            "Step 1: Compute carry*38")
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Carry_times_38
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Newline ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Comment
                        "Step 2: Substract carry*38 from the original difference")
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
                           (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                           (Vale_X64_Machine_s.OReg Prims.int_zero))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Sbb64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Vale_X64_Machine_s.OConst Prims.int_zero))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                                 (Vale_X64_Machine_s.OConst Prims.int_zero))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Sbb64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (11)))
                                    (Vale_X64_Machine_s.OConst Prims.int_zero))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                       ())
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Comment
                                          "Step 3: Fold the carry bit back in; guaranteed not to carry at this point")
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_zero)
                                             (Vale_X64_Machine_s.OConst
                                                Prims.int_zero))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Cmovc64
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_zero)
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (2))))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (8)))
                                                   (Vale_X64_Machine_s.OReg
                                                      Prims.int_zero))
                                                (Vale_X64_Decls.va_ttrue ())))))))))))))))
let (va_qcode_Carry_sub_pass :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_LargeComment
         "Wrap the result back into the field";
      Vale_X64_InsBasic.va_code_Comment "Step 1: Compute carry*38";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      va_code_Carry_times_38 (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 2: Substract carry*38 from the original difference";
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 3: Fold the carry bit back in; guaranteed not to carry at this point";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cmovc64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)] va_mods ()

type ('vaus0, 'vauk) va_wp_Carry_sub_pass = unit

let (va_quick_Carry_sub_pass :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Carry_sub_pass ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Fast_add :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
         Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret))]
let (va_codegen_success_Fast_add : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
         Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OMem
                  ((Vale_X64_Machine_s.MReg
                      ((Vale_X64_Machine_s.Reg
                          (Prims.int_zero, (Prims.of_int (4)))),
                        Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OMem
                           ((Vale_X64_Machine_s.MReg
                               ((Vale_X64_Machine_s.Reg
                                   (Prims.int_zero, (Prims.of_int (4)))),
                                 (Prims.of_int (8)))),
                             Vale_Arch_HeapTypes_s.Secret)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                           (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
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
                                          (Prims.of_int (16)))),
                                      Vale_Arch_HeapTypes_s.Secret)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                    Prims.int_zero
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (11)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (3)))
                                    (Prims.of_int (24))
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
                                                   (Prims.of_int (24)))),
                                               Vale_Arch_HeapTypes_s.Secret)))
                                       (Vale_X64_Decls.va_ttrue ()))))))))))))
let (va_qcode_Fast_add :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
             (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
             Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Add64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (16))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (24))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret))]
          va_mods ()

type ('inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_add = unit

let (va_quick_Fast_add :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun inA_b ->
    fun inB_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_add ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))))],
          (), ())
let (va_code_Fast_sub :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment
         "Compute the raw substraction of f1-f2";
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Sbb64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3)))),
                 (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret))]
let (va_codegen_success_Fast_sub : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment
         "Compute the raw substraction of f1-f2")
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
                             (Prims.int_zero, (Prims.of_int (3)))),
                           Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
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
                                      (Prims.int_zero, (Prims.of_int (3)))),
                                    (Prims.of_int (8)))),
                                Vale_Arch_HeapTypes_s.Secret)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                              Prims.int_zero
                              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
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
                                                 (Prims.of_int (3)))),
                                             (Prims.of_int (16)))),
                                         Vale_Arch_HeapTypes_s.Secret)))
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
                                                          (Prims.of_int (3)))),
                                                      (Prims.of_int (24)))),
                                                  Vale_Arch_HeapTypes_s.Secret)))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
let (va_qcode_Fast_sub :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsBasic.va_code_Comment
             "Compute the raw substraction of f1-f2";
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
                       (Prims.int_zero, (Prims.of_int (3)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Secret));
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
                       (Prims.int_zero, (Prims.of_int (3)))),
                     (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (16))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Sbb64
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (3)))),
                     (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (24))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Sbb64
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (3)))),
                     (Prims.of_int (24)))), Vale_Arch_HeapTypes_s.Secret))]
          va_mods ()

type ('inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_sub = unit

let (va_quick_Fast_sub :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun inA_b ->
    fun inB_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_sub ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))))],
          (), ())
let (va_code_Fadd :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_Comment "Compute the raw addition of f1 + f2";
      va_code_Fast_add ();
      Vale_X64_InsBasic.va_code_LargeComment
        "Wrap the result back into the field";
      va_code_Carry_pass true Prims.int_zero;
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fadd : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Comment
            "Compute the raw addition of f1 + f2")
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fast_add ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_LargeComment
                  "Wrap the result back into the field")
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Carry_pass true Prims.int_zero)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
                     (Vale_X64_Decls.va_ttrue ()))))))
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inBub) va_req_Fadd = unit
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inBub, 'vausM, 'vaufM) va_ens_Fadd =
  unit
let (va_qcode_Fadd :
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
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_X64_InsBasic.va_code_Comment
              "Compute the raw addition of f1 + f2";
            va_code_Fast_add ();
            Vale_X64_InsBasic.va_code_LargeComment
              "Wrap the result back into the field";
            va_code_Carry_pass true Prims.int_zero;
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fadd = unit

let (va_quick_Fadd :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fadd ()),
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fadd_stdcall :
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
      va_code_Fadd ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]
      else Vale_X64_Machine_s.Block []]
let (va_codegen_success_Fadd_stdcall : Prims.bool -> Vale_X64_Decls.va_pbool)
  =
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
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fadd ())
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
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBub) va_req_Fadd_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBub, 'vausM,
  'vaufM) va_ens_Fadd_stdcall = unit
let (va_qcode_Fadd_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
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
              va_code_Fadd ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsStack.va_code_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))])
                (Vale_X64_Machine_s.Block [])] va_mods ()

type ('win, 'dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fadd_stdcall = unit

let (va_quick_Fadd_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fadd_stdcall win),
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
let (va_code_Fsub :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      va_code_Fast_sub ();
      va_code_Carry_sub_pass ();
      va_code_Store4 ();
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fsub : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fast_sub ())
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Carry_sub_pass ())
            (Vale_X64_Decls.va_pbool_and (va_codegen_success_Store4 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
                  (Vale_X64_Decls.va_ttrue ())))))
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inBub) va_req_Fsub = unit
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inBub, 'vausM, 'vaufM) va_ens_Fsub =
  unit
let (va_qcode_Fsub :
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
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            va_code_Fast_sub ();
            va_code_Carry_sub_pass ();
            va_code_Store4 ();
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fsub = unit

let (va_quick_Fsub :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fsub ()),
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fsub_stdcall :
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
      va_code_Fsub ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]
      else Vale_X64_Machine_s.Block []]
let (va_codegen_success_Fsub_stdcall : Prims.bool -> Vale_X64_Decls.va_pbool)
  =
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
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fsub ())
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
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBub) va_req_Fsub_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBub, 'vausM,
  'vaufM) va_ens_Fsub_stdcall = unit
let (va_qcode_Fsub_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
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
              va_code_Fsub ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsStack.va_code_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))])
                (Vale_X64_Machine_s.Block [])] va_mods ()

type ('win, 'dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fsub_stdcall = unit

let (va_quick_Fsub_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fsub_stdcall win),
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
let (va_code_Fmul1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      va_code_Fast_mul1 Prims.int_zero;
      Vale_X64_InsBasic.va_code_LargeComment
        "Wrap the result back into the field";
      Vale_X64_InsBasic.va_code_Comment "Step 1: Compute carry*38";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (38)));
      va_code_Carry_pass false Prims.int_zero;
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fmul1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (va_codegen_success_Fast_mul1 Prims.int_zero)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_LargeComment
               "Wrap the result back into the field")
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Comment
                  "Step 1: Compute carry*38")
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                     (Vale_X64_Machine_s.OConst (Prims.of_int (38))))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Carry_pass false Prims.int_zero)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                           ()) (Vale_X64_Decls.va_ttrue ())))))))
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inB) va_req_Fmul1 = unit
type ('vaub0, 'vaus0, 'dstub, 'inAub, 'inB, 'vausM, 'vaufM) va_ens_Fmul1 =
  unit
let (va_qcode_Fmul1 :
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
            va_code_Fast_mul1 Prims.int_zero;
            Vale_X64_InsBasic.va_code_LargeComment
              "Wrap the result back into the field";
            Vale_X64_InsBasic.va_code_Comment "Step 1: Compute carry*38";
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OConst (Prims.of_int (38)));
            va_code_Carry_pass false Prims.int_zero;
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('dstub, 'inAub, 'inB, 'vaus0, 'vauk) va_wp_Fmul1 = unit

let (va_quick_Fmul1 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst_b ->
    fun inA_b ->
      fun inB ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fmul1 ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fmul1_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
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
      va_code_Fmul1 ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]
let (va_codegen_success_Fmul1_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push_Secret
               (Vale_X64_Machine_s.OReg Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (if win
                then
                  Vale_X64_Decls.va_pbool_and
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
                             (Vale_X64_Decls.va_ttrue ()))))
                else Vale_X64_Decls.va_ttrue ())
               (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fmul1 ())
                  (Vale_X64_Decls.va_pbool_and
                     (if win
                      then
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                          (Vale_X64_Decls.va_ttrue ())
                      else Vale_X64_Decls.va_ttrue ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                           (Vale_X64_Machine_s.OReg Prims.int_one))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                              (Vale_X64_Decls.va_ttrue ())))))))))
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBuin) va_req_Fmul1_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'dstub, 'inAub, 'inBuin, 'vausM,
  'vaufM) va_ens_Fmul1_stdcall = unit
let (va_qcode_Fmul1_stdcall :
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
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Push_Secret
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
              va_code_Fmul1 ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                (Vale_X64_Machine_s.Block []);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))] va_mods ()

type ('win, 'dstub, 'inAub, 'inBuin, 'vaus0, 'vauk) va_wp_Fmul1_stdcall =
  unit

let (va_quick_Fmul1_stdcall :
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
            ((va_code_Fmul1_stdcall win),
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