open Prims
let (va_code_Init_ctr :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Pxor (Prims.of_int (4)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4)) Prims.int_one
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (12)))]
let (va_codegen_success_Init_ctr : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Pxor (Prims.of_int (4))
         (Prims.of_int (4)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_PinsrdImm (Prims.of_int (4))
            Prims.int_one Prims.int_zero
            (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_Init_ctr :
  Vale_X64_QuickCode.mod_t Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    Vale_X64_QuickCodes.qblock
      [Vale_X64_InsVector.va_code_Pxor (Prims.of_int (4)) (Prims.of_int (4));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (4)) Prims.int_one
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (12)))] va_mods
      ()

type ('vaus0, 'vauk) va_wp_Init_ctr = unit

let (va_quick_Init_ctr : unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_Init_ctr ()),
        [Vale_X64_QuickCode.Mod_reg
           (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))));
        Vale_X64_QuickCode.Mod_flags;
        Vale_X64_QuickCode.Mod_reg
          (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))))], (),
        ())
let (va_code_Inc32 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun one ->
      Vale_X64_Machine_s.Block [Vale_X64_InsVector.va_code_Paddd dst one]
let (va_codegen_success_Inc32 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun one ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsVector.va_codegen_success_Paddd dst one)
        (Vale_X64_Decls.va_ttrue ())

type ('dst, 'one, 'vaus0, 'vauk) va_wp_Inc32 = unit

let (va_quick_Inc32 :
  Vale_X64_Machine_s.reg_xmm ->
    Vale_X64_Machine_s.reg_xmm -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun one ->
      Vale_X64_QuickCode.QProc
        ((va_code_Inc32 dst one),
          [Vale_X64_QuickCode.Mod_flags; Vale_X64_QuickCode.va_mod_xmm dst],
          (), ())
let (va_code_Gctr_register :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero (Prims.of_int (7));
      Vale_X64_InsVector.va_code_InitPshufbMask (Prims.of_int (2))
        (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsVector.va_code_Pshufb Prims.int_zero (Prims.of_int (2));
      Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
      Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_zero]
let (va_codegen_success_Gctr_register :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_zero
         (Prims.of_int (7)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_InitPshufbMask
            (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Pshufb Prims.int_zero
               (Prims.of_int (2)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_AES_X64_AES.va_codegen_success_AESEncryptBlock alg)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one
                     Prims.int_zero) (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_Gctr_register :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun key ->
        fun round_keys ->
          fun keys_b ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero
                 (Prims.of_int (7));
              Vale_X64_InsVector.va_code_InitPshufbMask (Prims.of_int (2))
                (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
              Vale_X64_InsVector.va_code_Pshufb Prims.int_zero
                (Prims.of_int (2));
              Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
              Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_zero]
              va_mods ()

type ('alg, 'key, 'roundukeys, 'keysub, 'vaus0, 'vauk) va_wp_Gctr_register =
  unit

let (va_quick_Gctr_register :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun key ->
      fun round_keys ->
        fun keys_b ->
          Vale_X64_QuickCode.QProc
            ((va_code_Gctr_register alg),
              [Vale_X64_QuickCode.Mod_reg
                 (Vale_X64_Machine_s.Reg
                    (Prims.int_zero, (Prims.of_int (12))));
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))],
              (), ())
let (va_code_Gctr_core_body0 :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero (Prims.of_int (7));
      Vale_X64_InsVector.va_code_Pshufb Prims.int_zero (Prims.of_int (8));
      Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2)) Prims.int_zero;
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) (Prims.of_int (2))
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst Prims.int_one);
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
      va_code_Inc32 (Prims.of_int (7)) (Prims.of_int (4))]
let (va_codegen_success_Gctr_core_body0 :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_zero
         (Prims.of_int (7)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Pshufb Prims.int_zero
            (Prims.of_int (8)))
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_AES.va_codegen_success_AESEncryptBlock alg)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                  Prims.int_zero (Prims.of_int (2))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9))) Prims.int_zero
                  Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pxor
                     (Prims.of_int (2)) Prims.int_zero)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                        Prims.int_one
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Prims.of_int (2)) Prims.int_zero
                        Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Add64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                           (Vale_X64_Machine_s.OConst Prims.int_one))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsBasic.va_codegen_success_Add64
                              (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                              (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Add64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                                 (Vale_X64_Machine_s.OConst
                                    (Prims.of_int (16))))
                              (Vale_X64_Decls.va_pbool_and
                                 (va_codegen_success_Inc32 (Prims.of_int (7))
                                    (Prims.of_int (4)))
                                 (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_Gctr_core_body0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_AES_AES_s.algorithm ->
        Prims.nat ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Types_s.quad32 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun alg ->
        fun va_in_block_offset ->
          fun va_in_in_b ->
            fun va_in_key ->
              fun va_in_keys_b ->
                fun va_in_old_iv ->
                  fun va_in_out_b ->
                    fun va_in_round_keys ->
                      Vale_X64_QuickCodes.qblock
                        [Vale_X64_InsVector.va_code_Mov128 Prims.int_zero
                           (Prims.of_int (7));
                        Vale_X64_InsVector.va_code_Pshufb Prims.int_zero
                          (Prims.of_int (8));
                        Vale_AES_X64_AES.va_code_AESEncryptBlock alg;
                        Vale_X64_InsVector.va_code_Load128_buffer
                          Prims.int_zero (Prims.of_int (2))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                          Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2))
                          Prims.int_zero;
                        Vale_X64_InsVector.va_code_Store128_buffer
                          Prims.int_one
                          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                          (Prims.of_int (2)) Prims.int_zero
                          Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_InsBasic.va_code_Add64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                          (Vale_X64_Machine_s.OConst Prims.int_one);
                        Vale_X64_InsBasic.va_code_Add64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                          (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
                        Vale_X64_InsBasic.va_code_Add64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                          (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
                        va_code_Inc32 (Prims.of_int (7)) (Prims.of_int (4))]
                        va_mods ()

type ('vauold, 'alg, 'vauinublockuoffset, 'vauinuinub, 'vauinukey,
  'vauinukeysub, 'vauinuolduiv, 'vauinuoutub, 'vauinuroundukeys, 'vaus0,
  'vauk) va_wp_Gctr_core_body0 = unit

let (va_quick_Gctr_core_body0 :
  Vale_X64_State.vale_state ->
    Vale_AES_AES_s.algorithm ->
      Prims.nat ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun alg ->
      fun va_in_block_offset ->
        fun va_in_in_b ->
          fun va_in_key ->
            fun va_in_keys_b ->
              fun va_in_old_iv ->
                fun va_in_out_b ->
                  fun va_in_round_keys ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_Gctr_core_body0 alg),
                        [Vale_X64_QuickCode.Mod_reg
                           (Vale_X64_Machine_s.Reg
                              (Prims.int_one, (Prims.of_int (7))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (2))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, Prims.int_zero));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (3))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (9))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (10))));
                        Vale_X64_QuickCode.Mod_ok;
                        Vale_X64_QuickCode.Mod_mem;
                        Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Gctr_core_while0 :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.While
         ((Vale_X64_Decls.va_cmp_ne
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (2)))),
           (Vale_X64_Machine_s.Block [va_code_Gctr_core_body0 alg]))]
