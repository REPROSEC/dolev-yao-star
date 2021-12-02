open Prims
let (va_code_Poly1305_multiply :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mul64Wrap
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Mul64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Mul64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Mul64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_IMul64
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_IMul64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.parse_int "18446744073709551612"));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))]
let (va_codegen_success_Poly1305_multiply : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mul64Wrap
         (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mul64Wrap
                     (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                        (Vale_X64_Machine_s.OReg Prims.int_zero))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mul64Wrap
                                 (Vale_X64_Machine_s.OReg Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (9)))
                                    (Vale_X64_Machine_s.OReg Prims.int_zero))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (10)))
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (3))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Mul64Wrap
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_one))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_one)
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (6))))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (14)))
                                                   (Vale_X64_Machine_s.OReg
                                                      Prims.int_zero))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (8)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (3))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_IMul64
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_one)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (13))))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (9)))
                                                            (Vale_X64_Machine_s.OReg
                                                               Prims.int_one))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                               (Vale_X64_Machine_s.OReg
                                                                  Prims.int_one)
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (8))))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                  (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_IMul64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (11))))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OConst
                                                                    (Prims.parse_int "18446744073709551612")))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (10)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))
let (va_qcode_Poly1305_multiply :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat64 -> (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun r1 ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsBasic.va_code_Mul64Wrap
           (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_Mul64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_Mul64Wrap
          (Vale_X64_Machine_s.OReg Prims.int_one);
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
        Vale_X64_InsBasic.va_code_Adc64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_Mul64Wrap
          (Vale_X64_Machine_s.OReg Prims.int_one);
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_one)
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
          (Vale_X64_Machine_s.OReg Prims.int_zero);
        Vale_X64_InsBasic.va_code_Adc64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
        Vale_X64_InsBasic.va_code_IMul64
          (Vale_X64_Machine_s.OReg Prims.int_one)
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
          (Vale_X64_Machine_s.OReg Prims.int_one);
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_one)
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
        Vale_X64_InsBasic.va_code_Adc64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OConst Prims.int_zero);
        Vale_X64_InsBasic.va_code_IMul64
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
        Vale_X64_InsBasic.va_code_Add64Wrap
          (Vale_X64_Machine_s.OReg Prims.int_one)
          (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
        Vale_X64_InsBasic.va_code_Mov64
          (Vale_X64_Machine_s.OReg Prims.int_zero)
          (Vale_X64_Machine_s.OConst (Prims.parse_int "18446744073709551612"));
        Vale_X64_InsBasic.va_code_Adc64Wrap
          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)))] va_mods ()

type ('r1, 'vaus0, 'vauk) va_wp_Poly1305_multiply = unit

let (va_quick_Poly1305_multiply :
  Vale_Def_Words_s.nat64 -> (Prims.int, unit) Vale_X64_QuickCode.quickCode) =
  fun r1 ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_multiply ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))))], (),
        ())
let (va_code_Poly1305_reduce :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_And64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OConst Prims.int_zero)]
let (va_codegen_success_Poly1305_reduce : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_And64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Shr64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_And64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Vale_X64_Machine_s.OConst (Prims.of_int (3))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                     (Vale_X64_Machine_s.OReg Prims.int_zero)
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                        (Vale_X64_Machine_s.OReg Prims.int_zero))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OConst Prims.int_zero))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                              (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                              (Vale_X64_Machine_s.OConst Prims.int_zero))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_Poly1305_reduce :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_And64
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OConst Prims.int_zero)] va_mods ()

type ('vaus0, 'vauk) va_wp_Poly1305_reduce = unit

