open Prims
let va_subscript_FStar__Seq__Base__seq :
  'uuuuu . unit -> 'uuuuu FStar_Seq_Base.seq -> Prims.nat -> 'uuuuu =
  fun uu___ -> FStar_Seq_Base.index
type ('hkeysub, 'heap0, 'layout, 'ptr, 'h) hkeys_b_powers = unit
let (quad32_opt_rev :
  Prims.bool -> Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun b -> fun q -> if b then Vale_Def_Types_s.reverse_bytes_quad32 q else q
let (index_opt_rev :
  Prims.bool -> Prims.int -> Prims.int -> Prims.int -> Prims.int) =
  fun b ->
    fun len ->
      fun n ->
        fun i -> if b then (len - Prims.int_one) - i else (len - n) + i
type ('revubytes, 'revublocks, 'scratchuinub, 'scratchulen, 'count, 'heapus,
  'data) scratch_b_blocks = unit
type ('revubytes, 'revublocks, 'scratchuinub, 'scratchulen, 'count, 'heapus,
  'layout, 'ptr, 'data) scratch_b_data = unit
let (va_code_MulAdd_step :
  Prims.nat ->
    Prims.int ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_X64_Machine_s.reg_xmm ->
          Vale_X64_Machine_s.reg_xmm ->
            Vale_X64_Machine_s.reg_xmm ->
              Vale_X64_Machine_s.reg_xmm ->
                Vale_X64_Machine_s.reg_xmm ->
                  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
                    Vale_X64_Machine_s.precode)
  =
  fun m ->
    fun power_index ->
      fun a0 ->
        fun a1 ->
          fun a2 ->
            fun a3 ->
              fun b ->
                fun c ->
                  Vale_X64_Machine_s.Block
                    [if m = Prims.int_zero
                     then
                       Vale_X64_Machine_s.Block
                         [Vale_AES_X64_PolyOps.va_code_VPolyMul a0 b c false
                            false;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a1 b c false
                           true;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a2 b c true
                           false;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul b b c true
                           true;
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (6)) a2 (Vale_X64_Machine_s.OReg a1);
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (8)) (Prims.of_int (8))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                         Vale_X64_InsVector.va_code_Mem128_lemma ();
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (8)) (Prims.of_int (8))
                           (Vale_X64_Machine_s.OMem
                              ((Vale_X64_Machine_s.MReg
                                  ((Vale_X64_Machine_s.Reg
                                      (Prims.int_zero, (Prims.of_int (6)))),
                                    (Prims.of_int (16)))),
                                Vale_Arch_HeapTypes_s.Secret))]
                     else
                       Vale_X64_Machine_s.Block
                         [Vale_X64_InsVector.va_code_Load128_buffer
                            Prims.int_zero c
                            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                            (((Prims.of_int (16)) * power_index) -
                               (Prims.of_int (32)))
                            Vale_Arch_HeapTypes_s.Secret;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a0 b c false
                           false;
                         if m = Prims.int_one
                         then
                           Vale_X64_Machine_s.Block
                             [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                (Prims.of_int (4)) a1
                                (Vale_X64_Machine_s.OReg a0)]
                         else
                           Vale_X64_Machine_s.Block
                             [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                (Prims.of_int (4)) (Prims.of_int (4))
                                (Vale_X64_Machine_s.OReg a0)];
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a1 b c false
                           true;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a2 b c true
                           false;
                         Vale_AES_X64_PolyOps.va_code_VPolyMul a3 b c true
                           true;
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (6)) (Prims.of_int (6))
                           (Vale_X64_Machine_s.OReg a1);
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (6)) (Prims.of_int (6))
                           (Vale_X64_Machine_s.OReg a2);
                         Vale_AES_X64_PolyOps.va_code_VPolyAdd
                           (Prims.of_int (7)) (Prims.of_int (7))
                           (Vale_X64_Machine_s.OReg a3);
                         if m = (Prims.of_int (4))
                         then
                           Vale_X64_Machine_s.Block
                             [Vale_X64_InsVector.va_code_Mem128_lemma ();
                             Vale_AES_X64_PolyOps.va_code_VPolyAdd
                               (Prims.of_int (8)) (Prims.of_int (8))
                               (Vale_X64_Machine_s.OMem
                                  ((Vale_X64_Machine_s.MReg
                                      ((Vale_X64_Machine_s.Reg
                                          (Prims.int_zero,
                                            (Prims.of_int (6)))),
                                        (Prims.of_int (112)))),
                                    Vale_Arch_HeapTypes_s.Secret))]
                         else Vale_X64_Machine_s.Block []];
                    if m < (Prims.of_int (4))
                    then
                      Vale_X64_Machine_s.Block
                        [Vale_X64_InsVector.va_code_Load128_buffer
                           (Prims.of_int (3)) Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                           ((Prims.of_int (48)) + ((Prims.of_int (16)) * m))
                           Vale_Arch_HeapTypes_s.Secret]
                    else Vale_X64_Machine_s.Block []]
