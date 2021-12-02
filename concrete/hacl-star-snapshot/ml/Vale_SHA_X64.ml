open Prims
let (va_code_Preamble :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_one
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_zero
         Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_InitPshufbStableMask (Prims.of_int (7))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_one
        (Prims.of_int (27));
      Vale_X64_InsVector.va_code_Pshufd Prims.int_one Prims.int_one
        (Prims.of_int (177));
      Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2)) (Prims.of_int (2))
        (Prims.of_int (27));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (8)) (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Palignr8 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Shufpd (Prims.of_int (2)) Prims.int_zero
        Prims.int_zero]
let (va_codegen_success_Preamble : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
         Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
            (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_InitPshufbStableMask
               (Prims.of_int (7)) (Vale_X64_Machine_s.OReg Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Pshufd Prims.int_zero
                  Prims.int_one (Prims.of_int (27)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pshufd Prims.int_one
                     Prims.int_one (Prims.of_int (177)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Pshufd
                        (Prims.of_int (2)) (Prims.of_int (2))
                        (Prims.of_int (27)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Mov128
                           (Prims.of_int (8)) (Prims.of_int (7)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Palignr8
                              Prims.int_one (Prims.of_int (2)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Shufpd
                                 (Prims.of_int (2)) Prims.int_zero
                                 Prims.int_zero) (Vale_X64_Decls.va_ttrue ())))))))))
let (va_qcode_Preamble :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ctx_b ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
           Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
           Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
          (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
          (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsVector.va_code_InitPshufbStableMask (Prims.of_int (7))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_one
          (Prims.of_int (27));
        Vale_X64_InsVector.va_code_Pshufd Prims.int_one Prims.int_one
          (Prims.of_int (177));
        Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
          (Prims.of_int (2)) (Prims.of_int (27));
        Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (8))
          (Prims.of_int (7));
        Vale_X64_InsVector.va_code_Palignr8 Prims.int_one (Prims.of_int (2));
        Vale_X64_InsVector.va_code_Shufpd (Prims.of_int (2)) Prims.int_zero
          Prims.int_zero] va_mods ()

type ('ctxub, 'vaus0, 'vauk) va_wp_Preamble = unit

let (va_quick_Preamble :
  Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun ctx_b ->
    Vale_X64_QuickCode.QProc
      ((va_code_Preamble ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Loop_rounds_0_15 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (3))
        (Prims.of_int (7));
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (3));
      Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (4))
        (Prims.of_int (7));
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (10))
        (Prims.of_int (2));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (9)) Prims.int_one;
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (4));
      Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (5))
        (Prims.of_int (7));
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (64)));
      Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (3))
        (Prims.of_int (4));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (5));
      Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (6))
        (Prims.of_int (7));
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
        (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Paddd (Prims.of_int (3)) (Prims.of_int (7));
      Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (4))
        (Prims.of_int (5));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (48))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (6));
      Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (3))
        (Prims.of_int (6));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
        (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Paddd (Prims.of_int (4)) (Prims.of_int (7));
      Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (5))
        (Prims.of_int (6));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2))]
