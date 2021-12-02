open Prims
let (va_code_ShiftLeft128_1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Psrld (Prims.of_int (2)) (Prims.of_int (31));
      Vale_X64_InsVector.va_code_Pslld Prims.int_one Prims.int_one;
      Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (2))
        (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (2))]
let (va_codegen_success_ShiftLeft128_1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (2))
         Prims.int_one)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Psrld (Prims.of_int (2))
            (Prims.of_int (31)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Pslld Prims.int_one
               Prims.int_one)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_VPslldq4
                  (Prims.of_int (2)) (Prims.of_int (2)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one
                     (Prims.of_int (2))) (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_ShiftLeft128_1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun a ->
      Vale_X64_QuickCodes.qblock
        [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) Prims.int_one;
        Vale_X64_InsVector.va_code_Psrld (Prims.of_int (2))
          (Prims.of_int (31));
        Vale_X64_InsVector.va_code_Pslld Prims.int_one Prims.int_one;
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (2))
          (Prims.of_int (2));
        Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (2))]
        va_mods ()

type ('a, 'vaus0, 'vauk) va_wp_ShiftLeft128_1 = unit

let (va_quick_ShiftLeft128_1 :
  Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun a ->
    Vale_X64_QuickCode.QProc
      ((va_code_ShiftLeft128_1 ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_ShiftLeft2_128_1 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      Vale_X64_InsVector.va_code_Psrld (Prims.of_int (3)) (Prims.of_int (31));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Psrld (Prims.of_int (4)) (Prims.of_int (31));
      Vale_X64_InsVector.va_code_Pslld Prims.int_one Prims.int_one;
      Vale_X64_InsVector.va_code_Pslld (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (5))
        (Prims.of_int (3));
      Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
        (Prims.of_int (4));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3)) Prims.int_zero
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (3)) (Prims.of_int (3))
        (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2)) (Prims.of_int (3))]
let (va_codegen_success_ShiftLeft2_128_1 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (3))
         Prims.int_one)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Psrld (Prims.of_int (3))
            (Prims.of_int (31)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (4))
               (Prims.of_int (2)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Psrld
                  (Prims.of_int (4)) (Prims.of_int (31)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pslld Prims.int_one
                     Prims.int_one)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Pslld
                        (Prims.of_int (2)) Prims.int_one)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_VPslldq4
                           (Prims.of_int (5)) (Prims.of_int (3)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_VPslldq4
                              (Prims.of_int (4)) (Prims.of_int (4)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                                 (Prims.of_int (3)) Prims.int_zero
                                 Prims.int_zero
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Pshufd
                                    (Prims.of_int (3)) (Prims.of_int (3))
                                    (Prims.of_int (3)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Pxor
                                       (Prims.of_int (3)) (Prims.of_int (4)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Pxor
                                          Prims.int_one (Prims.of_int (5)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsVector.va_codegen_success_Pxor
                                             (Prims.of_int (2))
                                             (Prims.of_int (3)))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
let (va_qcode_ShiftLeft2_128_1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun lo ->
      fun hi ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          Vale_X64_InsVector.va_code_Psrld (Prims.of_int (3))
            (Prims.of_int (31));
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4))
            (Prims.of_int (2));
          Vale_X64_InsVector.va_code_Psrld (Prims.of_int (4))
            (Prims.of_int (31));
          Vale_X64_InsVector.va_code_Pslld Prims.int_one Prims.int_one;
          Vale_X64_InsVector.va_code_Pslld (Prims.of_int (2)) Prims.int_one;
          Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (5))
            (Prims.of_int (3));
          Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
            (Prims.of_int (4));
          Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
            Prims.int_zero Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
          Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (3))
            (Prims.of_int (3)) (Prims.of_int (3));
          Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
            (Prims.of_int (4));
          Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (5));
          Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2))
            (Prims.of_int (3))] va_mods ()

type ('lo, 'hi, 'vaus0, 'vauk) va_wp_ShiftLeft2_128_1 = unit