let (va_codegen_success_MulAdd_step :
  Prims.nat ->
    Prims.int ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_X64_Machine_s.reg_xmm ->
          Vale_X64_Machine_s.reg_xmm ->
            Vale_X64_Machine_s.reg_xmm ->
              Vale_X64_Machine_s.reg_xmm ->
                Vale_X64_Machine_s.reg_xmm -> Vale_X64_Decls.va_pbool)
  =
  fun m ->
    fun power_index ->
      fun a0 ->
        fun a1 ->
          fun a2 ->
            fun a3 ->
              fun b ->
                fun c ->
                  Vale_X64_Decls.va_pbool_and
                    (if m = Prims.int_zero
                     then
                       Vale_X64_Decls.va_pbool_and
                         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul a0
                            b c false false)
                         (Vale_X64_Decls.va_pbool_and
                            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                               a1 b c false true)
                            (Vale_X64_Decls.va_pbool_and
                               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                  a2 b c true false)
                               (Vale_X64_Decls.va_pbool_and
                                  (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                     b b c true true)
                                  (Vale_X64_Decls.va_pbool_and
                                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                        (Prims.of_int (6)) a2
                                        (Vale_X64_Machine_s.OReg a1))
                                     (Vale_X64_Decls.va_pbool_and
                                        (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                           (Prims.of_int (8))
                                           (Prims.of_int (8))
                                           (Vale_X64_Machine_s.OReg
                                              (Prims.of_int (4))))
                                        (Vale_X64_Decls.va_pbool_and
                                           (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                              ())
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                 (Prims.of_int (8))
                                                 (Prims.of_int (8))
                                                 (Vale_X64_Machine_s.OMem
                                                    ((Vale_X64_Machine_s.MReg
                                                        ((Vale_X64_Machine_s.Reg
                                                            (Prims.int_zero,
                                                              (Prims.of_int (6)))),
                                                          (Prims.of_int (16)))),
                                                      Vale_Arch_HeapTypes_s.Secret)))
                                              (Vale_X64_Decls.va_ttrue ()))))))))
                     else
                       Vale_X64_Decls.va_pbool_and
                         (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                            Prims.int_zero c
                            (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                            (((Prims.of_int (16)) * power_index) -
                               (Prims.of_int (32)))
                            Vale_Arch_HeapTypes_s.Secret)
                         (Vale_X64_Decls.va_pbool_and
                            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                               a0 b c false false)
                            (Vale_X64_Decls.va_pbool_and
                               (if m = Prims.int_one
                                then
                                  Vale_X64_Decls.va_pbool_and
                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                       (Prims.of_int (4)) a1
                                       (Vale_X64_Machine_s.OReg a0))
                                    (Vale_X64_Decls.va_ttrue ())
                                else
                                  Vale_X64_Decls.va_pbool_and
                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                       (Prims.of_int (4)) (Prims.of_int (4))
                                       (Vale_X64_Machine_s.OReg a0))
                                    (Vale_X64_Decls.va_ttrue ()))
                               (Vale_X64_Decls.va_pbool_and
                                  (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                     a1 b c false true)
                                  (Vale_X64_Decls.va_pbool_and
                                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                        a2 b c true false)
                                     (Vale_X64_Decls.va_pbool_and
                                        (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                           a3 b c true true)
                                        (Vale_X64_Decls.va_pbool_and
                                           (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                              (Prims.of_int (6))
                                              (Prims.of_int (6))
                                              (Vale_X64_Machine_s.OReg a1))
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                 (Prims.of_int (6))
                                                 (Prims.of_int (6))
                                                 (Vale_X64_Machine_s.OReg a2))
                                              (Vale_X64_Decls.va_pbool_and
                                                 (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                    (Prims.of_int (7))
                                                    (Prims.of_int (7))
                                                    (Vale_X64_Machine_s.OReg
                                                       a3))
                                                 (Vale_X64_Decls.va_pbool_and
                                                    (if
                                                       m = (Prims.of_int (4))
                                                     then
                                                       Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                            ())
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                               (Prims.of_int (8))
                                                               (Prims.of_int (8))
                                                               (Vale_X64_Machine_s.OMem
                                                                  ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (6)))),
                                                                    (Prims.of_int (112)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                            (Vale_X64_Decls.va_ttrue
                                                               ()))
                                                     else
                                                       Vale_X64_Decls.va_ttrue
                                                         ())
                                                    (Vale_X64_Decls.va_ttrue
                                                       ())))))))))))
                    (Vale_X64_Decls.va_pbool_and
                       (if m < (Prims.of_int (4))
                        then
                          Vale_X64_Decls.va_pbool_and
                            (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                               (Prims.of_int (3)) Prims.int_zero
                               (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                               ((Prims.of_int (48)) +
                                  ((Prims.of_int (16)) * m))
                               Vale_Arch_HeapTypes_s.Secret)
                            (Vale_X64_Decls.va_ttrue ())
                        else Vale_X64_Decls.va_ttrue ())
                       (Vale_X64_Decls.va_ttrue ()))

type ('m, 'poweruindex, 'a0, 'a1, 'a2, 'a3, 'b, 'c, 'hkeysub, 'scratchub, 
  'h, 'prev, 'data, 'vaus0, 'vauk) va_wp_MulAdd_step = unit

let (va_quick_MulAdd_step :
  Prims.nat ->
    Prims.int ->
      Vale_X64_Machine_s.reg_xmm ->
        Vale_X64_Machine_s.reg_xmm ->
          Vale_X64_Machine_s.reg_xmm ->
            Vale_X64_Machine_s.reg_xmm ->
              Vale_X64_Machine_s.reg_xmm ->
                Vale_X64_Machine_s.reg_xmm ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_Math_Poly2_s.poly ->
                        Vale_Math_Poly2_s.poly ->
                          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun m ->
    fun power_index ->
      fun a0 ->
        fun a1 ->
          fun a2 ->
            fun a3 ->
              fun b ->
                fun c ->
                  fun hkeys_b ->
                    fun scratch_b ->
                      fun h ->
                        fun prev ->
                          fun data ->
                            Vale_X64_QuickCode.QProc
                              ((va_code_MulAdd_step m power_index a0 a1 a2 a3
                                  b c),
                                [Vale_X64_QuickCode.Mod_reg
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
                                     (Prims.int_one, (Prims.of_int (4))));
                                Vale_X64_QuickCode.Mod_reg
                                  (Vale_X64_Machine_s.Reg
                                     (Prims.int_one, Prims.int_zero));
                                Vale_X64_QuickCode.Mod_flags;
                                Vale_X64_QuickCode.va_mod_xmm c;
                                Vale_X64_QuickCode.va_mod_xmm b;
                                Vale_X64_QuickCode.va_mod_xmm a3;
                                Vale_X64_QuickCode.va_mod_xmm a2;
                                Vale_X64_QuickCode.va_mod_xmm a1;
                                Vale_X64_QuickCode.va_mod_xmm a0], (), ())
let (va_code_MulAdd_unroll_i :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        Prims.bool ->
          Prims.int ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun is_first ->
        fun is_last ->
          fun power_index ->
            Vale_X64_Machine_s.Block
              [if is_last
               then
                 Vale_X64_Machine_s.Block
                   [Vale_AES_X64_PolyOps.va_code_VPolyAdd Prims.int_zero
                      (Prims.of_int (8))
                      (Vale_X64_Machine_s.OReg Prims.int_zero)]
               else
                 Vale_X64_Machine_s.Block
                   [if rev_blocks
                    then
                      Vale_X64_Machine_s.Block
                        [Vale_X64_InsBasic.va_code_Add64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (16)))]
                    else
                      Vale_X64_Machine_s.Block
                        [Vale_X64_InsBasic.va_code_Sub64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (16)))]];
              Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                Prims.int_zero (Prims.of_int (5)) false false;
              Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                Prims.int_zero (Prims.of_int (5)) false true;
              Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
                Prims.int_zero (Prims.of_int (5)) true false;
              Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                Prims.int_zero (Prims.of_int (5)) true true;
              Vale_X64_Machine_s.Block [];
              if Prims.op_Negation is_last
              then
                Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
                     Prims.int_zero
                     (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                     Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                  (if Prims.op_Negation rev_bytes
                   then
                     Vale_X64_Machine_s.Block
                       [Vale_X64_InsVector.va_code_Pshufb Prims.int_zero
                          (Prims.of_int (9))]
                   else Vale_X64_Machine_s.Block [])]
              else Vale_X64_Machine_s.Block [];
              if is_first
              then
                Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4))
                     Prims.int_one]
              else
                Vale_X64_Machine_s.Block
                  [Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                     (Prims.of_int (4))
                     (Vale_X64_Machine_s.OReg Prims.int_one)];
              if Prims.op_Negation is_last
              then
                Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                     Prims.int_one
                     (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                     (((Prims.of_int (16)) * power_index) -
                        (Prims.of_int (32))) Vale_Arch_HeapTypes_s.Secret]
              else Vale_X64_Machine_s.Block [];
              if is_first
              then
                Vale_X64_Machine_s.Block
                  [Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                     (Prims.of_int (2))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                  Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
                    (Prims.of_int (5))]
              else
                Vale_X64_Machine_s.Block
                  [Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                     (Prims.of_int (6))
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                  Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                    (Prims.of_int (6))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                  Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                    (Prims.of_int (7))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))];
              if Prims.op_Negation is_last
              then
                Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (5))
                     Prims.int_one]
              else Vale_X64_Machine_s.Block []]
