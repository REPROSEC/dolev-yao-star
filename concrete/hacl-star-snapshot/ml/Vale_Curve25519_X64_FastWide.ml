open Prims
let (va_code_Fmul :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_LargeComment
        "Compute the raw multiplication: tmp <- src1 * src2";
      Vale_Curve25519_X64_FastMul.va_code_Fast_multiply Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Line up pointers";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_LargeComment
        "Wrap the result back into the field";
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fmul : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_LargeComment
            "Compute the raw multiplication: tmp <- src1 * src2")
         (Vale_X64_Decls.va_pbool_and
            (Vale_Curve25519_X64_FastMul.va_codegen_success_Fast_multiply
               Prims.int_zero)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Newline ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Comment
                     "Line up pointers")
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_LargeComment
                              "Wrap the result back into the field")
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                 Prims.int_zero)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                    ()) (Vale_X64_Decls.va_ttrue ()))))))))))
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'inBub) va_req_Fmul = unit
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'inBub, 'vausM,
  'vaufM) va_ens_Fmul = unit
let (va_qcode_Fmul :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsMem.va_code_CreateHeaplets ();
              Vale_X64_InsBasic.va_code_LargeComment
                "Compute the raw multiplication: tmp <- src1 * src2";
              Vale_Curve25519_X64_FastMul.va_code_Fast_multiply
                Prims.int_zero;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_Comment "Line up pointers";
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_LargeComment
                "Wrap the result back into the field";
              Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide
                Prims.int_zero;
              Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('tmpub, 'inAub, 'dstub, 'inBub, 'vaus0, 'vauk) va_wp_Fmul = unit

let (va_quick_Fmul :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun tmp_b ->
    fun inA_b ->
      fun dst_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fmul ()),
              [Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
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
let (va_code_Fmul_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fmul ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))]
let (va_codegen_success_Fmul_stdcall : Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push_Secret
               (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsStack.va_codegen_success_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one))
               (Vale_X64_Decls.va_pbool_and
                  (if win
                   then
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Push_Secret
                          (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsBasic.va_codegen_success_Mov64
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4)))
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (3))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsBasic.va_codegen_success_Mov64
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (15)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (8))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsBasic.va_codegen_success_Mov64
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (2)))
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (9))))
                                      (Vale_X64_Decls.va_ttrue ()))))))
                   else
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                       (Vale_X64_Decls.va_ttrue ()))
                  (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fmul ())
                     (Vale_X64_Decls.va_pbool_and
                        (if win
                         then
                           Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4))))
                                (Vale_X64_Decls.va_ttrue ()))
                         else Vale_X64_Decls.va_ttrue ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                              (Vale_X64_Machine_s.OReg Prims.int_one))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13))))
                                    (Vale_X64_Decls.va_ttrue ())))))))))))
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub,
  'inBub) va_req_Fmul_stdcall = unit
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub, 'inBub, 'vausM,
  'vaufM) va_ens_Fmul_stdcall = unit
let (va_qcode_Fmul_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            Vale_X64_Memory.buffer64 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun tmp_b ->
        fun inA_b ->
          fun dst_b ->
            fun inB_b ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsStack.va_code_Push_Secret
                   (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Push_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (9)))])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
                va_code_Fmul ();
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Pop_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                  (Vale_X64_Machine_s.Block []);
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (13)))] va_mods ()