let (va_codegen_success_Gctr_core_while0 :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Gctr_core_body0 alg)
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Gctr_core_while0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_AES_AES_s.algorithm ->
        Prims.nat ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Types_s.quad32 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun alg ->
        fun va_in_block_offset ->
          fun va_in_in_b ->
            fun va_in_key ->
              fun va_in_keys_b ->
                fun va_in_old_iv ->
                  fun va_in_out_b ->
                    fun va_in_round_keys ->
                      Vale_X64_QuickCodes.qblock
                        [Vale_X64_Machine_s.While
                           ((Vale_X64_QuickCodes.cmp_to_ocmp
                               (Vale_X64_QuickCodes.Cmp_ne
                                  ((Vale_X64_Machine_s.OReg
                                      (Prims.of_int (3))),
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (2)))))),
                             (Vale_X64_Machine_s.Block
                                [va_code_Gctr_core_body0 alg]))] va_mods ()

type ('vauold, 'alg, 'vauinublockuoffset, 'vauinuinub, 'vauinukey,
  'vauinukeysub, 'vauinuolduiv, 'vauinuoutub, 'vauinuroundukeys, 'vaus0,
  'vauk) va_wp_Gctr_core_while0 = unit

let (va_quick_Gctr_core_while0 :
  Vale_X64_State.vale_state ->
    Vale_AES_AES_s.algorithm ->
      Prims.nat ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun alg ->
      fun va_in_block_offset ->
        fun va_in_in_b ->
          fun va_in_key ->
            fun va_in_keys_b ->
              fun va_in_old_iv ->
                fun va_in_out_b ->
                  fun va_in_round_keys ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_Gctr_core_while0 alg),
                        [Vale_X64_QuickCode.Mod_reg
                           (Vale_X64_Machine_s.Reg
                              (Prims.int_one, (Prims.of_int (7))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, (Prims.of_int (2))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_one, Prims.int_zero));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (3))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (9))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (10))));
                        Vale_X64_QuickCode.Mod_ok;
                        Vale_X64_QuickCode.Mod_mem;
                        Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Gctr_core :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
         (Vale_X64_Machine_s.OConst Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
        (Vale_X64_Machine_s.OReg Prims.int_one);
      va_code_Init_ctr ();
      va_code_Gctr_core_while0 alg]