let (va_codegen_success_Loop_rounds_0_15 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
         Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
            (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Load128_buffer
               Prims.int_zero (Prims.of_int (5))
               (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
               (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_PshufbStable
                  (Prims.of_int (3)) (Prims.of_int (7)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                     Prims.int_zero (Prims.of_int (6))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                        Prims.int_zero Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Paddd
                           Prims.int_zero (Prims.of_int (3)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_PshufbStable
                              (Prims.of_int (4)) (Prims.of_int (7)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Mov128
                                 (Prims.of_int (10)) (Prims.of_int (2)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                    (Prims.of_int (2)) Prims.int_one)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Pshufd
                                       Prims.int_zero Prims.int_zero
                                       (Prims.of_int (14)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Mov128
                                          (Prims.of_int (9)) Prims.int_one)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                             Prims.int_one (Prims.of_int (2)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                Prims.int_zero Prims.int_zero
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (2)))
                                                (Prims.of_int (16))
                                                Vale_Arch_HeapTypes_s.Secret)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsVector.va_codegen_success_Paddd
                                                   Prims.int_zero
                                                   (Prims.of_int (4)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_PshufbStable
                                                      (Prims.of_int (5))
                                                      (Prims.of_int (7)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                         (Prims.of_int (2))
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Pshufd
                                                            Prims.int_zero
                                                            Prims.int_zero
                                                            (Prims.of_int (14)))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Add64
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (4)))
                                                               (Vale_X64_Machine_s.OConst
                                                                  (Prims.of_int (64))))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsSha.va_codegen_success_SHA256_msg1
                                                                  (Prims.of_int (3))
                                                                  (Prims.of_int (4)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    Prims.int_one
                                                                    (Prims.of_int (2)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_PshufbStable
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (7)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    (Prims.of_int (2))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Pshufd
                                                                    Prims.int_zero
                                                                    Prims.int_zero
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Palignr4
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    (Prims.of_int (3))
                                                                    (Prims.of_int (7)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_msg1
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    Prims.int_one
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    Prims.int_zero
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_msg2
                                                                    (Prims.of_int (3))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    (Prims.of_int (2))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Pshufd
                                                                    Prims.int_zero
                                                                    Prims.int_zero
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Palignr4
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (7)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_msg1
                                                                    (Prims.of_int (5))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    Prims.int_one
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ())))))))))))))))))))))))))))))))))))))))))
let (va_qcode_Loop_rounds_0_15 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun in_b ->
      fun k_b ->
        fun offset ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (3))
              (Prims.of_int (7));
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Paddd Prims.int_zero
              (Prims.of_int (3));
            Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (4))
              (Prims.of_int (7));
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (10))
              (Prims.of_int (2));
            Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
              Prims.int_one;
            Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
              (Prims.of_int (14));
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (9))
              Prims.int_one;
            Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
              (Prims.of_int (2));
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Paddd Prims.int_zero
              (Prims.of_int (4));
            Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (5))
              (Prims.of_int (7));
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
              Prims.int_one;
            Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
              (Prims.of_int (14));
            Vale_X64_InsBasic.va_code_Add64
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Vale_X64_Machine_s.OConst (Prims.of_int (64)));
            Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (3))
              (Prims.of_int (4));
            Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
              (Prims.of_int (2));
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Paddd Prims.int_zero
              (Prims.of_int (5));
            Vale_X64_InsVector.va_code_PshufbStable (Prims.of_int (6))
              (Prims.of_int (7));
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
              Prims.int_one;
            Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
              (Prims.of_int (14));
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
              (Prims.of_int (6));
            Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
              (Prims.of_int (5));
            Vale_X64_InsVector.va_code_Paddd (Prims.of_int (3))
              (Prims.of_int (7));
            Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (4))
              (Prims.of_int (5));
            Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
              (Prims.of_int (2));
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_Machine_s.Block [];
            Vale_X64_InsVector.va_code_Paddd Prims.int_zero
              (Prims.of_int (6));
            Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (3))
              (Prims.of_int (6));
            Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
              Prims.int_one;
            Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
              (Prims.of_int (14));
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
              (Prims.of_int (3));
            Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
              (Prims.of_int (6));
            Vale_X64_InsVector.va_code_Paddd (Prims.of_int (4))
              (Prims.of_int (7));
            Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (5))
              (Prims.of_int (6));
            Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
              (Prims.of_int (2))] va_mods ()

type ('inub, 'kub, 'offset, 'vaus0, 'vauk) va_wp_Loop_rounds_0_15 = unit

let (va_quick_Loop_rounds_0_15 :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun in_b ->
    fun k_b ->
      fun offset ->
        Vale_X64_QuickCode.QProc
          ((va_code_Loop_rounds_0_15 ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))))],
            (), ())
let (va_code_Loop_rounds_16_51_body :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun i ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         ((Prims.of_int (16)) * i) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (4))
        (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
        (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Paddd (Prims.of_int (5)) (Prims.of_int (7));
      Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (6))
        (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2))]
