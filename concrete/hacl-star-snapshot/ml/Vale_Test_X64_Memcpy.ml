open Prims
let (va_code_Copy16 :
  Vale_Arch_HeapTypes_s.taint ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun t ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero t;
      Vale_X64_InsMem.va_code_Load64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8)) t;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero t;
      Vale_X64_InsMem.va_code_Store64_buffer Prims.int_zero
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2))) (Prims.of_int (8)) t]
let (va_codegen_success_Copy16 :
  Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool) =
  fun t ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
         (Vale_X64_Machine_s.OReg Prims.int_zero)
         (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero t)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsMem.va_codegen_success_Load64_buffer Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (4))) (Prims.of_int (8)) t)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsMem.va_codegen_success_Store64_buffer Prims.int_zero
               (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
               (Vale_X64_Machine_s.OReg Prims.int_zero) Prims.int_zero t)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsMem.va_codegen_success_Store64_buffer
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Prims.of_int (8)) t) (Vale_X64_Decls.va_ttrue ()))))