let (va_codegen_success_MulAdd_unroll_i :
  Prims.bool ->
    Prims.bool ->
      Prims.bool -> Prims.bool -> Prims.int -> Vale_X64_Decls.va_pbool)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun is_first ->
        fun is_last ->
          fun power_index ->
            Vale_X64_Decls.va_pbool_and
              (if is_last
               then
                 Vale_X64_Decls.va_pbool_and
                   (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                      Prims.int_zero (Prims.of_int (8))
                      (Vale_X64_Machine_s.OReg Prims.int_zero))
                   (Vale_X64_Decls.va_ttrue ())
               else
                 Vale_X64_Decls.va_pbool_and
                   (if rev_blocks
                    then
                      Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Add64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
                        (Vale_X64_Decls.va_ttrue ())
                    else
                      Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Sub64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
                        (Vale_X64_Decls.va_ttrue ()))
                   (Vale_X64_Decls.va_ttrue ()))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                    Prims.int_one Prims.int_zero (Prims.of_int (5)) false
                    false)
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                       (Prims.of_int (2)) Prims.int_zero (Prims.of_int (5))
                       false true)
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                          (Prims.of_int (3)) Prims.int_zero
                          (Prims.of_int (5)) true false)
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                             (Prims.of_int (5)) Prims.int_zero
                             (Prims.of_int (5)) true true)
                          (Vale_X64_Decls.va_pbool_and
                             (if Prims.op_Negation is_last
                              then
                                Vale_X64_Decls.va_pbool_and
                                  (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                     Prims.int_one Prims.int_zero
                                     (Vale_X64_Machine_s.OReg
                                        (Prims.of_int (11))) Prims.int_zero
                                     Vale_Arch_HeapTypes_s.Secret)
                                  (Vale_X64_Decls.va_pbool_and
                                     (if Prims.op_Negation rev_bytes
                                      then
                                        Vale_X64_Decls.va_pbool_and
                                          (Vale_X64_InsVector.va_codegen_success_Pshufb
                                             Prims.int_zero
                                             (Prims.of_int (9)))
                                          (Vale_X64_Decls.va_ttrue ())
                                      else Vale_X64_Decls.va_ttrue ())
                                     (Vale_X64_Decls.va_ttrue ()))
                              else Vale_X64_Decls.va_ttrue ())
                             (Vale_X64_Decls.va_pbool_and
                                (if is_first
                                 then
                                   Vale_X64_Decls.va_pbool_and
                                     (Vale_X64_InsVector.va_codegen_success_Mov128
                                        (Prims.of_int (4)) Prims.int_one)
                                     (Vale_X64_Decls.va_ttrue ())
                                 else
                                   Vale_X64_Decls.va_pbool_and
                                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                        (Prims.of_int (4)) (Prims.of_int (4))
                                        (Vale_X64_Machine_s.OReg
                                           Prims.int_one))
                                     (Vale_X64_Decls.va_ttrue ()))
                                (Vale_X64_Decls.va_pbool_and
                                   (if Prims.op_Negation is_last
                                    then
                                      Vale_X64_Decls.va_pbool_and
                                        (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                           Prims.int_zero Prims.int_one
                                           (Vale_X64_Machine_s.OReg
                                              (Prims.of_int (9)))
                                           (((Prims.of_int (16)) *
                                               power_index)
                                              - (Prims.of_int (32)))
                                           Vale_Arch_HeapTypes_s.Secret)
                                        (Vale_X64_Decls.va_ttrue ())
                                    else Vale_X64_Decls.va_ttrue ())
                                   (Vale_X64_Decls.va_pbool_and
                                      (if is_first
                                       then
                                         Vale_X64_Decls.va_pbool_and
                                           (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                              (Prims.of_int (6))
                                              (Prims.of_int (2))
                                              (Vale_X64_Machine_s.OReg
                                                 (Prims.of_int (3))))
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_X64_InsVector.va_codegen_success_Mov128
                                                 (Prims.of_int (7))
                                                 (Prims.of_int (5)))
                                              (Vale_X64_Decls.va_ttrue ()))
                                       else
                                         Vale_X64_Decls.va_pbool_and
                                           (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                              (Prims.of_int (6))
                                              (Prims.of_int (6))
                                              (Vale_X64_Machine_s.OReg
                                                 (Prims.of_int (2))))
                                           (Vale_X64_Decls.va_pbool_and
                                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                 (Prims.of_int (6))
                                                 (Prims.of_int (6))
                                                 (Vale_X64_Machine_s.OReg
                                                    (Prims.of_int (3))))
                                              (Vale_X64_Decls.va_pbool_and
                                                 (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                    (Prims.of_int (7))
                                                    (Prims.of_int (7))
                                                    (Vale_X64_Machine_s.OReg
                                                       (Prims.of_int (5))))
                                                 (Vale_X64_Decls.va_ttrue ()))))
                                      (Vale_X64_Decls.va_pbool_and
                                         (if Prims.op_Negation is_last
                                          then
                                            Vale_X64_Decls.va_pbool_and
                                              (Vale_X64_InsVector.va_codegen_success_Mov128
                                                 (Prims.of_int (5))
                                                 Prims.int_one)
                                              (Vale_X64_Decls.va_ttrue ())
                                          else Vale_X64_Decls.va_ttrue ())
                                         (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_MulAdd_unroll_i :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Prims.bool ->
        Prims.bool ->
          Prims.bool ->
            Prims.int ->
              Vale_Def_Words_s.nat64 ->
                Prims.nat ->
                  Prims.int ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_X64_Memory.buffer128 ->
                        Vale_Math_Poly2_s.poly ->
                          Vale_Math_Poly2_s.poly ->
                            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun rev_bytes ->
      fun rev_blocks ->
        fun is_first ->
          fun is_last ->
            fun power_index ->
              fun scratch_len ->
                fun n ->
                  fun m ->
                    fun hkeys_b ->
                      fun scratch_in_b ->
                        fun h ->
                          fun prev ->
                            fun data ->
                              Vale_X64_QuickCodes.qblock
                                [Vale_X64_QuickCodes.if_code is_last
                                   (Vale_X64_Machine_s.Block
                                      [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                         Prims.int_zero (Prims.of_int (8))
                                         (Vale_X64_Machine_s.OReg
                                            Prims.int_zero)])
                                   (Vale_X64_Machine_s.Block
                                      [Vale_X64_QuickCodes.if_code rev_blocks
                                         (Vale_X64_Machine_s.Block
                                            [Vale_X64_InsBasic.va_code_Add64
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (11)))
                                               (Vale_X64_Machine_s.OConst
                                                  (Prims.of_int (16)))])
                                         (Vale_X64_Machine_s.Block
                                            [Vale_X64_InsBasic.va_code_Sub64
                                               (Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (11)))
                                               (Vale_X64_Machine_s.OConst
                                                  (Prims.of_int (16)))])]);
                                Vale_AES_X64_PolyOps.va_code_VPolyMul
                                  Prims.int_one Prims.int_zero
                                  (Prims.of_int (5)) false false;
                                Vale_AES_X64_PolyOps.va_code_VPolyMul
                                  (Prims.of_int (2)) Prims.int_zero
                                  (Prims.of_int (5)) false true;
                                Vale_AES_X64_PolyOps.va_code_VPolyMul
                                  (Prims.of_int (3)) Prims.int_zero
                                  (Prims.of_int (5)) true false;
                                Vale_AES_X64_PolyOps.va_code_VPolyMul
                                  (Prims.of_int (5)) Prims.int_zero
                                  (Prims.of_int (5)) true true;
                                Vale_X64_Machine_s.Block [];
                                Vale_X64_QuickCodes.if_code
                                  (Prims.op_Negation is_last)
                                  (Vale_X64_Machine_s.Block
                                     [Vale_X64_InsVector.va_code_Load128_buffer
                                        Prims.int_one Prims.int_zero
                                        (Vale_X64_Machine_s.OReg
                                           (Prims.of_int (11)))
                                        Prims.int_zero
                                        Vale_Arch_HeapTypes_s.Secret;
                                     Vale_X64_QuickCodes.if_code
                                       (Prims.op_Negation rev_bytes)
                                       (Vale_X64_Machine_s.Block
                                          [Vale_X64_InsVector.va_code_Pshufb
                                             Prims.int_zero
                                             (Prims.of_int (9))])
                                       (Vale_X64_Machine_s.Block [])])
                                  (Vale_X64_Machine_s.Block []);
                                Vale_X64_QuickCodes.if_code is_first
                                  (Vale_X64_Machine_s.Block
                                     [Vale_X64_InsVector.va_code_Mov128
                                        (Prims.of_int (4)) Prims.int_one])
                                  (Vale_X64_Machine_s.Block
                                     [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                        (Prims.of_int (4)) (Prims.of_int (4))
                                        (Vale_X64_Machine_s.OReg
                                           Prims.int_one)]);
                                Vale_X64_QuickCodes.if_code
                                  (Prims.op_Negation is_last)
                                  (Vale_X64_Machine_s.Block
                                     [Vale_X64_InsVector.va_code_Load128_buffer
                                        Prims.int_zero Prims.int_one
                                        (Vale_X64_Machine_s.OReg
                                           (Prims.of_int (9)))
                                        (((Prims.of_int (16)) * power_index)
                                           - (Prims.of_int (32)))
                                        Vale_Arch_HeapTypes_s.Secret])
                                  (Vale_X64_Machine_s.Block []);
                                Vale_X64_QuickCodes.if_code is_first
                                  (Vale_X64_Machine_s.Block
                                     [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                        (Prims.of_int (6)) (Prims.of_int (2))
                                        (Vale_X64_Machine_s.OReg
                                           (Prims.of_int (3)));
                                     Vale_X64_InsVector.va_code_Mov128
                                       (Prims.of_int (7)) (Prims.of_int (5))])
                                  (Vale_X64_Machine_s.Block
                                     [Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                        (Prims.of_int (6)) (Prims.of_int (6))
                                        (Vale_X64_Machine_s.OReg
                                           (Prims.of_int (2)));
                                     Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                       (Prims.of_int (6)) (Prims.of_int (6))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (3)));
                                     Vale_AES_X64_PolyOps.va_code_VPolyAdd
                                       (Prims.of_int (7)) (Prims.of_int (7))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (5)))]);
                                Vale_X64_QuickCodes.if_code
                                  (Prims.op_Negation is_last)
                                  (Vale_X64_Machine_s.Block
                                     [Vale_X64_InsVector.va_code_Mov128
                                        (Prims.of_int (5)) Prims.int_one])
                                  (Vale_X64_Machine_s.Block [])] va_mods ()

