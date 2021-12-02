open Prims
let (va_code_Loop6x_partial_expected_code :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Add64
         (Vale_X64_Machine_s.OReg Prims.int_one)
         (Vale_X64_Machine_s.OConst (Prims.of_int (6)));
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_ge (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OConst (Prims.of_int (256)))),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsVector.va_code_InitPshufbMask Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (6))
               Prims.int_one Prims.int_zero;
             Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (5));
             Vale_X64_InsVector.va_code_PinsrqImm (Prims.of_int (5))
               Prims.int_one Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
             Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (10))
               (Prims.of_int (6)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (5));
             Vale_X64_InsVector.va_code_PinsrqImm (Prims.of_int (5))
               (Prims.of_int (2)) Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
             Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (11))
               (Prims.of_int (6)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
               (Prims.of_int (3))
               (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
               (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
             Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (12))
               (Prims.of_int (10)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (10))
               (Prims.of_int (10)) Prims.int_zero;
             Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (13))
               (Prims.of_int (11)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (11))
               (Prims.of_int (11)) Prims.int_zero;
             Vale_X64_InsVector.va_code_VPxor (Prims.of_int (10))
               (Prims.of_int (10))
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
             Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (14))
               (Prims.of_int (12)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (12))
               (Prims.of_int (12)) Prims.int_zero;
             Vale_X64_InsVector.va_code_VPxor (Prims.of_int (11))
               (Prims.of_int (11))
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
             Vale_X64_InsVector.va_code_VPaddd Prims.int_one
               (Prims.of_int (13)) (Prims.of_int (5));
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (13))
               (Prims.of_int (13)) Prims.int_zero;
             Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (14))
               (Prims.of_int (14)) Prims.int_zero;
             Vale_X64_InsVector.va_code_VPshufb Prims.int_one Prims.int_one
               Prims.int_zero;
             Vale_X64_InsBasic.va_code_Sub64
               (Vale_X64_Machine_s.OReg Prims.int_one)
               (Vale_X64_Machine_s.OConst (Prims.of_int (256)))]),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                (Prims.of_int (3))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
             Vale_X64_InsVector.va_code_VPaddd Prims.int_one
               (Prims.of_int (2)) (Prims.of_int (14));
             Vale_X64_InsVector.va_code_VPxor (Prims.of_int (10))
               (Prims.of_int (10))
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
             Vale_X64_InsVector.va_code_VPxor (Prims.of_int (11))
               (Prims.of_int (11))
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6))) Prims.int_one
        (Prims.of_int (128)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
        (Prims.of_int (7)) (Prims.of_int (3)) false true;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (12))
        (Prims.of_int (12)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-112)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (6))
        (Prims.of_int (7)) (Prims.of_int (3)) true false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (13))
        (Prims.of_int (13)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one (Prims.of_int (7))
        (Prims.of_int (3)) false false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (14))
        (Prims.of_int (14)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (7))
        (Prims.of_int (7)) (Prims.of_int (3)) true true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (2));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (3)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (2));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4)) Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (3)) false true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-96)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (3)) true false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (3)) true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (88))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (80))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (40))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (5)) false false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (5)) false true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (5)) true false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (5)) true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        Prims.int_one false false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        Prims.int_one false true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (72))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        Prims.int_one true false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (64))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        Prims.int_one true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (48))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (56))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (2)) false false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (2)) false true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (56))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (2)) true false;
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6)))),
                 (Prims.of_int (112)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (48))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (2)) true true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (64))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (72))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
        (Prims.of_int (8)) (Prims.of_int (3)) false true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one (Prims.of_int (8))
        (Prims.of_int (3)) true false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (40))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
        (Prims.of_int (8)) (Prims.of_int (3)) false false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (8))
        (Prims.of_int (8)) (Prims.of_int (3)) true true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (80))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (88))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VLow64ToHigh (Prims.of_int (5))
        (Prims.of_int (6));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
      Vale_X64_InsVector.va_code_PinsrqImm (Prims.of_int (3))
        (Prims.parse_int "13979173243358019584") Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_AES_X64_PolyOps.va_code_VSwap Prims.int_zero (Prims.of_int (4));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
        (Prims.of_int (4)) (Prims.of_int (3)) false true;
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (96))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (104))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) Prims.int_one;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) Prims.int_one;
      Vale_AES_X64_PolyOps.va_code_VHigh64ToLow (Prims.of_int (6))
        (Prims.of_int (6));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) Prims.int_one;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) Prims.int_one;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) Prims.int_one;
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) Prims.int_one;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      if alg = Vale_AES_AES_s.AES_256
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
             (Prims.of_int (9)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
            (Prims.of_int (10)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
            (Prims.of_int (11)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
            (Prims.of_int (12)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
            (Prims.of_int (13)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
            (Prims.of_int (9)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
            (Prims.of_int (10)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
            (Prims.of_int (11)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
            (Prims.of_int (12)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
            (Prims.of_int (13)) Prims.int_one;
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) Prims.int_one;
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
            (Prims.of_int (9)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
            (Prims.of_int (10)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
            (Prims.of_int (11)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
            (Prims.of_int (12)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
            (Prims.of_int (13)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) (Prims.of_int (15));
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
            (Prims.of_int (9)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
            (Prims.of_int (10)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
            (Prims.of_int (11)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
            (Prims.of_int (12)) Prims.int_one;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
            (Prims.of_int (13)) Prims.int_one;
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) Prims.int_one;
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6))) (Prims.of_int (7))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VSwap (Prims.of_int (8))
        (Prims.of_int (4));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
        (Prims.of_int (10)) (Prims.of_int (15));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
        (Prims.of_int (4)) (Prims.of_int (3)) false true;
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (2)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (5)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (32)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (6)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (48)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (15));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (7)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (64)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (3)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (80)))), Vale_Arch_HeapTypes_s.Secret))]
let (va_codegen_success_Loop6x_partial_expected_code :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Add64
         (Vale_X64_Machine_s.OReg Prims.int_one)
         (Vale_X64_Machine_s.OConst (Prims.of_int (6))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_InitPshufbMask
               Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_VPshufb
                  (Prims.of_int (6)) Prims.int_one Prims.int_zero)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                     (Prims.of_int (5)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_PinsrqImm
                        (Prims.of_int (5)) Prims.int_one Prims.int_zero
                        (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_VPaddd
                           (Prims.of_int (10)) (Prims.of_int (6))
                           (Prims.of_int (5)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                              (Prims.of_int (5)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_PinsrqImm
                                 (Prims.of_int (5)) (Prims.of_int (2))
                                 Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_VPaddd
                                    (Prims.of_int (11)) (Prims.of_int (6))
                                    (Prims.of_int (5)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                       Prims.int_zero (Prims.of_int (3))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (9)))
                                       (Prims.of_int (-32))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_VPaddd
                                          (Prims.of_int (12))
                                          (Prims.of_int (10))
                                          (Prims.of_int (5)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsVector.va_codegen_success_VPshufb
                                             (Prims.of_int (10))
                                             (Prims.of_int (10))
                                             Prims.int_zero)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                (Prims.of_int (13))
                                                (Prims.of_int (11))
                                                (Prims.of_int (5)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsVector.va_codegen_success_VPshufb
                                                   (Prims.of_int (11))
                                                   (Prims.of_int (11))
                                                   Prims.int_zero)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_VPxor
                                                      (Prims.of_int (10))
                                                      (Prims.of_int (10))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (15))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                         (Prims.of_int (14))
                                                         (Prims.of_int (12))
                                                         (Prims.of_int (5)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_VPshufb
                                                            (Prims.of_int (12))
                                                            (Prims.of_int (12))
                                                            Prims.int_zero)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsVector.va_codegen_success_VPxor
                                                               (Prims.of_int (11))
                                                               (Prims.of_int (11))
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (15))))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                                  Prims.int_one
                                                                  (Prims.of_int (13))
                                                                  (Prims.of_int (5)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsVector.va_codegen_success_VPshufb
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    Prims.int_zero)
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPshufb
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPshufb
                                                                    Prims.int_one
                                                                    Prims.int_one
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Sub64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    (Prims.of_int (256))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (-32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                                    Prims.int_one
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (15))))
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (15)))))))))))))))))))))))))))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Store128_buffer
               (Prims.of_int (3))
               (Vale_X64_Machine_s.OReg (Prims.of_int (6))) Prims.int_one
               (Prims.of_int (128)) Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                  (Prims.of_int (5)) (Prims.of_int (7)) (Prims.of_int (3))
                  false true)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_VPxor
                     (Prims.of_int (12)) (Prims.of_int (12))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                        Prims.int_zero (Prims.of_int (2))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Prims.of_int (-112)) Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                           (Prims.of_int (6)) (Prims.of_int (7))
                           (Prims.of_int (3)) true false)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                              (Prims.of_int (9)) (Prims.of_int (9))
                              (Prims.of_int (2)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                 (Prims.of_int (3)) Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                                 (Prims.of_int (48))
                                 Vale_Arch_HeapTypes_s.Secret)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_VPxor
                                    (Prims.of_int (13)) (Prims.of_int (13))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (15))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                       Prims.int_one (Prims.of_int (7))
                                       (Prims.of_int (3)) false false)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                          (Prims.of_int (10))
                                          (Prims.of_int (10))
                                          (Prims.of_int (2)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsVector.va_codegen_success_VPxor
                                             (Prims.of_int (14))
                                             (Prims.of_int (14))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (15))))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                (Prims.of_int (7))
                                                (Prims.of_int (7))
                                                (Prims.of_int (3)) true true)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                   (Prims.of_int (11))
                                                   (Prims.of_int (11))
                                                   (Prims.of_int (2)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                      Prims.int_zero
                                                      (Prims.of_int (3))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (9)))
                                                      (Prims.of_int (-16))
                                                      Vale_Arch_HeapTypes_s.Secret)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                         (Prims.of_int (12))
                                                         (Prims.of_int (12))
                                                         (Prims.of_int (2)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                            (Prims.of_int (6))
                                                            (Prims.of_int (6))
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (5))))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                               (Prims.of_int (5))
                                                               Prims.int_zero
                                                               (Prims.of_int (3))
                                                               false false)
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                  (Prims.of_int (8))
                                                                  (Prims.of_int (8))
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4))))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (2)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (8))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (6)))),
                                                                    (Prims.of_int (16)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (88))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Prims.of_int (40))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (16))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (72))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Prims.of_int (56))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-48))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (56))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (8))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (6)))),
                                                                    (Prims.of_int (112)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Prims.of_int (72))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (40))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Prims.of_int (88))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (-16))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VLow64ToHigh
                                                                    (Prims.of_int (5))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_PinsrqImm
                                                                    (Prims.of_int (3))
                                                                    (Prims.parse_int "13979173243358019584")
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (24))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (16))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VSwap
                                                                    Prims.int_zero
                                                                    (Prims.of_int (4)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Prims.of_int (104))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    Prims.int_zero
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (16))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VHigh64ToLow
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (8))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    Prims.int_zero
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (if
                                                                    alg =
                                                                    Vale_AES_AES_s.AES_256
                                                                    then
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))
                                                                    else
                                                                    Vale_X64_Decls.va_ttrue
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (9))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (16))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VSwap
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (4)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (2))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    Prims.int_zero)),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (11))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    (Prims.of_int (16)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (5))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    (Prims.of_int (32)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (13))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (6))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    (Prims.of_int (48)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (7))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    (Prims.of_int (64)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                                                    (Prims.of_int (3))
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (5)))),
                                                                    (Prims.of_int (80)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))