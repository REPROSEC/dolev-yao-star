open Prims
type ('alg, 'key, 'roundukeys, 'keysub, 'keyuptr, 'heap0,
  'layout) aes_reqs0 = unit
type ('alg, 'key, 'roundukeys, 'keysub, 'keyuptr, 'heap0,
  'layout) aes_reqs_offset = unit
type 'a six_of = ('a * 'a * 'a * 'a * 'a * 'a)
type quad32_6 = Vale_Def_Types_s.quad32 six_of





type ('scratchub, 'count, 'heap3, 's, 'z3) scratch_reqs = unit
let (add :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2_s.add

let (va_code_Load_two_lsb :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_ZeroXmm dst;
      Vale_X64_InsVector.va_code_PinsrqImm dst (Prims.of_int (2))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (11)))]
let (va_codegen_success_Load_two_lsb :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_ZeroXmm dst)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrqImm dst
            (Prims.of_int (2)) Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
         (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'vaus0, 'vauk) va_wp_Load_two_lsb = unit

let (va_quick_Load_two_lsb :
  Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst ->
    Vale_X64_QuickCode.QProc
      ((va_code_Load_two_lsb dst),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Load_0xc2_msb :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_ZeroXmm dst;
      Vale_X64_InsVector.va_code_PinsrqImm dst
        (Prims.parse_int "13979173243358019584") Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))]
let (va_codegen_success_Load_0xc2_msb :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_ZeroXmm dst)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrqImm dst
            (Prims.parse_int "13979173243358019584") Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
         (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'vaus0, 'vauk) va_wp_Load_0xc2_msb = unit

let (va_quick_Load_0xc2_msb :
  Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst ->
    Vale_X64_QuickCode.QProc
      ((va_code_Load_0xc2_msb dst),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Load_one_lsb :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_ZeroXmm dst;
      Vale_X64_InsVector.va_code_PinsrqImm dst Prims.int_one Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))]
let (va_codegen_success_Load_one_lsb :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_ZeroXmm dst)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrqImm dst Prims.int_one
            Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
         (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'vaus0, 'vauk) va_wp_Load_one_lsb = unit

let (va_quick_Load_one_lsb :
  Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst ->
    Vale_X64_QuickCode.QProc
      ((va_code_Load_one_lsb dst),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Handle_ctr32 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_InitPshufbMask Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (6)) Prims.int_one
        Prims.int_zero;
      va_code_Load_one_lsb (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (10))
        (Prims.of_int (6)) (Prims.of_int (5));
      va_code_Load_two_lsb (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (11))
        (Prims.of_int (6)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (12))
        (Prims.of_int (10)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (10))
        (Prims.of_int (10)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (13))
        (Prims.of_int (11)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (11))
        (Prims.of_int (11)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (10))
        (Prims.of_int (10)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (14))
        (Prims.of_int (12)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (12))
        (Prims.of_int (12)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (11))
        (Prims.of_int (11)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_VPaddd Prims.int_one (Prims.of_int (13))
        (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (13))
        (Prims.of_int (13)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (14))
        (Prims.of_int (14)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPshufb Prims.int_one Prims.int_one
        Prims.int_zero]
let (va_codegen_success_Handle_ctr32 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_InitPshufbMask Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_VPshufb (Prims.of_int (6))
            Prims.int_one Prims.int_zero)
         (Vale_X64_Decls.va_pbool_and
            (va_codegen_success_Load_one_lsb (Prims.of_int (5)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_VPaddd
                  (Prims.of_int (10)) (Prims.of_int (6)) (Prims.of_int (5)))
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Load_two_lsb (Prims.of_int (5)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_VPaddd
                        (Prims.of_int (11)) (Prims.of_int (6))
                        (Prims.of_int (5)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_VPaddd
                           (Prims.of_int (12)) (Prims.of_int (10))
                           (Prims.of_int (5)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_VPshufb
                              (Prims.of_int (10)) (Prims.of_int (10))
                              Prims.int_zero)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_VPaddd
                                 (Prims.of_int (13)) (Prims.of_int (11))
                                 (Prims.of_int (5)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_VPshufb
                                    (Prims.of_int (11)) (Prims.of_int (11))
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
                                                         (Vale_X64_Decls.va_ttrue
                                                            ()))))))))))))))))))
let (va_qcode_Handle_ctr32 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Types_s.quad32 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ctr_BE ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsVector.va_code_InitPshufbMask Prims.int_zero
           (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (6)) Prims.int_one
          Prims.int_zero;
        va_code_Load_one_lsb (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (10))
          (Prims.of_int (6)) (Prims.of_int (5));
        va_code_Load_two_lsb (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (11))
          (Prims.of_int (6)) (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (12))
          (Prims.of_int (10)) (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (10))
          (Prims.of_int (10)) Prims.int_zero;
        Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (13))
          (Prims.of_int (11)) (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (11))
          (Prims.of_int (11)) Prims.int_zero;
        Vale_X64_InsVector.va_code_VPxor (Prims.of_int (10))
          (Prims.of_int (10)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
        Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (14))
          (Prims.of_int (12)) (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (12))
          (Prims.of_int (12)) Prims.int_zero;
        Vale_X64_InsVector.va_code_VPxor (Prims.of_int (11))
          (Prims.of_int (11)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
        Vale_X64_InsVector.va_code_VPaddd Prims.int_one (Prims.of_int (13))
          (Prims.of_int (5));
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (13))
          (Prims.of_int (13)) Prims.int_zero;
        Vale_X64_InsVector.va_code_VPshufb (Prims.of_int (14))
          (Prims.of_int (14)) Prims.int_zero;
        Vale_X64_InsVector.va_code_VPshufb Prims.int_one Prims.int_one
          Prims.int_zero] va_mods ()

type ('ctruBE, 'vaus0, 'vauk) va_wp_Handle_ctr32 = unit

let (va_quick_Handle_ctr32 :
  Vale_Def_Types_s.quad32 -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun ctr_BE ->
    Vale_X64_QuickCode.QProc
      ((va_code_Handle_ctr32 ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (14))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (13))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (12))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (11))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))))],
        (), ())
let (va_code_Loop6x_ctr_update :
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
             [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                (Prims.of_int (3))
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
             va_code_Handle_ctr32 ();
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
               (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]))]