type ('revubytes, 'revublocks, 'isufirst, 'isulast, 'poweruindex,
  'scratchulen, 'n, 'm, 'hkeysub, 'scratchuinub, 'h, 'prev, 'data, 'vaus0,
  'vauk) va_wp_MulAdd_unroll_i = unit

let (va_quick_MulAdd_unroll_i :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        Prims.bool ->
          Prims.int ->
            Vale_Def_Words_s.nat64 ->
              Prims.nat ->
                Prims.int ->
                  Vale_X64_Memory.buffer128 ->
                    Vale_X64_Memory.buffer128 ->
                      Vale_Math_Poly2_s.poly ->
                        Vale_Math_Poly2_s.poly ->
                          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun is_first ->
        fun is_last ->
          fun power_index ->
            fun scratch_len ->
              fun n ->
                fun m ->
                  fun hkeys_b ->
                    fun scratch_in_b ->
                      fun h ->
                        fun prev ->
                          fun data ->
                            Vale_X64_QuickCode.QProc
                              ((va_code_MulAdd_unroll_i rev_bytes rev_blocks
                                  is_first is_last power_index),
                                [Vale_X64_QuickCode.Mod_reg
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
                                     (Prims.int_zero, (Prims.of_int (11))));
                                Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_MulAdd_unroll_n :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
             (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
          Vale_X64_InsVector.va_code_Load128_buffer Prims.int_one
            Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
            Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
          if Prims.op_Negation rev_bytes
          then
            Vale_X64_Machine_s.Block
              [Vale_X64_InsVector.va_code_Pshufb Prims.int_zero
                 (Prims.of_int (9))]
          else Vale_X64_Machine_s.Block [];
          if exactly6
          then
            Vale_X64_Machine_s.Block
              [va_code_MulAdd_unroll_i rev_bytes rev_blocks true false
                 Prims.int_one;
              va_code_MulAdd_unroll_i rev_bytes rev_blocks false false
                (Prims.of_int (3));
              va_code_MulAdd_unroll_i rev_bytes rev_blocks false false
                (Prims.of_int (4));
              va_code_MulAdd_unroll_i rev_bytes rev_blocks false false
                (Prims.of_int (6));
              va_code_MulAdd_unroll_i rev_bytes rev_blocks false false
                (Prims.of_int (7));
              va_code_MulAdd_unroll_i rev_bytes rev_blocks false true
                Prims.int_zero]
          else
            Vale_X64_Machine_s.Block
              [Vale_X64_Machine_s.IfElse
                 ((Vale_X64_Decls.va_cmp_eq
                     (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                     (Vale_X64_Machine_s.OConst Prims.int_one)),
                   (Vale_X64_Machine_s.Block
                      [va_code_MulAdd_unroll_i rev_bytes rev_blocks true true
                         Prims.int_one]),
                   (Vale_X64_Machine_s.Block
                      [va_code_MulAdd_unroll_i rev_bytes rev_blocks true
                         false Prims.int_one;
                      Vale_X64_Machine_s.IfElse
                        ((Vale_X64_Decls.va_cmp_ne
                            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                            (Vale_X64_Machine_s.OConst (Prims.of_int (2)))),
                          (Vale_X64_Machine_s.Block
                             [va_code_MulAdd_unroll_i rev_bytes rev_blocks
                                false false (Prims.of_int (3));
                             Vale_X64_Machine_s.IfElse
                               ((Vale_X64_Decls.va_cmp_ne
                                   (Vale_X64_Machine_s.OReg
                                      (Prims.of_int (3)))
                                   (Vale_X64_Machine_s.OConst
                                      (Prims.of_int (3)))),
                                 (Vale_X64_Machine_s.Block
                                    [va_code_MulAdd_unroll_i rev_bytes
                                       rev_blocks false false
                                       (Prims.of_int (4));
                                    Vale_X64_Machine_s.IfElse
                                      ((Vale_X64_Decls.va_cmp_ne
                                          (Vale_X64_Machine_s.OReg
                                             (Prims.of_int (3)))
                                          (Vale_X64_Machine_s.OConst
                                             (Prims.of_int (4)))),
                                        (Vale_X64_Machine_s.Block
                                           [va_code_MulAdd_unroll_i rev_bytes
                                              rev_blocks false false
                                              (Prims.of_int (6))]),
                                        (Vale_X64_Machine_s.Block []))]),
                                 (Vale_X64_Machine_s.Block []))]),
                          (Vale_X64_Machine_s.Block []));
                      va_code_MulAdd_unroll_i rev_bytes rev_blocks false true
                        Prims.int_zero]))]]
let (va_codegen_success_MulAdd_unroll_n :
  Prims.bool -> Prims.bool -> Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        Vale_X64_Decls.va_pbool_and
          (Vale_X64_InsVector.va_codegen_success_Load128_buffer
             Prims.int_zero (Prims.of_int (5))
             (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
             (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret)
          (Vale_X64_Decls.va_pbool_and
             (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                Prims.int_one Prims.int_zero
                (Vale_X64_Machine_s.OReg (Prims.of_int (11))) Prims.int_zero
                Vale_Arch_HeapTypes_s.Secret)
             (Vale_X64_Decls.va_pbool_and
                (if Prims.op_Negation rev_bytes
                 then
                   Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Pshufb
                        Prims.int_zero (Prims.of_int (9)))
                     (Vale_X64_Decls.va_ttrue ())
                 else Vale_X64_Decls.va_ttrue ())
                (Vale_X64_Decls.va_pbool_and
                   (if exactly6
                    then
                      Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_MulAdd_unroll_i rev_bytes
                           rev_blocks true false Prims.int_one)
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_MulAdd_unroll_i rev_bytes
                              rev_blocks false false (Prims.of_int (3)))
                           (Vale_X64_Decls.va_pbool_and
                              (va_codegen_success_MulAdd_unroll_i rev_bytes
                                 rev_blocks false false (Prims.of_int (4)))
                              (Vale_X64_Decls.va_pbool_and
                                 (va_codegen_success_MulAdd_unroll_i
                                    rev_bytes rev_blocks false false
                                    (Prims.of_int (6)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (va_codegen_success_MulAdd_unroll_i
                                       rev_bytes rev_blocks false false
                                       (Prims.of_int (7)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_MulAdd_unroll_i
                                          rev_bytes rev_blocks false true
                                          Prims.int_zero)
                                       (Vale_X64_Decls.va_ttrue ()))))))
                    else
                      Vale_X64_Decls.va_pbool_and
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_MulAdd_unroll_i rev_bytes
                              rev_blocks true true Prims.int_one)
                           (Vale_X64_Decls.va_pbool_and
                              (va_codegen_success_MulAdd_unroll_i rev_bytes
                                 rev_blocks true false Prims.int_one)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_Decls.va_pbool_and
                                    (va_codegen_success_MulAdd_unroll_i
                                       rev_bytes rev_blocks false false
                                       (Prims.of_int (3)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_MulAdd_unroll_i
                                          rev_bytes rev_blocks false false
                                          (Prims.of_int (4)))
                                       (va_codegen_success_MulAdd_unroll_i
                                          rev_bytes rev_blocks false false
                                          (Prims.of_int (6)))))
                                 (va_codegen_success_MulAdd_unroll_i
                                    rev_bytes rev_blocks false true
                                    Prims.int_zero))))
                        (Vale_X64_Decls.va_ttrue ()))
                   (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_MulAdd_unroll_n :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Prims.bool ->
        Prims.bool ->
          Vale_Def_Words_s.nat64 ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_Math_Poly2_s.poly ->
                  Vale_Math_Poly2_s.poly ->
                    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun rev_bytes ->
      fun rev_blocks ->
        fun exactly6 ->
          fun scratch_len ->
            fun hkeys_b ->
              fun scratch_in_b ->
                fun h ->
                  fun prev ->
                    fun data ->
                      Vale_X64_QuickCodes.qblock
                        [Vale_X64_InsVector.va_code_Load128_buffer
                           Prims.int_zero (Prims.of_int (5))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                           (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_InsVector.va_code_Load128_buffer
                          Prims.int_one Prims.int_zero
                          (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                          Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_QuickCodes.if_code
                          (Prims.op_Negation rev_bytes)
                          (Vale_X64_Machine_s.Block
                             [Vale_X64_InsVector.va_code_Pshufb
                                Prims.int_zero (Prims.of_int (9))])
                          (Vale_X64_Machine_s.Block []);
                        Vale_X64_QuickCodes.if_code exactly6
                          (Vale_X64_Machine_s.Block
                             [va_code_MulAdd_unroll_i rev_bytes rev_blocks
                                true false Prims.int_one;
                             va_code_MulAdd_unroll_i rev_bytes rev_blocks
                               false false (Prims.of_int (3));
                             va_code_MulAdd_unroll_i rev_bytes rev_blocks
                               false false (Prims.of_int (4));
                             va_code_MulAdd_unroll_i rev_bytes rev_blocks
                               false false (Prims.of_int (6));
                             va_code_MulAdd_unroll_i rev_bytes rev_blocks
                               false false (Prims.of_int (7));
                             va_code_MulAdd_unroll_i rev_bytes rev_blocks
                               false true Prims.int_zero])
                          (Vale_X64_Machine_s.Block
                             [Vale_X64_Machine_s.IfElse
                                ((Vale_X64_QuickCodes.cmp_to_ocmp
                                    (Vale_X64_QuickCodes.Cmp_eq
                                       ((Vale_X64_Machine_s.OReg
                                           (Prims.of_int (3))),
                                         (Vale_X64_Machine_s.OConst
                                            Prims.int_one)))),
                                  (Vale_X64_Machine_s.Block
                                     [va_code_MulAdd_unroll_i rev_bytes
                                        rev_blocks true true Prims.int_one]),
                                  (Vale_X64_Machine_s.Block
                                     [va_code_MulAdd_unroll_i rev_bytes
                                        rev_blocks true false Prims.int_one;
                                     Vale_X64_Machine_s.IfElse
                                       ((Vale_X64_QuickCodes.cmp_to_ocmp
                                           (Vale_X64_QuickCodes.Cmp_ne
                                              ((Vale_X64_Machine_s.OReg
                                                  (Prims.of_int (3))),
                                                (Vale_X64_Machine_s.OConst
                                                   (Prims.of_int (2)))))),
                                         (Vale_X64_Machine_s.Block
                                            [va_code_MulAdd_unroll_i
                                               rev_bytes rev_blocks false
                                               false (Prims.of_int (3));
                                            Vale_X64_Machine_s.IfElse
                                              ((Vale_X64_QuickCodes.cmp_to_ocmp
                                                  (Vale_X64_QuickCodes.Cmp_ne
                                                     ((Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (3))),
                                                       (Vale_X64_Machine_s.OConst
                                                          (Prims.of_int (3)))))),
                                                (Vale_X64_Machine_s.Block
                                                   [va_code_MulAdd_unroll_i
                                                      rev_bytes rev_blocks
                                                      false false
                                                      (Prims.of_int (4));
                                                   Vale_X64_Machine_s.IfElse
                                                     ((Vale_X64_QuickCodes.cmp_to_ocmp
                                                         (Vale_X64_QuickCodes.Cmp_ne
                                                            ((Vale_X64_Machine_s.OReg
                                                                (Prims.of_int (3))),
                                                              (Vale_X64_Machine_s.OConst
                                                                 (Prims.of_int (4)))))),
                                                       (Vale_X64_Machine_s.Block
                                                          [va_code_MulAdd_unroll_i
                                                             rev_bytes
                                                             rev_blocks false
                                                             false
                                                             (Prims.of_int (6))]),
                                                       (Vale_X64_Machine_s.Block
                                                          []))]),
                                                (Vale_X64_Machine_s.Block []))]),
                                         (Vale_X64_Machine_s.Block []));
                                     va_code_MulAdd_unroll_i rev_bytes
                                       rev_blocks false true Prims.int_zero]))])]
                        va_mods ()

type ('revubytes, 'revublocks, 'exactly6, 'scratchulen, 'hkeysub,
  'scratchuinub, 'h, 'prev, 'data, 'vaus0, 'vauk) va_wp_MulAdd_unroll_n =
  unit

let (va_quick_MulAdd_unroll_n :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        Vale_Def_Words_s.nat64 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_Math_Poly2_s.poly ->
                Vale_Math_Poly2_s.poly ->
                  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        fun scratch_len ->
          fun hkeys_b ->
            fun scratch_in_b ->
              fun h ->
                fun prev ->
                  fun data ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_MulAdd_unroll_n rev_bytes rev_blocks exactly6),
                        [Vale_X64_QuickCode.Mod_reg
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
                             (Prims.int_zero, (Prims.of_int (11))));
                        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_MulAdd_unroll :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one (Prims.of_int (7))
        (Prims.of_int (3)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
        (Prims.of_int (7)) (Prims.of_int (3)) false true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (6))
        (Prims.of_int (7)) (Prims.of_int (3)) true false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (7))
        (Prims.of_int (7)) (Prims.of_int (3)) true true;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (3)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4)) Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (3)) false true;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (3)) true false;
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6)))),
                 (Prims.of_int (16)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (3)) true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (5)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (5)) false true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (5)) true false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (5)) true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (9))) (Prims.of_int (32))
        Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        Prims.int_one false false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        Prims.int_one false true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        Prims.int_one true false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        Prims.int_one true true;
      Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
        Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
        (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (2)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (2)) false true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (2)) true false;
      Vale_X64_InsVector.va_code_Mem128_lemma ();
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
        (Prims.of_int (8))
        (Vale_X64_Machine_s.OMem
           ((Vale_X64_Machine_s.MReg
               ((Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6)))),
                 (Prims.of_int (112)))), Vale_Arch_HeapTypes_s.Secret));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (2)) true true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
        (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
        (Prims.of_int (8)) (Prims.of_int (3)) false true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one (Prims.of_int (8))
        (Prims.of_int (3)) true false;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
        (Prims.of_int (8)) (Prims.of_int (3)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (8))
        (Prims.of_int (8)) (Prims.of_int (3)) true true;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
      Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
        (Prims.parse_int "3254779904") (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))]