let (va_codegen_success_Loop_rounds_16_51_body :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun i ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         ((Prims.of_int (16)) * i) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Paddd Prims.int_zero
            (Prims.of_int (3)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsSha.va_codegen_success_SHA256_msg2
               (Prims.of_int (4)) (Prims.of_int (3)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                  (Prims.of_int (2)) Prims.int_one)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pshufd
                     Prims.int_zero Prims.int_zero (Prims.of_int (14)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mov128
                        (Prims.of_int (7)) (Prims.of_int (4)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Palignr4
                           (Prims.of_int (7)) (Prims.of_int (3)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Paddd
                              (Prims.of_int (5)) (Prims.of_int (7)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsSha.va_codegen_success_SHA256_msg1
                                 (Prims.of_int (6)) (Prims.of_int (3)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                    Prims.int_one (Prims.of_int (2)))
                                 (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_Loop_rounds_16_51_body :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer128 ->
        Vale_SHA_SHA_helpers.block_w ->
          Vale_SHA_SHA_helpers.hash256 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun i ->
      fun k_b ->
        fun block ->
          fun hash_orig ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                 Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                 ((Prims.of_int (16)) * i) Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_Machine_s.Block [];
              Vale_X64_InsVector.va_code_Paddd Prims.int_zero
                (Prims.of_int (3));
              Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (4))
                (Prims.of_int (3));
              Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
                Prims.int_one;
              Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
                (Prims.of_int (14));
              Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
                (Prims.of_int (3));
              Vale_X64_InsVector.va_code_Paddd (Prims.of_int (5))
                (Prims.of_int (7));
              Vale_X64_InsSha.va_code_SHA256_msg1 (Prims.of_int (6))
                (Prims.of_int (3));
              Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
                (Prims.of_int (2))] va_mods ()

type ('i, 'kub, 'block, 'hashuorig, 'vaus0,
  'vauk) va_wp_Loop_rounds_16_51_body = unit

let (va_quick_Loop_rounds_16_51_body :
  Prims.nat ->
    Vale_X64_Memory.buffer128 ->
      Vale_SHA_SHA_helpers.block_w ->
        Vale_SHA_SHA_helpers.hash256 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun i ->
    fun k_b ->
      fun block ->
        fun hash_orig ->
          Vale_X64_QuickCode.QProc
            ((va_code_Loop_rounds_16_51_body i),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))],
              (), ())
let (va_code_Msg_shift :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
         (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Mov128 Prims.int_zero (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_zero]
let (va_codegen_success_Msg_shift : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (7))
         (Prims.of_int (3)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_zero
            (Prims.of_int (6)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (3))
               (Prims.of_int (4)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Mov128
                  (Prims.of_int (4)) (Prims.of_int (5)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Mov128
                     (Prims.of_int (6)) (Prims.of_int (7)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mov128
                        (Prims.of_int (5)) Prims.int_zero)
                     (Vale_X64_Decls.va_ttrue ()))))))
let (va_qcode_Msg_shift :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
         (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Mov128 Prims.int_zero (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_zero]
      va_mods ()

type ('vaus0, 'vauk) va_wp_Msg_shift = unit

let (va_quick_Msg_shift : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Msg_shift ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))))], (),
        ())
let rec (va_code_Loop_rounds_16_51_recursive :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun i ->
    Vale_X64_Machine_s.Block
      [if i > (Prims.of_int (4))
       then
         Vale_X64_Machine_s.Block
           [va_code_Loop_rounds_16_51_recursive (i - Prims.int_one)]
       else Vale_X64_Machine_s.Block [];
      va_code_Loop_rounds_16_51_body i;
      va_code_Msg_shift ()]
let rec (va_codegen_success_Loop_rounds_16_51_recursive :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun i ->
    Vale_X64_Decls.va_pbool_and
      (if i > (Prims.of_int (4))
       then
         Vale_X64_Decls.va_pbool_and
           (va_codegen_success_Loop_rounds_16_51_recursive
              (i - Prims.int_one)) (Vale_X64_Decls.va_ttrue ())
       else Vale_X64_Decls.va_ttrue ())
      (Vale_X64_Decls.va_pbool_and
         (va_codegen_success_Loop_rounds_16_51_body i)
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Msg_shift ())
            (Vale_X64_Decls.va_ttrue ())))

let (va_code_Loop_rounds_16_51 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_Loop_rounds_16_51_recursive (Prims.of_int (12))]
let (va_codegen_success_Loop_rounds_16_51 : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (va_codegen_success_Loop_rounds_16_51_recursive (Prims.of_int (12)))
      (Vale_X64_Decls.va_ttrue ())

type ('kub, 'block, 'hashuorig, 'vaus0, 'vauk) va_wp_Loop_rounds_16_51 = unit

let (va_quick_Loop_rounds_16_51 :
  Vale_X64_Memory.buffer128 ->
    Vale_SHA_SHA_helpers.block_w ->
      Vale_SHA_SHA_helpers.hash256 ->
        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun k_b ->
    fun block ->
      fun hash_orig ->
        Vale_X64_QuickCode.QProc
          ((va_code_Loop_rounds_16_51 ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))], (),
            ())
let (va_code_Loop_rounds_52_64 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Prims.of_int (208)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (4))
        (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
        (Prims.of_int (3));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Paddd (Prims.of_int (5)) (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (224))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (4));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (5))
        (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (8));
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (240))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (5));
      Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
        (Prims.of_int (14));
      Vale_X64_InsBasic.va_code_Sub64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Paddd (Prims.of_int (2)) (Prims.of_int (10));
      Vale_X64_InsVector.va_code_Paddd Prims.int_one (Prims.of_int (9))]
