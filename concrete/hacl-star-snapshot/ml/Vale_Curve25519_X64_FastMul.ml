open Prims
let (va_code_Fast_multiply_a0b :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment "Compute src1[0] * src2";
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.int_zero + ((Prims.of_int (8)) * offset))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.int_zero + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Prims.int_zero + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
let (va_codegen_success_Fast_multiply_a0b :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment "Compute src1[0] * src2")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Prims.int_zero + ((Prims.of_int (8)) * offset))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (2)))),
                              (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Space
                        (Prims.of_int (3)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Xor64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Space
                              Prims.int_one)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                 Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                                 (Prims.int_zero +
                                    (offset * (Prims.of_int (16))))
                                 Vale_Arch_HeapTypes_s.Secret)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Newline
                                    ())
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                       ())
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (11)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (10)))
                                             (Vale_X64_Machine_s.OMem
                                                ((Vale_X64_Machine_s.MReg
                                                    ((Vale_X64_Machine_s.Reg
                                                        (Prims.int_zero,
                                                          (Prims.of_int (2)))),
                                                      ((Prims.of_int (8)) +
                                                         (offset *
                                                            (Prims.of_int (8)))))),
                                                  Vale_Arch_HeapTypes_s.Secret)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Space
                                                Prims.int_one)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (10)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (9))))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Space
                                                      Prims.int_one)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                         Prims.int_zero
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (5)))
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (10)))
                                                         ((Prims.of_int (8))
                                                            +
                                                            (offset *
                                                               (Prims.of_int (16))))
                                                         Vale_Arch_HeapTypes_s.Secret)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Newline
                                                            ())
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
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (16))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (35)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))
let (va_qcode_Fast_multiply_a0b :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Comment "Compute src1[0] * src2";
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                (Prims.int_zero + ((Prims.of_int (8)) * offset))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
              Vale_X64_InsBasic.va_code_Xor64
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Prims.int_zero + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))] va_mods ()

type ('offset, 'dstub, 'inAub, 'inBub, 'vaus0,
  'vauk) va_wp_Fast_multiply_a0b = unit

let (va_quick_Fast_multiply_a0b :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_multiply_a0b offset),
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_multiply_a1b :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment "Compute src1[1] * src2";
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.int_zero + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (16)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
let (va_codegen_success_Fast_multiply_a1b :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment "Compute src1[1] * src2")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (2)))),
                              (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Space
                        (Prims.of_int (3)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Xor64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Space
                              Prims.int_one)
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
                                                 (Prims.of_int (5)))),
                                             ((Prims.of_int (8)) +
                                                (offset * (Prims.of_int (16)))))),
                                         Vale_Arch_HeapTypes_s.Secret)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                       Prims.int_zero
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (5)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (8)))
                                       ((Prims.of_int (8)) +
                                          (offset * (Prims.of_int (16))))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (11)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (10)))
                                                (Vale_X64_Machine_s.OMem
                                                   ((Vale_X64_Machine_s.MReg
                                                       ((Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (2)))),
                                                         ((Prims.of_int (8))
                                                            +
                                                            (offset *
                                                               (Prims.of_int (8)))))),
                                                     Vale_Arch_HeapTypes_s.Secret)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Space
                                                   Prims.int_one)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (10)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (9))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Space
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (10)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                               Prims.int_zero
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (5)))
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (10)))
                                                               ((Prims.of_int (16))
                                                                  +
                                                                  (offset *
                                                                    (Prims.of_int (16))))
                                                               Vale_Arch_HeapTypes_s.Secret)
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
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (16))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8)))
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
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (35)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))
let (va_qcode_Fast_multiply_a1b :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Comment "Compute src1[1] * src2";
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
              Vale_X64_InsBasic.va_code_Xor64
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (5)))),
                         ((Prims.of_int (8)) + (offset * (Prims.of_int (16)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg Prims.int_zero);
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))] va_mods ()