type ('win, 'tmpub, 'inAub, 'dstub, 'inBub, 'vaus0,
  'vauk) va_wp_Fmul_stdcall = unit

let (va_quick_Fmul_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          fun inB_b ->
            Vale_X64_QuickCode.QProc
              ((va_code_Fmul_stdcall win),
                [Vale_X64_QuickCode.Mod_stackTaint;
                Vale_X64_QuickCode.Mod_stack;
                Vale_X64_QuickCode.Mod_mem_layout;
                Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
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
let (va_code_Fmul2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_LargeComment
        "Compute the raw multiplication tmp[0] <- f1[0] * f2[0]";
      Vale_Curve25519_X64_FastMul.va_code_Fast_multiply Prims.int_zero;
      Vale_X64_InsBasic.va_code_LargeComment
        "Compute the raw multiplication tmp[1] <- f1[1] * f2[1]";
      Vale_Curve25519_X64_FastMul.va_code_Fast_multiply (Prims.of_int (4));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Line up pointers";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsBasic.va_code_LargeComment
        "Wrap the results back into the field";
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide (Prims.of_int (4));
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fmul2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_LargeComment
            "Compute the raw multiplication tmp[0] <- f1[0] * f2[0]")
         (Vale_X64_Decls.va_pbool_and
            (Vale_Curve25519_X64_FastMul.va_codegen_success_Fast_multiply
               Prims.int_zero)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_LargeComment
                  "Compute the raw multiplication tmp[1] <- f1[1] * f2[1]")
               (Vale_X64_Decls.va_pbool_and
                  (Vale_Curve25519_X64_FastMul.va_codegen_success_Fast_multiply
                     (Prims.of_int (4)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Newline ())
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Comment
                           "Line up pointers")
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsBasic.va_codegen_success_LargeComment
                                    "Wrap the results back into the field")
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                       Prims.int_zero)
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_X64_InsBasic.va_codegen_success_Newline
                                          ())
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                             (Prims.of_int (4)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                                ())
                                             (Vale_X64_Decls.va_ttrue ()))))))))))))))
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'inBub) va_req_Fmul2 = unit
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'inBub, 'vausM,
  'vaufM) va_ens_Fmul2 = unit
let (va_qcode_Fmul2 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          fun inB_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsMem.va_code_CreateHeaplets ();
              Vale_X64_InsBasic.va_code_LargeComment
                "Compute the raw multiplication tmp[0] <- f1[0] * f2[0]";
              Vale_Curve25519_X64_FastMul.va_code_Fast_multiply
                Prims.int_zero;
              Vale_X64_InsBasic.va_code_LargeComment
                "Compute the raw multiplication tmp[1] <- f1[1] * f2[1]";
              Vale_Curve25519_X64_FastMul.va_code_Fast_multiply
                (Prims.of_int (4));
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_X64_InsBasic.va_code_Comment "Line up pointers";
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
              Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsBasic.va_code_LargeComment
                "Wrap the results back into the field";
              Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide
                Prims.int_zero;
              Vale_X64_InsBasic.va_code_Newline ();
              Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide
                (Prims.of_int (4));
              Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('tmpub, 'inAub, 'dstub, 'inBub, 'vaus0, 'vauk) va_wp_Fmul2 = unit

let (va_quick_Fmul2 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun tmp_b ->
    fun inA_b ->
      fun dst_b ->
        fun inB_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fmul2 ()),
              [Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
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
let (va_code_Fmul2_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fmul2 ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))]
let (va_codegen_success_Fmul2_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push_Secret
               (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsStack.va_codegen_success_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one))
               (Vale_X64_Decls.va_pbool_and
                  (if win
                   then
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Push_Secret
                          (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsBasic.va_codegen_success_Mov64
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsBasic.va_codegen_success_Mov64
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4)))
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (3))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsBasic.va_codegen_success_Mov64
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (15)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (8))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsBasic.va_codegen_success_Mov64
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (2)))
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (9))))
                                      (Vale_X64_Decls.va_ttrue ()))))))
                   else
                     Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                       (Vale_X64_Decls.va_ttrue ()))
                  (Vale_X64_Decls.va_pbool_and (va_codegen_success_Fmul2 ())
                     (Vale_X64_Decls.va_pbool_and
                        (if win
                         then
                           Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (4))))
                                (Vale_X64_Decls.va_ttrue ()))
                         else Vale_X64_Decls.va_ttrue ())
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                              (Vale_X64_Machine_s.OReg Prims.int_one))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (14))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (13))))
                                    (Vale_X64_Decls.va_ttrue ())))))))))))
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub,
  'inBub) va_req_Fmul2_stdcall = unit
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub, 'inBub, 'vausM,
  'vaufM) va_ens_Fmul2_stdcall = unit
let (va_qcode_Fmul2_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            Vale_X64_Memory.buffer64 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun tmp_b ->
        fun inA_b ->
          fun dst_b ->
            fun inB_b ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsStack.va_code_Push_Secret
                   (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                Vale_X64_InsStack.va_code_Push_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Push_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                     Vale_X64_InsStack.va_code_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (9)))])
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
                va_code_Fmul2 ();
                Vale_X64_QuickCodes.if_code win
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_InsStack.va_code_Pop_Secret
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                     Vale_X64_InsStack.va_code_Pop_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                  (Vale_X64_Machine_s.Block []);
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                Vale_X64_InsStack.va_code_Pop_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (13)))] va_mods ()

