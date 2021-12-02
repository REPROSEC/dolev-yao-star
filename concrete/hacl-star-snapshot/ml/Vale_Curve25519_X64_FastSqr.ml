open Prims
let (va_code_Fast_sqr_part1 :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.int_zero + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
      Vale_X64_InsBasic.va_code_Comment "f[0]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
      Vale_X64_InsBasic.va_code_Xor64
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Comment "f[1]*f[0]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Comment "f[2]*f[0]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Comment "f[3]*f[0]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (34));
      Vale_X64_InsBasic.va_code_Comment "f[3]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Comment "f[1]*f[3]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Comment "f[2]*f[3]";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (9));
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_Comment "f1";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
             Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (4));
      Vale_X64_InsBasic.va_code_Comment "f[2]*f[1]"]
let (va_codegen_success_Fast_sqr_part1 :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Prims.int_zero + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Space (Prims.of_int (35)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Comment "f[0]")
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mulx64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                           (Vale_X64_Machine_s.OMem
                              ((Vale_X64_Machine_s.MReg
                                  ((Vale_X64_Machine_s.Reg
                                      (Prims.int_zero, (Prims.of_int (4)))),
                                    ((Prims.of_int (8)) +
                                       (offset * (Prims.of_int (8)))))),
                                Vale_Arch_HeapTypes_s.Secret)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Space
                              (Prims.of_int (2)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Xor64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Space
                                    Prims.int_one)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                       "f[1]*f[0]")
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (10)))
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (9)))
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
                                                (Vale_X64_InsBasic.va_codegen_success_Space
                                                   Prims.int_one)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (9)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (14))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Space
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Comment
                                                            "f[2]*f[0]")
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                                  ())
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[3]*f[0]")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (34)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[3]")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (4)))),
                                                                    ((Prims.of_int (8))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8)))))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[1]*f[3]")
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
                                                                    Prims.int_zero)
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[2]*f[3]")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    ((Prims.of_int (8))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (9)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (15))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f1")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (4)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[2]*f[1]")
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))))))))))))))))
let (va_qcode_Fast_sqr_part1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun offset ->
      fun inA_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Prims.int_zero + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (35));
          Vale_X64_InsBasic.va_code_Comment "f[0]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
          Vale_X64_InsBasic.va_code_Xor64
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsBasic.va_code_Space Prims.int_one;
          Vale_X64_InsBasic.va_code_Comment "f[1]*f[0]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Space Prims.int_one;
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
          Vale_X64_InsBasic.va_code_Space Prims.int_one;
          Vale_X64_InsBasic.va_code_Comment "f[2]*f[0]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (24)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsBasic.va_code_Comment "f[3]*f[0]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (34));
          Vale_X64_InsBasic.va_code_Comment "f[3]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (8)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_Space Prims.int_one;
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Comment "f[1]*f[3]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsBasic.va_code_Comment "f[2]*f[3]";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (9));
          Vale_X64_InsBasic.va_code_Adcx64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsBasic.va_code_Comment "f1";
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mulx64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     ((Prims.of_int (16)) + (offset * (Prims.of_int (8)))))),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsBasic.va_code_NoNewline ();
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
            (Vale_X64_Machine_s.OConst Prims.int_zero);
          Vale_X64_InsBasic.va_code_Space (Prims.of_int (4));
          Vale_X64_InsBasic.va_code_Comment "f[2]*f[1]"] va_mods ()

type ('offset, 'inAub, 'vaus0, 'vauk) va_wp_Fast_sqr_part1 = unit

let (va_quick_Fast_sqr_part1 :
  Prims.nat ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun inA_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Fast_sqr_part1 offset),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (),
          ())

let (va_code_Fast_sqr_part2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_Bignum_X64.va_code_Adox_64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))]
let (va_codegen_success_Fast_sqr_part2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_Bignum_X64.va_codegen_success_Adox_64
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
            (Vale_X64_Machine_s.OReg Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_Bignum_X64.va_codegen_success_Adcx_64
               (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_Bignum_X64.va_codegen_success_Adox_64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_Bignum_X64.va_codegen_success_Adcx_64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_Bignum_X64.va_codegen_success_Adox_64
                        (Vale_X64_Machine_s.OReg Prims.int_one)
                        (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_Bignum_X64.va_codegen_success_Adcx_64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_Bignum_X64.va_codegen_success_Adox_64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_Bignum_X64.va_codegen_success_Adcx_64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_Bignum_X64.va_codegen_success_Adox_64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (15))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_Bignum_X64.va_codegen_success_Adcx_64
                                       (Vale_X64_Machine_s.OReg Prims.int_one)
                                       (Vale_X64_Machine_s.OReg Prims.int_one))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_Bignum_X64.va_codegen_success_Adcx_64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (13)))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (13))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_Bignum_X64.va_codegen_success_Adcx_64
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (14)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (14))))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
let (va_qcode_Fast_sqr_part2 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Xor64
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_Bignum_X64.va_code_Adox_64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_Bignum_X64.va_code_Adox_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_Bignum_X64.va_code_Adcx_64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_Bignum_X64.va_code_Adcx_64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Fast_sqr_part2 = unit

let (va_quick_Fast_sqr_part2 :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Fast_sqr_part2 ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))))], (),
        ())