let (va_codegen_success_MulAdd_unroll : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul Prims.int_one
            (Prims.of_int (7)) (Prims.of_int (3)) false false)
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
               (Prims.of_int (5)) (Prims.of_int (7)) (Prims.of_int (3)) false
               true)
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                  (Prims.of_int (3)) Prims.int_zero
                  (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                     (Prims.of_int (6)) (Prims.of_int (7)) (Prims.of_int (3))
                     true false)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                        (Prims.of_int (7)) (Prims.of_int (7))
                        (Prims.of_int (3)) true true)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                           Prims.int_zero (Prims.of_int (3))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                           (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                              (Prims.of_int (6)) (Prims.of_int (6))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                 (Prims.of_int (5)) Prims.int_zero
                                 (Prims.of_int (3)) false false)
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                    (Prims.of_int (8)) (Prims.of_int (8))
                                    (Vale_X64_Machine_s.OReg
                                       (Prims.of_int (4))))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                       (Prims.of_int (4)) Prims.int_one
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (5))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                          Prims.int_one Prims.int_zero
                                          (Prims.of_int (3)) false true)
                                       (Vale_X64_Decls.va_pbool_and
                                          (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                             (Prims.of_int (2))
                                             Prims.int_zero
                                             (Prims.of_int (3)) true false)
                                          (Vale_X64_Decls.va_pbool_and
                                             (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                ())
                                             (Vale_X64_Decls.va_pbool_and
                                                (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                   (Prims.of_int (8))
                                                   (Prims.of_int (8))
                                                   (Vale_X64_Machine_s.OMem
                                                      ((Vale_X64_Machine_s.MReg
                                                          ((Vale_X64_Machine_s.Reg
                                                              (Prims.int_zero,
                                                                (Prims.of_int (6)))),
                                                            (Prims.of_int (16)))),
                                                        Vale_Arch_HeapTypes_s.Secret)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                      (Prims.of_int (3))
                                                      Prims.int_zero
                                                      (Prims.of_int (3)) true
                                                      true)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                         (Prims.of_int (3))
                                                         Prims.int_zero
                                                         (Vale_X64_Machine_s.OReg
                                                            (Prims.of_int (6)))
                                                         (Prims.of_int (64))
                                                         Vale_Arch_HeapTypes_s.Secret)
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                            Prims.int_zero
                                                            (Prims.of_int (5))
                                                            (Vale_X64_Machine_s.OReg
                                                               (Prims.of_int (9)))
                                                            (Prims.of_int (16))
                                                            Vale_Arch_HeapTypes_s.Secret)
                                                         (Vale_X64_Decls.va_pbool_and
                                                            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                               (Prims.of_int (6))
                                                               (Prims.of_int (6))
                                                               (Vale_X64_Machine_s.OReg
                                                                  Prims.int_one))
                                                            (Vale_X64_Decls.va_pbool_and
                                                               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                  Prims.int_one
                                                                  Prims.int_zero
                                                                  (Prims.of_int (5))
                                                                  false false)
                                                               (Vale_X64_Decls.va_pbool_and
                                                                  (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                  (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (5))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (32))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    Prims.int_one
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (6)))
                                                                    (Prims.of_int (96))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (64))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (3))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Mem128_lemma
                                                                    ())
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (8))
                                                                    (Vale_X64_Machine_s.OMem
                                                                    ((Vale_X64_Machine_s.MReg
                                                                    ((Vale_X64_Machine_s.Reg
                                                                    (Prims.int_zero,
                                                                    (Prims.of_int (6)))),
                                                                    (Prims.of_int (112)))),
                                                                    Vale_Arch_HeapTypes_s.Secret)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    Prims.int_zero
                                                                    (Prims.of_int (2))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (3))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                                    Prims.int_zero
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (9)))
                                                                    (Prims.of_int (80))
                                                                    Vale_Arch_HeapTypes_s.Secret)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (5))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    Prims.int_one
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    true
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (2))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    false
                                                                    false)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (8))
                                                                    (Prims.of_int (3))
                                                                    true true)
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (5))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (6))
                                                                    (Prims.of_int (6))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_one))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (4))
                                                                    (Prims.of_int (4))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (2))))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                                                                    (Prims.of_int (3)))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                                                                    (Prims.of_int (3))
                                                                    (Prims.parse_int "3254779904")
                                                                    (Prims.of_int (3))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    Prims.int_zero))
                                                                    (Vale_X64_Decls.va_pbool_and
                                                                    (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                                                    (Prims.of_int (7))
                                                                    (Prims.of_int (7))
                                                                    (Vale_X64_Machine_s.OReg
                                                                    (Prims.of_int (8))))
                                                                    (Vale_X64_Decls.va_ttrue
                                                                    ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
let (va_qcode_MulAdd_unroll :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Math_Poly2_s.poly ->
          Vale_Math_Poly2_s.poly ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun hkeys_b ->
      fun scratch_b ->
        fun h ->
          fun prev ->
            fun data ->
              Vale_X64_QuickCodes.qblock
                [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                   (Prims.of_int (3))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                   (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  (Prims.of_int (7)) (Prims.of_int (3)) false false;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  (Prims.of_int (7)) (Prims.of_int (3)) false true;
                Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (48)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (6))
                  (Prims.of_int (7)) (Prims.of_int (3)) true false;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (7))
                  (Prims.of_int (7)) (Prims.of_int (3)) true true;
                Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                  (Prims.of_int (3))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (-16)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  Prims.int_zero (Prims.of_int (3)) false false;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
                  (Prims.of_int (8))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (4)));
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                  Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  Prims.int_zero (Prims.of_int (3)) false true;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                  Prims.int_zero (Prims.of_int (3)) true false;
                Vale_X64_InsVector.va_code_Mem128_lemma ();
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
                  (Prims.of_int (8))
                  (Vale_X64_Machine_s.OMem
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (6)))),
                           (Prims.of_int (16)))),
                       Vale_Arch_HeapTypes_s.Secret));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
                  Prims.int_zero (Prims.of_int (3)) true true;
                Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
                Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                  (Prims.of_int (5))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  Prims.int_zero (Prims.of_int (5)) false false;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                  Prims.int_zero (Prims.of_int (5)) false true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                  (Prims.of_int (7))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
                  Prims.int_zero (Prims.of_int (5)) true false;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  Prims.int_zero (Prims.of_int (5)) true true;
                Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                  (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                  Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (32)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                  Prims.int_zero Prims.int_one false false;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
                  Prims.int_zero Prims.int_one false true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                  (Prims.of_int (7))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  Prims.int_zero Prims.int_one true false;
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  Prims.int_zero Prims.int_one true true;
                Vale_X64_InsVector.va_code_Load128_buffer (Prims.of_int (3))
                  Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (6)))
                  (Prims.of_int (96)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                  (Prims.of_int (4))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                  (Prims.of_int (2))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (64)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
                  Prims.int_zero (Prims.of_int (2)) false false;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  Prims.int_zero (Prims.of_int (2)) false true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                  (Prims.of_int (7)) (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  Prims.int_zero (Prims.of_int (2)) true false;
                Vale_X64_InsVector.va_code_Mem128_lemma ();
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
                  (Prims.of_int (8))
                  (Vale_X64_Machine_s.OMem
                     ((Vale_X64_Machine_s.MReg
                         ((Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (6)))),
                           (Prims.of_int (112)))),
                       Vale_Arch_HeapTypes_s.Secret));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                  Prims.int_zero (Prims.of_int (2)) true true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                  (Prims.of_int (4))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                  (Prims.of_int (3))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
                  (Prims.of_int (80)) Vale_Arch_HeapTypes_s.Secret;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
                  (Prims.of_int (8)) (Prims.of_int (3)) false true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
                  (Prims.of_int (8)) (Prims.of_int (3)) true false;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                  (Prims.of_int (7))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
                  (Prims.of_int (8)) (Prims.of_int (3)) false false;
                Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (8))
                  (Prims.of_int (8)) (Prims.of_int (3)) true true;
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
                  (Prims.of_int (6)) (Vale_X64_Machine_s.OReg Prims.int_one);
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
                  (Prims.of_int (4))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (2)));
                Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
                Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
                  (Prims.parse_int "3254779904") (Prims.of_int (3))
                  (Vale_X64_Machine_s.OReg Prims.int_zero);
                Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
                  (Prims.of_int (7))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (8)))] va_mods ()