let (va_quick_ShiftLeft2_128_1 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun lo ->
    fun hi ->
      Vale_X64_QuickCode.QProc
        ((va_code_ShiftLeft2_128_1 ()),
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
let (va_code_ClmulRev64 :
  Prims.bool ->
    Prims.bool ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dstHi ->
    fun srcHi ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
           dstHi srcHi;
        va_code_ShiftLeft128_1 ()]
let (va_codegen_success_ClmulRev64 :
  Prims.bool -> Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun dstHi ->
    fun srcHi ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsAes.va_codegen_success_Pclmulqdq Prims.int_one
           (Prims.of_int (2)) dstHi srcHi)
        (Vale_X64_Decls.va_pbool_and (va_codegen_success_ShiftLeft128_1 ())
           (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_ClmulRev64 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly ->
        Prims.bool -> Prims.bool -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun a ->
      fun b ->
        fun dstHi ->
          fun srcHi ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one
                 (Prims.of_int (2)) dstHi srcHi;
              va_code_ShiftLeft128_1 ()] va_mods ()

type ('a, 'b, 'dstHi, 'srcHi, 'vaus0, 'vauk) va_wp_ClmulRev64 = unit

let (va_quick_ClmulRev64 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      Prims.bool -> Prims.bool -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun a ->
    fun b ->
      fun dstHi ->
        fun srcHi ->
          Vale_X64_QuickCode.QProc
            ((va_code_ClmulRev64 dstHi srcHi),
              [Vale_X64_QuickCode.Mod_reg
                 (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_High64ToLow :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_PinsrdImm dst Prims.int_zero Prims.int_zero
         (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_Pshufd dst dst (Prims.of_int (14))]
let (va_codegen_success_High64ToLow :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_PinsrdImm dst Prims.int_zero
         Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Pshufd dst dst
            (Prims.of_int (14))) (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'a, 'vaus0, 'vauk) va_wp_High64ToLow = unit

let (va_quick_High64ToLow :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun a ->
      Vale_X64_QuickCode.QProc
        ((va_code_High64ToLow dst),
          [Vale_X64_QuickCode.Mod_reg
             (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Low64ToHigh :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_PinsrdImm dst Prims.int_zero
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_Pshufd dst dst (Prims.of_int (79))]
let (va_codegen_success_Low64ToHigh :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_PinsrdImm dst Prims.int_zero
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Pshufd dst dst
            (Prims.of_int (79))) (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'a, 'vaus0, 'vauk) va_wp_Low64ToHigh = unit

let (va_quick_Low64ToHigh :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun a ->
      Vale_X64_QuickCode.QProc
        ((va_code_Low64ToHigh dst),
          [Vale_X64_QuickCode.Mod_reg
             (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_AddPoly :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Machine_s.Block [Vale_X64_InsVector.va_code_Pxor dst src]
let (va_codegen_success_AddPoly :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsVector.va_codegen_success_Pxor dst src)
        (Vale_X64_Decls.va_ttrue ())

type ('dst, 'src, 'a, 'b, 'vaus0, 'vauk) va_wp_AddPoly = unit

let (va_quick_AddPoly :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      Vale_Math_Poly2_s.poly ->
        Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      fun a ->
        fun b ->
          Vale_X64_QuickCode.QProc
            ((va_code_AddPoly dst src),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_Clmul128 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_one;
      Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
        false true;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (5));
      Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2)) true
        false;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (5));
      Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
        false false;
      Vale_X64_InsAes.va_code_Pclmulqdq (Prims.of_int (5)) (Prims.of_int (2))
        true true;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
      va_code_High64ToLow Prims.int_one;
      va_code_AddPoly (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (4));
      va_code_High64ToLow Prims.int_one;
      va_code_AddPoly (Prims.of_int (2)) Prims.int_one;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
      va_code_Low64ToHigh Prims.int_one;
      va_code_Low64ToHigh (Prims.of_int (4));
      va_code_AddPoly Prims.int_one (Prims.of_int (4));
      va_code_AddPoly Prims.int_one (Prims.of_int (5))]
let (va_codegen_success_Clmul128 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (5))
         Prims.int_one)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsAes.va_codegen_success_Pclmulqdq Prims.int_one
            (Prims.of_int (2)) false true)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (3))
               Prims.int_one)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_one
                  (Prims.of_int (5)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsAes.va_codegen_success_Pclmulqdq Prims.int_one
                     (Prims.of_int (2)) true false)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Mov128
                        (Prims.of_int (4)) Prims.int_one)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Mov128
                           Prims.int_one (Prims.of_int (5)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsAes.va_codegen_success_Pclmulqdq
                              Prims.int_one (Prims.of_int (2)) false false)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsAes.va_codegen_success_Pclmulqdq
                                 (Prims.of_int (5)) (Prims.of_int (2)) true
                                 true)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_Mov128
                                    (Prims.of_int (2)) (Prims.of_int (5)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_Mov128
                                       (Prims.of_int (5)) Prims.int_one)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsVector.va_codegen_success_Mov128
                                          Prims.int_one (Prims.of_int (3)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (va_codegen_success_High64ToLow
                                             Prims.int_one)
                                          (Vale_X64_Decls.va_pbool_and
                                             (va_codegen_success_AddPoly
                                                (Prims.of_int (2))
                                                Prims.int_one)
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_X64_InsVector.va_codegen_success_Mov128
                                                   Prims.int_one
                                                   (Prims.of_int (4)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (va_codegen_success_High64ToLow
                                                      Prims.int_one)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (va_codegen_success_AddPoly
                                                         (Prims.of_int (2))
                                                         Prims.int_one)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Mov128
                                                            Prims.int_one
                                                            (Prims.of_int (3)))
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (va_codegen_success_Low64ToHigh
                                                               Prims.int_one)
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (va_codegen_success_Low64ToHigh
                                                                  (Prims.of_int (4)))
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (va_codegen_success_AddPoly
                                                                    Prims.int_one
                                                                    (Prims.of_int (4)))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (va_codegen_success_AddPoly
                                                                    Prims.int_one
                                                                    (Prims.of_int (5)))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))
let (va_qcode_Clmul128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly ->
        ((Vale_Math_Poly2_s.poly * Vale_Math_Poly2_s.poly), unit)
          Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ab ->
      fun cd ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_one;
          Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
            false true;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (3)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (5));
          Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
            true false;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (5));
          Vale_X64_InsAes.va_code_Pclmulqdq Prims.int_one (Prims.of_int (2))
            false false;
          Vale_X64_InsAes.va_code_Pclmulqdq (Prims.of_int (5))
            (Prims.of_int (2)) true true;
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
            (Prims.of_int (5));
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
          va_code_High64ToLow Prims.int_one;
          va_code_AddPoly (Prims.of_int (2)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (4));
          va_code_High64ToLow Prims.int_one;
          va_code_AddPoly (Prims.of_int (2)) Prims.int_one;
          Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (3));
          va_code_Low64ToHigh Prims.int_one;
          va_code_Low64ToHigh (Prims.of_int (4));
          va_code_AddPoly Prims.int_one (Prims.of_int (4));
          va_code_AddPoly Prims.int_one (Prims.of_int (5))] va_mods ()

type ('ab, 'cd, 'vaus0, 'vauk) va_wp_Clmul128 = unit

let (va_quick_Clmul128 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      ((Vale_Math_Poly2_s.poly * Vale_Math_Poly2_s.poly), unit)
        Vale_X64_QuickCode.quickCode)
  =
  fun ab ->
    fun cd ->
      Vale_X64_QuickCode.QProc
        ((va_code_Clmul128 ()),
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
let (va_code_ClmulRev128 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_Clmul128 (); va_code_ShiftLeft2_128_1 ()]
let (va_codegen_success_ClmulRev128 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Clmul128 ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_ShiftLeft2_128_1 ())
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_ClmulRev128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly ->
        ((Vale_Math_Poly2_s.poly * Vale_Math_Poly2_s.poly), unit)
          Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun ab ->
      fun cd ->
        Vale_X64_QuickCodes.qblock
          [va_code_Clmul128 (); va_code_ShiftLeft2_128_1 ()] va_mods ()

type ('ab, 'cd, 'vaus0, 'vauk) va_wp_ClmulRev128 = unit

let (va_quick_ClmulRev128 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      ((Vale_Math_Poly2_s.poly * Vale_Math_Poly2_s.poly), unit)
        Vale_X64_QuickCode.quickCode)
  =
  fun ab ->
    fun cd ->
      Vale_X64_QuickCode.QProc
        ((va_code_ClmulRev128 ()),
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
let (va_code_Gf128ModulusRev :
  Vale_X64_Machine_s.reg_xmm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pxor dst dst;
      Vale_X64_InsVector.va_code_PinsrdImm dst (Prims.parse_int "3774873600")
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (12)))]
let (va_codegen_success_Gf128ModulusRev :
  Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool) =
  fun dst ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pxor dst dst)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrdImm dst
            (Prims.parse_int "3774873600") (Prims.of_int (3))
            (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
         (Vale_X64_Decls.va_ttrue ()))

type ('dst, 'vaus0, 'vauk) va_wp_Gf128ModulusRev = unit

let (va_quick_Gf128ModulusRev :
  Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun dst ->
    Vale_X64_QuickCode.QProc
      ((va_code_Gf128ModulusRev dst),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
        Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.va_mod_xmm dst], (), ())
let (va_code_ReduceMulRev128 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_ClmulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6)) (Prims.of_int (2));
      va_code_Gf128ModulusRev (Prims.of_int (2));
      va_code_ClmulRev128 ();
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5)) (Prims.of_int (2));
      va_code_Gf128ModulusRev (Prims.of_int (2));
      va_code_ClmulRev64 true true;
      va_code_AddPoly Prims.int_one (Prims.of_int (5));
      va_code_AddPoly Prims.int_one (Prims.of_int (6))]