let (va_codegen_success_Loop6x_ctr_update :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Add64
         (Vale_X64_Machine_s.OReg Prims.int_one)
         (Vale_X64_Machine_s.OConst (Prims.of_int (6))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Load128_buffer
               Prims.int_zero (Prims.of_int (3))
               (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
               (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and (va_codegen_success_Handle_ctr32 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Sub64
                     (Vale_X64_Machine_s.OReg Prims.int_one)
                     (Vale_X64_Machine_s.OConst (Prims.of_int (256))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                        Prims.int_zero (Prims.of_int (3))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_VPaddd
                           Prims.int_one (Prims.of_int (2))
                           (Prims.of_int (14)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_VPxor
                              (Prims.of_int (10)) (Prims.of_int (10))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                           (Vale_X64_InsVector.va_codegen_success_VPxor
                              (Prims.of_int (11)) (Prims.of_int (11))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))))))
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_Loop6x_ctr_update :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Types_s.quad32 ->
                  (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun h_LE ->
        fun key_words ->
          fun round_keys ->
            fun keys_b ->
              fun hkeys_b ->
                fun ctr_BE ->
                  Vale_X64_QuickCodes.qblock
                    [Vale_X64_InsBasic.va_code_Add64
                       (Vale_X64_Machine_s.OReg Prims.int_one)
                       (Vale_X64_Machine_s.OConst (Prims.of_int (6)));
                    Vale_X64_Machine_s.IfElse
                      ((Vale_X64_QuickCodes.cmp_to_ocmp
                          (Vale_X64_QuickCodes.Cmp_ge
                             ((Vale_X64_Machine_s.OReg Prims.int_one),
                               (Vale_X64_Machine_s.OConst
                                  (Prims.of_int (256)))))),
                        (Vale_X64_Machine_s.Block
                           [Vale_X64_InsVector.va_code_Load128_buffer
                              Prims.int_zero (Prims.of_int (3))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Prims.of_int (-32))
                              Vale_Arch_HeapTypes_s.Secret;
                           va_code_Handle_ctr32 ();
                           Vale_X64_InsBasic.va_code_Sub64
                             (Vale_X64_Machine_s.OReg Prims.int_one)
                             (Vale_X64_Machine_s.OConst (Prims.of_int (256)))]),
                        (Vale_X64_Machine_s.Block
                           [Vale_X64_InsVector.va_code_Load128_buffer
                              Prims.int_zero (Prims.of_int (3))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Prims.of_int (-32))
                              Vale_Arch_HeapTypes_s.Secret;
                           Vale_X64_InsVector.va_code_VPaddd Prims.int_one
                             (Prims.of_int (2)) (Prims.of_int (14));
                           Vale_X64_InsVector.va_code_VPxor
                             (Prims.of_int (10)) (Prims.of_int (10))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                           Vale_X64_InsVector.va_code_VPxor
                             (Prims.of_int (11)) (Prims.of_int (11))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]))]
                    va_mods ()

type ('alg, 'huLE, 'keyuwords, 'roundukeys, 'keysub, 'hkeysub, 'ctruBE,
  'vaus0, 'vauk) va_wp_Loop6x_ctr_update = unit

let (va_quick_Loop6x_ctr_update :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun h_LE ->
      fun key_words ->
        fun round_keys ->
          fun keys_b ->
            fun hkeys_b ->
              fun ctr_BE ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Loop6x_ctr_update alg),
                    [Vale_X64_QuickCode.Mod_flags;
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
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (9))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (6))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (5))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (2))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (3))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (11))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one))],
                    (), ())
let (va_code_Loop6x_plain :
  Vale_AES_AES_s.algorithm ->
    Prims.nat ->
      Vale_X64_Machine_s.reg_xmm ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    fun rnd ->
      fun rndkey ->
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero rndkey
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (((Prims.of_int (16)) * (rnd + Prims.int_one)) -
                (Prims.of_int (128))) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (9))
            (Prims.of_int (9)) rndkey;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (10))
            (Prims.of_int (10)) rndkey;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (11))
            (Prims.of_int (11)) rndkey;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (12))
            (Prims.of_int (12)) rndkey;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (13))
            (Prims.of_int (13)) rndkey;
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) rndkey]
let (va_codegen_success_Loop6x_plain :
  Vale_AES_AES_s.algorithm ->
    Prims.nat -> Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  =
  fun alg ->
    fun rnd ->
      fun rndkey ->
        Vale_X64_Decls.va_pbool_and
          (Vale_X64_InsVector.va_codegen_success_Load128_buffer
             Prims.int_zero rndkey
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (((Prims.of_int (16)) * (rnd + Prims.int_one)) -
                (Prims.of_int (128))) Vale_Arch_HeapTypes_s.Secret)
          (Vale_X64_Decls.va_pbool_and
             (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                (Prims.of_int (9)) (Prims.of_int (9)) rndkey)
             (Vale_X64_Decls.va_pbool_and
                (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                   (Prims.of_int (10)) (Prims.of_int (10)) rndkey)
                (Vale_X64_Decls.va_pbool_and
                   (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                      (Prims.of_int (11)) (Prims.of_int (11)) rndkey)
                   (Vale_X64_Decls.va_pbool_and
                      (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                         (Prims.of_int (12)) (Prims.of_int (12)) rndkey)
                      (Vale_X64_Decls.va_pbool_and
                         (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                            (Prims.of_int (13)) (Prims.of_int (13)) rndkey)
                         (Vale_X64_Decls.va_pbool_and
                            (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                               (Prims.of_int (14)) (Prims.of_int (14)) rndkey)
                            (Vale_X64_Decls.va_ttrue ())))))))

type ('alg, 'rnd, 'keyuwords, 'roundukeys, 'keysub, 'init, 'rndkey, 'vaus0,
  'vauk) va_wp_Loop6x_plain = unit

let (va_quick_Loop6x_plain :
  Vale_AES_AES_s.algorithm ->
    Prims.nat ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            quad32_6 ->
              Vale_X64_Machine_s.reg_xmm ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun rnd ->
      fun key_words ->
        fun round_keys ->
          fun keys_b ->
            fun init ->
              fun rndkey ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Loop6x_plain alg rnd rndkey),
                    [Vale_X64_QuickCode.Mod_flags;
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
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (9))));
                    Vale_X64_QuickCode.va_mod_xmm rndkey], (), ())