type ('hkeysub, 'scratchub, 'h, 'prev, 'data, 'vaus0,
  'vauk) va_wp_MulAdd_unroll = unit

let (va_quick_MulAdd_unroll :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_Math_Poly2_s.poly ->
        Vale_Math_Poly2_s.poly ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun hkeys_b ->
    fun scratch_b ->
      fun h ->
        fun prev ->
          fun data ->
            Vale_X64_QuickCode.QProc
              ((va_code_MulAdd_unroll ()),
                [Vale_X64_QuickCode.Mod_reg
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_one, (Prims.of_int (8))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
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
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Reduce :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun last_adds ->
    Vale_X64_Machine_s.Block
      [Vale_AES_X64_PolyOps.va_code_VLow64ToHigh (Prims.of_int (5))
         (Prims.of_int (6));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      Vale_AES_X64_PolyOps.va_code_VSwap Prims.int_zero (Prims.of_int (4));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
        (Prims.of_int (4)) (Prims.of_int (3)) false true;
      Vale_AES_X64_PolyOps.va_code_VHigh64ToLow (Prims.of_int (6))
        (Prims.of_int (6));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
        (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
        (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_AES_X64_PolyOps.va_code_VSwap (Prims.of_int (8))
        (Prims.of_int (4));
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
        (Prims.of_int (4)) (Prims.of_int (3)) false true;
      if last_adds
      then
        Vale_X64_Machine_s.Block
          [Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
             (Prims.of_int (8)) (Vale_X64_Machine_s.OReg (Prims.of_int (7)));
          Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
            (Prims.of_int (8)) (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]
      else Vale_X64_Machine_s.Block []]
let (va_codegen_success_Reduce : Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun last_adds ->
    Vale_X64_Decls.va_pbool_and
      (Vale_AES_X64_PolyOps.va_codegen_success_VLow64ToHigh
         (Prims.of_int (5)) (Prims.of_int (6)))
      (Vale_X64_Decls.va_pbool_and
         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd (Prims.of_int (4))
            (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_PolyOps.va_codegen_success_VSwap Prims.int_zero
               (Prims.of_int (4)))
            (Vale_X64_Decls.va_pbool_and
               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                  (Prims.of_int (4)) (Prims.of_int (4)) (Prims.of_int (3))
                  false true)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_AES_X64_PolyOps.va_codegen_success_VHigh64ToLow
                     (Prims.of_int (6)) (Prims.of_int (6)))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                        (Prims.of_int (7)) (Prims.of_int (7))
                        (Vale_X64_Machine_s.OReg (Prims.of_int (6))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                           (Prims.of_int (4)) (Prims.of_int (4))
                           (Vale_X64_Machine_s.OReg Prims.int_zero))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_AES_X64_PolyOps.va_codegen_success_VSwap
                              (Prims.of_int (8)) (Prims.of_int (4)))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                                 (Prims.of_int (4)) (Prims.of_int (4))
                                 (Prims.of_int (3)) false true)
                              (Vale_X64_Decls.va_pbool_and
                                 (if last_adds
                                  then
                                    Vale_X64_Decls.va_pbool_and
                                      (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                         (Prims.of_int (8))
                                         (Prims.of_int (8))
                                         (Vale_X64_Machine_s.OReg
                                            (Prims.of_int (7))))
                                      (Vale_X64_Decls.va_pbool_and
                                         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                                            (Prims.of_int (8))
                                            (Prims.of_int (8))
                                            (Vale_X64_Machine_s.OReg
                                               (Prims.of_int (4))))
                                         (Vale_X64_Decls.va_ttrue ()))
                                  else Vale_X64_Decls.va_ttrue ())
                                 (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_Reduce :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun last_adds ->
      fun f ->
        Vale_X64_QuickCodes.qblock
          [Vale_AES_X64_PolyOps.va_code_VLow64ToHigh (Prims.of_int (5))
             (Prims.of_int (6));
          Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
            (Prims.of_int (4)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
          Vale_AES_X64_PolyOps.va_code_VSwap Prims.int_zero
            (Prims.of_int (4));
          Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
            (Prims.of_int (4)) (Prims.of_int (3)) false true;
          Vale_AES_X64_PolyOps.va_code_VHigh64ToLow (Prims.of_int (6))
            (Prims.of_int (6));
          Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (7))
            (Prims.of_int (7)) (Vale_X64_Machine_s.OReg (Prims.of_int (6)));
          Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (4))
            (Prims.of_int (4)) (Vale_X64_Machine_s.OReg Prims.int_zero);
          Vale_AES_X64_PolyOps.va_code_VSwap (Prims.of_int (8))
            (Prims.of_int (4));
          Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (4))
            (Prims.of_int (4)) (Prims.of_int (3)) false true;
          Vale_X64_QuickCodes.if_code last_adds
            (Vale_X64_Machine_s.Block
               [Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
                  (Prims.of_int (8))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (7)));
               Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (8))
                 (Prims.of_int (8))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (4)))])
            (Vale_X64_Machine_s.Block [])] va_mods ()

type ('lastuadds, 'f, 'vaus0, 'vauk) va_wp_Reduce = unit