let (va_quick_Poly1305_reduce :
  unit -> (Prims.int, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_reduce ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Poly1305_iteration :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_Poly1305_multiply (); va_code_Poly1305_reduce ()]
let (va_codegen_success_Poly1305_iteration : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Poly1305_multiply ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Poly1305_reduce ())
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_Poly1305_iteration :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat64 -> (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun r1 ->
      Vale_X64_QuickCodes.qblock
        [va_code_Poly1305_multiply (); va_code_Poly1305_reduce ()] va_mods ()

type ('r1, 'vaus0, 'vauk) va_wp_Poly1305_iteration = unit

let (va_quick_Poly1305_iteration :
  Vale_Def_Words_s.nat64 -> (Prims.int, unit) Vale_X64_QuickCode.quickCode) =
  fun r1 ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_iteration ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Poly1305_blocks_body0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 Prims.int_zero)), Vale_Arch_HeapTypes_s.Public));
      Vale_X64_InsMem.va_code_Mem64_lemma ();
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))),
                 (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Public));
      Vale_X64_InsBasic.va_code_AddLea64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      va_code_Poly1305_iteration ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsBasic.va_code_Sub64
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
        (Vale_X64_Machine_s.OConst Prims.int_one)]
let (va_codegen_success_Poly1305_blocks_body0 :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Public)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                  (Vale_X64_Machine_s.OReg Prims.int_one)
                  (Vale_X64_Machine_s.OMem
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (4)))),
                           (Prims.of_int (8)))),
                       Vale_Arch_HeapTypes_s.Public)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_AddLea64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Poly1305_iteration ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_zero)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Sub64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                                 (Vale_X64_Machine_s.OConst Prims.int_one))
                              (Vale_X64_Decls.va_ttrue ())))))))))
let (va_qcode_Poly1305_blocks_body0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_X64_Memory.buffer64 ->
        Prims.int ->
          Vale_X64_Memory.buffer64 ->
            Prims.int ->
              (unit, unit) Vale_X64_Decls.va_int_range ->
                (unit, unit) Vale_X64_Decls.va_int_range ->
                  Prims.int ->
                    Prims.int ->
                      Prims.nat ->
                        ((Prims.int * Prims.nat), unit)
                          Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_ctx_b ->
        fun va_in_h_in ->
          fun va_in_inp_b ->
            fun va_in_length ->
              fun va_in_n ->
                fun va_in_p ->
                  fun va_in_r ->
                    fun va_in_h ->
                      fun va_in_word_index ->
                        Vale_X64_QuickCodes.qblock
                          [Vale_X64_InsMem.va_code_Mem64_lemma ();
                          Vale_X64_InsBasic.va_code_Add64Wrap
                            (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                            (Vale_X64_Machine_s.OMem
                               ((Vale_X64_Machine_s.MReg
                                   ((Vale_X64_Machine_s.Reg
                                       (Prims.int_zero, (Prims.of_int (4)))),
                                     Prims.int_zero)),
                                 Vale_Arch_HeapTypes_s.Public));
                          Vale_X64_InsMem.va_code_Mem64_lemma ();
                          Vale_X64_InsBasic.va_code_Adc64Wrap
                            (Vale_X64_Machine_s.OReg Prims.int_one)
                            (Vale_X64_Machine_s.OMem
                               ((Vale_X64_Machine_s.MReg
                                   ((Vale_X64_Machine_s.Reg
                                       (Prims.int_zero, (Prims.of_int (4)))),
                                     (Prims.of_int (8)))),
                                 Vale_Arch_HeapTypes_s.Public));
                          Vale_X64_InsBasic.va_code_AddLea64
                            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                            (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
                          Vale_X64_InsBasic.va_code_Adc64Wrap
                            (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                          va_code_Poly1305_iteration ();
                          Vale_X64_InsBasic.va_code_Mov64
                            (Vale_X64_Machine_s.OReg Prims.int_zero)
                            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                          Vale_X64_InsBasic.va_code_Sub64
                            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                            (Vale_X64_Machine_s.OConst Prims.int_one)]
                          va_mods ()

type ('vauold, 'vauinuctxub, 'vauinuhuin, 'vauinuinpub, 'vauinulength,
  'vauinun, 'vauinup, 'vauinur, 'vauinuh, 'vauinuworduindex, 'vaus0,
  'vauk) va_wp_Poly1305_blocks_body0 = unit

let (va_quick_Poly1305_blocks_body0 :
  Vale_X64_State.vale_state ->
    Vale_X64_Memory.buffer64 ->
      Prims.int ->
        Vale_X64_Memory.buffer64 ->
          Prims.int ->
            (unit, unit) Vale_X64_Decls.va_int_range ->
              (unit, unit) Vale_X64_Decls.va_int_range ->
                Prims.int ->
                  Prims.int ->
                    Prims.nat ->
                      ((Prims.int * Prims.nat), unit)
                        Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_ctx_b ->
      fun va_in_h_in ->
        fun va_in_inp_b ->
          fun va_in_length ->
            fun va_in_n ->
              fun va_in_p ->
                fun va_in_r ->
                  fun va_in_h ->
                    fun va_in_word_index ->
                      Vale_X64_QuickCode.QProc
                        ((va_code_Poly1305_blocks_body0 ()),
                          [Vale_X64_QuickCode.Mod_reg
                             (Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (4))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (3))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_one));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (6))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_zero));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (9))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (8))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (15))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (14))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (10))));
                          Vale_X64_QuickCode.Mod_ok;
                          Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Poly1305_blocks_while0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.While
         ((Vale_X64_Decls.va_cmp_ne
             (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
             (Vale_X64_Machine_s.OConst Prims.int_zero)),
           (Vale_X64_Machine_s.Block [va_code_Poly1305_blocks_body0 ()]))]