let (va_code_Loop6x_preamble :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [va_code_Loop6x_ctr_update alg;
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6))) Prims.int_one
        (Prims.of_int (128)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (12))
        (Prims.of_int (12)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (13))
        (Prims.of_int (13)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (14))
        (Prims.of_int (14)) (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
let (va_codegen_success_Loop6x_preamble :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop6x_ctr_update alg)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Store128_buffer
            (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
            Prims.int_one (Prims.of_int (128)) Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_VPxor (Prims.of_int (12))
               (Prims.of_int (12))
               (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_VPxor
                  (Prims.of_int (13)) (Prims.of_int (13))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_VPxor
                     (Prims.of_int (14)) (Prims.of_int (14))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                  (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_Loop6x_preamble :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_Def_Types_s.quad32 ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun h_LE ->
        fun iv_b ->
          fun scratch_b ->
            fun key_words ->
              fun round_keys ->
                fun keys_b ->
                  fun hkeys_b ->
                    fun ctr_BE ->
                      Vale_X64_QuickCodes.qblock
                        [va_code_Loop6x_ctr_update alg;
                        Vale_X64_InsVector.va_code_Store128_buffer
                          (Prims.of_int (3))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                          Prims.int_one (Prims.of_int (128))
                          Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_InsVector.va_code_VPxor (Prims.of_int (12))
                          (Prims.of_int (12))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                        Vale_X64_InsVector.va_code_VPxor (Prims.of_int (13))
                          (Prims.of_int (13))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                        Vale_X64_InsVector.va_code_VPxor (Prims.of_int (14))
                          (Prims.of_int (14))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
                        va_mods ()

type ('alg, 'huLE, 'ivub, 'scratchub, 'keyuwords, 'roundukeys, 'keysub,
  'hkeysub, 'ctruBE, 'vaus0, 'vauk) va_wp_Loop6x_preamble = unit

let (va_quick_Loop6x_preamble :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Types_s.quad32 ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun h_LE ->
      fun iv_b ->
        fun scratch_b ->
          fun key_words ->
            fun round_keys ->
              fun keys_b ->
                fun hkeys_b ->
                  fun ctr_BE ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_Loop6x_preamble alg),
                        [Vale_X64_QuickCode.Mod_flags;
                        Vale_X64_QuickCode.Mod_mem_heaplet (Prims.of_int (3));
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
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (9))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (6))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (5))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (2))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, Prims.int_one));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, Prims.int_zero));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (3))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (11))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, Prims.int_one));
                        Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Loop6x_reverse128 :
  Prims.nat ->
    Prims.nat ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun in0_offset ->
    fun stack_offset ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsVector.va_code_LoadBe64_buffer128 (Prims.of_int (6))
           (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
           (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
           ((in0_offset * (Prims.of_int (16))) + (Prims.of_int (8)))
           Vale_Arch_HeapTypes_s.Secret true;
        Vale_X64_InsVector.va_code_LoadBe64_buffer128 (Prims.of_int (6))
          (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
          (in0_offset * (Prims.of_int (16))) Vale_Arch_HeapTypes_s.Secret
          false;
        Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
          (stack_offset * (Prims.of_int (16))) Vale_Arch_HeapTypes_s.Secret
          false;
        Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
          ((stack_offset * (Prims.of_int (16))) + (Prims.of_int (8)))
          Vale_Arch_HeapTypes_s.Secret true]
let (va_codegen_success_Loop6x_reverse128 :
  Prims.nat -> Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun in0_offset ->
    fun stack_offset ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
           (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
           (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
           ((in0_offset * (Prims.of_int (16))) + (Prims.of_int (8)))
           Vale_Arch_HeapTypes_s.Secret true)
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
              (Prims.of_int (6))
              (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
              (in0_offset * (Prims.of_int (16))) Vale_Arch_HeapTypes_s.Secret
              false)
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                 (Prims.of_int (3))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                 (stack_offset * (Prims.of_int (16)))
                 Vale_Arch_HeapTypes_s.Secret false)
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                    (Prims.of_int (3))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                    ((stack_offset * (Prims.of_int (16))) +
                       (Prims.of_int (8))) Vale_Arch_HeapTypes_s.Secret true)
                 (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_Loop6x_reverse128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Prims.nat ->
        Prims.nat ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun in0_offset ->
      fun stack_offset ->
        fun start ->
          fun in0_b ->
            fun scratch_b ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsVector.va_code_LoadBe64_buffer128
                   (Prims.of_int (6))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                   ((in0_offset * (Prims.of_int (16))) + (Prims.of_int (8)))
                   Vale_Arch_HeapTypes_s.Secret true;
                Vale_X64_InsVector.va_code_LoadBe64_buffer128
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                  (in0_offset * (Prims.of_int (16)))
                  Vale_Arch_HeapTypes_s.Secret false;
                Vale_X64_InsVector.va_code_Store64_buffer128
                  (Prims.of_int (3))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                  (stack_offset * (Prims.of_int (16)))
                  Vale_Arch_HeapTypes_s.Secret false;
                Vale_X64_InsVector.va_code_Store64_buffer128
                  (Prims.of_int (3))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                  ((stack_offset * (Prims.of_int (16))) + (Prims.of_int (8)))
                  Vale_Arch_HeapTypes_s.Secret true] va_mods ()

type ('in0uoffset, 'stackuoffset, 'start, 'in0ub, 'scratchub, 'vaus0,
  'vauk) va_wp_Loop6x_reverse128 = unit

let (va_quick_Loop6x_reverse128 :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun in0_offset ->
    fun stack_offset ->
      fun start ->
        fun in0_b ->
          fun scratch_b ->
            Vale_X64_QuickCode.QProc
              ((va_code_Loop6x_reverse128 in0_offset stack_offset),
                [Vale_X64_QuickCode.Mod_mem_heaplet (Prims.of_int (3));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (13))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (12))));
                Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Loop6x_round9 :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (3))
         (Vale_X64_Machine_s.OReg (Prims.of_int (6))) (Prims.of_int (7))
         (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (2)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (5)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (32)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (6)) Prims.int_one
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))),
                 (Prims.of_int (48)))), Vale_Arch_HeapTypes_s.Secret));
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
let (va_codegen_success_Loop6x_round9 :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Store128_buffer
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
         (Prims.of_int (7)) (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Mem128_lemma ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_VPxor (Prims.of_int (2))
               Prims.int_one
               (Vale_X64_Machine_s.OMem
                  ((Vale_X64_Machine_s.MReg
                      ((Vale_X64_Machine_s.Reg
                          (Prims.int_zero, (Prims.of_int (5)))),
                        Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Mem128_lemma ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_VPxor Prims.int_zero
                     Prims.int_one
                     (Vale_X64_Machine_s.OMem
                        ((Vale_X64_Machine_s.MReg
                            ((Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (5)))),
                              (Prims.of_int (16)))),
                          Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mem128_lemma ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_VPxor
                           (Prims.of_int (5)) Prims.int_one
                           (Vale_X64_Machine_s.OMem
                              ((Vale_X64_Machine_s.MReg
                                  ((Vale_X64_Machine_s.Reg
                                      (Prims.int_zero, (Prims.of_int (5)))),
                                    (Prims.of_int (32)))),
                                Vale_Arch_HeapTypes_s.Secret)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                              ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_VPxor
                                 (Prims.of_int (6)) Prims.int_one
                                 (Vale_X64_Machine_s.OMem
                                    ((Vale_X64_Machine_s.MReg
                                        ((Vale_X64_Machine_s.Reg
                                            (Prims.int_zero,
                                              (Prims.of_int (5)))),
                                          (Prims.of_int (48)))),
                                      Vale_Arch_HeapTypes_s.Secret)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                    ())
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_VPxor
                                       (Prims.of_int (7)) Prims.int_one
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
                                             (Prims.of_int (3)) Prims.int_one
                                             (Vale_X64_Machine_s.OMem
                                                ((Vale_X64_Machine_s.MReg
                                                    ((Vale_X64_Machine_s.Reg
                                                        (Prims.int_zero,
                                                          (Prims.of_int (5)))),
                                                      (Prims.of_int (80)))),
                                                  Vale_Arch_HeapTypes_s.Secret)))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
let (va_qcode_Loop6x_round9 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Prims.nat ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun count ->
        fun in_b ->
          fun scratch_b ->
            fun key_words ->
              fun round_keys ->
                fun keys_b ->
                  Vale_X64_QuickCodes.qblock
                    [Vale_X64_InsVector.va_code_Store128_buffer
                       (Prims.of_int (3))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                       (Prims.of_int (7)) (Prims.of_int (16))
                       Vale_Arch_HeapTypes_s.Secret;
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor (Prims.of_int (2))
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               Prims.int_zero)),
                           Vale_Arch_HeapTypes_s.Secret));
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor Prims.int_zero
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               (Prims.of_int (16)))),
                           Vale_Arch_HeapTypes_s.Secret));
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor (Prims.of_int (5))
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               (Prims.of_int (32)))),
                           Vale_Arch_HeapTypes_s.Secret));
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor (Prims.of_int (6))
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               (Prims.of_int (48)))),
                           Vale_Arch_HeapTypes_s.Secret));
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor (Prims.of_int (7))
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               (Prims.of_int (64)))),
                           Vale_Arch_HeapTypes_s.Secret));
                    Vale_X64_InsVector.va_code_Mem128_lemma ();
                    Vale_X64_InsVector.va_code_VPxor (Prims.of_int (3))
                      Prims.int_one
                      (Vale_X64_Machine_s.OMem
                         ((Vale_X64_Machine_s.MReg
                             ((Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5)))),
                               (Prims.of_int (80)))),
                           Vale_Arch_HeapTypes_s.Secret))] va_mods ()