let (va_code_Fast_sqr_part3 :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.int_zero + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Comment "f[0]^2";
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (27));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Prims.int_zero + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Comment "f[1]^2";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Comment "f[2]^2";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        ((Prims.of_int (32)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one)
        ((Prims.of_int (40)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Mulx64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Comment "f[3]^2";
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        ((Prims.of_int (48)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_NoNewline ();
      Vale_X64_InsBasic.va_code_Adcx64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Space Prims.int_one;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        ((Prims.of_int (56)) + (offset * (Prims.of_int (16))))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Newline ()]
let (va_codegen_success_Fast_sqr_part3 :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_NoNewline ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Prims.int_zero + (offset * (Prims.of_int (8))))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Space Prims.int_one)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mulx64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Comment "f[0]^2")
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Space
                        (Prims.of_int (27)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Prims.int_zero + (offset * (Prims.of_int (16))))
                           Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Newline ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                 ())
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (8)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (2))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                       (Prims.of_int (3)))
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
                                          (Vale_X64_InsBasic.va_codegen_success_Newline
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                ())
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                   Prims.int_zero
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (3)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (4)))
                                                   ((Prims.of_int (8)) +
                                                      (offset *
                                                         (Prims.of_int (8))))
                                                   Vale_Arch_HeapTypes_s.Secret)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Space
                                                      Prims.int_one)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (2)))
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_zero)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (3))))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Comment
                                                            "f[1]^2")
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                               ())
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                  (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    (Prims.of_int (2)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    ((Prims.of_int (16))
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
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
                                                                    ((Prims.of_int (24))
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
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    ((Prims.of_int (16))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[2]^2")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11)))
                                                                    ((Prims.of_int (32))
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    ((Prims.of_int (24))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (8))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mulx64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Comment
                                                                    "f[3]^2")
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_NoNewline
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    ((Prims.of_int (48))
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
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Space
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    ((Prims.of_int (56))
                                                                    +
                                                                    (offset *
                                                                    (Prims.of_int (16))))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                                                    ())
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
let (va_qcode_Fast_sqr_part3 :
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
            [Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.int_zero + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsBasic.va_code_Mulx64
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Comment "f[0]^2";
            Vale_X64_InsBasic.va_code_Space (Prims.of_int (27));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Prims.int_zero + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Add64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsBasic.va_code_Space (Prims.of_int (3));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              ((Prims.of_int (8)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              ((Prims.of_int (8)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsBasic.va_code_Mulx64
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Comment "f[1]^2";
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsBasic.va_code_Space (Prims.of_int (2));
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
              ((Prims.of_int (16)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
              ((Prims.of_int (24)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              ((Prims.of_int (16)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Mulx64
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Comment "f[2]^2";
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
              ((Prims.of_int (32)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg Prims.int_one)
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg Prims.int_one)
              ((Prims.of_int (40)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              ((Prims.of_int (24)) + (offset * (Prims.of_int (8))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Mulx64
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Comment "f[3]^2";
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
              ((Prims.of_int (48)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_NoNewline ();
            Vale_X64_InsBasic.va_code_Adcx64Wrap
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsBasic.va_code_Space Prims.int_one;
            Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
              ((Prims.of_int (56)) + (offset * (Prims.of_int (16))))
              Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Newline ()] va_mods ()

type ('offset, 'dstub, 'inAub, 'vaus0, 'vauk) va_wp_Fast_sqr_part3 = unit

let (va_quick_Fast_sqr_part3 :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_sqr_part3 offset),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_sqr :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun offset ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Comment
         "Step 1: Compute all partial products";
      va_code_Fast_sqr_part1 offset;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 2: Compute two parallel carry chains";
      va_code_Fast_sqr_part2 ();
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment
        "Step 3: Compute intermediate squares";
      va_code_Fast_sqr_part3 offset]
let (va_codegen_success_Fast_sqr : Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun offset ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Comment
         "Step 1: Compute all partial products")
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fast_sqr_part1 offset)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Newline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Comment
                  "Step 2: Compute two parallel carry chains")
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Fast_sqr_part2 ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Newline ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Comment
                           "Step 3: Compute intermediate squares")
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_Fast_sqr_part3 offset)
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Fast_sqr :
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
               "Step 1: Compute all partial products";
            va_code_Fast_sqr_part1 offset;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment
              "Step 2: Compute two parallel carry chains";
            va_code_Fast_sqr_part2 ();
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment
              "Step 3: Compute intermediate squares";
            va_code_Fast_sqr_part3 offset] va_mods ()

type ('offset, 'dstub, 'inAub, 'vaus0, 'vauk) va_wp_Fast_sqr = unit

let (va_quick_Fast_sqr :
  Prims.nat ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun offset ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_sqr offset),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
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
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fast_sqr_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Push
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
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
      else Vale_X64_Machine_s.Block [];
      va_code_Fast_sqr Prims.int_zero;
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_X64_InsStack.va_code_Pop (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
let (va_codegen_success_Fast_sqr_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push
            (Vale_X64_Machine_s.OReg Prims.int_one))
         (Vale_X64_Decls.va_pbool_and
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
                             (Vale_X64_Decls.va_ttrue ()))
                      else Vale_X64_Decls.va_ttrue ())
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Fast_sqr Prims.int_zero)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop
                              (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (4))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsStack.va_codegen_success_Pop
                                       (Vale_X64_Machine_s.OReg Prims.int_one))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsStack.va_codegen_success_Pop
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (15))))
                                       (Vale_X64_Decls.va_ttrue ()))))))))))))
let (va_qcode_Fast_sqr_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst_b ->
        fun inA_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsStack.va_code_Push
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
            Vale_X64_InsStack.va_code_Push
              (Vale_X64_Machine_s.OReg Prims.int_one);
            Vale_X64_InsStack.va_code_Push
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
                   (Vale_X64_Machine_s.OReg (Prims.of_int (3)))])
              (Vale_X64_Machine_s.Block []);
            va_code_Fast_sqr Prims.int_zero;
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg Prims.int_one);
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (15)))] va_mods ()