type ('offset, 'dstub, 'inAub, 'inBub, 'vaus0,
  'vauk) va_wp_Fast_multiply_a1b = unit

let (va_quick_Fast_multiply_a1b :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_multiply_a1b offset),
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_multiply_a2b :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment "Compute src1[2] * src2";
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.int_zero + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (16)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
let (va_codegen_success_Fast_multiply_a2b :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment "Compute src1[2] * src2")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (2)))),
                              (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Space
                        (Prims.of_int (3)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Xor64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
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
                                                 (Prims.of_int (5)))),
                                             ((Prims.of_int (16)) +
                                                (offset * (Prims.of_int (16)))))),
                                         Vale_Arch_HeapTypes_s.Secret)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                       Prims.int_zero
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (5)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (8)))
                                       ((Prims.of_int (16)) +
                                          (offset * (Prims.of_int (16))))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (11)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (10)))
                                                (Vale_X64_Machine_s.OMem
                                                   ((Vale_X64_Machine_s.MReg
                                                       ((Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (2)))),
                                                         ((Prims.of_int (8))
                                                            +
                                                            (offset *
                                                               (Prims.of_int (8)))))),
                                                     Vale_Arch_HeapTypes_s.Secret)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Space
                                                   Prims.int_one)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (10)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (9))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Space
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (10)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                               Prims.int_zero
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (5)))
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (10)))
                                                               ((Prims.of_int (24))
                                                                  +
                                                                  (offset *
                                                                    (Prims.of_int (16))))
                                                               Vale_Arch_HeapTypes_s.Secret)
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
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (16))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8)))
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
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (35)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))
let (va_qcode_Fast_multiply_a2b :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Comment "Compute src1[2] * src2";
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
              Vale_X64_InsBasic.va_code_Xor64
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (5)))),
                         ((Prims.of_int (16)) +
                            (offset * (Prims.of_int (16)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg Prims.int_zero);
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))] va_mods ()

type ('offset, 'dstub, 'inAub, 'inBub, 'vaus0,
  'vauk) va_wp_Fast_multiply_a2b = unit

let (va_quick_Fast_multiply_a2b :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_multiply_a2b offset),
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_multiply_a3b :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment "Compute src1[3] * src2";
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 (Prims.int_zero + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (16)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        ((Prims.of_int (32)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        ((Prims.of_int (40)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        ((Prims.of_int (48)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
      Vale_X64_InsBasic.va_code_Adox64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        ((Prims.of_int (56)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Fast_multiply_a3b :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment "Compute src1[3] * src2")
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (2)))),
                              (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Space
                        (Prims.of_int (3)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Xor64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
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
                                                 (Prims.of_int (5)))),
                                             ((Prims.of_int (24)) +
                                                (offset * (Prims.of_int (16)))))),
                                         Vale_Arch_HeapTypes_s.Secret)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                       Prims.int_zero
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (5)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (8)))
                                       ((Prims.of_int (24)) +
                                          (offset * (Prims.of_int (16))))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (11)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (10)))
                                                (Vale_X64_Machine_s.OMem
                                                   ((Vale_X64_Machine_s.MReg
                                                       ((Vale_X64_Machine_s.Reg
                                                           (Prims.int_zero,
                                                             (Prims.of_int (2)))),
                                                         ((Prims.of_int (8))
                                                            +
                                                            (offset *
                                                               (Prims.of_int (8)))))),
                                                     Vale_Arch_HeapTypes_s.Secret)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Space
                                                   Prims.int_one)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (10)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (9))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Space
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (10)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                               Prims.int_zero
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (5)))
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (10)))
                                                               ((Prims.of_int (32))
                                                                  +
                                                                  (offset *
                                                                    (Prims.of_int (16))))
                                                               Vale_Arch_HeapTypes_s.Secret)
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
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (16))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    ((Prims.of_int (40))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (16))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8)))
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
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (2)))),
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    ((Prims.of_int (48))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (16))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (35)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    ((Prims.of_int (56))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (16))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ())))))))))))))))))))))))))))))))))))))))))))))
let (va_qcode_Fast_multiply_a3b :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Comment "Compute src1[3] * src2";
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         (Prims.int_zero + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
              Vale_X64_InsBasic.va_code_Xor64
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (5)))),
                         ((Prims.of_int (24)) +
                            (offset * (Prims.of_int (16)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                ((Prims.of_int (32)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg Prims.int_one)
                ((Prims.of_int (40)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Mem64_lemma ();
              Vale_X64_InsBasic.va_code_Mulx64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OMem
                   ((Vale_X64_Machine_s.MReg
                       ((Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (2)))),
                         ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                     Vale_Arch_HeapTypes_s.Secret));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg Prims.int_zero);
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                ((Prims.of_int (48)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
              Vale_X64_InsBasic.va_code_Adox64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_NoNewline ();
              Vale_X64_InsBasic.va_code_Adcx64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Space Prims.int_one;
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                ((Prims.of_int (56)) + (offset * (Prims.of_int (16))))
                Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('offset, 'dstub, 'inAub, 'inBub, 'vaus0,
  'vauk) va_wp_Fast_multiply_a3b = unit

let (va_quick_Fast_multiply_a3b :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_multiply_a3b offset),
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_multiply :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [va_code_Fast_multiply_a0b offset;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Newline ();
      va_code_Fast_multiply_a1b offset;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Newline ();
      va_code_Fast_multiply_a2b offset;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Newline ();
      va_code_Fast_multiply_a3b offset;
      Vale_X64_InsBasic.va_code_Newline ()]
let (va_codegen_success_Fast_multiply : Prims.nat -> Vale_X64_Decls.va_pbool)
  =
  fun offset ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Fast_multiply_a0b offset)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Newline ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Newline ())
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Fast_multiply_a1b offset)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Newline ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Newline ())
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Fast_multiply_a2b offset)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Newline ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Newline
                                 ())
                              (Vale_X64_Decls.va_pbool_and
                                 (va_codegen_success_Fast_multiply_a3b offset)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                       ()) (Vale_X64_Decls.va_ttrue ())))))))))))