type ('alg, 'count, 'inub, 'scratchub, 'keyuwords, 'roundukeys, 'keysub,
  'vaus0, 'vauk) va_wp_Loop6x_round9 = unit

let (va_quick_Loop6x_round9 :
  Vale_AES_AES_s.algorithm ->
    Prims.nat ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun count ->
      fun in_b ->
        fun scratch_b ->
          fun key_words ->
            fun round_keys ->
              fun keys_b ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Loop6x_round9 alg),
                    [Vale_X64_QuickCode.Mod_mem_heaplet (Prims.of_int (3));
                    Vale_X64_QuickCode.Mod_flags;
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (7))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (6))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (5))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (3))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_one, (Prims.of_int (2))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                    Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_load_one_msb :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (2));
      Vale_X64_InsVector.va_code_PinsrqImm (Prims.of_int (2))
        (Prims.parse_int "72057594037927936") Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))]
let (va_codegen_success_load_one_msb : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_ZeroXmm (Prims.of_int (2)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrqImm (Prims.of_int (2))
            (Prims.parse_int "72057594037927936") Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_load_one_msb :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (2));
      Vale_X64_InsVector.va_code_PinsrqImm (Prims.of_int (2))
        (Prims.parse_int "72057594037927936") Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))] va_mods ()

type ('vaus0, 'vauk) va_wp_load_one_msb = unit

let (va_quick_load_one_msb :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_load_one_msb ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))))],
        (), ())
let (va_code_Loop6x_final :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
         Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
         (Prims.of_int (128)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (9))
        (Prims.of_int (9)) (Prims.of_int (2));
      va_code_load_one_msb ();
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (10))
        (Prims.of_int (10)) Prims.int_zero;
      Vale_X64_InsVector.va_code_VPaddd Prims.int_zero Prims.int_one
        (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13))) (Prims.of_int (112))
        Vale_Arch_HeapTypes_s.Secret false;
      Vale_X64_InsBasic.va_code_AddLea64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (11))
        (Prims.of_int (11)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Store64_buffer128 (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (120))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsBasic.va_code_AddLea64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (15)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Prims.of_int (-128)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (12))
        (Prims.of_int (12)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (6)) (Prims.of_int (5))
        (Prims.of_int (2));
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (13))
        (Prims.of_int (13)) (Prims.of_int (7));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (7)) (Prims.of_int (6))
        (Prims.of_int (2));
      Vale_X64_InsAes.va_code_VAESNI_enc_last (Prims.of_int (14))
        (Prims.of_int (14)) (Prims.of_int (3));
      Vale_X64_InsVector.va_code_VPaddd (Prims.of_int (3)) (Prims.of_int (7))
        (Prims.of_int (2))]
let (va_codegen_success_Loop6x_final :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer
         (Prims.of_int (3)) Prims.int_one
         (Vale_X64_Machine_s.OReg (Prims.of_int (6))) (Prims.of_int (128))
         Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
            (Prims.of_int (9)) (Prims.of_int (9)) (Prims.of_int (2)))
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_load_one_msb ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
                  (Prims.of_int (10)) (Prims.of_int (10)) Prims.int_zero)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_VPaddd
                     Prims.int_zero Prims.int_one (Prims.of_int (2)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                        (Prims.of_int (3))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                        (Prims.of_int (112)) Vale_Arch_HeapTypes_s.Secret
                        false)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_AddLea64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (96))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
                              (Prims.of_int (11)) (Prims.of_int (11))
                              (Prims.of_int (5)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_VPaddd
                                 (Prims.of_int (5)) Prims.int_zero
                                 (Prims.of_int (2)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Store64_buffer128
                                    (Prims.of_int (3))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (6)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (12)))
                                    (Prims.of_int (120))
                                    Vale_Arch_HeapTypes_s.Secret true)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_AddLea64
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (4)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (4)))
                                       (Vale_X64_Machine_s.OConst
                                          (Prims.of_int (96))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                          Prims.int_zero (Prims.of_int (15))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (2)))
                                          (Prims.of_int (-128))
                                          Vale_Arch_HeapTypes_s.Secret)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
                                             (Prims.of_int (12))
                                             (Prims.of_int (12))
                                             (Prims.of_int (6)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                (Prims.of_int (6))
                                                (Prims.of_int (5))
                                                (Prims.of_int (2)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
                                                   (Prims.of_int (13))
                                                   (Prims.of_int (13))
                                                   (Prims.of_int (7)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                      (Prims.of_int (7))
                                                      (Prims.of_int (6))
                                                      (Prims.of_int (2)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsAes.va_codegen_success_VAESNI_enc_last
                                                         (Prims.of_int (14))
                                                         (Prims.of_int (14))
                                                         (Prims.of_int (3)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_VPaddd
                                                            (Prims.of_int (3))
                                                            (Prims.of_int (7))
                                                            (Prims.of_int (2)))
                                                         (Vale_X64_Decls.va_ttrue
                                                            ()))))))))))))))))))
let (va_qcode_Loop6x_final :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Types_s.quad32 ->
                  quad32_6 ->
                    quad32_6 ->
                      quad32_6 ->
                        Vale_Def_Types_s.quad32 ->
                          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun iv_b ->
        fun scratch_b ->
          fun key_words ->
            fun round_keys ->
              fun keys_b ->
                fun ctr_orig ->
                  fun init ->
                    fun ctrs ->
                      fun plain ->
                        fun inb ->
                          Vale_X64_QuickCodes.qblock
                            [Vale_X64_InsVector.va_code_Load128_buffer
                               (Prims.of_int (3)) Prims.int_one
                               (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                               (Prims.of_int (128))
                               Vale_Arch_HeapTypes_s.Secret;
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (9)) (Prims.of_int (9))
                              (Prims.of_int (2));
                            va_code_load_one_msb ();
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (10)) (Prims.of_int (10))
                              Prims.int_zero;
                            Vale_X64_InsVector.va_code_VPaddd Prims.int_zero
                              Prims.int_one (Prims.of_int (2));
                            Vale_X64_InsVector.va_code_Store64_buffer128
                              (Prims.of_int (3))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                              (Prims.of_int (112))
                              Vale_Arch_HeapTypes_s.Secret false;
                            Vale_X64_InsBasic.va_code_AddLea64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                              (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (11)) (Prims.of_int (11))
                              (Prims.of_int (5));
                            Vale_X64_InsVector.va_code_VPaddd
                              (Prims.of_int (5)) Prims.int_zero
                              (Prims.of_int (2));
                            Vale_X64_InsVector.va_code_Store64_buffer128
                              (Prims.of_int (3))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                              (Prims.of_int (120))
                              Vale_Arch_HeapTypes_s.Secret true;
                            Vale_X64_InsBasic.va_code_AddLea64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                              (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
                            Vale_X64_InsVector.va_code_Load128_buffer
                              Prims.int_zero (Prims.of_int (15))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                              (Prims.of_int (-128))
                              Vale_Arch_HeapTypes_s.Secret;
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (12)) (Prims.of_int (12))
                              (Prims.of_int (6));
                            Vale_X64_InsVector.va_code_VPaddd
                              (Prims.of_int (6)) (Prims.of_int (5))
                              (Prims.of_int (2));
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (13)) (Prims.of_int (13))
                              (Prims.of_int (7));
                            Vale_X64_InsVector.va_code_VPaddd
                              (Prims.of_int (7)) (Prims.of_int (6))
                              (Prims.of_int (2));
                            Vale_X64_InsAes.va_code_VAESNI_enc_last
                              (Prims.of_int (14)) (Prims.of_int (14))
                              (Prims.of_int (3));
                            Vale_X64_InsVector.va_code_VPaddd
                              (Prims.of_int (3)) (Prims.of_int (7))
                              (Prims.of_int (2))] va_mods ()