let (va_codegen_success_Loop_rounds_52_64 : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Prims.of_int (208)) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Paddd Prims.int_zero
            (Prims.of_int (3)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsSha.va_codegen_success_SHA256_msg2
               (Prims.of_int (4)) (Prims.of_int (3)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                  (Prims.of_int (2)) Prims.int_one)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pshufd
                     Prims.int_zero Prims.int_zero (Prims.of_int (14)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mov128
                        (Prims.of_int (7)) (Prims.of_int (4)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Palignr4
                           (Prims.of_int (7)) (Prims.of_int (3)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                              Prims.int_one (Prims.of_int (2)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Paddd
                                 (Prims.of_int (5)) (Prims.of_int (7)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                    Prims.int_zero Prims.int_zero
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (2)))
                                    (Prims.of_int (224))
                                    Vale_Arch_HeapTypes_s.Secret)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                       Prims.int_zero (Prims.of_int (4)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                          (Prims.of_int (2)) Prims.int_one)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsVector.va_codegen_success_Pshufd
                                             Prims.int_zero Prims.int_zero
                                             (Prims.of_int (14)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsSha.va_codegen_success_SHA256_msg2
                                                (Prims.of_int (5))
                                                (Prims.of_int (4)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsVector.va_codegen_success_Mov128
                                                   (Prims.of_int (7))
                                                   (Prims.of_int (8)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                      Prims.int_one
                                                      (Prims.of_int (2)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                         Prims.int_zero
                                                         Prims.int_zero
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (2)))
                                                         (Prims.of_int (240))
                                                         Vale_Arch_HeapTypes_s.Secret)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Paddd
                                                            Prims.int_zero
                                                            (Prims.of_int (5)))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                               (Prims.of_int (2))
                                                               Prims.int_one)
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsVector.va_codegen_success_Pshufd
                                                                  Prims.int_zero
                                                                  Prims.int_zero
                                                                  (Prims.of_int (14)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Sub64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_one))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsSha.va_codegen_success_SHA256_rnds2
                                                                    Prims.int_one
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (10)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Paddd
                                                                    Prims.int_one
                                                                    (Prims.of_int (9)))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))
let (va_qcode_Loop_rounds_52_64 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_SHA_SHA_helpers.block_w ->
        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun k_b ->
      fun block ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Prims.of_int (208)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_Machine_s.Block [];
          Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (3));
          Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (4))
            (Prims.of_int (3));
          Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
            Prims.int_one;
          Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
            (Prims.of_int (14));
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
            (Prims.of_int (4));
          Vale_X64_InsVector.va_code_Palignr4 (Prims.of_int (7))
            (Prims.of_int (3));
          Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
            (Prims.of_int (2));
          Vale_X64_InsVector.va_code_Paddd (Prims.of_int (5))
            (Prims.of_int (7));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (224)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_Machine_s.Block [];
          Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (4));
          Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
            Prims.int_one;
          Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
            (Prims.of_int (14));
          Vale_X64_InsSha.va_code_SHA256_msg2 (Prims.of_int (5))
            (Prims.of_int (4));
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
            (Prims.of_int (8));
          Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
            (Prims.of_int (2));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (240)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_Machine_s.Block [];
          Vale_X64_InsVector.va_code_Paddd Prims.int_zero (Prims.of_int (5));
          Vale_X64_InsSha.va_code_SHA256_rnds2 (Prims.of_int (2))
            Prims.int_one;
          Vale_X64_InsVector.va_code_Pshufd Prims.int_zero Prims.int_zero
            (Prims.of_int (14));
          Vale_X64_InsBasic.va_code_Sub64
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OConst Prims.int_one);
          Vale_X64_InsSha.va_code_SHA256_rnds2 Prims.int_one
            (Prims.of_int (2));
          Vale_X64_InsVector.va_code_Paddd (Prims.of_int (2))
            (Prims.of_int (10));
          Vale_X64_InsVector.va_code_Paddd Prims.int_one (Prims.of_int (9))]
          va_mods ()