let (va_codegen_success_Poly1305_blocks_while0 :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Poly1305_blocks_body0 ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Poly1305_blocks_while0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_X64_Memory.buffer64 ->
        Prims.int ->
          Vale_X64_Memory.buffer64 ->
            Prims.int ->
              (unit, unit) Vale_X64_Decls.va_int_range ->
                (unit, unit) Vale_X64_Decls.va_int_range ->
                  Prims.int ->
                    Prims.int ->
                      Prims.nat ->
                        ((Prims.int * Prims.nat), unit)
                          Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_ctx_b ->
        fun va_in_h_in ->
          fun va_in_inp_b ->
            fun va_in_length ->
              fun va_in_n ->
                fun va_in_p ->
                  fun va_in_r ->
                    fun va_in_h ->
                      fun va_in_word_index ->
                        Vale_X64_QuickCodes.qblock
                          [Vale_X64_Machine_s.While
                             ((Vale_X64_QuickCodes.cmp_to_ocmp
                                 (Vale_X64_QuickCodes.Cmp_ne
                                    ((Vale_X64_Machine_s.OReg
                                        (Prims.of_int (15))),
                                      (Vale_X64_Machine_s.OConst
                                         Prims.int_zero)))),
                               (Vale_X64_Machine_s.Block
                                  [va_code_Poly1305_blocks_body0 ()]))]
                          va_mods ()

type ('vauold, 'vauinuctxub, 'vauinuhuin, 'vauinuinpub, 'vauinulength,
  'vauinun, 'vauinup, 'vauinur, 'vauinuh, 'vauinuworduindex, 'vaus0,
  'vauk) va_wp_Poly1305_blocks_while0 = unit

let (va_quick_Poly1305_blocks_while0 :
  Vale_X64_State.vale_state ->
    Vale_X64_Memory.buffer64 ->
      Prims.int ->
        Vale_X64_Memory.buffer64 ->
          Prims.int ->
            (unit, unit) Vale_X64_Decls.va_int_range ->
              (unit, unit) Vale_X64_Decls.va_int_range ->
                Prims.int ->
                  Prims.int ->
                    Prims.nat ->
                      ((Prims.int * Prims.nat), unit)
                        Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_ctx_b ->
      fun va_in_h_in ->
        fun va_in_inp_b ->
          fun va_in_length ->
            fun va_in_n ->
              fun va_in_p ->
                fun va_in_r ->
                  fun va_in_h ->
                    fun va_in_word_index ->
                      Vale_X64_QuickCode.QProc
                        ((va_code_Poly1305_blocks_while0 ()),
                          [Vale_X64_QuickCode.Mod_reg
                             (Vale_X64_Machine_s.Reg
                                (Prims.int_zero, (Prims.of_int (4))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (3))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_one));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (6))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_zero));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (9))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (8))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (15))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (14))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (10))));
                          Vale_X64_QuickCode.Mod_ok;
                          Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Poly1305_blocks :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Shr64
         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
         (Vale_X64_Machine_s.OConst (Prims.of_int (4)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      va_code_Poly1305_blocks_while0 ();
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Public]
let (va_codegen_success_Poly1305_blocks : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Shr64
         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
         (Vale_X64_Machine_s.OConst (Prims.of_int (4))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Public)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                  Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Public)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                     Prims.int_one
                     (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     Prims.int_zero Vale_Arch_HeapTypes_s.Public)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                        Prims.int_one (Vale_X64_Machine_s.OReg Prims.int_one)
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                        (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Public)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                           Prims.int_one
                           (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Public)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Shr64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                                 (Vale_X64_Machine_s.OConst
                                    (Prims.of_int (2))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                                    (Vale_X64_Machine_s.OReg Prims.int_zero)
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (12))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Add64
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13)))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (12))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_Poly1305_blocks_while0
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                             Prims.int_one
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (5)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (14)))
                                             Prims.int_zero
                                             Vale_Arch_HeapTypes_s.Public)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                Prims.int_one
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (5)))
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_one)
                                                (Prims.of_int (8))
                                                Vale_Arch_HeapTypes_s.Public)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                   Prims.int_one
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (5)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (6)))
                                                   (Prims.of_int (16))
                                                   Vale_Arch_HeapTypes_s.Public)
                                                (Vale_X64_Decls.va_ttrue ())))))))))))))))