type ('alg, 'ivub, 'scratchub, 'keyuwords, 'roundukeys, 'keysub, 'ctruorig,
  'init, 'ctrs, 'plain, 'inb, 'vaus0, 'vauk) va_wp_Loop6x_final = unit

let (va_quick_Loop6x_final :
  Vale_AES_AES_s.algorithm ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                quad32_6 ->
                  quad32_6 ->
                    quad32_6 ->
                      Vale_Def_Types_s.quad32 ->
                        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun iv_b ->
      fun scratch_b ->
        fun key_words ->
          fun round_keys ->
            fun keys_b ->
              fun ctr_orig ->
                fun init ->
                  fun ctrs ->
                    fun plain ->
                      fun inb ->
                        Vale_X64_QuickCode.QProc
                          ((va_code_Loop6x_final alg),
                            [Vale_X64_QuickCode.Mod_mem_heaplet
                               (Prims.of_int (3));
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
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (9))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (7))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (6))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (5))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (3))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, (Prims.of_int (2))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, Prims.int_one));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_one, Prims.int_zero));
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
                                 (Prims.int_zero, (Prims.of_int (4))));
                            Vale_X64_QuickCode.Mod_reg
                              (Vale_X64_Machine_s.Reg
                                 (Prims.int_zero, (Prims.of_int (5))));
                            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Loop6x_save_output :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
         (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (9))
         (Prims.of_int (-96)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_VPxor (Prims.of_int (9)) Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (10))
        (Prims.of_int (-80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (10)) Prims.int_zero;
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (11))
        (Prims.of_int (-64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (11))
        (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (12))
        (Prims.of_int (-48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (12))
        (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (13))
        (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (13))
        (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (14))
        (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (14))
        (Prims.of_int (3))]
let (va_codegen_success_Loop6x_save_output : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Store128_buffer
         (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
         (Prims.of_int (9)) (Prims.of_int (-96)) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_VPxor (Prims.of_int (9))
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Store128_buffer
               (Prims.of_int (6))
               (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
               (Prims.of_int (10)) (Prims.of_int (-80))
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Mov128
                  (Prims.of_int (10)) Prims.int_zero)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                     (Prims.of_int (6))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Prims.of_int (11)) (Prims.of_int (-64))
                     Vale_Arch_HeapTypes_s.Secret)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mov128
                        (Prims.of_int (11)) (Prims.of_int (5)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                           (Prims.of_int (6))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                           (Prims.of_int (12)) (Prims.of_int (-48))
                           Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Mov128
                              (Prims.of_int (12)) (Prims.of_int (6)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                 (Prims.of_int (6))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                                 (Prims.of_int (13)) (Prims.of_int (-32))
                                 Vale_Arch_HeapTypes_s.Secret)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Mov128
                                    (Prims.of_int (13)) (Prims.of_int (7)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                       (Prims.of_int (6))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (4)))
                                       (Prims.of_int (14))
                                       (Prims.of_int (-16))
                                       Vale_Arch_HeapTypes_s.Secret)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Mov128
                                          (Prims.of_int (14))
                                          (Prims.of_int (3)))
                                       (Vale_X64_Decls.va_ttrue ()))))))))))))
let (va_qcode_Loop6x_save_output :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun count ->
      fun out_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
             (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (9))
             (Prims.of_int (-96)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_VPxor (Prims.of_int (9)) Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
          Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (10))
            (Prims.of_int (-80)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (10))
            Prims.int_zero;
          Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (11))
            (Prims.of_int (-64)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (11))
            (Prims.of_int (5));
          Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (12))
            (Prims.of_int (-48)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (12))
            (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (13))
            (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (13))
            (Prims.of_int (7));
          Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (6))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (14))
            (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (14))
            (Prims.of_int (3))] va_mods ()

type ('count, 'outub, 'vaus0, 'vauk) va_wp_Loop6x_save_output = unit

let (va_quick_Loop6x_save_output :
  Prims.nat ->
    Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun count ->
    fun out_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Loop6x_save_output ()),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_mem_heaplet (Prims.of_int (6));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (14))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (13))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (11))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_untransformedoriginal_Loop6x_partial :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [va_code_Loop6x_preamble alg;
      va_code_Loop6x_plain alg Prims.int_zero (Prims.of_int (2));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step Prims.int_zero Prims.int_zero
        Prims.int_one (Prims.of_int (5)) (Prims.of_int (6))
        (Prims.of_int (7)) (Prims.of_int (7)) (Prims.of_int (3));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step Prims.int_one Prims.int_one
        (Prims.of_int (5)) Prims.int_one (Prims.of_int (2))
        (Prims.of_int (3)) Prims.int_zero (Prims.of_int (3));
      va_code_Loop6x_plain alg Prims.int_one (Prims.of_int (15));
      va_code_Loop6x_reverse128 (Prims.of_int (5)) (Prims.of_int (2));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step (Prims.of_int (2))
        (Prims.of_int (3)) Prims.int_one (Prims.of_int (2))
        (Prims.of_int (3)) (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (5));
      va_code_Loop6x_plain alg (Prims.of_int (2)) (Prims.of_int (15));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step (Prims.of_int (3))
        (Prims.of_int (4)) (Prims.of_int (2)) (Prims.of_int (3))
        (Prims.of_int (5)) Prims.int_one Prims.int_zero Prims.int_one;
      va_code_Loop6x_plain alg (Prims.of_int (3)) (Prims.of_int (15));
      va_code_Loop6x_reverse128 (Prims.of_int (4)) (Prims.of_int (3));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step (Prims.of_int (4))
        (Prims.of_int (6)) (Prims.of_int (3)) (Prims.of_int (5))
        Prims.int_one (Prims.of_int (2)) Prims.int_zero (Prims.of_int (2));
      va_code_Loop6x_plain alg (Prims.of_int (4)) (Prims.of_int (15));
      va_code_Loop6x_reverse128 (Prims.of_int (3)) (Prims.of_int (4));
      Vale_AES_X64_AESopt2.va_code_MulAdd_step (Prims.of_int (5))
        (Prims.of_int (7)) (Prims.of_int (2)) (Prims.of_int (5))
        Prims.int_one (Prims.of_int (8)) (Prims.of_int (8))
        (Prims.of_int (3));
      va_code_Loop6x_plain alg (Prims.of_int (5)) (Prims.of_int (15));
      va_code_Loop6x_reverse128 (Prims.of_int (2)) (Prims.of_int (5));
      va_code_Load_0xc2_msb (Prims.of_int (3));
      Vale_AES_X64_AESopt2.va_code_ReduceLast false;
      va_code_Loop6x_plain alg (Prims.of_int (6)) (Prims.of_int (15));
      va_code_Loop6x_reverse128 Prims.int_one (Prims.of_int (6));
      va_code_Loop6x_plain alg (Prims.of_int (7)) Prims.int_one;
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret true;
      Vale_X64_InsVector.va_code_LoadBe64_buffer128 (Prims.of_int (6))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret false;
      va_code_Loop6x_plain alg (Prims.of_int (8)) (Prims.of_int (15));
      if alg = Vale_AES_AES_s.AES_256
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
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
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) Prims.int_one;
          va_code_Loop6x_plain alg (Prims.of_int (10)) (Prims.of_int (15));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
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
          Vale_X64_InsAes.va_code_VAESNI_enc (Prims.of_int (14))
            (Prims.of_int (14)) Prims.int_one;
          va_code_Loop6x_plain alg (Prims.of_int (12)) (Prims.of_int (15))]
      else Vale_X64_Machine_s.Block [];
      if alg = Vale_AES_AES_s.AES_256
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret];
      va_code_Loop6x_round9 alg]
