open Prims
let (va_code_KeyExpansionStdcall :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    fun alg ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsMem.va_code_CreateHeaplets ();
        if alg = Vale_AES_AES_s.AES_128
        then
          Vale_X64_Machine_s.Block
            [Vale_AES_X64_AES128.va_code_KeyExpansion128Stdcall win]
        else
          Vale_X64_Machine_s.Block
            [Vale_AES_X64_AES256.va_code_KeyExpansion256Stdcall win];
        Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_KeyExpansionStdcall :
  Prims.bool -> Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun win ->
    fun alg ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
        (Vale_X64_Decls.va_pbool_and
           (if alg = Vale_AES_AES_s.AES_128
            then
              Vale_X64_Decls.va_pbool_and
                (Vale_AES_X64_AES128.va_codegen_success_KeyExpansion128Stdcall
                   win) (Vale_X64_Decls.va_ttrue ())
            else
              Vale_X64_Decls.va_pbool_and
                (Vale_AES_X64_AES256.va_codegen_success_KeyExpansion256Stdcall
                   win) (Vale_X64_Decls.va_ttrue ()))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets ())
              (Vale_X64_Decls.va_ttrue ())))
type ('vaub0, 'vaus0, 'win, 'alg, 'inputukeyub,
  'outputukeyuexpansionub) va_req_KeyExpansionStdcall = unit
type ('vaub0, 'vaus0, 'win, 'alg, 'inputukeyub, 'outputukeyuexpansionub,
  'vausM, 'vaufM) va_ens_KeyExpansionStdcall = unit
let (va_qcode_KeyExpansionStdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_AES_AES_s.algorithm ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun alg ->
        fun input_key_b ->
          fun output_key_expansion_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsMem.va_code_CreateHeaplets ();
              Vale_X64_QuickCodes.if_code (alg = Vale_AES_AES_s.AES_128)
                (Vale_X64_Machine_s.Block
                   [Vale_AES_X64_AES128.va_code_KeyExpansion128Stdcall win])
                (Vale_X64_Machine_s.Block
                   [Vale_AES_X64_AES256.va_code_KeyExpansion256Stdcall win]);
              Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods ()

type ('win, 'alg, 'inputukeyub, 'outputukeyuexpansionub, 'vaus0,
  'vauk) va_wp_KeyExpansionStdcall = unit

let (va_quick_KeyExpansionStdcall :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun alg ->
      fun input_key_b ->
        fun output_key_expansion_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_KeyExpansionStdcall win alg),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_mem_layout;
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_AESEncryptBlock :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [if alg = Vale_AES_AES_s.AES_128
       then
         Vale_X64_Machine_s.Block
           [Vale_AES_X64_AES128.va_code_AES128EncryptBlock ()]
       else
         Vale_X64_Machine_s.Block
           [Vale_AES_X64_AES256.va_code_AES256EncryptBlock ()]]
let (va_codegen_success_AESEncryptBlock :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (if alg = Vale_AES_AES_s.AES_128
       then
         Vale_X64_Decls.va_pbool_and
           (Vale_AES_X64_AES128.va_codegen_success_AES128EncryptBlock ())
           (Vale_X64_Decls.va_ttrue ())
       else
         Vale_X64_Decls.va_pbool_and
           (Vale_AES_X64_AES256.va_codegen_success_AES256EncryptBlock ())
           (Vale_X64_Decls.va_ttrue ())) (Vale_X64_Decls.va_ttrue ())
let (va_qcode_AESEncryptBlock :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun input ->
        fun key ->
          fun round_keys ->
            fun keys_buffer ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_QuickCodes.if_code (alg = Vale_AES_AES_s.AES_128)
                   (Vale_X64_Machine_s.Block
                      [Vale_AES_X64_AES128.va_code_AES128EncryptBlock ()])
                   (Vale_X64_Machine_s.Block
                      [Vale_AES_X64_AES256.va_code_AES256EncryptBlock ()])]
                va_mods ()

type ('alg, 'input, 'key, 'roundukeys, 'keysubuffer, 'vaus0,
  'vauk) va_wp_AESEncryptBlock = unit

let (va_quick_AESEncryptBlock :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun input ->
      fun key ->
        fun round_keys ->
          fun keys_buffer ->
            Vale_X64_QuickCode.QProc
              ((va_code_AESEncryptBlock alg),
                [Vale_X64_QuickCode.Mod_flags;
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))],
                (), ())