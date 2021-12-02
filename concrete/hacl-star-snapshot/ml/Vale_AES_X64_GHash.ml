open Prims
let (get_last_slice_workaround :
  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
    Prims.int -> Prims.int -> Vale_Def_Words_s.nat32 Vale_Def_Words_s.four)
  =
  fun s ->
    fun start_pos ->
      fun end_pos ->
        if
          ((Prims.int_zero <= start_pos) && (start_pos < end_pos)) &&
            (end_pos <= (FStar_Seq_Base.length s))
        then
          FStar_Seq_Properties.last
            (FStar_Seq_Base.slice s start_pos end_pos)
        else
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = Prims.int_zero;
            Vale_Def_Words_s.hi2 = Prims.int_zero;
            Vale_Def_Words_s.hi3 = Prims.int_zero
          }
let (va_code_Compute_Y0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_one]
let (va_codegen_success_Compute_Y0 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one Prims.int_one)
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Compute_Y0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_one] va_mods
      ()

type ('vaus0, 'vauk) va_wp_Compute_Y0 = unit

let (va_quick_Compute_Y0 : unit -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Compute_Y0 ()),
        [Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one))], (), ())
let (va_code_ReduceMul128_LE :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pshufb Prims.int_one (Prims.of_int (8));
      Vale_AES_X64_GF128_Mul.va_code_ReduceMulRev128 ();
      Vale_X64_InsVector.va_code_Pshufb Prims.int_one (Prims.of_int (8))]
let (va_codegen_success_ReduceMul128_LE : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pshufb Prims.int_one
         (Prims.of_int (8)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_AES_X64_GF128_Mul.va_codegen_success_ReduceMulRev128 ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Pshufb Prims.int_one
               (Prims.of_int (8))) (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_ReduceMul128_LE :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun a ->
      fun b ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsVector.va_code_Pshufb Prims.int_one (Prims.of_int (8));
          Vale_AES_X64_GF128_Mul.va_code_ReduceMulRev128 ();
          Vale_X64_InsVector.va_code_Pshufb Prims.int_one (Prims.of_int (8))]
          va_mods ()

type ('a, 'b, 'vaus0, 'vauk) va_wp_ReduceMul128_LE = unit

let (va_quick_ReduceMul128_LE :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun a ->
    fun b ->
      Vale_X64_QuickCode.QProc
        ((va_code_ReduceMul128_LE ()),
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
let (va_code_Compute_ghash_incremental_register :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
        (Prims.of_int (11));
      va_code_ReduceMul128_LE ()]
let (va_codegen_success_Compute_ghash_incremental_register :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one
         (Prims.of_int (2)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Mov128 (Prims.of_int (2))
            (Prims.of_int (11)))
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_ReduceMul128_LE ())
            (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_Compute_ghash_incremental_register :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (2))
        (Prims.of_int (11));
      va_code_ReduceMul128_LE ()] va_mods ()

type ('vaus0, 'vauk) va_wp_Compute_ghash_incremental_register = unit

let (va_quick_Compute_ghash_incremental_register :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Compute_ghash_incremental_register ()),
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
          (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
        Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one))], (), ())