let (va_codegen_success_untransformedoriginal_Loop6x_partial :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop6x_preamble alg)
      (Vale_X64_Decls.va_pbool_and
         (va_codegen_success_Loop6x_plain alg Prims.int_zero
            (Prims.of_int (2)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
               Prims.int_zero Prims.int_zero Prims.int_one (Prims.of_int (5))
               (Prims.of_int (6)) (Prims.of_int (7)) (Prims.of_int (7))
               (Prims.of_int (3)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
                  Prims.int_one Prims.int_one (Prims.of_int (5))
                  Prims.int_one (Prims.of_int (2)) (Prims.of_int (3))
                  Prims.int_zero (Prims.of_int (3)))
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Loop6x_plain alg Prims.int_one
                     (Prims.of_int (15)))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Loop6x_reverse128 (Prims.of_int (5))
                        (Prims.of_int (2)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
                           (Prims.of_int (2)) (Prims.of_int (3))
                           Prims.int_one (Prims.of_int (2))
                           (Prims.of_int (3)) (Prims.of_int (5))
                           Prims.int_zero (Prims.of_int (5)))
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_Loop6x_plain alg
                              (Prims.of_int (2)) (Prims.of_int (15)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
                                 (Prims.of_int (3)) (Prims.of_int (4))
                                 (Prims.of_int (2)) (Prims.of_int (3))
                                 (Prims.of_int (5)) Prims.int_one
                                 Prims.int_zero Prims.int_one)
                              (Vale_X64_Decls.va_pbool_and
                                 (va_codegen_success_Loop6x_plain alg
                                    (Prims.of_int (3)) (Prims.of_int (15)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (va_codegen_success_Loop6x_reverse128
                                       (Prims.of_int (4)) (Prims.of_int (3)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
                                          (Prims.of_int (4))
                                          (Prims.of_int (6))
                                          (Prims.of_int (3))
                                          (Prims.of_int (5)) Prims.int_one
                                          (Prims.of_int (2)) Prims.int_zero
                                          (Prims.of_int (2)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (va_codegen_success_Loop6x_plain
                                             alg (Prims.of_int (4))
                                             (Prims.of_int (15)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (va_codegen_success_Loop6x_reverse128
                                                (Prims.of_int (3))
                                                (Prims.of_int (4)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_AES_X64_AESopt2.va_codegen_success_MulAdd_step
                                                   (Prims.of_int (5))
                                                   (Prims.of_int (7))
                                                   (Prims.of_int (2))
                                                   (Prims.of_int (5))
                                                   Prims.int_one
                                                   (Prims.of_int (8))
                                                   (Prims.of_int (8))
                                                   (Prims.of_int (3)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (va_codegen_success_Loop6x_plain
                                                      alg (Prims.of_int (5))
                                                      (Prims.of_int (15)))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (va_codegen_success_Loop6x_reverse128
                                                         (Prims.of_int (2))
                                                         (Prims.of_int (5)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (va_codegen_success_Load_0xc2_msb
                                                            (Prims.of_int (3)))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_AES_X64_AESopt2.va_codegen_success_ReduceLast
                                                               false)
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (va_codegen_success_Loop6x_plain
                                                                  alg
                                                                  (Prims.of_int (6))
                                                                  (Prims.of_int (15)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (va_codegen_success_Loop6x_reverse128
                                                                    Prims.int_one
                                                                    (Prims.of_int (6)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Loop6x_plain
                                                                    alg
                                                                    (Prims.of_int (7))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Prims.of_int (8))
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_LoadBe64_buffer128
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    Prims.int_zero
                                                                    Vale_Arch_HeapTypes_s.Secret
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Loop6x_plain
                                                                    alg
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (if
                                                                    alg =
                                                                    Vale_AES_AES_s.AES_256
                                                                    then
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
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
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Loop6x_plain
                                                                    alg
                                                                    (Prims.of_int (10))
                                                                    (Prims.of_int (15)))
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
                                                                    (Vale_X64_InsAes.va_codegen_success_VAESNI_enc
                                                                    (Prims.of_int (14))
                                                                    (Prims.of_int (14))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Loop6x_plain
                                                                    alg
                                                                    (Prims.of_int (12))
                                                                    (Prims.of_int (15)))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))
                                                                    else
                                                                    Vale_X64_Decls.va_ttrue
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (if
                                                                    alg =
                                                                    Vale_AES_AES_s.AES_256
                                                                    then
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ())
                                                                    else
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_Loop6x_round9
                                                                    alg)
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))
let (va_qcode_untransformedoriginal_Loop6x_partial :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            Prims.nat ->
              Prims.nat ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_X64_Memory.buffer128 ->
                        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                            Vale_X64_Memory.buffer128 ->
                              Vale_X64_Memory.buffer128 ->
                                Vale_Def_Types_s.quad32 ->
                                  (quad32_6, unit)
                                    Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun h_LE ->
        fun y_prev ->
          fun data ->
            fun count ->
              fun in0_count ->
                fun iv_b ->
                  fun in0_b ->
                    fun in_b ->
                      fun scratch_b ->
                        fun key_words ->
                          fun round_keys ->
                            fun keys_b ->
                              fun hkeys_b ->
                                fun ctr_BE ->
                                  Vale_X64_QuickCodes.qblock
                                    [va_code_Loop6x_preamble alg;
                                    va_code_Loop6x_plain alg Prims.int_zero
                                      (Prims.of_int (2));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      Prims.int_zero Prims.int_zero
                                      Prims.int_one (Prims.of_int (5))
                                      (Prims.of_int (6)) (Prims.of_int (7))
                                      (Prims.of_int (7)) (Prims.of_int (3));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      Prims.int_one Prims.int_one
                                      (Prims.of_int (5)) Prims.int_one
                                      (Prims.of_int (2)) (Prims.of_int (3))
                                      Prims.int_zero (Prims.of_int (3));
                                    va_code_Loop6x_plain alg Prims.int_one
                                      (Prims.of_int (15));
                                    va_code_Loop6x_reverse128
                                      (Prims.of_int (5)) (Prims.of_int (2));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      (Prims.of_int (2)) (Prims.of_int (3))
                                      Prims.int_one (Prims.of_int (2))
                                      (Prims.of_int (3)) (Prims.of_int (5))
                                      Prims.int_zero (Prims.of_int (5));
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (2)) (Prims.of_int (15));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      (Prims.of_int (3)) (Prims.of_int (4))
                                      (Prims.of_int (2)) (Prims.of_int (3))
                                      (Prims.of_int (5)) Prims.int_one
                                      Prims.int_zero Prims.int_one;
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (3)) (Prims.of_int (15));
                                    va_code_Loop6x_reverse128
                                      (Prims.of_int (4)) (Prims.of_int (3));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      (Prims.of_int (4)) (Prims.of_int (6))
                                      (Prims.of_int (3)) (Prims.of_int (5))
                                      Prims.int_one (Prims.of_int (2))
                                      Prims.int_zero (Prims.of_int (2));
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (4)) (Prims.of_int (15));
                                    va_code_Loop6x_reverse128
                                      (Prims.of_int (3)) (Prims.of_int (4));
                                    Vale_AES_X64_AESopt2.va_code_MulAdd_step
                                      (Prims.of_int (5)) (Prims.of_int (7))
                                      (Prims.of_int (2)) (Prims.of_int (5))
                                      Prims.int_one (Prims.of_int (8))
                                      (Prims.of_int (8)) (Prims.of_int (3));
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (5)) (Prims.of_int (15));
                                    va_code_Loop6x_reverse128
                                      (Prims.of_int (2)) (Prims.of_int (5));
                                    va_code_Load_0xc2_msb (Prims.of_int (3));
                                    Vale_AES_X64_AESopt2.va_code_ReduceLast
                                      false;
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (6)) (Prims.of_int (15));
                                    va_code_Loop6x_reverse128 Prims.int_one
                                      (Prims.of_int (6));
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (7)) Prims.int_one;
                                    Vale_X64_InsVector.va_code_LoadBe64_buffer128
                                      (Prims.of_int (6))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (13)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (14)))
                                      (Prims.of_int (8))
                                      Vale_Arch_HeapTypes_s.Secret true;
                                    Vale_X64_InsVector.va_code_LoadBe64_buffer128
                                      (Prims.of_int (6))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (12)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (14))) Prims.int_zero
                                      Vale_Arch_HeapTypes_s.Secret false;
                                    va_code_Loop6x_plain alg
                                      (Prims.of_int (8)) (Prims.of_int (15));
                                    Vale_X64_QuickCodes.if_code
                                      (alg = Vale_AES_AES_s.AES_256)
                                      (Vale_X64_Machine_s.Block
                                         [Vale_X64_InsVector.va_code_Load128_buffer
                                            Prims.int_zero Prims.int_one
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (2)))
                                            (Prims.of_int (32))
                                            Vale_Arch_HeapTypes_s.Secret;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (9))
                                           (Prims.of_int (9)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (10))
                                           (Prims.of_int (10)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (11))
                                           (Prims.of_int (11)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (12))
                                           (Prims.of_int (12)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (13))
                                           (Prims.of_int (13)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (14))
                                           (Prims.of_int (14)) Prims.int_one;
                                         va_code_Loop6x_plain alg
                                           (Prims.of_int (10))
                                           (Prims.of_int (15));
                                         Vale_X64_InsVector.va_code_Load128_buffer
                                           Prims.int_zero Prims.int_one
                                           (Vale_X64_Machine_s.OReg
                                              (Prims.of_int (2)))
                                           (Prims.of_int (64))
                                           Vale_Arch_HeapTypes_s.Secret;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (9))
                                           (Prims.of_int (9)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (10))
                                           (Prims.of_int (10)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (11))
                                           (Prims.of_int (11)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (12))
                                           (Prims.of_int (12)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (13))
                                           (Prims.of_int (13)) Prims.int_one;
                                         Vale_X64_InsAes.va_code_VAESNI_enc
                                           (Prims.of_int (14))
                                           (Prims.of_int (14)) Prims.int_one;
                                         va_code_Loop6x_plain alg
                                           (Prims.of_int (12))
                                           (Prims.of_int (15))])
                                      (Vale_X64_Machine_s.Block []);
                                    Vale_X64_QuickCodes.if_code
                                      (alg = Vale_AES_AES_s.AES_256)
                                      (Vale_X64_Machine_s.Block
                                         [Vale_X64_InsVector.va_code_Load128_buffer
                                            Prims.int_zero Prims.int_one
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (2)))
                                            (Prims.of_int (96))
                                            Vale_Arch_HeapTypes_s.Secret])
                                      (Vale_X64_Machine_s.Block
                                         [Vale_X64_InsVector.va_code_Load128_buffer
                                            Prims.int_zero Prims.int_one
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (2)))
                                            (Prims.of_int (32))
                                            Vale_Arch_HeapTypes_s.Secret]);
                                    va_code_Loop6x_round9 alg] va_mods ()

