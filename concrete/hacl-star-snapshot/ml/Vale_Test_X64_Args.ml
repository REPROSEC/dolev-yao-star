open Prims
let (va_code_Test :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg Prims.int_zero)
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Test : Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OReg Prims.int_one))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
            (Vale_X64_Decls.va_ttrue ())))
type ('vaub0, 'vaus0, 'win, 'arg0, 'arg1, 'arg2, 'arg3, 'arg4, 'arg5, 
  'arg6, 'arg7) va_req_Test = unit
type ('vaub0, 'vaus0, 'win, 'arg0, 'arg1, 'arg2, 'arg3, 'arg4, 'arg5, 
  'arg6, 'arg7, 'vausM, 'vaufM) va_ens_Test = unit
let (va_qcode_Test :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            Vale_X64_Memory.buffer64 ->
              Vale_X64_Memory.buffer64 ->
                Vale_X64_Memory.buffer64 ->
                  Vale_X64_Memory.buffer64 ->
                    Vale_X64_Memory.buffer64 ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun arg0 ->
        fun arg1 ->
          fun arg2 ->
            fun arg3 ->
              fun arg4 ->
                fun arg5 ->
                  fun arg6 ->
                    fun arg7 ->
                      Vale_X64_QuickCodes.qblock
                        [Vale_X64_InsMem.va_code_CreateHeaplets ();
                        Vale_X64_InsBasic.va_code_Mov64
                          (Vale_X64_Machine_s.OReg Prims.int_zero)
                          (Vale_X64_Machine_s.OReg Prims.int_one);
                        Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods
                        ()

type ('win, 'arg0, 'arg1, 'arg2, 'arg3, 'arg4, 'arg5, 'arg6, 'arg7, 'vaus0,
  'vauk) va_wp_Test = unit

let (va_quick_Test :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            Vale_X64_Memory.buffer64 ->
              Vale_X64_Memory.buffer64 ->
                Vale_X64_Memory.buffer64 ->
                  Vale_X64_Memory.buffer64 ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun arg0 ->
      fun arg1 ->
        fun arg2 ->
          fun arg3 ->
            fun arg4 ->
              fun arg5 ->
                fun arg6 ->
                  fun arg7 ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_Test win),
                        [Vale_X64_QuickCode.Mod_mem_layout;
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
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, Prims.int_one));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, Prims.int_zero));
                        Vale_X64_QuickCode.Mod_mem], (), ())