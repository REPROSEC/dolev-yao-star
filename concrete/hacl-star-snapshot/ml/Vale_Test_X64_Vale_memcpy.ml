open Prims
let (va_code_InnerMemcpy :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
         Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero
        Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
        Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_InnerMemcpy : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
         Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Store64_buffer Prims.int_one
               (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
               (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                  Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_InnerMemcpy :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun dst ->
      fun src ->
        Vale_X64_QuickCodes.qblock
          [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
             (Vale_X64_Machine_s.OReg Prims.int_zero)
             (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
             Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('dst, 'src, 'vaus0, 'vauk) va_wp_InnerMemcpy = unit

let (va_quick_InnerMemcpy :
  Vale_X64_Memory.buffer64 ->
    Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_InnerMemcpy ()),
          [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Memcpy :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_CreateHeaplets ();
      if win
      then Vale_X64_Machine_s.Block [va_code_InnerMemcpy ()]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg Prims.int_zero)
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))), Prims.int_zero)),
                 Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Mem64_lemma ();
          Vale_X64_InsBasic.va_code_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OMem
               ((Vale_X64_Machine_s.MReg
                   ((Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (4)))),
                     (Prims.of_int (8)))), Vale_Arch_HeapTypes_s.Secret));
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero
            Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (8))
            Vale_Arch_HeapTypes_s.Secret];
      Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Memcpy : Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
      (Vale_X64_Decls.va_pbool_and
         (if win
          then
            Vale_X64_Decls.va_pbool_and (va_codegen_success_InnerMemcpy ())
              (Vale_X64_Decls.va_ttrue ())
          else
            Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                    (Vale_X64_Machine_s.OReg Prims.int_zero)
                    (Vale_X64_Machine_s.OMem
                       ((Vale_X64_Machine_s.MReg
                           ((Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (4)))),
                             Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret)))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsMem.va_codegen_success_Mem64_lemma ())
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                          (Vale_X64_Machine_s.OMem
                             ((Vale_X64_Machine_s.MReg
                                 ((Vale_X64_Machine_s.Reg
                                     (Prims.int_zero, (Prims.of_int (4)))),
                                   (Prims.of_int (8)))),
                               Vale_Arch_HeapTypes_s.Secret)))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                             Prims.int_one
                             (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                             (Vale_X64_Machine_s.OReg Prims.int_zero)
                             Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                                Prims.int_one
                                (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                                (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                (Prims.of_int (8))
                                Vale_Arch_HeapTypes_s.Secret)
                             (Vale_X64_Decls.va_ttrue ())))))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
            (Vale_X64_Decls.va_ttrue ())))
type ('vaub0, 'vaus0, 'win, 'dst, 'src) va_req_Memcpy = unit
type ('vaub0, 'vaus0, 'win, 'dst, 'src, 'vausM, 'vaufM) va_ens_Memcpy = unit
let (va_qcode_Memcpy :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer64 ->
        Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun dst ->
        fun src ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsMem.va_code_CreateHeaplets ();
            Vale_X64_QuickCodes.if_code win
              (Vale_X64_Machine_s.Block [va_code_InnerMemcpy ()])
              (Vale_X64_Machine_s.Block
                 [Vale_X64_InsMem.va_code_Mem64_lemma ();
                 Vale_X64_InsBasic.va_code_Mov64
                   (Vale_X64_Machine_s.OReg Prims.int_zero)
                   (Vale_X64_Machine_s.OMem
                      ((Vale_X64_Machine_s.MReg
                          ((Vale_X64_Machine_s.Reg
                              (Prims.int_zero, (Prims.of_int (4)))),
                            Prims.int_zero)), Vale_Arch_HeapTypes_s.Secret));
                 Vale_X64_InsMem.va_code_Mem64_lemma ();
                 Vale_X64_InsBasic.va_code_Mov64
                   (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                   (Vale_X64_Machine_s.OMem
                      ((Vale_X64_Machine_s.MReg
                          ((Vale_X64_Machine_s.Reg
                              (Prims.int_zero, (Prims.of_int (4)))),
                            (Prims.of_int (8)))),
                        Vale_Arch_HeapTypes_s.Secret));
                 Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                   (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                   (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero
                   Vale_Arch_HeapTypes_s.Secret;
                 Vale_X64_InsMem.va_code_Store64_buffer Prims.int_one
                   (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                   (Prims.of_int (8)) Vale_Arch_HeapTypes_s.Secret]);
            Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('win, 'dst, 'src, 'vaus0, 'vauk) va_wp_Memcpy = unit

let (va_quick_Memcpy :
  Prims.bool ->
    Vale_X64_Memory.buffer64 ->
      Vale_X64_Memory.buffer64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun dst ->
      fun src ->
        Vale_X64_QuickCode.QProc
          ((va_code_Memcpy win),
            [Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
            Vale_X64_QuickCode.Mod_mem_layout;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
            Vale_X64_QuickCode.Mod_mem], (), ())