let (va_codegen_success_Gctr_core :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
         (Vale_X64_Machine_s.OConst Prims.int_zero))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
            (Vale_X64_Machine_s.OReg Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OReg Prims.int_one))
            (Vale_X64_Decls.va_pbool_and (va_codegen_success_Init_ctr ())
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_Gctr_core_while0 alg)
                  (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_Gctr_core :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Prims.nat ->
            Vale_Def_Types_s.quad32 ->
              Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                  Vale_X64_Memory.buffer128 ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun in_b ->
        fun out_b ->
          fun block_offset ->
            fun old_iv ->
              fun key ->
                fun round_keys ->
                  fun keys_b ->
                    Vale_X64_QuickCodes.qblock
                      [Vale_X64_InsBasic.va_code_Mov64
                         (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                         (Vale_X64_Machine_s.OConst Prims.int_zero);
                      Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OReg Prims.int_zero);
                      Vale_X64_InsBasic.va_code_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Vale_X64_Machine_s.OReg Prims.int_one);
                      va_code_Init_ctr ();
                      va_code_Gctr_core_while0 alg] va_mods ()

type ('alg, 'inub, 'outub, 'blockuoffset, 'olduiv, 'key, 'roundukeys,
  'keysub, 'vaus0, 'vauk) va_wp_Gctr_core = unit

let (va_quick_Gctr_core :
  Vale_AES_AES_s.algorithm ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Prims.nat ->
          Vale_Def_Types_s.quad32 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun in_b ->
      fun out_b ->
        fun block_offset ->
          fun old_iv ->
            fun key ->
              fun round_keys ->
                fun keys_b ->
                  Vale_X64_QuickCode.QProc
                    ((va_code_Gctr_core alg),
                      [Vale_X64_QuickCode.Mod_flags;
                      Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                      Vale_X64_QuickCode.Mod_reg
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_one, (Prims.of_int (7))));
                      Vale_X64_QuickCode.Mod_reg
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_one, (Prims.of_int (4))));
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
                           (Prims.int_zero, (Prims.of_int (12))));
                      Vale_X64_QuickCode.Mod_reg
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (10))));
                      Vale_X64_QuickCode.Mod_reg
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (9))));
                      Vale_X64_QuickCode.Mod_reg
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (3))));
                      Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Gctr_core_opt :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_InitPshufbMask (Prims.of_int (8))
         (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
      Vale_X64_InsBasic.va_code_Mov64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_Shr64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_And64
        (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_gt
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OConst Prims.int_zero)),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsBasic.va_code_Mov64
                (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                (Vale_X64_Machine_s.OReg Prims.int_zero);
             Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OReg Prims.int_one);
             Vale_AES_X64_AESCTRplain.va_code_Aes_counter_loop alg;
             Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
             Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg Prims.int_one)
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))]),
          (Vale_X64_Machine_s.Block []));
      va_code_Gctr_core alg]
let (va_codegen_success_Gctr_core_opt :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_InitPshufbMask
         (Prims.of_int (8)) (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_Mov64
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Shr64
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (2))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_And64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                  (Vale_X64_Machine_s.OConst (Prims.of_int (3))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_Mov64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                        (Vale_X64_Machine_s.OReg Prims.int_zero))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg Prims.int_one))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_AES_X64_AESCTRplain.va_codegen_success_Aes_counter_loop
                              alg)
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (9))))
                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_one)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (10))))))))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_Gctr_core alg)
                     (Vale_X64_Decls.va_ttrue ()))))))
let (va_qcode_Gctr_core_opt :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun in_b ->
        fun out_b ->
          fun key ->
            fun round_keys ->
              fun keys_b ->
                Vale_X64_QuickCodes.qblock
                  [Vale_X64_InsVector.va_code_InitPshufbMask
                     (Prims.of_int (8))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                  Vale_X64_InsBasic.va_code_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                  Vale_X64_InsBasic.va_code_Shr64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                    (Vale_X64_Machine_s.OConst (Prims.of_int (2)));
                  Vale_X64_InsBasic.va_code_And64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                    (Vale_X64_Machine_s.OConst (Prims.of_int (3)));
                  Vale_X64_Machine_s.IfElse
                    ((Vale_X64_QuickCodes.cmp_to_ocmp
                        (Vale_X64_QuickCodes.Cmp_gt
                           ((Vale_X64_Machine_s.OReg (Prims.of_int (3))),
                             (Vale_X64_Machine_s.OConst Prims.int_zero)))),
                      (Vale_X64_Machine_s.Block
                         [Vale_X64_InsBasic.va_code_Mov64
                            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                            (Vale_X64_Machine_s.OReg Prims.int_zero);
                         Vale_X64_InsBasic.va_code_Mov64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                           (Vale_X64_Machine_s.OReg Prims.int_one);
                         Vale_AES_X64_AESCTRplain.va_code_Aes_counter_loop
                           alg;
                         Vale_X64_InsBasic.va_code_Mov64
                           (Vale_X64_Machine_s.OReg Prims.int_zero)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
                         Vale_X64_InsBasic.va_code_Mov64
                           (Vale_X64_Machine_s.OReg Prims.int_one)
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10)))]),
                      (Vale_X64_Machine_s.Block []));
                  va_code_Gctr_core alg] va_mods ()

