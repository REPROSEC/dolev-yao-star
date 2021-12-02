open Prims
let (va_code_ShiftKey1_128 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
      Vale_AES_X64_GF128_Mul.va_code_ShiftLeft128_1 ();
      Vale_AES_X64_PolyOps.va_code_PolyAnd (Prims.of_int (3))
        (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Pcmpeqd (Prims.of_int (3))
        (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (3)) (Prims.of_int (3))
        (Prims.of_int (255));
      Vale_AES_X64_PolyOps.va_code_PolyAnd (Prims.of_int (3))
        (Prims.of_int (4));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
let (va_codegen_success_ShiftKey1_128 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_one
         (Prims.of_int (3)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_AES_X64_GF128_Mul.va_codegen_success_ShiftLeft128_1 ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_PolyOps.va_codegen_success_PolyAnd
               (Prims.of_int (3)) (Prims.of_int (5)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Pcmpeqd
                  (Prims.of_int (3)) (Prims.of_int (5)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pshufd
                     (Prims.of_int (3)) (Prims.of_int (3))
                     (Prims.of_int (255)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_AES_X64_PolyOps.va_codegen_success_PolyAnd
                        (Prims.of_int (3)) (Prims.of_int (4)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                           Prims.int_one Prims.int_one
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                        (Vale_X64_Decls.va_ttrue ())))))))
let (va_qcode_ShiftKey1_128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun f ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
        Vale_AES_X64_GF128_Mul.va_code_ShiftLeft128_1 ();
        Vale_AES_X64_PolyOps.va_code_PolyAnd (Prims.of_int (3))
          (Prims.of_int (5));
        Vale_X64_InsVector.va_code_Pcmpeqd (Prims.of_int (3))
          (Prims.of_int (5));
        Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (3))
          (Prims.of_int (3)) (Prims.of_int (255));
        Vale_AES_X64_PolyOps.va_code_PolyAnd (Prims.of_int (3))
          (Prims.of_int (4));
        Vale_AES_X64_PolyOps.va_code_VPolyAdd Prims.int_one Prims.int_one
          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))] va_mods ()

type ('f, 'vaus0, 'vauk) va_wp_ShiftKey1_128 = unit

let (va_quick_ShiftKey1_128 :
  Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun f ->
    Vale_X64_QuickCode.QProc
      ((va_code_ShiftKey1_128 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_ShiftKey1_gf128_power :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (4));
      Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (5));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4))
        (Prims.parse_int "3254779904") (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4)) Prims.int_one
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (5))
        (Prims.parse_int "2147483648") (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      va_code_ShiftKey1_128 ()]
let (va_codegen_success_ShiftKey1_gf128_power :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_ZeroXmm (Prims.of_int (4)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_ZeroXmm (Prims.of_int (5)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_PinsrdImm
               (Prims.of_int (4)) (Prims.parse_int "3254779904")
               (Prims.of_int (3))
               (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                  (Prims.of_int (4)) Prims.int_one Prims.int_zero
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                     (Prims.of_int (5)) (Prims.parse_int "2147483648")
                     (Prims.of_int (3))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_ShiftKey1_128 ())
                     (Vale_X64_Decls.va_ttrue ()))))))
let (va_qcode_ShiftKey1_gf128_power :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun h ->
      fun n ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (4));
          Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (5));
          Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4))
            (Prims.parse_int "3254779904") (Prims.of_int (3))
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4))
            Prims.int_one Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (5))
            (Prims.parse_int "2147483648") (Prims.of_int (3))
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          va_code_ShiftKey1_128 ()] va_mods ()

type ('h, 'n, 'vaus0, 'vauk) va_wp_ShiftKey1_gf128_power = unit