let (va_codegen_success_ReduceMulRev128 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_ClmulRev128 ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (6))
            (Prims.of_int (2)))
         (Vale_X64_Decls.va_pbool_and
            (va_codegen_success_Gf128ModulusRev (Prims.of_int (2)))
            (Vale_X64_Decls.va_pbool_and (va_codegen_success_ClmulRev128 ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Mov128
                     (Prims.of_int (5)) (Prims.of_int (2)))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Gf128ModulusRev (Prims.of_int (2)))
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_ClmulRev64 true true)
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_AddPoly Prims.int_one
                              (Prims.of_int (5)))
                           (Vale_X64_Decls.va_pbool_and
                              (va_codegen_success_AddPoly Prims.int_one
                                 (Prims.of_int (6)))
                              (Vale_X64_Decls.va_ttrue ())))))))))
let (va_qcode_ReduceMulRev128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun a ->
      fun b ->
        Vale_X64_QuickCodes.qblock
          [va_code_ClmulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (6))
            (Prims.of_int (2));
          va_code_Gf128ModulusRev (Prims.of_int (2));
          va_code_ClmulRev128 ();
          Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5))
            (Prims.of_int (2));
          va_code_Gf128ModulusRev (Prims.of_int (2));
          va_code_ClmulRev64 true true;
          va_code_AddPoly Prims.int_one (Prims.of_int (5));
          va_code_AddPoly Prims.int_one (Prims.of_int (6))] va_mods ()

type ('a, 'b, 'vaus0, 'vauk) va_wp_ReduceMulRev128 = unit

let (va_quick_ReduceMulRev128 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun a ->
    fun b ->
      Vale_X64_QuickCode.QProc
        ((va_code_ReduceMulRev128 ()),
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
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
          Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Gf128MulRev128 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block [va_code_ReduceMulRev128 ()]
let (va_codegen_success_Gf128MulRev128 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_ReduceMulRev128 ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Gf128MulRev128 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock [va_code_ReduceMulRev128 ()] va_mods ()

type ('vaus0, 'vauk) va_wp_Gf128MulRev128 = unit

let (va_quick_Gf128MulRev128 :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Gf128MulRev128 ()),
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
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
        Vale_X64_QuickCode.Mod_flags], (), ())