type ('kub, 'block, 'vaus0, 'vauk) va_wp_Loop_rounds_52_64 = unit

let (va_quick_Loop_rounds_52_64 :
  Vale_X64_Memory.buffer128 ->
    Vale_SHA_SHA_helpers.block_w -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun k_b ->
    fun block ->
      Vale_X64_QuickCode.QProc
        ((va_code_Loop_rounds_52_64 ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))))],
          (), ())
let (va_code_Loop_rounds :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.Block [];
      va_code_Loop_rounds_0_15 ();
      va_code_Loop_rounds_16_51 ();
      va_code_Loop_rounds_52_64 ()]
let (va_codegen_success_Loop_rounds : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop_rounds_0_15 ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop_rounds_16_51 ())
         (Vale_X64_Decls.va_pbool_and
            (va_codegen_success_Loop_rounds_52_64 ())
            (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_Loop_rounds :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Prims.nat ->
          Vale_SHA_SHA_helpers.hash256 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun in_b ->
      fun k_b ->
        fun offset ->
          fun hash_orig ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_Machine_s.Block [];
              va_code_Loop_rounds_0_15 ();
              va_code_Loop_rounds_16_51 ();
              va_code_Loop_rounds_52_64 ()] va_mods ()

type ('inub, 'kub, 'offset, 'hashuorig, 'vaus0, 'vauk) va_wp_Loop_rounds =
  unit

let (va_quick_Loop_rounds :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Prims.nat ->
        Vale_SHA_SHA_helpers.hash256 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun in_b ->
    fun k_b ->
      fun offset ->
        fun hash_orig ->
          Vale_X64_QuickCode.QProc
            ((va_code_Loop_rounds ()),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))))],
              (), ())