let (va_qcode_Poly1305_blocks :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.int ->
      Prims.int ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun r ->
      fun h_in ->
        fun ctx_b ->
          fun inp_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Shr64
                 (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                 (Vale_X64_Machine_s.OConst (Prims.of_int (4)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_zero
                Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsBasic.va_code_Shr64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg Prims.int_zero)
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsBasic.va_code_Add64
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              va_code_Poly1305_blocks_while0 ();
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (14))) Prims.int_zero
                Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (8))
                Vale_Arch_HeapTypes_s.Public;
              Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Public] va_mods ()

type ('r, 'huin, 'ctxub, 'inpub, 'vaus0, 'vauk) va_wp_Poly1305_blocks = unit

let (va_quick_Poly1305_blocks :
  Prims.int ->
    Prims.int ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun r ->
    fun h_in ->
      fun ctx_b ->
        fun inp_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Poly1305_blocks ()),
              [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Poly1305_last_block :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.IfElse
         ((Vale_X64_Decls.va_cmp_lt
             (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
             (Vale_X64_Machine_s.OConst (Prims.of_int (8)))),
           (Vale_X64_Machine_s.Block
              [Vale_X64_InsBasic.va_code_Mov64
                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_And64
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero)]),
           (Vale_X64_Machine_s.Block
              [Vale_X64_Machine_s.Block [];
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_Machine_s.Block [];
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_And64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero)]));
      va_code_Poly1305_iteration ()]