type ('win, 'dstub, 'inAub, 'vaus0, 'vauk) va_wp_Fast_sqr_stdcall = unit

let (va_quick_Fast_sqr_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fast_sqr_stdcall win),
            [Vale_X64_QuickCode.Mod_stackTaint;
            Vale_X64_QuickCode.Mod_stack;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
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
let (va_code_Sqr2_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push (Vale_X64_Machine_s.OReg Prims.int_one);
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
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
      else Vale_X64_Machine_s.Block [];
      va_code_Fast_sqr Prims.int_zero;
      va_code_Fast_sqr (Prims.of_int (4));
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
let (va_codegen_success_Sqr2_stdcall : Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push
         (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push
            (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push
               (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsStack.va_codegen_success_Push
                  (Vale_X64_Machine_s.OReg Prims.int_one))
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
                             (Vale_X64_Decls.va_ttrue ())))
                   else Vale_X64_Decls.va_ttrue ())
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Fast_sqr Prims.int_zero)
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Fast_sqr (Prims.of_int (4)))
                        (Vale_X64_Decls.va_pbool_and
                           (if win
                            then
                              Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4))))
                                (Vale_X64_Decls.va_ttrue ())
                            else Vale_X64_Decls.va_ttrue ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop
                                 (Vale_X64_Machine_s.OReg Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsStack.va_codegen_success_Pop
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsStack.va_codegen_success_Pop
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (15))))
                                       (Vale_X64_Decls.va_ttrue ()))))))))))))
let (va_qcode_Sqr2_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst_b ->
        fun inA_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsStack.va_code_Push
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
            Vale_X64_InsStack.va_code_Push
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
            Vale_X64_InsStack.va_code_Push
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
            Vale_X64_InsStack.va_code_Push
              (Vale_X64_Machine_s.OReg Prims.int_one);
            Vale_X64_QuickCodes.if_code win
              (Vale_X64_Machine_s.Block
                 [Vale_X64_InsStack.va_code_Push
                    (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                 Vale_X64_InsBasic.va_code_Mov64
                   (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                 Vale_X64_InsBasic.va_code_Mov64
                   (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (3)))])
              (Vale_X64_Machine_s.Block []);
            va_code_Fast_sqr Prims.int_zero;
            va_code_Fast_sqr (Prims.of_int (4));
            Vale_X64_QuickCodes.if_code win
              (Vale_X64_Machine_s.Block
                 [Vale_X64_InsStack.va_code_Pop
                    (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
              (Vale_X64_Machine_s.Block []);
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg Prims.int_one);
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
            Vale_X64_InsStack.va_code_Pop
              (Vale_X64_Machine_s.OReg (Prims.of_int (15)))] va_mods ()

type ('win, 'dstub, 'inAub, 'vaus0, 'vauk) va_wp_Sqr2_stdcall = unit

let (va_quick_Sqr2_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst_b ->
      fun inA_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Sqr2_stdcall win),
            [Vale_X64_QuickCode.Mod_stackTaint;
            Vale_X64_QuickCode.Mod_stack;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
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