let (va_transform_Loop6x_partial :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_transformation_result) =
  fun alg ->
    Vale_Transformers_Transform.reorder
      (va_code_untransformedoriginal_Loop6x_partial alg)
      (Vale_AES_X64_AESGCM_expected_code.va_code_Loop6x_partial_expected_code
         alg)
let (va_code_Loop6x_partial :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun alg -> (va_transform_Loop6x_partial alg).Vale_X64_Decls.result
let (va_codegen_success_Loop6x_partial :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (va_codegen_success_untransformedoriginal_Loop6x_partial alg)
      (va_transform_Loop6x_partial alg).Vale_X64_Decls.success

type ('alg, 'huLE, 'yuprev, 'data, 'count, 'in0ucount, 'ivub, 'in0ub, 
  'inub, 'scratchub, 'keyuwords, 'roundukeys, 'keysub, 'hkeysub, 'ctruBE,
  'vaus0, 'vauk) va_wp_Loop6x_partial = unit

let (va_quick_Loop6x_partial :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Prims.nat ->
            Prims.nat ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                          Vale_X64_Memory.buffer128 ->
                            Vale_X64_Memory.buffer128 ->
                              Vale_Def_Types_s.quad32 ->
                                (quad32_6, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun h_LE ->
      fun y_prev ->
        fun data ->
          fun count ->
            fun in0_count ->
              fun iv_b ->
                fun in0_b ->
                  fun in_b ->
                    fun scratch_b ->
                      fun key_words ->
                        fun round_keys ->
                          fun keys_b ->
                            fun hkeys_b ->
                              fun ctr_BE ->
                                Vale_X64_QuickCode.QProc
                                  ((va_code_Loop6x_partial alg),
                                    [Vale_X64_QuickCode.Mod_flags;
                                    Vale_X64_QuickCode.Mod_mem_heaplet
                                      (Prims.of_int (3));
                                    Vale_X64_QuickCode.Mod_mem_heaplet
                                      (Prims.of_int (2));
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
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (9))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (8))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (7))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (6))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (5))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (4))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (3))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, (Prims.of_int (2))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, Prims.int_one));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_one, Prims.int_zero));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_zero,
                                           (Prims.of_int (13))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_zero,
                                           (Prims.of_int (12))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_zero,
                                           (Prims.of_int (11))));
                                    Vale_X64_QuickCode.Mod_reg
                                      (Vale_X64_Machine_s.Reg
                                         (Prims.int_zero, Prims.int_one));
                                    Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Loop6x :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block [];
      va_code_Loop6x_partial alg;
      va_code_Loop6x_final alg;
      Vale_X64_InsBasic.va_code_Sub64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (6)));
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_gt
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OConst Prims.int_zero)),
          (Vale_X64_Machine_s.Block
             [va_code_Loop6x_save_output ();
             Vale_X64_Machine_s.Block [];
             Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
               (Prims.of_int (7))
               (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
               (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
             Vale_X64_Machine_s.Block []]),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsVector.va_code_Mem128_lemma ();
             Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
               (Prims.of_int (8))
               (Vale_X64_Machine_s.OMem
                  ((Vale_X64_Machine_s.MReg
                      ((Vale_X64_Machine_s.Reg
                          (Prims.int_zero, (Prims.of_int (6)))),
                        (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
             Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
               (Prims.of_int (8))
               (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]))]
let (va_codegen_success_Loop6x :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop6x_partial alg)
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Loop6x_final alg)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Sub64
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (6))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Add64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                  (Vale_X64_Machine_s.OConst (Prims.of_int (96))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Loop6x_save_output ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                           (Prims.of_int (3)) (Prims.of_int (7))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                           (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                              ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                 (Prims.of_int (8)) (Prims.of_int (8))
                                 (Vale_X64_Machine_s.OMem
                                    ((Vale_X64_Machine_s.MReg
                                        ((Vale_X64_Machine_s.Reg
                                            (Prims.int_zero,
                                              (Prims.of_int (6)))),
                                          (Prims.of_int (16)))),
                                      Vale_Arch_HeapTypes_s.Secret)))
                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                 (Prims.of_int (8)) (Prims.of_int (8))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (4))))))))
                  (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_Loop6x :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 ->
            Prims.nat ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_X64_Memory.buffer128 ->
                        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                              Vale_X64_Memory.buffer128 ->
                                Vale_X64_Memory.buffer128 ->
                                  Vale_Def_Types_s.quad32 ->
                                    Vale_Def_Types_s.quad32 ->
                                      (Vale_Def_Types_s.quad32, unit)
                                        Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun h_LE ->
        fun y_orig ->
          fun y_prev ->
            fun count ->
              fun iv_b ->
                fun in0_b ->
                  fun in_b ->
                    fun out_b ->
                      fun scratch_b ->
                        fun plain_quads ->
                          fun key_words ->
                            fun round_keys ->
                              fun keys_b ->
                                fun hkeys_b ->
                                  fun ctr_BE_orig ->
                                    fun ctr_BE ->
                                      Vale_X64_QuickCodes.qblock
                                        [Vale_X64_Machine_s.Block [];
                                        Vale_X64_Machine_s.Block [];
                                        va_code_Loop6x_partial alg;
                                        va_code_Loop6x_final alg;
                                        Vale_X64_InsBasic.va_code_Sub64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (3)))
                                          (Vale_X64_Machine_s.OConst
                                             (Prims.of_int (6)));
                                        Vale_X64_InsBasic.va_code_Add64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (14)))
                                          (Vale_X64_Machine_s.OConst
                                             (Prims.of_int (96)));
                                        Vale_X64_Machine_s.Block [];
                                        Vale_X64_Machine_s.Block [];
                                        Vale_X64_Machine_s.Block [];
                                        Vale_X64_Machine_s.Block [];
                                        Vale_X64_Machine_s.IfElse
                                          ((Vale_X64_QuickCodes.cmp_to_ocmp
                                              (Vale_X64_QuickCodes.Cmp_gt
                                                 ((Vale_X64_Machine_s.OReg
                                                     (Prims.of_int (3))),
                                                   (Vale_X64_Machine_s.OConst
                                                      Prims.int_zero)))),
                                            (Vale_X64_Machine_s.Block
                                               [va_code_Loop6x_save_output ();
                                               Vale_X64_Machine_s.Block [];
                                               Vale_X64_InsVector.va_code_Load128_buffer
                                                 (Prims.of_int (3))
                                                 (Prims.of_int (7))
                                                 (Vale_X64_Machine_s.OReg
                                                    (Prims.of_int (6)))
                                                 (Prims.of_int (32))
                                                 Vale_Arch_HeapTypes_s.Secret;
                                               Vale_X64_Machine_s.Block []]),
                                            (Vale_X64_Machine_s.Block
                                               [Vale_X64_InsVector.va_code_Mem128_lemma
                                                  ();
                                               Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                                 (Prims.of_int (8))
                                                 (Prims.of_int (8))
                                                 (Vale_X64_Machine_s.OMem
                                                    ((Vale_X64_Machine_s.MReg
                                                        ((Vale_X64_Machine_s.Reg
                                                            (Prims.int_zero,
                                                              (Prims.of_int (6)))),
                                                          (Prims.of_int (16)))),
                                                      Vale_Arch_HeapTypes_s.Secret));
                                               Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                                 (Prims.of_int (8))
                                                 (Prims.of_int (8))
                                                 (Vale_X64_Machine_s.OReg
                                                    (Prims.of_int (4)))]))]
                                        va_mods ()