let (va_codegen_success_Poly1305_last_block :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Shl64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (3))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Vale_X64_Machine_s.OConst Prims.int_one))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Shl64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Sub64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                           (Vale_X64_Machine_s.OConst Prims.int_one))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_And64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                                 (Vale_X64_Machine_s.OConst Prims.int_zero))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14)))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (8))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                       (Vale_X64_Machine_s.OReg Prims.int_one)
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (9))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (6)))
                                          (Vale_X64_Machine_s.OConst
                                             Prims.int_zero))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (14)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (3))))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_one)
                                                (Vale_X64_Machine_s.OConst
                                                   Prims.int_zero))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (6)))
                                                   (Vale_X64_Machine_s.OConst
                                                      Prims.int_zero))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (2)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (15))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Sub64
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (2)))
                                                         (Vale_X64_Machine_s.OConst
                                                            (Prims.of_int (8))))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsBasic.va_codegen_success_Shl64
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (2)))
                                                            (Vale_X64_Machine_s.OConst
                                                               (Prims.of_int (3))))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (3)))
                                                               (Vale_X64_Machine_s.OConst
                                                                  Prims.int_one))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsBasic.va_codegen_success_Shl64
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Sub64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_And64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Machine_s.OConst
                                                                    Prims.int_zero)))))))))))))))))))))))))))))
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_Poly1305_iteration ())
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_Poly1305_last_block :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_Machine_s.IfElse
         ((Vale_X64_QuickCodes.cmp_to_ocmp
             (Vale_X64_QuickCodes.Cmp_lt
                ((Vale_X64_Machine_s.OReg (Prims.of_int (15))),
                  (Vale_X64_Machine_s.OConst (Prims.of_int (8)))))),
           (Vale_X64_Machine_s.Block
              [Vale_X64_InsBasic.va_code_Mov64
                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_And64
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero)]),
           (Vale_X64_Machine_s.Block
              [Vale_X64_Machine_s.Block [];
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_Shl64
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_Machine_s.Block [];
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Sub64
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                (Vale_X64_Machine_s.OConst Prims.int_one);
              Vale_X64_InsBasic.va_code_And64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Add64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                (Vale_X64_Machine_s.OConst Prims.int_zero);
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg Prims.int_one)
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
              Vale_X64_InsBasic.va_code_Adc64Wrap
                (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                (Vale_X64_Machine_s.OConst Prims.int_zero)]));
      va_code_Poly1305_iteration ()] va_mods ()

type ('vaus0, 'vauk) va_wp_Poly1305_last_block = unit

let (va_quick_Poly1305_last_block :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_last_block ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
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
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))], (), ())
let (va_code_Poly1305_reduce_last :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Add64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
let (va_codegen_success_Poly1305_reduce_last :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg Prims.int_one))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                  (Vale_X64_Machine_s.OConst (Prims.of_int (5))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (Vale_X64_Machine_s.OConst Prims.int_zero))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Vale_X64_Machine_s.OConst Prims.int_zero))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Shr64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg Prims.int_zero)
                              (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OConst Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_And64
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14)))
                                    (Vale_X64_Machine_s.OReg Prims.int_zero))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_And64
                                       (Vale_X64_Machine_s.OReg Prims.int_one)
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                                          (Vale_X64_Machine_s.OReg
                                             Prims.int_zero)
                                          (Vale_X64_Machine_s.OConst
                                             Prims.int_zero))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsBasic.va_codegen_success_Sub64Wrap
                                             (Vale_X64_Machine_s.OReg
                                                Prims.int_zero)
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (10))))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_And64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (8)))
                                                (Vale_X64_Machine_s.OReg
                                                   Prims.int_zero))
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsBasic.va_codegen_success_And64
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (9)))
                                                   (Vale_X64_Machine_s.OReg
                                                      Prims.int_zero))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsBasic.va_codegen_success_Add64
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (14)))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (8))))
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsBasic.va_codegen_success_Add64
                                                         (Vale_X64_Machine_s.OReg
                                                            Prims.int_one)
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (9))))
                                                      (Vale_X64_Decls.va_ttrue
                                                         ())))))))))))))))))
let (va_qcode_Poly1305_reduce_last :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsBasic.va_code_Add64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Sub64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
      Vale_X64_InsBasic.va_code_Add64 (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Poly1305_reduce_last = unit

let (va_quick_Poly1305_reduce_last :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_reduce_last ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8))))], (),
        ())