let (va_quick_Reduce :
  Prims.bool ->
    Vale_Math_Poly2_s.poly -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun last_adds ->
    fun f ->
      Vale_X64_QuickCode.QProc
        ((va_code_Reduce last_adds),
          [Vale_X64_QuickCode.Mod_reg
             (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
          Vale_X64_QuickCode.Mod_reg
            (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
          Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_ReduceLast :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun last_adds ->
    Vale_X64_Machine_s.Block
      [va_code_Reduce last_adds;
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block []]
let (va_codegen_success_ReduceLast : Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun last_adds ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Reduce last_adds)
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_ReduceLast :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun last_adds ->
      fun h_LE ->
        fun y_prev ->
          fun data ->
            Vale_X64_QuickCodes.qblock
              [va_code_Reduce last_adds;
              Vale_X64_Machine_s.Block [];
              Vale_X64_Machine_s.Block []] va_mods ()

type ('lastuadds, 'huLE, 'yuprev, 'data, 'vaus0, 'vauk) va_wp_ReduceLast =
  unit

let (va_quick_ReduceLast :
  Prims.bool ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun last_adds ->
    fun h_LE ->
      fun y_prev ->
        fun data ->
          Vale_X64_QuickCode.QProc
            ((va_code_ReduceLast last_adds),
              [Vale_X64_QuickCode.Mod_reg
                 (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
              Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_GhashUnroll_n :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        Vale_X64_Machine_s.Block
          [va_code_MulAdd_unroll_n rev_bytes rev_blocks exactly6;
          Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
          Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
            (Prims.parse_int "3254779904") (Prims.of_int (3))
            (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
          va_code_ReduceLast true]
let (va_codegen_success_GhashUnroll_n :
  Prims.bool -> Prims.bool -> Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        Vale_X64_Decls.va_pbool_and
          (va_codegen_success_MulAdd_unroll_n rev_bytes rev_blocks exactly6)
          (Vale_X64_Decls.va_pbool_and
             (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                (Prims.of_int (3)))
             (Vale_X64_Decls.va_pbool_and
                (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                   (Prims.of_int (3)) (Prims.parse_int "3254779904")
                   (Prims.of_int (3))
                   (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                (Vale_X64_Decls.va_pbool_and
                   (va_codegen_success_ReduceLast true)
                   (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_GhashUnroll_n :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Prims.bool ->
        Prims.bool ->
          Vale_Def_Words_s.nat64 ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                Vale_Def_Types_s.quad32 ->
                  Vale_Def_Types_s.quad32 ->
                    Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                      (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun rev_bytes ->
      fun rev_blocks ->
        fun exactly6 ->
          fun scratch_len ->
            fun hkeys_b ->
              fun scratch_in_b ->
                fun h_LE ->
                  fun y_prev ->
                    fun data ->
                      Vale_X64_QuickCodes.qblock
                        [va_code_MulAdd_unroll_n rev_bytes rev_blocks
                           exactly6;
                        Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
                        Vale_X64_InsVector.va_code_PinsrdImm
                          (Prims.of_int (3)) (Prims.parse_int "3254779904")
                          (Prims.of_int (3))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
                        va_code_ReduceLast true] va_mods ()

type ('revubytes, 'revublocks, 'exactly6, 'scratchulen, 'hkeysub,
  'scratchuinub, 'huLE, 'yuprev, 'data, 'vaus0, 'vauk) va_wp_GhashUnroll_n =
  unit

let (va_quick_GhashUnroll_n :
  Prims.bool ->
    Prims.bool ->
      Prims.bool ->
        Vale_Def_Words_s.nat64 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                Vale_Def_Types_s.quad32 ->
                  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
                    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun rev_bytes ->
    fun rev_blocks ->
      fun exactly6 ->
        fun scratch_len ->
          fun hkeys_b ->
            fun scratch_in_b ->
              fun h_LE ->
                fun y_prev ->
                  fun data ->
                    Vale_X64_QuickCode.QProc
                      ((va_code_GhashUnroll_n rev_bytes rev_blocks exactly6),
                        [Vale_X64_QuickCode.Mod_reg
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
                             (Prims.int_zero, (Prims.of_int (11))));
                        Vale_X64_QuickCode.Mod_reg
                          (Vale_X64_Machine_s.Reg
                             (Prims.int_zero, (Prims.of_int (10))));
                        Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Ghash_register :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_Machine_s.Block [];
      Vale_AES_X64_PolyOps.va_code_VPolyAdd Prims.int_zero (Prims.of_int (8))
        (Vale_X64_Machine_s.OReg Prims.int_zero);
      Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one Prims.int_zero
        (Prims.of_int (5)) false false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2)) Prims.int_zero
        (Prims.of_int (5)) false true;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3)) Prims.int_zero
        (Prims.of_int (5)) true false;
      Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5)) Prims.int_zero
        (Prims.of_int (5)) true true;
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4)) Prims.int_one;
      Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
      Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7)) (Prims.of_int (5));
      Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
      Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
        (Prims.parse_int "3254779904") (Prims.of_int (3))
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
      va_code_Reduce true]
let (va_codegen_success_Ghash_register : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (5)) (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
         (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd Prims.int_zero
            (Prims.of_int (8)) (Vale_X64_Machine_s.OReg Prims.int_zero))
         (Vale_X64_Decls.va_pbool_and
            (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul Prims.int_one
               Prims.int_zero (Prims.of_int (5)) false false)
            (Vale_X64_Decls.va_pbool_and
               (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                  (Prims.of_int (2)) Prims.int_zero (Prims.of_int (5)) false
                  true)
               (Vale_X64_Decls.va_pbool_and
                  (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                     (Prims.of_int (3)) Prims.int_zero (Prims.of_int (5))
                     true false)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_AES_X64_PolyOps.va_codegen_success_VPolyMul
                        (Prims.of_int (5)) Prims.int_zero (Prims.of_int (5))
                        true true)
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Mov128
                           (Prims.of_int (4)) Prims.int_one)
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_AES_X64_PolyOps.va_codegen_success_VPolyAdd
                              (Prims.of_int (6)) (Prims.of_int (2))
                              (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
                           (Vale_X64_Decls.va_pbool_and
                              (Vale_X64_InsVector.va_codegen_success_Mov128
                                 (Prims.of_int (7)) (Prims.of_int (5)))
                              (Vale_X64_Decls.va_pbool_and
                                 (Vale_X64_InsVector.va_codegen_success_ZeroXmm
                                    (Prims.of_int (3)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (Vale_X64_InsVector.va_codegen_success_PinsrdImm
                                       (Prims.of_int (3))
                                       (Prims.parse_int "3254779904")
                                       (Prims.of_int (3))
                                       (Vale_X64_Machine_s.OReg
                                          (Prims.of_int (11))))
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_Reduce true)
                                       (Vale_X64_Decls.va_ttrue ()))))))))))))
let (va_qcode_Ghash_register :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun hkeys_b ->
      fun h_LE ->
        fun y_prev ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
               (Prims.of_int (5))
               (Vale_X64_Machine_s.OReg (Prims.of_int (9)))
               (Prims.of_int (-32)) Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_Machine_s.Block [];
            Vale_AES_X64_PolyOps.va_code_VPolyAdd Prims.int_zero
              (Prims.of_int (8)) (Vale_X64_Machine_s.OReg Prims.int_zero);
            Vale_AES_X64_PolyOps.va_code_VPolyMul Prims.int_one
              Prims.int_zero (Prims.of_int (5)) false false;
            Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (2))
              Prims.int_zero (Prims.of_int (5)) false true;
            Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (3))
              Prims.int_zero (Prims.of_int (5)) true false;
            Vale_AES_X64_PolyOps.va_code_VPolyMul (Prims.of_int (5))
              Prims.int_zero (Prims.of_int (5)) true true;
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (4))
              Prims.int_one;
            Vale_AES_X64_PolyOps.va_code_VPolyAdd (Prims.of_int (6))
              (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
            Vale_X64_InsVector.va_code_Mov128 (Prims.of_int (7))
              (Prims.of_int (5));
            Vale_X64_InsVector.va_code_ZeroXmm (Prims.of_int (3));
            Vale_X64_InsVector.va_code_PinsrdImm (Prims.of_int (3))
              (Prims.parse_int "3254779904") (Prims.of_int (3))
              (Vale_X64_Machine_s.OReg (Prims.of_int (11)));
            va_code_Reduce true] va_mods ()

type ('hkeysub, 'huLE, 'yuprev, 'vaus0, 'vauk) va_wp_Ghash_register = unit

let (va_quick_Ghash_register :
  Vale_X64_Memory.buffer128 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun hkeys_b ->
    fun h_LE ->
      fun y_prev ->
        Vale_X64_QuickCode.QProc
          ((va_code_Ghash_register ()),
            [Vale_X64_QuickCode.Mod_reg
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
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
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
            Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Ghash_buffer_loop_body :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.Block [];
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (80)));
      Vale_X64_Machine_s.Block [];
      va_code_GhashUnroll_n false false true;
      Vale_X64_Machine_s.Block [];
      Vale_X64_Machine_s.Block [];
      Vale_X64_InsBasic.va_code_Add64
        (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
      Vale_X64_InsBasic.va_code_Sub64
        (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
        (Vale_X64_Machine_s.OConst (Prims.of_int (6)))]
let (va_codegen_success_Ghash_buffer_loop_body :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Add64
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
         (Vale_X64_Machine_s.OConst (Prims.of_int (80))))
      (Vale_X64_Decls.va_pbool_and
         (va_codegen_success_GhashUnroll_n false false true)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsBasic.va_codegen_success_Add64
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (96))))
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Sub64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                  (Vale_X64_Machine_s.OConst (Prims.of_int (6))))
               (Vale_X64_Decls.va_ttrue ()))))