let (va_qcode_Fast_multiply :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun dst_b ->
        fun inA_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [va_code_Fast_multiply_a0b offset;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_Newline ();
              va_code_Fast_multiply_a1b offset;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_Newline ();
              va_code_Fast_multiply_a2b offset;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_Newline ();
              va_code_Fast_multiply_a3b offset;
              Vale_X64_InsBasic.va_code_Newline ()] va_mods ()

type ('offset, 'dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_multiply =
  unit

let (va_quick_Fast_multiply :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fast_multiply offset),
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_mul_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_X64_InsStack.va_code_Push
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
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
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fast_multiply Prims.int_zero;
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
let (va_codegen_success_Fast_mul_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push
            (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push
               (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
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
                             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
                          (Vale_X64_Decls.va_ttrue ())))
                else
                  Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                    (Vale_X64_Decls.va_ttrue ()))
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Fast_multiply Prims.int_zero)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsStack.va_codegen_success_Pop
                        (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsStack.va_codegen_success_Pop
                           (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Fast_mul_stdcall :
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
              [Vale_X64_InsStack.va_code_Push
                 (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
              Vale_X64_InsStack.va_code_Push
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Push
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
              va_code_Fast_multiply Prims.int_zero;
              Vale_X64_InsStack.va_code_Pop
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Pop
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Pop
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))] va_mods ()

type ('win, 'dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_mul_stdcall =
  unit

let (va_quick_Fast_mul_stdcall :
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
            ((va_code_Fast_mul_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_mul2_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fast_multiply Prims.int_zero;
      va_code_Fast_multiply (Prims.of_int (4));
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))]
let (va_codegen_success_Fast_mul2_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push
            (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
         (Vale_X64_Decls.va_pbool_and
            (if win
             then
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsStack.va_codegen_success_Push
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
                             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
                          (Vale_X64_Decls.va_ttrue ()))))
             else
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                 (Vale_X64_Decls.va_ttrue ()))
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Fast_multiply Prims.int_zero)
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Fast_multiply (Prims.of_int (4)))
                  (Vale_X64_Decls.va_pbool_and
                     (if win
                      then
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Pop
                             (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                          (Vale_X64_Decls.va_ttrue ())
                      else Vale_X64_Decls.va_ttrue ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsStack.va_codegen_success_Pop
                           (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Fast_mul2_stdcall :
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
              [Vale_X64_InsStack.va_code_Push
                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Push
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Push
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
              va_code_Fast_multiply Prims.int_zero;
              va_code_Fast_multiply (Prims.of_int (4));
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                (Vale_X64_Machine_s.Block []);
              Vale_X64_InsStack.va_code_Pop
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Pop
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))] va_mods ()

type ('win, 'dstub, 'inAub, 'inBub, 'vaus0, 'vauk) va_wp_Fast_mul2_stdcall =
  unit

let (va_quick_Fast_mul2_stdcall :
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
            ((va_code_Fast_mul2_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())