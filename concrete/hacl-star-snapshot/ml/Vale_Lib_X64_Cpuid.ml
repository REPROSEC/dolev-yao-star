open Prims
let (va_code_Check_aesni_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_AES ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "33554432"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (24)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_aesni_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_AES ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst
                           (Prims.parse_int "33554432")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (24))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_And64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                              (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_And64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                                    (Vale_X64_Machine_s.OReg Prims.int_one)
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (9))))
                                 (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_Check_aesni_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_AES ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "33554432"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (24)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_aesni_support = unit

let (va_quick_Check_aesni_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_aesni_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_sha_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Sha ();
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "536870912"));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_sha_support : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OConst (Prims.of_int (7))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Sha ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_And64
                     (Vale_X64_Machine_s.OReg Prims.int_one)
                     (Vale_X64_Machine_s.OConst (Prims.parse_int "536870912")))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OReg Prims.int_one))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_Check_sha_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Sha ();
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "536870912"));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_sha_support = unit

let (va_quick_Check_sha_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_sha_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_adx_bmi2_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Adx_Bmi2 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.of_int (256)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_adx_bmi2_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OConst (Prims.of_int (7))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Adx_Bmi2 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (11))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_And64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OConst (Prims.of_int (256))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_And64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                                    (Vale_X64_Machine_s.OReg Prims.int_one)
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (9))))
                                 (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_Check_adx_bmi2_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Adx_Bmi2 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.of_int (256)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_adx_bmi2_support = unit

let (va_quick_Check_adx_bmi2_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_adx_bmi2_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_avx_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Avx ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "268435456"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (27)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_avx_support : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Avx ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst
                           (Prims.parse_int "268435456")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (27))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Check_avx_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Avx ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "268435456"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (27)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_avx_support = unit

let (va_quick_Check_avx_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_avx_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_avx2_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Avx2 ();
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.of_int (32)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_avx2_support : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OConst (Prims.of_int (7))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Avx2 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_And64
                     (Vale_X64_Machine_s.OReg Prims.int_one)
                     (Vale_X64_Machine_s.OConst (Prims.of_int (32))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OReg Prims.int_one))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_Check_avx2_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Avx2 ();
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.of_int (32)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_avx2_support = unit

let (va_quick_Check_avx2_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_avx2_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_movbe_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Movbe ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "4194304"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (21)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_movbe_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Movbe ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst
                           (Prims.parse_int "4194304")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (21))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Check_movbe_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Movbe ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "4194304"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (21)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_movbe_support = unit

let (va_quick_Check_movbe_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_movbe_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_sse_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Sse ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (512)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "67108864"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (17)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_sse_support : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Sse ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_And64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (512))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_And64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                              (Vale_X64_Machine_s.OConst
                                 (Prims.parse_int "67108864")))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Shr64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OConst
                                    (Prims.of_int (10))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Shr64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (3)))
                                    (Vale_X64_Machine_s.OConst
                                       (Prims.of_int (17))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_And64
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (3))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_And64
                                          (Vale_X64_Machine_s.OReg
                                             Prims.int_zero)
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (2))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_one)
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (9))))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
let (va_qcode_Check_sse_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Sse ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "524288"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (512)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "67108864"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (17)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_sse_support = unit

let (va_quick_Check_sse_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_sse_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_rdrand_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Rdrand ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1073741824"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (29)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_rdrand_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Rdrand ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst
                           (Prims.parse_int "1073741824")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (29))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Check_rdrand_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Rdrand ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1073741824"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (29)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_rdrand_support = unit

let (va_quick_Check_rdrand_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_rdrand_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_avx512_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Avx512 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "65536"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "131072"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1073741824"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "2147483648"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_avx512_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OConst (Prims.of_int (7))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Avx512 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Vale_X64_Machine_s.OReg Prims.int_one))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OReg Prims.int_one))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_And64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OConst
                                 (Prims.parse_int "65536")))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_And64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OConst
                                    (Prims.parse_int "131072")))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_And64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (10)))
                                    (Vale_X64_Machine_s.OConst
                                       (Prims.parse_int "1073741824")))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Shr64
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero)
                                       (Vale_X64_Machine_s.OConst
                                          Prims.int_one))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Shr64
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (10)))
                                          (Vale_X64_Machine_s.OConst
                                             (Prims.of_int (14))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_And64
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_zero)
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_one))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_one)
                                                (Vale_X64_Machine_s.OConst
                                                   (Prims.parse_int "2147483648")))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_And64
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (11)))
                                                   (Vale_X64_Machine_s.OReg
                                                      Prims.int_one))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Shr64
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (11)))
                                                      (Vale_X64_Machine_s.OConst
                                                         (Prims.of_int (15))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_And64
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_zero)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (10))))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_And64
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_zero)
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (11))))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                               (Vale_X64_Machine_s.OReg
                                                                  Prims.int_one)
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (9))))
                                                            (Vale_X64_Decls.va_ttrue
                                                               ())))))))))))))))))))
let (va_qcode_Check_avx512_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (7)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Cpuid_Avx512 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "65536"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "131072"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1073741824"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "2147483648"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_avx512_support = unit

let (va_quick_Check_avx512_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_avx512_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_osxsave_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Osxsave ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "134217728"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (26)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Check_osxsave_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OConst Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OConst Prims.int_one))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Cpuid_Osxsave ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg Prims.int_zero)
                        (Vale_X64_Machine_s.OConst
                           (Prims.parse_int "134217728")))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OConst (Prims.of_int (26))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_one)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Check_osxsave_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Cpuid_Osxsave ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "134217728"));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (26)));
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_osxsave_support = unit

let (va_quick_Check_osxsave_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_osxsave_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_avx_xcr0_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Xgetbv_Avx ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (4)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
let (va_codegen_success_Check_avx_xcr0_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Xgetbv_Avx ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_And64
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OConst (Prims.of_int (4))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Shr64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OConst Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_And64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_Check_avx_xcr0_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Xgetbv_Avx ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (4)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_avx_xcr0_support = unit

let (va_quick_Check_avx_xcr0_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_avx_xcr0_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Check_avx512_xcr0_support :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Xgetbv_Avx512 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (32)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (64)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (128)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
let (va_codegen_success_Check_avx512_xcr0_support :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Xgetbv_Avx512 ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg Prims.int_zero))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Vale_X64_Machine_s.OReg Prims.int_zero))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_And64
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OConst (Prims.of_int (32))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Vale_X64_Machine_s.OConst (Prims.of_int (64))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_And64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (128))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Shr64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                              (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Shr64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                 (Vale_X64_Machine_s.OConst Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_And64
                                    (Vale_X64_Machine_s.OReg Prims.int_zero)
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (3))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_And64
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (2))))
                                    (Vale_X64_Decls.va_ttrue ())))))))))))
let (va_qcode_Check_avx512_xcr0_support :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
         (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Xgetbv_Avx512 ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (32)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (64)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (128)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Check_avx512_xcr0_support = unit

let (va_quick_Check_avx512_xcr0_support :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Check_avx512_xcr0_support ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())