let (va_qcode_Ghash_buffer_loop_body :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 ->
            Vale_Def_Words_s.nat64 ->
              Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun hkeys_b ->
      fun in_b ->
        fun h_LE ->
          fun y_prev ->
            fun old_len ->
              fun index ->
                Vale_X64_QuickCodes.qblock
                  [Vale_X64_Machine_s.Block [];
                  Vale_X64_InsBasic.va_code_Add64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                    (Vale_X64_Machine_s.OConst (Prims.of_int (80)));
                  Vale_X64_Machine_s.Block [];
                  va_code_GhashUnroll_n false false true;
                  Vale_X64_Machine_s.Block [];
                  Vale_X64_Machine_s.Block [];
                  Vale_X64_InsBasic.va_code_Add64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                    (Vale_X64_Machine_s.OConst (Prims.of_int (96)));
                  Vale_X64_InsBasic.va_code_Sub64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                    (Vale_X64_Machine_s.OConst (Prims.of_int (6)))] va_mods
                  ()

type ('hkeysub, 'inub, 'huLE, 'yuprev, 'oldulen, 'index, 'vaus0,
  'vauk) va_wp_Ghash_buffer_loop_body = unit

let (va_quick_Ghash_buffer_loop_body :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Words_s.nat64 ->
            Prims.nat -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun hkeys_b ->
    fun in_b ->
      fun h_LE ->
        fun y_prev ->
          fun old_len ->
            fun index ->
              Vale_X64_QuickCode.QProc
                ((va_code_Ghash_buffer_loop_body ()),
                  [Vale_X64_QuickCode.Mod_reg
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
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (10))));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (11))));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (3))))], (), ())
let (va_code_Ghash_buffer_body0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block [va_code_Ghash_buffer_loop_body ()]
let (va_codegen_success_Ghash_buffer_body0 : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (va_codegen_success_Ghash_buffer_loop_body ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Ghash_buffer_body0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_Math_Poly2_s.poly ->
        Vale_Def_Types_s.quad32 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_h ->
        fun va_in_h_LE ->
          fun va_in_hkeys_b ->
            fun va_in_in_b ->
              fun va_in_y_prev ->
                fun va_in_index ->
                  Vale_X64_QuickCodes.qblock
                    [va_code_Ghash_buffer_loop_body ()] va_mods ()

type ('vauold, 'vauinuh, 'vauinuhuLE, 'vauinuhkeysub, 'vauinuinub,
  'vauinuyuprev, 'vauinuindex, 'vaus0, 'vauk) va_wp_Ghash_buffer_body0 = 
  unit

let (va_quick_Ghash_buffer_body0 :
  Vale_X64_State.vale_state ->
    Vale_Math_Poly2_s.poly ->
      Vale_Def_Types_s.quad32 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Types_s.quad32 ->
              Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_h ->
      fun va_in_h_LE ->
        fun va_in_hkeys_b ->
          fun va_in_in_b ->
            fun va_in_y_prev ->
              fun va_in_index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Ghash_buffer_body0 ()),
                    [Vale_X64_QuickCode.Mod_reg
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
                         (Prims.int_zero, (Prims.of_int (3))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (11))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (10))));
                    Vale_X64_QuickCode.Mod_ok;
                    Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Ghash_buffer_while0 :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.While
         ((Vale_X64_Decls.va_cmp_ge
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
             (Vale_X64_Machine_s.OConst (Prims.of_int (6)))),
           (Vale_X64_Machine_s.Block [va_code_Ghash_buffer_body0 ()]))]
let (va_codegen_success_Ghash_buffer_while0 :
  unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_Ghash_buffer_body0 ())
      (Vale_X64_Decls.va_ttrue ())
let (va_qcode_Ghash_buffer_while0 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_State.vale_state ->
      Vale_Math_Poly2_s.poly ->
        Vale_Def_Types_s.quad32 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_Def_Types_s.quad32 ->
                Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun va_old ->
      fun va_in_h ->
        fun va_in_h_LE ->
          fun va_in_hkeys_b ->
            fun va_in_in_b ->
              fun va_in_y_prev ->
                fun va_in_index ->
                  Vale_X64_QuickCodes.qblock
                    [Vale_X64_Machine_s.While
                       ((Vale_X64_QuickCodes.cmp_to_ocmp
                           (Vale_X64_QuickCodes.Cmp_ge
                              ((Vale_X64_Machine_s.OReg (Prims.of_int (3))),
                                (Vale_X64_Machine_s.OConst (Prims.of_int (6)))))),
                         (Vale_X64_Machine_s.Block
                            [va_code_Ghash_buffer_body0 ()]))] va_mods ()

type ('vauold, 'vauinuh, 'vauinuhuLE, 'vauinuhkeysub, 'vauinuinub,
  'vauinuyuprev, 'vauinuindex, 'vaus0, 'vauk) va_wp_Ghash_buffer_while0 =
  unit

let (va_quick_Ghash_buffer_while0 :
  Vale_X64_State.vale_state ->
    Vale_Math_Poly2_s.poly ->
      Vale_Def_Types_s.quad32 ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_Def_Types_s.quad32 ->
              Prims.nat -> (Prims.nat, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_old ->
    fun va_in_h ->
      fun va_in_h_LE ->
        fun va_in_hkeys_b ->
          fun va_in_in_b ->
            fun va_in_y_prev ->
              fun va_in_index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Ghash_buffer_while0 ()),
                    [Vale_X64_QuickCode.Mod_reg
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
                         (Prims.int_zero, (Prims.of_int (3))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (11))));
                    Vale_X64_QuickCode.Mod_reg
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (10))));
                    Vale_X64_QuickCode.Mod_ok;
                    Vale_X64_QuickCode.Mod_flags], (), ())
let (va_code_Ghash_buffer :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsBasic.va_code_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
      va_code_Ghash_buffer_while0 ();
      Vale_X64_Machine_s.IfElse
        ((Vale_X64_Decls.va_cmp_gt
            (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
            (Vale_X64_Machine_s.OConst Prims.int_zero)),
          (Vale_X64_Machine_s.Block
             [Vale_X64_Machine_s.Block [];
             Vale_X64_InsBasic.va_code_Mov64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
             Vale_X64_InsBasic.va_code_Sub64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OConst Prims.int_one);
             Vale_X64_InsBasic.va_code_IMul64
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
               (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
             Vale_X64_InsBasic.va_code_Add64
               (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
               (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
             va_code_GhashUnroll_n false false false;
             Vale_X64_Machine_s.Block [];
             Vale_X64_Machine_s.Block []]), (Vale_X64_Machine_s.Block []))]
let (va_codegen_success_Ghash_buffer : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsBasic.va_codegen_success_Mov64
         (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
         (Vale_X64_Machine_s.OReg (Prims.of_int (5))))
      (Vale_X64_Decls.va_pbool_and
         (va_codegen_success_Ghash_buffer_while0 ())
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_Decls.va_pbool_and
               (Vale_X64_InsBasic.va_codegen_success_Mov64
                  (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                  (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsBasic.va_codegen_success_Sub64
                     (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                     (Vale_X64_Machine_s.OConst Prims.int_one))
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsBasic.va_codegen_success_IMul64
                        (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                        (Vale_X64_Machine_s.OConst (Prims.of_int (16))))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsBasic.va_codegen_success_Add64
                           (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                           (Vale_X64_Machine_s.OReg (Prims.of_int (10))))
                        (va_codegen_success_GhashUnroll_n false false false)))))
            (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_Ghash_buffer :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun hkeys_b ->
      fun in_b ->
        fun h_LE ->
          fun y_prev ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsBasic.va_code_Mov64
                 (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)));
              va_code_Ghash_buffer_while0 ();
              Vale_X64_Machine_s.IfElse
                ((Vale_X64_QuickCodes.cmp_to_ocmp
                    (Vale_X64_QuickCodes.Cmp_gt
                       ((Vale_X64_Machine_s.OReg (Prims.of_int (3))),
                         (Vale_X64_Machine_s.OConst Prims.int_zero)))),
                  (Vale_X64_Machine_s.Block
                     [Vale_X64_Machine_s.Block [];
                     Vale_X64_InsBasic.va_code_Mov64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (3)));
                     Vale_X64_InsBasic.va_code_Sub64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                       (Vale_X64_Machine_s.OConst Prims.int_one);
                     Vale_X64_InsBasic.va_code_IMul64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (10)))
                       (Vale_X64_Machine_s.OConst (Prims.of_int (16)));
                     Vale_X64_InsBasic.va_code_Add64
                       (Vale_X64_Machine_s.OReg (Prims.of_int (11)))
                       (Vale_X64_Machine_s.OReg (Prims.of_int (10)));
                     va_code_GhashUnroll_n false false false;
                     Vale_X64_Machine_s.Block [];
                     Vale_X64_Machine_s.Block []]),
                  (Vale_X64_Machine_s.Block []))] va_mods ()

type ('hkeysub, 'inub, 'huLE, 'yuprev, 'vaus0, 'vauk) va_wp_Ghash_buffer =
  unit

let (va_quick_Ghash_buffer :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun hkeys_b ->
    fun in_b ->
      fun h_LE ->
        fun y_prev ->
          Vale_X64_QuickCode.QProc
            ((va_code_Ghash_buffer ()),
              [Vale_X64_QuickCode.Mod_reg
                 (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
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
              Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))))],
              (), ())
let (va_code_GhashUnroll6x :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [va_code_MulAdd_unroll (); va_code_ReduceLast true]
let (va_codegen_success_GhashUnroll6x : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and (va_codegen_success_MulAdd_unroll ())
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_ReduceLast true)
         (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_GhashUnroll6x :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 ->
            Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun hkeys_b ->
      fun scratch_b ->
        fun h_LE ->
          fun y_prev ->
            fun data ->
              Vale_X64_QuickCodes.qblock
                [va_code_MulAdd_unroll (); va_code_ReduceLast true] va_mods
                ()

type ('hkeysub, 'scratchub, 'huLE, 'yuprev, 'data, 'vaus0,
  'vauk) va_wp_GhashUnroll6x = unit

let (va_quick_GhashUnroll6x :
  Vale_X64_Memory.buffer128 ->
    Vale_X64_Memory.buffer128 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 ->
          Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun hkeys_b ->
    fun scratch_b ->
      fun h_LE ->
        fun y_prev ->
          fun data ->
            Vale_X64_QuickCode.QProc
              ((va_code_GhashUnroll6x ()),
                [Vale_X64_QuickCode.Mod_reg
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_one, (Prims.of_int (8))));
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))));
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
                Vale_X64_QuickCode.Mod_reg
                  (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero));
                Vale_X64_QuickCode.Mod_flags], (), ())