let (va_quick_ShiftKey1_gf128_power :
  Vale_Math_Poly2_s.poly ->
    Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun n ->
      Vale_X64_QuickCode.QProc
        ((va_code_ShiftKey1_gf128_power ()),
          [Vale_X64_QuickCode.Mod_reg
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
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Gf128_powers :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero (Prims.of_int (6));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (6));
      Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (6));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      va_code_ShiftKey1_gf128_power ();
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
        (Prims.of_int (112)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_zero;
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
        (Vale_X64_Machine_s.OReg Prims.int_zero)]
let (va_codegen_success_Gf128_powers : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_zero
         (Prims.of_int (6)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Load128_buffer
               Prims.int_one Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Mov128
                  (Prims.of_int (6)) Prims.int_one)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Mov128
                     (Prims.of_int (3)) Prims.int_one)
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_ShiftKey1_gf128_power ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                           Prims.int_one
                           (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                           Prims.int_one Prims.int_zero
                           Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Mov128
                              Prims.int_one (Prims.of_int (6)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Mov128
                                 (Prims.of_int (2)) (Prims.of_int (6)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_AES_X64_GF128_Mul.va_codegen_success_Gf128MulRev128
                                    ())
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                       (Prims.of_int (6)) Prims.int_one)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Mov128
                                          (Prims.of_int (3)) Prims.int_one)
                                       (Vale_X64_Decls.va_pbool_and
                                          (va_codegen_success_ShiftKey1_gf128_power
                                             ())
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                Prims.int_one
                                                (Vale_X64_Machine_s.OReg
                                                   (Prims.of_int (2)))
                                                Prims.int_one
                                                (Prims.of_int (16))
                                                Vale_Arch_HeapTypes_s.Secret)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsVector.va_codegen_success_Mov128
                                                   (Prims.of_int (2))
                                                   (Prims.of_int (6)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                      Prims.int_one
                                                      Prims.int_one
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (2)))
                                                      (Prims.of_int (32))
                                                      Vale_Arch_HeapTypes_s.Secret)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_AES_X64_GF128_Mul.va_codegen_success_Gf128MulRev128
                                                         ())
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Mov128
                                                            (Prims.of_int (6))
                                                            Prims.int_one)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_X64_InsVector.va_codegen_success_Mov128
                                                               (Prims.of_int (3))
                                                               Prims.int_one)
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (va_codegen_success_ShiftKey1_gf128_power
                                                                  ())
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    Prims.int_one
                                                                    (Prims.of_int (48))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_one
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_GF128_Mul.va_codegen_success_Gf128MulRev128
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (6))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (3))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_ShiftKey1_gf128_power
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    Prims.int_one
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_one
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_GF128_Mul.va_codegen_success_Gf128MulRev128
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (6))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (3))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_ShiftKey1_gf128_power
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    Prims.int_one
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (6)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_one
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_GF128_Mul.va_codegen_success_Gf128MulRev128
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (6))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (3))
                                                                    Prims.int_one)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_ShiftKey1_gf128_power
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                    Prims.int_one
                                                                    (Prims.of_int (112))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                                                    (Prims.of_int (6))
                                                                    Prims.int_zero)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (12)))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))))))))
let (va_qcode_Gf128_powers :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun h ->
      fun hkeys_b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero
             (Prims.of_int (6));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (6));
          Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (6));
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_AES_X64_GF128_Mul.va_code_Gf128MulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          va_code_ShiftKey1_gf128_power ();
          Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_one
            (Prims.of_int (112)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) Prims.int_zero;
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
            (Vale_X64_Machine_s.OReg Prims.int_zero)] va_mods ()

type ('h, 'hkeysub, 'vaus0, 'vauk) va_wp_Gf128_powers = unit