type ('alg, 'inub, 'outub, 'key, 'roundukeys, 'keysub, 'vaus0,
  'vauk) va_wp_Gctr_core_opt = unit

let (va_quick_Gctr_core_opt :
  Vale_AES_AES_s.algorithm ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun in_b ->
      fun out_b ->
        fun key ->
          fun round_keys ->
            fun keys_b ->
              Vale_X64_QuickCode.QProc
                ((va_code_Gctr_core_opt alg),
                  [Vale_X64_QuickCode.Mod_reg
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
                    (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                  Vale_X64_QuickCode.Mod_flags;
                  Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (12))));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (10))));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (9))));
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
                    (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                  Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Gctr_bytes_extra_work :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Mov128 Prims.int_one (Prims.of_int (2));
      va_code_Gctr_register alg;
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (10))) Prims.int_one
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_Gctr_bytes_extra_work :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Mov128 Prims.int_one
            (Prims.of_int (2)))
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Gctr_register alg)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                  Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                  Prims.int_one Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_Gctr_bytes_extra_work :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Words_s.nat64 ->
                    Vale_Def_Words_s.nat64 ->
                      Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun icb_BE ->
        fun in_b ->
          fun out_b ->
            fun key ->
              fun round_keys ->
                fun keys_b ->
                  fun orig_in_ptr ->
                    fun orig_out_ptr ->
                      fun num_bytes ->
                        Vale_X64_QuickCodes.qblock
                          [Vale_X64_InsVector.va_code_Load128_buffer
                             Prims.int_zero (Prims.of_int (2))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                             Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                          Vale_X64_InsVector.va_code_Mov128 Prims.int_one
                            (Prims.of_int (2));
                          va_code_Gctr_register alg;
                          Vale_X64_InsVector.va_code_Store128_buffer
                            Prims.int_one
                            (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                            Prims.int_one Prims.int_zero
                            Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('alg, 'icbuBE, 'inub, 'outub, 'key, 'roundukeys, 'keysub, 'origuinuptr,
  'origuoutuptr, 'numubytes, 'vaus0, 'vauk) va_wp_Gctr_bytes_extra_work =
  unit

let (va_quick_Gctr_bytes_extra_work :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Words_s.nat64 ->
                  Vale_Def_Words_s.nat64 ->
                    Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun icb_BE ->
      fun in_b ->
        fun out_b ->
          fun key ->
            fun round_keys ->
              fun keys_b ->
                fun orig_in_ptr ->
                  fun orig_out_ptr ->
                    fun num_bytes ->
                      Vale_X64_QuickCode.QProc
                        ((va_code_Gctr_bytes_extra_work alg),
                          [Vale_X64_QuickCode.Mod_flags;
                          Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_one, (Prims.of_int (4))));
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
                               (Prims.int_zero, (Prims.of_int (12))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (3))));
                          Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Gctr_bytes_no_extra :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun alg -> Vale_X64_Machine_s.Block []
let (va_codegen_success_Gctr_bytes_no_extra :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg -> Vale_X64_Decls.va_ttrue ()
let (va_qcode_Gctr_bytes_no_extra :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_Def_Types_s.quad32 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Words_s.nat64 ->
                    Vale_Def_Words_s.nat64 ->
                      Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun icb_BE ->
        fun in_b ->
          fun out_b ->
            fun key ->
              fun round_keys ->
                fun keys_b ->
                  fun orig_in_ptr ->
                    fun orig_out_ptr ->
                      fun num_bytes ->
                        Vale_X64_QuickCodes.qblock [] va_mods ()

type ('alg, 'icbuBE, 'inub, 'outub, 'key, 'roundukeys, 'keysub, 'origuinuptr,
  'origuoutuptr, 'numubytes, 'vaus0, 'vauk) va_wp_Gctr_bytes_no_extra = 
  unit

let (va_quick_Gctr_bytes_no_extra :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Types_s.quad32 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Words_s.nat64 ->
                  Vale_Def_Words_s.nat64 ->
                    Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun icb_BE ->
      fun in_b ->
        fun out_b ->
          fun key ->
            fun round_keys ->
              fun keys_b ->
                fun orig_in_ptr ->
                  fun orig_out_ptr ->
                    fun num_bytes ->
                      Vale_X64_QuickCode.QProc
                        ((va_code_Gctr_bytes_no_extra alg), [], (), ())
let (va_code_Gctr_bytes :
  Vale_AES_AES_s.algorithm ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun alg ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsBasic.va_code_IMul64
        (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
      va_code_Gctr_core_opt alg;
      va_code_Gctr_bytes_no_extra alg;
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_gt
            (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)))),
          (Vale_X64_Machine_s.Block
             [Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (2))
                Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
             va_code_Gctr_register alg;
             Vale_X64_InsVector.va_code_Store128_buffer (Prims.of_int (2))
               (Vale_X64_Machine_s.OReg (Prims.of_int (13))) Prims.int_one
               Prims.int_zero Vale_Arch_HeapTypes_s.Secret]),
          (Vale_X64_Machine_s.Block []))]