let (va_code_Poly1305_add_key_s :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Add64Wrap
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
         (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
let (va_codegen_success_Poly1305_add_key_s : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Add64Wrap
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
         (Vale_X64_Machine_s.OReg Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Adc64Wrap
            (Vale_X64_Machine_s.OReg Prims.int_one)
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_Poly1305_add_key_s :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsBasic.va_code_Add64Wrap
         (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
         (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Adc64Wrap
        (Vale_X64_Machine_s.OReg Prims.int_one)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))] va_mods ()

type ('vaus0, 'vauk) va_wp_Poly1305_add_key_s = unit

let (va_quick_Poly1305_add_key_s :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Poly1305_add_key_s ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))))],
        (), ())

let (va_code_Poly1305_impl :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (24))
         Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1152921487695413247"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.parse_int "1152921487695413244"));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11))) (Prims.of_int (24))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OConst (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_Sub64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_zero) (Prims.of_int (56))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (64))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst Prims.int_one);
      va_code_Poly1305_blocks ();
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (184))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_eq (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OConst Prims.int_one)),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Prims.of_int (56)) Vale_Arch_HeapTypes_s.Public;
             Vale_X64_Machine_s.IfElse
               ((Vale_X64_Decls.va_cmp_ne
                   (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                   (Vale_X64_Machine_s.OConst Prims.int_zero)),
                 (Vale_X64_Machine_s.Block
                    [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                       (Vale_X64_Machine_s.OReg Prims.int_zero)
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                       (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Public;
                    Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                      (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                      Prims.int_zero Vale_Arch_HeapTypes_s.Public;
                    Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
                      (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                      (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Public;
                    va_code_Poly1305_last_block ()]),
                 (Vale_X64_Machine_s.Block []));
             va_code_Poly1305_reduce_last ();
             Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Prims.of_int (40)) Vale_Arch_HeapTypes_s.Public;
             Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Public;
             va_code_Poly1305_add_key_s ()]), (Vale_X64_Machine_s.Block []))]
let (va_codegen_success_Poly1305_impl : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_one
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (24))
         Vale_Arch_HeapTypes_s.Public)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (5))) (Prims.of_int (32))
            Vale_Arch_HeapTypes_s.Public)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OConst
                  (Prims.parse_int "1152921487695413247")))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_And64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                     (Vale_X64_Machine_s.OConst
                        (Prims.parse_int "1152921487695413244")))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_And64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                           Prims.int_one
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Public)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                              Prims.int_one
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                              (Prims.of_int (32))
                              Vale_Arch_HeapTypes_s.Public)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_And64
                                    (Vale_X64_Machine_s.OReg Prims.int_zero)
                                    (Vale_X64_Machine_s.OConst
                                       (Prims.of_int (15))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Sub64
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (3)))
                                       (Vale_X64_Machine_s.OReg
                                          Prims.int_zero))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                          Prims.int_one
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (5)))
                                          (Vale_X64_Machine_s.OReg
                                             Prims.int_zero)
                                          (Prims.of_int (56))
                                          Vale_Arch_HeapTypes_s.Public)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                             Prims.int_one
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (5)))
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (3)))
                                             (Prims.of_int (64))
                                             Vale_Arch_HeapTypes_s.Public)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (2)))
                                                (Vale_X64_Machine_s.OConst
                                                   Prims.int_one))
                                             (Vale_X64_Decls.va_pbool_and
                                                (va_codegen_success_Poly1305_blocks
                                                   ())
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                      Prims.int_one
                                                      (Vale_X64_Machine_s.OReg
                                                         Prims.int_zero)
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (5)))
                                                      (Prims.of_int (184))
                                                      Vale_Arch_HeapTypes_s.Public)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                            Prims.int_one
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (15)))
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (5)))
                                                            (Prims.of_int (56))
                                                            Vale_Arch_HeapTypes_s.Public)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                  Prims.int_one
                                                                  (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                  (Prims.of_int (32))
                                                                  Vale_Arch_HeapTypes_s.Public)
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    Prims.int_zero
                                                                    Vale_Arch_HeapTypes_s.Public)
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4)))
                                                                    (Prims.of_int (8))
                                                                    Vale_Arch_HeapTypes_s.Public)
                                                                    (va_codegen_success_Poly1305_last_block
                                                                    ()))))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (va_codegen_success_Poly1305_reduce_last
                                                                  ())
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Prims.of_int (40))
                                                                    Vale_Arch_HeapTypes_s.Public)
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_Load64_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Public)
                                                                    (va_codegen_success_Poly1305_add_key_s
                                                                    ()))))))
                                                      (Vale_X64_Decls.va_ttrue
                                                         ())))))))))))))))))