let (va_quick_Gf128_powers :
  Vale_Math_Poly2_s.poly ->
    Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun hkeys_b ->
      Vale_X64_QuickCode.QProc
        ((va_code_Gf128_powers ()),
          [Vale_X64_QuickCode.Mod_reg
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
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Keyhash_init :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    fun alg ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsMem.va_code_CreateHeaplets ();
        Vale_X64_InsVector.va_code_InitPshufbMask (Prims.of_int (4))
          (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
        Vale_X64_InsVector.va_code_ZeroXmm Prims.int_zero;
        if win
        then
          Vale_X64_Machine_s.Block
            [Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
               (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))]
        else
          Vale_X64_Machine_s.Block
            [Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
               (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))];
        Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
        Vale_X64_InsVector.va_code_Pshufb Prims.int_zero (Prims.of_int (4));
        if win
        then
          Vale_X64_Machine_s.Block
            [Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]
        else
          Vale_X64_Machine_s.Block
            [Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (4)))];
        Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
          (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
          (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
        va_code_Gf128_powers ();
        Vale_X64_Machine_s.Block [];
        Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Keyhash_init :
  Prims.bool -> Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun win ->
    fun alg ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_InitPshufbMask
              (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (8))))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_ZeroXmm Prims.int_zero)
              (Vale_X64_Decls.va_pbool_and
                 (if win
                  then
                    Vale_X64_Decls.va_pbool_and
                      (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                         Prims.int_one
                         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                         Prims.int_zero (Prims.of_int (80))
                         Vale_Arch_HeapTypes_s.Secret)
                      (Vale_X64_Decls.va_pbool_and
                         (Vale_X64_InsBasic.va_codegen_success_Mov64
                            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                            (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                         (Vale_X64_Decls.va_ttrue ()))
                  else
                    Vale_X64_Decls.va_pbool_and
                      (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                         Prims.int_one
                         (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                         Prims.int_zero (Prims.of_int (80))
                         Vale_Arch_HeapTypes_s.Secret)
                      (Vale_X64_Decls.va_pbool_and
                         (Vale_X64_InsBasic.va_codegen_success_Mov64
                            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                            (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                         (Vale_X64_Decls.va_ttrue ())))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_AES_X64_AES.va_codegen_success_AESEncryptBlock alg)
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsVector.va_codegen_success_Pshufb
                          Prims.int_zero (Prims.of_int (4)))
                       (Vale_X64_Decls.va_pbool_and
                          (if win
                           then
                             Vale_X64_Decls.va_pbool_and
                               (Vale_X64_InsBasic.va_codegen_success_Mov64
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                               (Vale_X64_Decls.va_ttrue ())
                           else
                             Vale_X64_Decls.va_pbool_and
                               (Vale_X64_InsBasic.va_codegen_success_Mov64
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                               (Vale_X64_Decls.va_ttrue ()))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                Prims.int_one
                                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                Prims.int_zero (Prims.of_int (32))
                                Vale_Arch_HeapTypes_s.Secret)
                             (Vale_X64_Decls.va_pbool_and
                                (va_codegen_success_Gf128_powers ())
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                      ()) (Vale_X64_Decls.va_ttrue ()))))))))))
type ('vaub0, 'vaus0, 'win, 'alg, 'key, 'roundkeysub,
  'hkeysub) va_req_Keyhash_init = unit
type ('vaub0, 'vaus0, 'win, 'alg, 'key, 'roundkeysub, 'hkeysub, 'vausM,
  'vaufM) va_ens_Keyhash_init = unit
let (va_qcode_Keyhash_init :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_AES_AES_s.algorithm ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun alg ->
        fun key ->
          fun roundkeys_b ->
            fun hkeys_b ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsMem.va_code_CreateHeaplets ();
                Vale_X64_InsVector.va_code_InitPshufbMask (Prims.of_int (4))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                Vale_X64_InsVector.va_code_ZeroXmm Prims.int_zero;
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsVector.va_code_Store128_buffer
                        Prims.int_one
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                        Prims.int_zero (Prims.of_int (80))
                        Vale_Arch_HeapTypes_s.Secret;
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsVector.va_code_Store128_buffer
                        Prims.int_one
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                        Prims.int_zero (Prims.of_int (80))
                        Vale_Arch_HeapTypes_s.Secret;
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)))]);
                Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
                Vale_X64_InsVector.va_code_Pshufb Prims.int_zero
                  (Prims.of_int (4));
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]);
                Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
                  (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
                va_code_Gf128_powers ();
                Vale_X64_Machine_s.Block [];
                Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('win, 'alg, 'key, 'roundkeysub, 'hkeysub, 'vaus0,
  'vauk) va_wp_Keyhash_init = unit

let (va_quick_Keyhash_init :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun alg ->
      fun key ->
        fun roundkeys_b ->
          fun hkeys_b ->
            Vale_X64_QuickCode.QProc
              ((va_code_Keyhash_init win alg),
                [Vale_X64_QuickCode.Mod_flags;
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
                Vale_X64_QuickCode.Mod_mem_layout;
                Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (12))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (8))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (3))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                Vale_X64_QuickCode.Mod_mem], (), ())