let (va_codegen_success_Gctr_bytes :
  Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun alg ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsBasic.va_codegen_success_IMul64
            (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
            (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
         (Vale_X64_Decls.va_pbool_and (va_codegen_success_Gctr_core_opt alg)
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_Gctr_bytes_no_extra alg)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                        (Prims.of_int (2)) Prims.int_one
                        (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                        Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_Gctr_register alg)
                        (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                           (Prims.of_int (2))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                           Prims.int_one Prims.int_zero
                           Vale_Arch_HeapTypes_s.Secret)))
                  (Vale_X64_Decls.va_ttrue ())))))
let (va_qcode_Gctr_bytes :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
              Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                Vale_X64_Memory.buffer128 ->
                  (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun alg ->
      fun in_b ->
        fun out_b ->
          fun inout_b ->
            fun key ->
              fun round_keys ->
                fun keys_b ->
                  Vale_X64_QuickCodes.qblock
                    [Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                    Vale_X64_InsBasic.va_code_IMul64
                      (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                      (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
                    va_code_Gctr_core_opt alg;
                    va_code_Gctr_bytes_no_extra alg;
                    Vale_X64_Machine_s.IfElse
                      ((Vale_X64_QuickCodes.cmp_to_ocmp
                          (Vale_X64_QuickCodes.Cmp_gt
                             ((Vale_X64_Machine_s.OReg (Prims.of_int (4))),
                               (Vale_X64_Machine_s.OReg (Prims.of_int (6)))))),
                        (Vale_X64_Machine_s.Block
                           [Vale_X64_InsVector.va_code_Load128_buffer
                              (Prims.of_int (2)) Prims.int_one
                              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                           va_code_Gctr_register alg;
                           Vale_X64_InsVector.va_code_Store128_buffer
                             (Prims.of_int (2))
                             (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                             Prims.int_one Prims.int_zero
                             Vale_Arch_HeapTypes_s.Secret]),
                        (Vale_X64_Machine_s.Block []))] va_mods ()

type ('alg, 'inub, 'outub, 'inoutub, 'key, 'roundukeys, 'keysub, 'vaus0,
  'vauk) va_wp_Gctr_bytes = unit

let (va_quick_Gctr_bytes :
  Vale_AES_AES_s.algorithm ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              Vale_X64_Memory.buffer128 ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun alg ->
    fun in_b ->
      fun out_b ->
        fun inout_b ->
          fun key ->
            fun round_keys ->
              fun keys_b ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Gctr_bytes alg),
                    [Vale_X64_QuickCode.Mod_flags;
                    Vale_X64_QuickCode.Mod_mem_heaplet (Prims.of_int (2));
                    Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
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
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
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
                         (Prims.int_zero, (Prims.of_int (6))));
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
                      (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, Prims.int_zero));
                    Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_Gctr_bytes_stdcall :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    fun alg ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsMem.va_code_CreateHeaplets ();
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
        Vale_X64_InsStack.va_code_Push_Secret
          (Vale_X64_Machine_s.OReg Prims.int_one);
        if win
        then
          Vale_X64_Machine_s.Block
            [Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (15))
               (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (14))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (13))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (12))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (11))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (10))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (9))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (8))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (7))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PushXmm_Secret (Prims.of_int (6))
              (Vale_X64_Machine_s.OReg Prims.int_zero)]
        else Vale_X64_Machine_s.Block [];
        if win
        then
          Vale_X64_Machine_s.Block
            [Vale_X64_InsStack.va_code_Load64_stack
               (Vale_X64_Machine_s.OReg Prims.int_zero)
               (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
               (Prims.of_int (272));
            Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              (Prims.of_int (7)) (Vale_X64_Machine_s.OReg Prims.int_zero)
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg Prims.int_one)
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
            Vale_X64_InsStack.va_code_Load64_stack
              (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
              (Prims.of_int (264));
            Vale_X64_InsStack.va_code_Load64_stack
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
              (Prims.of_int (280))]
        else
          Vale_X64_Machine_s.Block
            [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
               (Prims.of_int (7))
               (Vale_X64_Machine_s.OReg (Prims.of_int (9))) Prims.int_zero
               Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg Prims.int_zero)
              (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg Prims.int_one)
              (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsBasic.va_code_Mov64
              (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
            Vale_X64_InsStack.va_code_Load64_stack
              (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
              (Prims.of_int (72))];
        va_code_Gctr_bytes alg;
        if win
        then
          Vale_X64_Machine_s.Block
            [Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (6))
               (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (7))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (8))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (9))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (10))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (11))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (12))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (13))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (14))
              (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_X64_InsStack.va_code_PopXmm_Secret (Prims.of_int (15))
              (Vale_X64_Machine_s.OReg Prims.int_zero)]
        else Vale_X64_Machine_s.Block [];
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg Prims.int_one);
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
        Vale_X64_InsStack.va_code_Pop_Secret
          (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
        Vale_X64_InsMem.va_code_DestroyHeaplets ()]