type ('win, 'tmpub, 'inAub, 'dstub, 'inBub, 'vaus0,
  'vauk) va_wp_Fmul2_stdcall = unit

let (va_quick_Fmul2_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          fun inB_b ->
            Vale_X64_QuickCode.QProc
              ((va_code_Fmul2_stdcall win),
                [Vale_X64_QuickCode.Mod_stackTaint;
                Vale_X64_QuickCode.Mod_stack;
                Vale_X64_QuickCode.Mod_mem_layout;
                Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
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
let (va_code_Fsqr :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_X64_InsBasic.va_code_LargeComment
        "Compute the raw multiplication: tmp <- f * f";
      Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Line up pointers";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsBasic.va_code_LargeComment
        "Wrap the result back into the field";
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fsqr : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_LargeComment
            "Compute the raw multiplication: tmp <- f * f")
         (Vale_X64_Decls.va_pbool_and
            (Vale_Curve25519_X64_FastSqr.va_codegen_success_Fast_sqr
               Prims.int_zero)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Newline ())
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Comment
                     "Line up pointers")
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_LargeComment
                              "Wrap the result back into the field")
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                 Prims.int_zero)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                    ()) (Vale_X64_Decls.va_ttrue ()))))))))))
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub) va_req_Fsqr = unit
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'vausM, 'vaufM) va_ens_Fsqr =
  unit
let (va_qcode_Fsqr :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_X64_InsBasic.va_code_LargeComment
              "Compute the raw multiplication: tmp <- f * f";
            Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr Prims.int_zero;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "Line up pointers";
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
            Vale_X64_InsBasic.va_code_LargeComment
              "Wrap the result back into the field";
            Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('tmpub, 'inAub, 'dstub, 'vaus0, 'vauk) va_wp_Fsqr = unit

let (va_quick_Fsqr :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun tmp_b ->
    fun inA_b ->
      fun dst_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fsqr ()),
            [Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
let (va_code_Fsqr_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fsqr ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
let (va_codegen_success_Fsqr_stdcall : Prims.bool -> Vale_X64_Decls.va_pbool)
  =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push_Secret
               (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsStack.va_codegen_success_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsStack.va_codegen_success_Push_Secret
                     (Vale_X64_Machine_s.OReg Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (if win
                      then
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsBasic.va_codegen_success_Mov64
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (5)))
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (2))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsBasic.va_codegen_success_Mov64
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (4)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (3))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsBasic.va_codegen_success_Mov64
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (12)))
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (8))))
                                      (Vale_X64_Decls.va_ttrue ())))))
                      else
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                             (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                          (Vale_X64_Decls.va_ttrue ()))
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Fsqr ())
                        (Vale_X64_Decls.va_pbool_and
                           (if win
                            then
                              Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (5))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (4))))
                                   (Vale_X64_Decls.va_ttrue ()))
                            else Vale_X64_Decls.va_ttrue ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                 (Vale_X64_Machine_s.OReg Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (12))))
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
                                                (Prims.of_int (15))))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub) va_req_Fsqr_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub, 'vausM,
  'vaufM) va_ens_Fsqr_stdcall = unit
let (va_qcode_Fsqr_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun tmp_b ->
        fun inA_b ->
          fun dst_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsStack.va_code_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Push_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsStack.va_code_Push_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
              va_code_Fsqr ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                   Vale_X64_InsStack.va_code_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                (Vale_X64_Machine_s.Block []);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)))] va_mods ()

type ('win, 'tmpub, 'inAub, 'dstub, 'vaus0, 'vauk) va_wp_Fsqr_stdcall = unit