let (va_qcode_Poly1305_impl :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat128 ->
      Vale_Def_Words_s.nat128 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            Vale_Def_Words_s.nat64 ->
              (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun key_r ->
      fun key_s ->
        fun ctx_b ->
          fun inp_b ->
            fun finish ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                   (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                   (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OConst
                     (Prims.parse_int "1152921487695413247"));
                Vale_X64_InsBasic.va_code_And64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OConst
                     (Prims.parse_int "1152921487695413244"));
                Vale_X64_InsBasic.va_code_And64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                  (Prims.of_int (24)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                  (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                Vale_X64_InsBasic.va_code_And64
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OConst (Prims.of_int (15)));
                Vale_X64_InsBasic.va_code_Sub64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Prims.of_int (56)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OConst Prims.int_one);
                va_code_Poly1305_blocks ();
                Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Prims.of_int (184)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_Machine_s.IfElse
                  ((Vale_X64_QuickCodes.cmp_to_ocmp
                      (Vale_X64_QuickCodes.Cmp_eq
                         ((Vale_X64_Machine_s.OReg Prims.int_zero),
                           (Vale_X64_Machine_s.OConst Prims.int_one)))),
                    (Vale_X64_Machine_s.Block
                       [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                          (Prims.of_int (56)) Vale_Arch_HeapTypes_s.Public;
                       Vale_X64_Machine_s.IfElse
                         ((Vale_X64_QuickCodes.cmp_to_ocmp
                             (Vale_X64_QuickCodes.Cmp_ne
                                ((Vale_X64_Machine_s.OReg (Prims.of_int (15))),
                                  (Vale_X64_Machine_s.OConst Prims.int_zero)))),
                           (Vale_X64_Machine_s.Block
                              [Vale_X64_InsMem.va_code_Load64_buffer
                                 Prims.int_one
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                 (Prims.of_int (32))
                                 Vale_Arch_HeapTypes_s.Public;
                              Vale_X64_InsMem.va_code_Load64_buffer
                                Prims.int_zero
                                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                                Prims.int_zero Vale_Arch_HeapTypes_s.Public;
                              Vale_X64_InsMem.va_code_Load64_buffer
                                Prims.int_zero
                                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                                (Prims.of_int (8))
                                Vale_Arch_HeapTypes_s.Public;
                              va_code_Poly1305_last_block ()]),
                           (Vale_X64_Machine_s.Block []));
                       va_code_Poly1305_reduce_last ();
                       Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                         (Vale_X64_Machine_s.OReg Prims.int_zero)
                         (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                         (Prims.of_int (40)) Vale_Arch_HeapTypes_s.Public;
                       Vale_X64_InsMem.va_code_Load64_buffer Prims.int_one
                         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                         (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                         (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Public;
                       va_code_Poly1305_add_key_s ()]),
                    (Vale_X64_Machine_s.Block []))] va_mods ()

type ('keyur, 'keyus, 'ctxub, 'inpub, 'finish, 'vaus0,
  'vauk) va_wp_Poly1305_impl = unit

let (va_quick_Poly1305_impl :
  Vale_Def_Words_s.nat128 ->
    Vale_Def_Words_s.nat128 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_Def_Words_s.nat64 ->
            (Prims.int, unit) Vale_X64_QuickCode.quickCode)
  =
  fun key_r ->
    fun key_s ->
      fun ctx_b ->
        fun inp_b ->
          fun finish ->
            Vale_X64_QuickCode.QProc
              ((va_code_Poly1305_impl ()),
                [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                Vale_X64_QuickCode.Mod_flags;
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
                     (Prims.int_zero, (Prims.of_int (6))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (4))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (5))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Poly1305 :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
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
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (184))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      va_code_Poly1305_impl ();
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (14))) Prims.int_zero
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (6))) (Prims.of_int (16))
        Vale_Arch_HeapTypes_s.Public;
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Poly1305 : Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
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
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                             (Vale_X64_Decls.va_ttrue ()))))
                else Vale_X64_Decls.va_ttrue ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                     Prims.int_one
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                     (Prims.of_int (184)) Vale_Arch_HeapTypes_s.Public)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsStack.va_codegen_success_Push_Secret
                        (Vale_X64_Machine_s.OReg Prims.int_one))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsStack.va_codegen_success_Push_Secret
                           (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Push_Secret
                              (Vale_X64_Machine_s.OReg Prims.int_zero))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (11))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (12))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (14))))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                             (Vale_X64_Machine_s.OReg
                                                (Prims.of_int (15))))
                                          (Vale_X64_Decls.va_pbool_and
                                             (va_codegen_success_Poly1305_impl
                                                ())
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                   Prims.int_one
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (5)))
                                                   (Vale_X64_Machine_s.OReg
                                                      (Prims.of_int (14)))
                                                   Prims.int_zero
                                                   Vale_Arch_HeapTypes_s.Public)
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                      Prims.int_one
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (5)))
                                                      (Vale_X64_Machine_s.OReg
                                                         Prims.int_one)
                                                      (Prims.of_int (8))
                                                      Vale_Arch_HeapTypes_s.Public)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                                         Prims.int_one
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (5)))
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (6)))
                                                         (Prims.of_int (16))
                                                         Vale_Arch_HeapTypes_s.Public)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (15))))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                               (Vale_X64_Machine_s.OReg
                                                                  (Prims.of_int (14))))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                  (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12))))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (4))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                                                    ())
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ())))))))))))))))))))))))))))
type ('vaub0, 'vaus0, 'win, 'ctxub, 'inpub, 'lenuin,
  'finishuin) va_req_Poly1305 = unit
type ('vaub0, 'vaus0, 'win, 'ctxub, 'inpub, 'lenuin, 'finishuin, 'vausM,
  'vaufM) va_ens_Poly1305 = unit
let (va_qcode_Poly1305 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_Def_Words_s.nat64 ->
            Vale_Def_Words_s.nat64 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun ctx_b ->
        fun inp_b ->
          fun len_in ->
            fun finish_in ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsMem.va_code_CreateHeaplets ();
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
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
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (9)))])
                  (Vale_X64_Machine_s.Block []);
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Prims.of_int (184)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                va_code_Poly1305_impl ();
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)))
                  Prims.int_zero Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg Prims.int_one) (Prims.of_int (8))
                  Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Public;
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_InsBasic.va_code_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('win, 'ctxub, 'inpub, 'lenuin, 'finishuin, 'vaus0,
  'vauk) va_wp_Poly1305 = unit

let (va_quick_Poly1305 :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_Def_Words_s.nat64 ->
          Vale_Def_Words_s.nat64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun ctx_b ->
      fun inp_b ->
        fun len_in ->
          fun finish_in ->
            Vale_X64_QuickCode.QProc
              ((va_code_Poly1305 win),
                [Vale_X64_QuickCode.Mod_stackTaint;
                Vale_X64_QuickCode.Mod_stack;
                Vale_X64_QuickCode.Mod_mem_layout;
                Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                Vale_X64_QuickCode.Mod_flags;
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