let (va_codegen_success_Gctr_bytes_stdcall :
  Prims.bool -> Vale_AES_AES_s.algorithm -> Vale_X64_Decls.va_pbool) =
  fun win ->
    fun alg ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsMem.va_codegen_success_CreateHeaplets ())
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsStack.va_codegen_success_Push_Secret
              (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsStack.va_codegen_success_Push_Secret
                 (Vale_X64_Machine_s.OReg (Prims.of_int (14))))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsStack.va_codegen_success_Push_Secret
                    (Vale_X64_Machine_s.OReg (Prims.of_int (13))))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsStack.va_codegen_success_Push_Secret
                       (Vale_X64_Machine_s.OReg (Prims.of_int (12))))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsStack.va_codegen_success_Push_Secret
                          (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsStack.va_codegen_success_Push_Secret
                             (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsStack.va_codegen_success_Push_Secret
                                   (Vale_X64_Machine_s.OReg Prims.int_one))
                                (Vale_X64_Decls.va_pbool_and
                                   (if win
                                    then
                                      Vale_X64_Decls.va_pbool_and
                                        (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                           (Prims.of_int (15))
                                           (Vale_X64_Machine_s.OReg
                                              Prims.int_zero))
                                        (Vale_X64_Decls.va_pbool_and
                                           (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                              (Prims.of_int (14))
                                              (Vale_X64_Machine_s.OReg
                                                 Prims.int_zero))
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                 (Prims.of_int (13))
                                                 (Vale_X64_Machine_s.OReg
                                                    Prims.int_zero))
                                              (Vale_X64_Decls.va_pbool_and
                                                 (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                    (Prims.of_int (12))
                                                    (Vale_X64_Machine_s.OReg
                                                       Prims.int_zero))
                                                 (Vale_X64_Decls.va_pbool_and
                                                    (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                       (Prims.of_int (11))
                                                       (Vale_X64_Machine_s.OReg
                                                          Prims.int_zero))
                                                    (Vale_X64_Decls.va_pbool_and
                                                       (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                          (Prims.of_int (10))
                                                          (Vale_X64_Machine_s.OReg
                                                             Prims.int_zero))
                                                       (Vale_X64_Decls.va_pbool_and
                                                          (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                             (Prims.of_int (9))
                                                             (Vale_X64_Machine_s.OReg
                                                                Prims.int_zero))
                                                          (Vale_X64_Decls.va_pbool_and
                                                             (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                                (Prims.of_int (8))
                                                                (Vale_X64_Machine_s.OReg
                                                                   Prims.int_zero))
                                                             (Vale_X64_Decls.va_pbool_and
                                                                (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                                   (Prims.of_int (7))
                                                                   (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                (Vale_X64_Decls.va_pbool_and
                                                                   (Vale_X64_InsStack.va_codegen_success_PushXmm_Secret
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                   (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))
                                    else Vale_X64_Decls.va_ttrue ())
                                   (Vale_X64_Decls.va_pbool_and
                                      (if win
                                       then
                                         Vale_X64_Decls.va_pbool_and
                                           (Vale_X64_InsStack.va_codegen_success_Load64_stack
                                              (Vale_X64_Machine_s.OReg
                                                 Prims.int_zero)
                                              (Vale_X64_Machine_s.OReg
                                                 (Prims.of_int (7)))
                                              (Prims.of_int (272)))
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                 Prims.int_zero
                                                 (Prims.of_int (7))
                                                 (Vale_X64_Machine_s.OReg
                                                    Prims.int_zero)
                                                 Prims.int_zero
                                                 Vale_Arch_HeapTypes_s.Secret)
                                              (Vale_X64_Decls.va_pbool_and
                                                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                    (Vale_X64_Machine_s.OReg
                                                       Prims.int_zero)
                                                    (Vale_X64_Machine_s.OReg
                                                       (Prims.of_int (2))))
                                                 (Vale_X64_Decls.va_pbool_and
                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                       (Vale_X64_Machine_s.OReg
                                                          Prims.int_one)
                                                       (Vale_X64_Machine_s.OReg
                                                          (Prims.of_int (8))))
                                                    (Vale_X64_Decls.va_pbool_and
                                                       (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                          (Vale_X64_Machine_s.OReg
                                                             (Prims.of_int (4)))
                                                          (Vale_X64_Machine_s.OReg
                                                             (Prims.of_int (3))))
                                                       (Vale_X64_Decls.va_pbool_and
                                                          (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                             (Vale_X64_Machine_s.OReg
                                                                (Prims.of_int (13)))
                                                             (Vale_X64_Machine_s.OReg
                                                                (Prims.of_int (9))))
                                                          (Vale_X64_Decls.va_pbool_and
                                                             (Vale_X64_InsStack.va_codegen_success_Load64_stack
                                                                (Vale_X64_Machine_s.OReg
                                                                   (Prims.of_int (8)))
                                                                (Vale_X64_Machine_s.OReg
                                                                   (Prims.of_int (7)))
                                                                (Prims.of_int (264)))
                                                             (Vale_X64_Decls.va_pbool_and
                                                                (Vale_X64_InsStack.va_codegen_success_Load64_stack
                                                                   (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2)))
                                                                   (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (7)))
                                                                   (Prims.of_int (280)))
                                                                (Vale_X64_Decls.va_ttrue
                                                                   ()))))))))
                                       else
                                         Vale_X64_Decls.va_pbool_and
                                           (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                              Prims.int_zero
                                              (Prims.of_int (7))
                                              (Vale_X64_Machine_s.OReg
                                                 (Prims.of_int (9)))
                                              Prims.int_zero
                                              Vale_Arch_HeapTypes_s.Secret)
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                 (Vale_X64_Machine_s.OReg
                                                    Prims.int_zero)
                                                 (Vale_X64_Machine_s.OReg
                                                    (Prims.of_int (5))))
                                              (Vale_X64_Decls.va_pbool_and
                                                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                    (Vale_X64_Machine_s.OReg
                                                       Prims.int_one)
                                                    (Vale_X64_Machine_s.OReg
                                                       (Prims.of_int (3))))
                                                 (Vale_X64_Decls.va_pbool_and
                                                    (Vale_X64_InsBasic.va_codegen_success_Mov64
                                                       (Vale_X64_Machine_s.OReg
                                                          (Prims.of_int (13)))
                                                       (Vale_X64_Machine_s.OReg
                                                          (Prims.of_int (2))))
                                                    (Vale_X64_Decls.va_pbool_and
                                                       (Vale_X64_InsStack.va_codegen_success_Load64_stack
                                                          (Vale_X64_Machine_s.OReg
                                                             (Prims.of_int (2)))
                                                          (Vale_X64_Machine_s.OReg
                                                             (Prims.of_int (7)))
                                                          (Prims.of_int (72)))
                                                       (Vale_X64_Decls.va_ttrue
                                                          ()))))))
                                      (Vale_X64_Decls.va_pbool_and
                                         (va_codegen_success_Gctr_bytes alg)
                                         (Vale_X64_Decls.va_pbool_and
                                            (if win
                                             then
                                               Vale_X64_Decls.va_pbool_and
                                                 (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                    (Prims.of_int (6))
                                                    (Vale_X64_Machine_s.OReg
                                                       Prims.int_zero))
                                                 (Vale_X64_Decls.va_pbool_and
                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                       (Prims.of_int (7))
                                                       (Vale_X64_Machine_s.OReg
                                                          Prims.int_zero))
                                                    (Vale_X64_Decls.va_pbool_and
                                                       (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                          (Prims.of_int (8))
                                                          (Vale_X64_Machine_s.OReg
                                                             Prims.int_zero))
                                                       (Vale_X64_Decls.va_pbool_and
                                                          (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                             (Prims.of_int (9))
                                                             (Vale_X64_Machine_s.OReg
                                                                Prims.int_zero))
                                                          (Vale_X64_Decls.va_pbool_and
                                                             (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                (Prims.of_int (10))
                                                                (Vale_X64_Machine_s.OReg
                                                                   Prims.int_zero))
                                                             (Vale_X64_Decls.va_pbool_and
                                                                (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                   (Prims.of_int (11))
                                                                   (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                (Vale_X64_Decls.va_pbool_and
                                                                   (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (12))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                   (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (13))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (14))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsStack.va_codegen_success_PopXmm_Secret
                                                                    (Prims.of_int (15))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))
                                             else Vale_X64_Decls.va_ttrue ())
                                            (Vale_X64_Decls.va_pbool_and
                                               (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                  (Vale_X64_Machine_s.OReg
                                                     Prims.int_one))
                                               (Vale_X64_Decls.va_pbool_and
                                                  (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                     (Vale_X64_Machine_s.OReg
                                                        (Prims.of_int (6))))
                                                  (Vale_X64_Decls.va_pbool_and
                                                     (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                        (Vale_X64_Machine_s.OReg
                                                           (Prims.of_int (5))))
                                                     (Vale_X64_Decls.va_pbool_and
                                                        (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                           (Vale_X64_Machine_s.OReg
                                                              (Prims.of_int (4))))
                                                        (Vale_X64_Decls.va_pbool_and
                                                           (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                              (Vale_X64_Machine_s.OReg
                                                                 (Prims.of_int (12))))
                                                           (Vale_X64_Decls.va_pbool_and
                                                              (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                 (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (13))))
                                                              (Vale_X64_Decls.va_pbool_and
                                                                 (Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (
                                                                    Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (14))))
                                                                 (Vale_X64_Decls.va_pbool_and
                                                                    (
                                                                    Vale_X64_InsStack.va_codegen_success_Pop_Secret
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (15))))
                                                                    (
                                                                    Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsMem.va_codegen_success_DestroyHeaplets
                                                                    ())
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))
type ('vaub0, 'vaus0, 'win, 'alg, 'inub, 'numubytes, 'outub, 'inoutub,
  'keysub, 'ctrub, 'numublocks, 'key) va_req_Gctr_bytes_stdcall = unit
type ('vaub0, 'vaus0, 'win, 'alg, 'inub, 'numubytes, 'outub, 'inoutub,
  'keysub, 'ctrub, 'numublocks, 'key, 'vausM,
  'vaufM) va_ens_Gctr_bytes_stdcall = unit
let (va_qcode_Gctr_bytes_stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_AES_AES_s.algorithm ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat64 ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_Def_Words_s.nat64 ->
                      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                        (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun alg ->
        fun in_b ->
          fun num_bytes ->
            fun out_b ->
              fun inout_b ->
                fun keys_b ->
                  fun ctr_b ->
                    fun num_blocks ->
                      fun key ->
                        Vale_X64_QuickCodes.qblock
                          [Vale_X64_InsMem.va_code_CreateHeaplets ();
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                          Vale_X64_InsStack.va_code_Push_Secret
                            (Vale_X64_Machine_s.OReg Prims.int_one);
                          Vale_X64_QuickCodes.if_code win
                            (Vale_X64_Machine_s.Block
                               [Vale_X64_InsStack.va_code_PushXmm_Secret
                                  (Prims.of_int (15))
                                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (14))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (13))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (12))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (11))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (10))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (9))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (8))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (7))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PushXmm_Secret
                                 (Prims.of_int (6))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)])
                            (Vale_X64_Machine_s.Block []);
                          Vale_X64_QuickCodes.if_code win
                            (Vale_X64_Machine_s.Block
                               [Vale_X64_InsStack.va_code_Load64_stack
                                  (Vale_X64_Machine_s.OReg Prims.int_zero)
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
                                  (Prims.of_int (272));
                               Vale_X64_InsVector.va_code_Load128_buffer
                                 Prims.int_zero (Prims.of_int (7))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_one)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (8)));
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (9)));
                               Vale_X64_InsStack.va_code_Load64_stack
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
                                 (Prims.of_int (264));
                               Vale_X64_InsStack.va_code_Load64_stack
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
                                 (Prims.of_int (280))])
                            (Vale_X64_Machine_s.Block
                               [Vale_X64_InsVector.va_code_Load128_buffer
                                  Prims.int_zero (Prims.of_int (7))
                                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                                  Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg Prims.int_one)
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                               Vale_X64_InsBasic.va_code_Mov64
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (13)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                               Vale_X64_InsStack.va_code_Load64_stack
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                                 (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
                                 (Prims.of_int (72))]);
                          va_code_Gctr_bytes alg;
                          Vale_X64_QuickCodes.if_code win
                            (Vale_X64_Machine_s.Block
                               [Vale_X64_InsStack.va_code_PopXmm_Secret
                                  (Prims.of_int (6))
                                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (7))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (8))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (9))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (10))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (11))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (12))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (13))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (14))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero);
                               Vale_X64_InsStack.va_code_PopXmm_Secret
                                 (Prims.of_int (15))
                                 (Vale_X64_Machine_s.OReg Prims.int_zero)])
                            (Vale_X64_Machine_s.Block []);
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg Prims.int_one);
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (12)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (13)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (14)));
                          Vale_X64_InsStack.va_code_Pop_Secret
                            (Vale_X64_Machine_s.OReg (Prims.of_int (15)));
                          Vale_X64_InsMem.va_code_DestroyHeaplets ()] va_mods
                          ()