let (va_code_Loop_body0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block [va_code_Loop_rounds ()]
let (va_codegen_success_Loop_body0 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop_rounds ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Loop_body0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_SHA_SHA_helpers.hash256 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_hash_orig ->
        fun va_in_in_b ->
          fun va_in_k_b ->
            fun va_in_count ->
              Vale_X64_QuickCodes.qblock [va_code_Loop_rounds ()] va_mods ()

type ('vauold, 'vauinuhashuorig, 'vauinuinub, 'vauinukub, 'vauinucount,
  'vaus0, 'vauk) va_wp_Loop_body0 = unit

let (va_quick_Loop_body0 :
  Vale_X64_State.vale_state ->
    Vale_SHA_SHA_helpers.hash256 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_hash_orig ->
      fun va_in_in_b ->
        fun va_in_k_b ->
          fun va_in_count ->
            Vale_X64_QuickCode.QProc
              ((va_code_Loop_body0 ()),
                [Vale_X64_QuickCode.Mod_reg
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_one, (Prims.of_int (9))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (10))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_ok;
                Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Loop_while0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.While
         ((Vale_X64_Decls.va_cmp_gt
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
             (Vale_X64_Machine_s.OConst Prims.int_zero)),
           (Vale_X64_Machine_s.Block [va_code_Loop_body0 ()]))]
let (va_codegen_success_Loop_while0 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop_body0 ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Loop_while0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_SHA_SHA_helpers.hash256 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_hash_orig ->
        fun va_in_in_b ->
          fun va_in_k_b ->
            fun va_in_count ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_Machine_s.While
                   ((Vale_X64_QuickCodes.cmp_to_ocmp
                       (Vale_X64_QuickCodes.Cmp_gt
                          ((Vale_X64_Machine_s.OReg (Prims.of_int (3))),
                            (Vale_X64_Machine_s.OConst Prims.int_zero)))),
                     (Vale_X64_Machine_s.Block [va_code_Loop_body0 ()]))]
                va_mods ()

type ('vauold, 'vauinuhashuorig, 'vauinuinub, 'vauinukub, 'vauinucount,
  'vaus0, 'vauk) va_wp_Loop_while0 = unit

let (va_quick_Loop_while0 :
  Vale_X64_State.vale_state ->
    Vale_SHA_SHA_helpers.hash256 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_hash_orig ->
      fun va_in_in_b ->
        fun va_in_k_b ->
          fun va_in_count ->
            Vale_X64_QuickCode.QProc
              ((va_code_Loop_while0 ()),
                [Vale_X64_QuickCode.Mod_reg
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_one, (Prims.of_int (9))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (10))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_ok;
                Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Loop :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block [va_code_Loop_while0 ()]
let (va_codegen_success_Loop : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop_while0 ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Loop :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun in_b ->
      fun k_b ->
        Vale_X64_QuickCodes.qblock [va_code_Loop_while0 ()] va_mods ()

type ('inub, 'kub, 'vaus0, 'vauk) va_wp_Loop = unit

let (va_quick_Loop :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun in_b ->
    fun k_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Loop ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))))],
          (), ())
let (va_code_Epilogue :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
         (Prims.of_int (2)) (Prims.of_int (177));
      Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (7)) Prims.int_one
        (Prims.of_int (27));
      Vale_X64_InsVector.va_code_Pshufd Prims.int_one Prims.int_one
        (Prims.of_int (177));
      Vale_X64_InsVector.va_code_Shufpd Prims.int_one (Prims.of_int (2))
        (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Palignr8 (Prims.of_int (2))
        (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_one
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (2))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Epilogue : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pshufd (Prims.of_int (2))
         (Prims.of_int (2)) (Prims.of_int (177)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Pshufd (Prims.of_int (7))
            Prims.int_one (Prims.of_int (27)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Pshufd Prims.int_one
               Prims.int_one (Prims.of_int (177)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Shufpd Prims.int_one
                  (Prims.of_int (2)) (Prims.of_int (3)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Palignr8
                     (Prims.of_int (2)) (Prims.of_int (7)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                        Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                        Prims.int_one Prims.int_zero
                        Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                           Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Prims.of_int (2)) (Prims.of_int (16))
                           Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_Epilogue :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ctx_b ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
           (Prims.of_int (2)) (Prims.of_int (177));
        Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (7)) Prims.int_one
          (Prims.of_int (27));
        Vale_X64_InsVector.va_code_Pshufd Prims.int_one Prims.int_one
          (Prims.of_int (177));
        Vale_X64_InsVector.va_code_Shufpd Prims.int_one (Prims.of_int (2))
          (Prims.of_int (3));
        Vale_X64_InsVector.va_code_Palignr8 (Prims.of_int (2))
          (Prims.of_int (7));
        Vale_X64_InsVector.va_code_Store128_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_one
          Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
        Vale_X64_InsVector.va_code_Store128_buffer Prims.int_zero
          (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (2))
          (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('ctxub, 'vaus0, 'vauk) va_wp_Epilogue = unit

let (va_quick_Epilogue :
  Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun ctx_b ->
    Vale_X64_QuickCode.QProc
      ((va_code_Epilogue ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
        Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Sha_update :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_Preamble (); va_code_Loop (); va_code_Epilogue ()]
let (va_codegen_success_Sha_update : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Preamble ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop ())
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Epilogue ())
            (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_Sha_update :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ctx_b ->
      fun in_b ->
        fun k_b ->
          Vale_X64_QuickCodes.qblock
            [va_code_Preamble (); va_code_Loop (); va_code_Epilogue ()]
            va_mods ()

type ('ctxub, 'inub, 'kub, 'vaus0, 'vauk) va_wp_Sha_update = unit

let (va_quick_Sha_update :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun ctx_b ->
    fun in_b ->
      fun k_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Sha_update ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Sha_update_bytes :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_Sha_update (); Vale_X64_Machine_s.Block []]
let (va_codegen_success_Sha_update_bytes : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Sha_update ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Sha_update_bytes :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ctx_b ->
      fun in_b ->
        fun k_b ->
          Vale_X64_QuickCodes.qblock
            [va_code_Sha_update (); Vale_X64_Machine_s.Block []] va_mods ()

type ('ctxub, 'inub, 'kub, 'vaus0, 'vauk) va_wp_Sha_update_bytes = unit

let (va_quick_Sha_update_bytes :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun ctx_b ->
    fun in_b ->
      fun k_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Sha_update_bytes ()),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Sha_update_bytes_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (15))
             (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (14))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (13))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (12))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (11))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (10))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (9))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (8))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (7))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg Prims.int_one)]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg Prims.int_one)];
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
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
      else Vale_X64_Machine_s.Block [];
      va_code_Sha_update_bytes ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg Prims.int_one);
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (7))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (8))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (9))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (10))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (11))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (12))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (13))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (14))
            (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (15))
            (Vale_X64_Machine_s.OReg Prims.int_zero)]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg Prims.int_one);
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))];
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Sha_update_bytes_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (if win
          then
            Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                 (Prims.of_int (15)) (Vale_X64_Machine_s.OReg Prims.int_zero))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                    (Prims.of_int (14))
                    (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                       (Prims.of_int (13))
                       (Vale_X64_Machine_s.OReg Prims.int_zero))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                          (Prims.of_int (12))
                          (Vale_X64_Machine_s.OReg Prims.int_zero))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                             (Prims.of_int (11))
                             (Vale_X64_Machine_s.OReg Prims.int_zero))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                (Prims.of_int (10))
                                (Vale_X64_Machine_s.OReg Prims.int_zero))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                   (Prims.of_int (9))
                                   (Vale_X64_Machine_s.OReg Prims.int_zero))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                      (Prims.of_int (8))
                                      (Vale_X64_Machine_s.OReg Prims.int_zero))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                         (Prims.of_int (7))
                                         (Vale_X64_Machine_s.OReg
                                            Prims.int_zero))
                                      (Vale_X64_Decls.va_pbool_and
                                         (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                            (Prims.of_int (6))
                                            (Vale_X64_Machine_s.OReg
                                               Prims.int_zero))
                                         (Vale_X64_Decls.va_pbool_and
                                            (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (15))))
                                            (Vale_X64_Decls.va_pbool_and
                                               (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                  (Vale_X64_Machine_s.OReg
                                                     (Prims.of_int (14))))
                                               (Vale_X64_Decls.va_pbool_and
                                                  (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                     (Vale_X64_Machine_s.OReg
                                                        (Prims.of_int (13))))
                                                  (Vale_X64_Decls.va_pbool_and
                                                     (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                        (Vale_X64_Machine_s.OReg
                                                           (Prims.of_int (12))))
                                                     (Vale_X64_Decls.va_pbool_and
                                                        (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                           (Vale_X64_Machine_s.OReg
                                                              (Prims.of_int (4))))
                                                        (Vale_X64_Decls.va_pbool_and
                                                           (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                              (Vale_X64_Machine_s.OReg
                                                                 (Prims.of_int (5))))
                                                           (Vale_X64_Decls.va_pbool_and
                                                              (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                                 (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6))))
                                                              (Vale_X64_Decls.va_pbool_and
                                                                 (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                                                    (
                                                                    Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                 (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))
          else
            Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsStack.va_codegen_success_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsStack.va_codegen_success_Push_Secret
                    (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsStack.va_codegen_success_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Push_Secret
                          (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (6))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                      (Vale_X64_Machine_s.OReg Prims.int_one))
                                   (Vale_X64_Decls.va_ttrue ())))))))))
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
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                          (Vale_X64_Decls.va_ttrue ()))))
             else Vale_X64_Decls.va_ttrue ())
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Sha_update_bytes ())
               (Vale_X64_Decls.va_pbool_and
                  (if win
                   then
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                          (Vale_X64_Machine_s.OReg Prims.int_one))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (12))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (13))))
                                      (Vale_X64_Decls.va_pbool_and
                                         (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (14))))
                                         (Vale_X64_Decls.va_pbool_and
                                            (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (15))))
                                            (Vale_X64_Decls.va_pbool_and
                                               (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                  (Prims.of_int (6))
                                                  (Vale_X64_Machine_s.OReg
                                                     Prims.int_zero))
                                               (Vale_X64_Decls.va_pbool_and
                                                  (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                     (Prims.of_int (7))
                                                     (Vale_X64_Machine_s.OReg
                                                        Prims.int_zero))
                                                  (Vale_X64_Decls.va_pbool_and
                                                     (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                        (Prims.of_int (8))
                                                        (Vale_X64_Machine_s.OReg
                                                           Prims.int_zero))
                                                     (Vale_X64_Decls.va_pbool_and
                                                        (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                           (Prims.of_int (9))
                                                           (Vale_X64_Machine_s.OReg
                                                              Prims.int_zero))
                                                        (Vale_X64_Decls.va_pbool_and
                                                           (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                              (Prims.of_int (10))
                                                              (Vale_X64_Machine_s.OReg
                                                                 Prims.int_zero))
                                                           (Vale_X64_Decls.va_pbool_and
                                                              (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                 (Prims.of_int (11))
                                                                 (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                              (Vale_X64_Decls.va_pbool_and
                                                                 (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (12))
                                                                    (
                                                                    Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                 (Vale_X64_Decls.va_pbool_and
                                                                    (
                                                                    Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (13))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (14))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))
                   else
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                          (Vale_X64_Machine_s.OReg Prims.int_one))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (12))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (13))))
                                      (Vale_X64_Decls.va_pbool_and
                                         (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (14))))
                                         (Vale_X64_Decls.va_pbool_and
                                            (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (15))))
                                            (Vale_X64_Decls.va_ttrue ())))))))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
                     (Vale_X64_Decls.va_ttrue ()))))))