type ('alg, 'huLE, 'yuorig, 'yuprev, 'count, 'ivub, 'in0ub, 'inub, 'outub,
  'scratchub, 'plainuquads, 'keyuwords, 'roundukeys, 'keysub, 'hkeysub,
  'ctruBEuorig, 'ctruBE, 'vaus0, 'vauk) va_wp_Loop6x = unit

let (va_quick_Loop6x :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Prims.nat ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                            Vale_X64_Memory.buffer128 ->
                              Vale_X64_Memory.buffer128 ->
                                Vale_Def_Types_s.quad32 ->
                                  Vale_Def_Types_s.quad32 ->
                                    (Vale_Def_Types_s.quad32, unit)
                                      Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun h_LE ->
      fun y_orig ->
        fun y_prev ->
          fun count ->
            fun iv_b ->
              fun in0_b ->
                fun in_b ->
                  fun out_b ->
                    fun scratch_b ->
                      fun plain_quads ->
                        fun key_words ->
                          fun round_keys ->
                            fun keys_b ->
                              fun hkeys_b ->
                                fun ctr_BE_orig ->
                                  fun ctr_BE ->
                                    Vale_X64_QuickCode.QProc
                                      ((va_code_Loop6x alg),
                                        [Vale_X64_QuickCode.Mod_flags;
                                        Vale_X64_QuickCode.Mod_mem_heaplet
                                          (Prims.of_int (3));
                                        Vale_X64_QuickCode.Mod_mem_heaplet
                                          (Prims.of_int (2));
                                        Vale_X64_QuickCode.Mod_mem_heaplet
                                          (Prims.of_int (6));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (15))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (14))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (13))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (12))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (11))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (10))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (9))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (8))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (7))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (6))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (5))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (4))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (3))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one,
                                               (Prims.of_int (2))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one, Prims.int_one));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_one, Prims.int_zero));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (14))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (13))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (12))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (11))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero, Prims.int_one));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (3))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (4))));
                                        Vale_X64_QuickCode.Mod_reg
                                          (Vale_X64_Machine_s.Reg
                                             (Prims.int_zero,
                                               (Prims.of_int (5))));
                                        Vale_X64_QuickCode.Mod_mem], (), ())