type ('win, 'alg, 'inub, 'numubytes, 'outub, 'inoutub, 'keysub, 'ctrub,
  'numublocks, 'key, 'vaus0, 'vauk) va_wp_Gctr_bytes_stdcall = unit

let (va_quick_Gctr_bytes_stdcall :
  Prims.bool ->
    Vale_AES_AES_s.algorithm ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat64 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_X64_Memory.buffer128 ->
                  Vale_Def_Words_s.nat64 ->
                    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun alg ->
      fun in_b ->
        fun num_bytes ->
          fun out_b ->
            fun inout_b ->
              fun keys_b ->
                fun ctr_b ->
                  fun num_blocks ->
                    fun key ->
                      Vale_X64_QuickCode.QProc
                        ((va_code_Gctr_bytes_stdcall win alg),
                          [Vale_X64_QuickCode.Mod_stackTaint;
                          Vale_X64_QuickCode.Mod_stack;
                          Vale_X64_QuickCode.Mod_flags;
                          Vale_X64_QuickCode.Mod_mem_layout;
                          Vale_X64_QuickCode.Mod_mem_heaplet
                            (Prims.of_int (2));
                          Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
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
                               (Prims.int_zero, (Prims.of_int (6))));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, (Prims.of_int (7))));
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
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_one));
                          Vale_X64_QuickCode.Mod_reg
                            (Vale_X64_Machine_s.Reg
                               (Prims.int_zero, Prims.int_zero));
                          Vale_X64_QuickCode.Mod_mem], (), ())