type ('vaub0, 'vaus0, 'win, 'ctxub, 'inub, 'numuval,
  'kub) va_req_Sha_update_bytes_stdcall = unit
type ('vaub0, 'vaus0, 'win, 'ctxub, 'inub, 'numuval, 'kub, 'vausM,
  'vaufM) va_ens_Sha_update_bytes_stdcall = unit
let (va_qcode_Sha_update_bytes_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat64 ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun ctx_b ->
        fun in_b ->
          fun num_val ->
            fun k_b ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsMem.va_code_CreateHeaplets ();
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_PushXmm_Secret
                        (Prims.of_int (15))
                        (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (14))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (13))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (12))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (11))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (10))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (9))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (8))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (7))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PushXmm_Secret
                       (Prims.of_int (6))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg Prims.int_one)])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Push_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg Prims.int_one)]);
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
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (9)))])
                  (Vale_X64_Machine_s.Block []);
                va_code_Sha_update_bytes ();
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Pop_Secret
                        (Vale_X64_Machine_s.OReg Prims.int_one);
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (6))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (7))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (8))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (9))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (10))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (11))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (12))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (13))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (14))
                       (Vale_X64_Machine_s.OReg Prims.int_zero);
                     Vale_X64_InsStack.va_code_PopXmm_Secret
                       (Prims.of_int (15))
                       (Vale_X64_Machine_s.OReg Prims.int_zero)])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Pop_Secret
                        (Vale_X64_Machine_s.OReg Prims.int_one);
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]);
                Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('win, 'ctxub, 'inub, 'numuval, 'kub, 'vaus0,
  'vauk) va_wp_Sha_update_bytes_stdcall = unit

let (va_quick_Sha_update_bytes_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat64 ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun ctx_b ->
      fun in_b ->
        fun num_val ->
          fun k_b ->
            Vale_X64_QuickCode.QProc
              ((va_code_Sha_update_bytes_stdcall win),
                [Vale_X64_QuickCode.Mod_stackTaint;
                Vale_X64_QuickCode.Mod_stack;
                Vale_X64_QuickCode.Mod_mem_layout;
                Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
                Vale_X64_QuickCode.Mod_flags;
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (15))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (14))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (13))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (12))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (11))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_one, (Prims.of_int (10))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (15))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (14))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (13))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (12))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (11))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (10))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (9))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (8))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (7))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (6))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (5))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                Vale_X64_QuickCode.Mod_mem], (), ())