let (va_quick_Fsqr_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fsqr_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Fsqr2 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr (Prims.of_int (4));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_X64_InsBasic.va_code_Comment "Line up pointers";
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
      Vale_X64_InsBasic.va_code_Newline ();
      Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide (Prims.of_int (4));
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Fsqr2 : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (Vale_Curve25519_X64_FastSqr.va_codegen_success_Fast_sqr
            Prims.int_zero)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Newline ())
            (Vale_X64_Decls.va_pbool_and
               (Vale_Curve25519_X64_FastSqr.va_codegen_success_Fast_sqr
                  (Prims.of_int (4)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Newline ())
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Comment
                        "Line up pointers")
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Mov64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Newline
                                 ())
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                    Prims.int_zero)
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsBasic.va_codegen_success_Newline
                                       ())
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_Curve25519_X64_FastHybrid.va_codegen_success_Carry_wide
                                          (Prims.of_int (4)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                             ()) (Vale_X64_Decls.va_ttrue ())))))))))))))
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub) va_req_Fsqr2 = unit
type ('vaub0, 'vaus0, 'tmpub, 'inAub, 'dstub, 'vausM, 'vaufM) va_ens_Fsqr2 =
  unit
let (va_qcode_Fsqr2 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr Prims.int_zero;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_Curve25519_X64_FastSqr.va_code_Fast_sqr (Prims.of_int (4));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_X64_InsBasic.va_code_Comment "Line up pointers";
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide Prims.int_zero;
            Vale_X64_InsBasic.va_code_Newline ();
            Vale_Curve25519_X64_FastHybrid.va_code_Carry_wide
              (Prims.of_int (4));
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('tmpub, 'inAub, 'dstub, 'vaus0, 'vauk) va_wp_Fsqr2 = unit

let (va_quick_Fsqr2 :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun tmp_b ->
    fun inA_b ->
      fun dst_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_Fsqr2 ()),
            [Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
            Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
let (va_code_Fsqr2_stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsStack.va_code_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Push_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Push_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
          Vale_X64_InsStack.va_code_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      va_code_Fsqr2 ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsStack.va_code_Pop_Secret
             (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_X64_InsStack.va_code_Pop_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block [];
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
      Vale_X64_InsStack.va_code_Pop_Secret
        (Vale_X64_Machine_s.OReg (Prims.of_int (15)))]
let (va_codegen_success_Fsqr2_stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsStack.va_codegen_success_Push_Secret
         (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsStack.va_codegen_success_Push_Secret
            (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsStack.va_codegen_success_Push_Secret
               (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsStack.va_codegen_success_Push_Secret
                  (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsStack.va_codegen_success_Push_Secret
                     (Vale_X64_Machine_s.OReg Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (if win
                      then
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsBasic.va_codegen_success_Mov64
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (5)))
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (2))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsBasic.va_codegen_success_Mov64
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (4)))
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (3))))
                                   (Vale_X64_Decls.va_pbool_and
                                      (Vale_X64_InsBasic.va_codegen_success_Mov64
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (12)))
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (8))))
                                      (Vale_X64_Decls.va_ttrue ())))))
                      else
                        Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                             (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                          (Vale_X64_Decls.va_ttrue ()))
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Fsqr2 ())
                        (Vale_X64_Decls.va_pbool_and
                           (if win
                            then
                              Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (5))))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (4))))
                                   (Vale_X64_Decls.va_ttrue ()))
                            else Vale_X64_Decls.va_ttrue ())
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                 (Vale_X64_Machine_s.OReg Prims.int_one))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (12))))
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
                                                (Prims.of_int (15))))
                                          (Vale_X64_Decls.va_ttrue ())))))))))))))
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub) va_req_Fsqr2_stdcall =
  unit
type ('vaub0, 'vaus0, 'win, 'tmpub, 'inAub, 'dstub, 'vausM,
  'vaufM) va_ens_Fsqr2_stdcall = unit
let (va_qcode_Fsqr2_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 ->
          Vale_X64_Memory.buffer64 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun tmp_b ->
        fun inA_b ->
          fun dst_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsStack.va_code_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsStack.va_code_Push_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Push_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                   Vale_X64_InsStack.va_code_Push_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                   Vale_X64_InsBasic.va_code_Mov64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (8)))])
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsBasic.va_code_Mov64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (12)))
                      (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
              va_code_Fsqr2 ();
              Vale_X64_QuickCodes.if_code win
                (Vale_X64_Machine_s.Block
                   [Vale_X64_InsStack.va_code_Pop_Secret
                      (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                   Vale_X64_InsStack.va_code_Pop_Secret
                     (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
                (Vale_X64_Machine_s.Block []);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg Prims.int_one);
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
              Vale_X64_InsStack.va_code_Pop_Secret
                (Vale_X64_Machine_s.OReg (Prims.of_int (15)))] va_mods ()

type ('win, 'tmpub, 'inAub, 'dstub, 'vaus0, 'vauk) va_wp_Fsqr2_stdcall = unit

let (va_quick_Fsqr2_stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun tmp_b ->
      fun inA_b ->
        fun dst_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Fsqr2_stdcall win),
              [Vale_X64_QuickCode.Mod_stackTaint;
              Vale_X64_QuickCode.Mod_stack;
              Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_zero;
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))));
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
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
              Vale_X64_QuickCode.Mod_mem], (), ())