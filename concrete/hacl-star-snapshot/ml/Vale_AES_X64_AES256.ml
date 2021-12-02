open Prims
let (va_code_KeyExpansionRoundEven256 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat8 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun round ->
    fun rcon ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsAes.va_code_AESNI_keygen_assist (Prims.of_int (2))
           (Prims.of_int (3)) rcon;
        Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
          (Prims.of_int (2)) (Prims.of_int (255));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4)) Prims.int_one;
        Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (4));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4)) Prims.int_one;
        Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (4));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4)) Prims.int_one;
        Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (4));
        Vale_X64_InsVector.va_code_Pxor Prims.int_one (Prims.of_int (2));
        Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
          (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_one
          ((Prims.of_int (16)) * (round + Prims.int_one))
          Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_KeyExpansionRoundEven256 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  =
  fun round ->
    fun rcon ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsAes.va_codegen_success_AESNI_keygen_assist
           (Prims.of_int (2)) (Prims.of_int (3)) rcon)
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Pshufd (Prims.of_int (2))
              (Prims.of_int (2)) (Prims.of_int (255)))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_VPslldq4
                 (Prims.of_int (4)) Prims.int_one)
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one
                    (Prims.of_int (4)))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsVector.va_codegen_success_VPslldq4
                       (Prims.of_int (4)) Prims.int_one)
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsVector.va_codegen_success_Pxor
                          Prims.int_one (Prims.of_int (4)))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsVector.va_codegen_success_VPslldq4
                             (Prims.of_int (4)) Prims.int_one)
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsVector.va_codegen_success_Pxor
                                Prims.int_one (Prims.of_int (4)))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsVector.va_codegen_success_Pxor
                                   Prims.int_one (Prims.of_int (2)))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                      Prims.int_one
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (3))) Prims.int_one
                                      ((Prims.of_int (16)) *
                                         (round + Prims.int_one))
                                      Vale_Arch_HeapTypes_s.Secret)
                                   (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_KeyExpansionRoundEven256 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun round ->
      fun rcon ->
        fun dst ->
          fun key ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsAes.va_code_AESNI_keygen_assist (Prims.of_int (2))
                 (Prims.of_int (3)) rcon;
              Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
                (Prims.of_int (2)) (Prims.of_int (255));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                Prims.int_one;
              Vale_X64_InsVector.va_code_Pxor Prims.int_one
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                Prims.int_one;
              Vale_X64_InsVector.va_code_Pxor Prims.int_one
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                Prims.int_one;
              Vale_X64_InsVector.va_code_Pxor Prims.int_one
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_Pxor Prims.int_one
                (Prims.of_int (2));
              Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_one
                ((Prims.of_int (16)) * (round + Prims.int_one))
                Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('round, 'rcon, 'dst, 'key, 'vaus0,
  'vauk) va_wp_KeyExpansionRoundEven256 = unit

let (va_quick_KeyExpansionRoundEven256 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat8 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun round ->
    fun rcon ->
      fun dst ->
        fun key ->
          Vale_X64_QuickCode.QProc
            ((va_code_KeyExpansionRoundEven256 round rcon),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
              Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_KeyExpansionRoundOdd256 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat8 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun round ->
    fun rcon ->
      Vale_X64_Machine_s.Block
        [Vale_X64_InsAes.va_code_AESNI_keygen_assist (Prims.of_int (2))
           Prims.int_one Prims.int_zero;
        Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
          (Prims.of_int (2)) (Prims.of_int (170));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
          (Prims.of_int (3));
        Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (4));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
          (Prims.of_int (3));
        Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (4));
        Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
          (Prims.of_int (3));
        Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (4));
        Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (2));
        Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
          (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (3))
          ((Prims.of_int (16)) * (round + Prims.int_one))
          Vale_Arch_HeapTypes_s.Secret]
let (va_codegen_success_KeyExpansionRoundOdd256 :
  Vale_Def_Words_s.nat64 -> Vale_Def_Words_s.nat8 -> Vale_X64_Decls.va_pbool)
  =
  fun round ->
    fun rcon ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsAes.va_codegen_success_AESNI_keygen_assist
           (Prims.of_int (2)) Prims.int_one Prims.int_zero)
        (Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Pshufd (Prims.of_int (2))
              (Prims.of_int (2)) (Prims.of_int (170)))
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_VPslldq4
                 (Prims.of_int (4)) (Prims.of_int (3)))
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsVector.va_codegen_success_Pxor
                    (Prims.of_int (3)) (Prims.of_int (4)))
                 (Vale_X64_Decls.va_pbool_and
                    (Vale_X64_InsVector.va_codegen_success_VPslldq4
                       (Prims.of_int (4)) (Prims.of_int (3)))
                    (Vale_X64_Decls.va_pbool_and
                       (Vale_X64_InsVector.va_codegen_success_Pxor
                          (Prims.of_int (3)) (Prims.of_int (4)))
                       (Vale_X64_Decls.va_pbool_and
                          (Vale_X64_InsVector.va_codegen_success_VPslldq4
                             (Prims.of_int (4)) (Prims.of_int (3)))
                          (Vale_X64_Decls.va_pbool_and
                             (Vale_X64_InsVector.va_codegen_success_Pxor
                                (Prims.of_int (3)) (Prims.of_int (4)))
                             (Vale_X64_Decls.va_pbool_and
                                (Vale_X64_InsVector.va_codegen_success_Pxor
                                   (Prims.of_int (3)) (Prims.of_int (2)))
                                (Vale_X64_Decls.va_pbool_and
                                   (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                                      Prims.int_one
                                      (Vale_X64_Machine_s.OReg
                                         (Prims.of_int (3)))
                                      (Prims.of_int (3))
                                      ((Prims.of_int (16)) *
                                         (round + Prims.int_one))
                                      Vale_Arch_HeapTypes_s.Secret)
                                   (Vale_X64_Decls.va_ttrue ()))))))))))
let (va_qcode_KeyExpansionRoundOdd256 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat8 ->
        Vale_X64_Memory.buffer128 ->
          Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun round ->
      fun rcon ->
        fun dst ->
          fun key ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsAes.va_code_AESNI_keygen_assist (Prims.of_int (2))
                 Prims.int_one Prims.int_zero;
              Vale_X64_InsVector.va_code_Pshufd (Prims.of_int (2))
                (Prims.of_int (2)) (Prims.of_int (170));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                (Prims.of_int (3));
              Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                (Prims.of_int (3));
              Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_VPslldq4 (Prims.of_int (4))
                (Prims.of_int (3));
              Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
                (Prims.of_int (4));
              Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
                (Prims.of_int (2));
              Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
                (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                (Prims.of_int (3))
                ((Prims.of_int (16)) * (round + Prims.int_one))
                Vale_Arch_HeapTypes_s.Secret] va_mods ()

type ('round, 'rcon, 'dst, 'key, 'vaus0,
  'vauk) va_wp_KeyExpansionRoundOdd256 = unit

let (va_quick_KeyExpansionRoundOdd256 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat8 ->
      Vale_X64_Memory.buffer128 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun round ->
    fun rcon ->
      fun dst ->
        fun key ->
          Vale_X64_QuickCode.QProc
            ((va_code_KeyExpansionRoundOdd256 round rcon),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
              Vale_X64_QuickCode.Mod_mem], (), ())
let rec (va_code_KeyExpansionRoundUnrolledRecursive256 :
  Prims.int ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun n ->
    Vale_X64_Machine_s.Block
      [if (Prims.int_one < n) && (n <= (Prims.of_int (14)))
       then
         Vale_X64_Machine_s.Block
           [va_code_KeyExpansionRoundUnrolledRecursive256 (n - Prims.int_one);
           (if (n mod (Prims.of_int (2))) = Prims.int_zero
            then
              Vale_X64_Machine_s.Block
                [va_code_KeyExpansionRoundEven256 (n - Prims.int_one)
                   (Vale_AES_AES_s.aes_rcon
                      ((n / (Prims.of_int (2))) - Prims.int_one))]
            else
              Vale_X64_Machine_s.Block
                [va_code_KeyExpansionRoundOdd256 (n - Prims.int_one)
                   (Vale_AES_AES_s.aes_rcon
                      ((n / (Prims.of_int (2))) - Prims.int_one))])]
       else Vale_X64_Machine_s.Block []]
let rec (va_codegen_success_KeyExpansionRoundUnrolledRecursive256 :
  Prims.int -> Vale_X64_Decls.va_pbool) =
  fun n ->
    Vale_X64_Decls.va_pbool_and
      (if (Prims.int_one < n) && (n <= (Prims.of_int (14)))
       then
         Vale_X64_Decls.va_pbool_and
           (va_codegen_success_KeyExpansionRoundUnrolledRecursive256
              (n - Prims.int_one))
           (Vale_X64_Decls.va_pbool_and
              (if (n mod (Prims.of_int (2))) = Prims.int_zero
               then
                 Vale_X64_Decls.va_pbool_and
                   (va_codegen_success_KeyExpansionRoundEven256
                      (n - Prims.int_one)
                      (Vale_AES_AES_s.aes_rcon
                         ((n / (Prims.of_int (2))) - Prims.int_one)))
                   (Vale_X64_Decls.va_ttrue ())
               else
                 Vale_X64_Decls.va_pbool_and
                   (va_codegen_success_KeyExpansionRoundOdd256
                      (n - Prims.int_one)
                      (Vale_AES_AES_s.aes_rcon
                         ((n / (Prims.of_int (2))) - Prims.int_one)))
                   (Vale_X64_Decls.va_ttrue ())) (Vale_X64_Decls.va_ttrue ()))
       else Vale_X64_Decls.va_ttrue ()) (Vale_X64_Decls.va_ttrue ())

type ('key, 'dst, 'n, 'vaus0,
  'vauk) va_wp_KeyExpansionRoundUnrolledRecursive256 = unit

let (va_quick_KeyExpansionRoundUnrolledRecursive256 :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Vale_X64_Memory.buffer128 ->
      Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun key ->
    fun dst ->
      fun n ->
        Vale_X64_QuickCode.QProc
          ((va_code_KeyExpansionRoundUnrolledRecursive256 n),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_KeyExpansion256Stdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [if win
       then
         Vale_X64_Machine_s.Block
           [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
           Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
             (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret]
       else
         Vale_X64_Machine_s.Block
           [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
           Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
             (Prims.of_int (3)) (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
             (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
           Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (4)))];
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_one
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
        (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (3))
        (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
      va_code_KeyExpansionRoundUnrolledRecursive256 (Prims.of_int (14));
      Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_one;
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2)) (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3)) (Prims.of_int (3));
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (4)) (Prims.of_int (4))]
let (va_codegen_success_KeyExpansion256Stdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (if win
       then
         Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Load128_buffer
              Prims.int_zero Prims.int_one
              (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret)
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                 Prims.int_zero (Prims.of_int (3))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                 (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
              (Vale_X64_Decls.va_ttrue ()))
       else
         Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Load128_buffer
              Prims.int_zero Prims.int_one
              (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret)
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                 Prims.int_zero (Prims.of_int (3))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                 (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret)
              (Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsBasic.va_codegen_success_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (4))))
                 (Vale_X64_Decls.va_ttrue ()))))
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Store128_buffer Prims.int_one
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_one
            Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
         (Vale_X64_Decls.va_pbool_and
            (Vale_X64_InsVector.va_codegen_success_Store128_buffer
               Prims.int_one (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
               (Prims.of_int (3)) (Prims.of_int (16))
               Vale_Arch_HeapTypes_s.Secret)
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_KeyExpansionRoundUnrolledRecursive256
                  (Prims.of_int (14)))
               (Vale_X64_Decls.va_pbool_and
                  (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_one
                     Prims.int_one)
                  (Vale_X64_Decls.va_pbool_and
                     (Vale_X64_InsVector.va_codegen_success_Pxor
                        (Prims.of_int (2)) (Prims.of_int (2)))
                     (Vale_X64_Decls.va_pbool_and
                        (Vale_X64_InsVector.va_codegen_success_Pxor
                           (Prims.of_int (3)) (Prims.of_int (3)))
                        (Vale_X64_Decls.va_pbool_and
                           (Vale_X64_InsVector.va_codegen_success_Pxor
                              (Prims.of_int (4)) (Prims.of_int (4)))
                           (Vale_X64_Decls.va_ttrue ()))))))))
let (va_qcode_KeyExpansion256Stdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_X64_Memory.buffer128 ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun input_key_b ->
        fun output_key_expansion_b ->
          Vale_X64_QuickCodes.qblock
            [Vale_X64_QuickCodes.if_code win
               (Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                     Prims.int_one
                     (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                     Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                  Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                    (Prims.of_int (3))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                    (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret])
               (Vale_X64_Machine_s.Block
                  [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                     Prims.int_one
                     (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                     Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                  Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                    (Prims.of_int (3))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                    (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
                  Vale_X64_InsBasic.va_code_Mov64
                    (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                    (Vale_X64_Machine_s.OReg (Prims.of_int (4)))]);
            Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
              (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_one
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
            Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
              (Vale_X64_Machine_s.OReg (Prims.of_int (3))) (Prims.of_int (3))
              (Prims.of_int (16)) Vale_Arch_HeapTypes_s.Secret;
            va_code_KeyExpansionRoundUnrolledRecursive256 (Prims.of_int (14));
            Vale_X64_InsVector.va_code_Pxor Prims.int_one Prims.int_one;
            Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2))
              (Prims.of_int (2));
            Vale_X64_InsVector.va_code_Pxor (Prims.of_int (3))
              (Prims.of_int (3));
            Vale_X64_InsVector.va_code_Pxor (Prims.of_int (4))
              (Prims.of_int (4))] va_mods ()

type ('win, 'inputukeyub, 'outputukeyuexpansionub, 'vaus0,
  'vauk) va_wp_KeyExpansion256Stdcall = unit

let (va_quick_KeyExpansion256Stdcall :
  Prims.bool ->
    Vale_X64_Memory.buffer128 ->
      Vale_X64_Memory.buffer128 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun input_key_b ->
      fun output_key_expansion_b ->
        Vale_X64_QuickCode.QProc
          ((va_code_KeyExpansion256Stdcall win),
            [Vale_X64_QuickCode.Mod_flags;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one));
            Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
            Vale_X64_QuickCode.Mod_reg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))));
            Vale_X64_QuickCode.Mod_mem], (), ())
let (va_code_AES256EncryptRound :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun n ->
    Vale_X64_Machine_s.Block
      [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
         (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         ((Prims.of_int (16)) * n) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_AESNI_enc Prims.int_zero (Prims.of_int (2))]
let (va_codegen_success_AES256EncryptRound :
  Prims.nat -> Vale_X64_Decls.va_pbool) =
  fun n ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         ((Prims.of_int (16)) * n) Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsAes.va_codegen_success_AESNI_enc Prims.int_zero
            (Prims.of_int (2))) (Vale_X64_Decls.va_ttrue ()))
let (va_qcode_AES256EncryptRound :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.nat ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun n ->
      fun init ->
        fun round_keys ->
          fun keys_buffer ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                 (Prims.of_int (2))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                 ((Prims.of_int (16)) * n) Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsAes.va_code_AESNI_enc Prims.int_zero
                (Prims.of_int (2))] va_mods ()

type ('n, 'init, 'roundukeys, 'keysubuffer, 'vaus0,
  'vauk) va_wp_AES256EncryptRound = unit

let (va_quick_AES256EncryptRound :
  Prims.nat ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun n ->
    fun init ->
      fun round_keys ->
        fun keys_buffer ->
          Vale_X64_QuickCode.QProc
            ((va_code_AES256EncryptRound n),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))],
              (), ())
let (va_code_AES256EncryptBlock :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Machine_s.Block
      [Vale_X64_Machine_s.Block [];
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsVector.va_code_Pxor Prims.int_zero (Prims.of_int (2));
      va_code_AES256EncryptRound Prims.int_one;
      va_code_AES256EncryptRound (Prims.of_int (2));
      va_code_AES256EncryptRound (Prims.of_int (3));
      va_code_AES256EncryptRound (Prims.of_int (4));
      va_code_AES256EncryptRound (Prims.of_int (5));
      va_code_AES256EncryptRound (Prims.of_int (6));
      va_code_AES256EncryptRound (Prims.of_int (7));
      va_code_AES256EncryptRound (Prims.of_int (8));
      va_code_AES256EncryptRound (Prims.of_int (9));
      va_code_AES256EncryptRound (Prims.of_int (10));
      va_code_AES256EncryptRound (Prims.of_int (11));
      va_code_AES256EncryptRound (Prims.of_int (12));
      va_code_AES256EncryptRound (Prims.of_int (13));
      Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
        (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
        (Prims.of_int (224)) Vale_Arch_HeapTypes_s.Secret;
      Vale_X64_InsAes.va_code_AESNI_enc_last Prims.int_zero
        (Prims.of_int (2));
      Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2)) (Prims.of_int (2))]
let (va_codegen_success_AES256EncryptBlock : unit -> Vale_X64_Decls.va_pbool)
  =
  fun uu___ ->
    Vale_X64_Decls.va_pbool_and
      (Vale_X64_InsVector.va_codegen_success_Load128_buffer Prims.int_zero
         (Prims.of_int (2)) (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
         Prims.int_zero Vale_Arch_HeapTypes_s.Secret)
      (Vale_X64_Decls.va_pbool_and
         (Vale_X64_InsVector.va_codegen_success_Pxor Prims.int_zero
            (Prims.of_int (2)))
         (Vale_X64_Decls.va_pbool_and
            (va_codegen_success_AES256EncryptRound Prims.int_one)
            (Vale_X64_Decls.va_pbool_and
               (va_codegen_success_AES256EncryptRound (Prims.of_int (2)))
               (Vale_X64_Decls.va_pbool_and
                  (va_codegen_success_AES256EncryptRound (Prims.of_int (3)))
                  (Vale_X64_Decls.va_pbool_and
                     (va_codegen_success_AES256EncryptRound
                        (Prims.of_int (4)))
                     (Vale_X64_Decls.va_pbool_and
                        (va_codegen_success_AES256EncryptRound
                           (Prims.of_int (5)))
                        (Vale_X64_Decls.va_pbool_and
                           (va_codegen_success_AES256EncryptRound
                              (Prims.of_int (6)))
                           (Vale_X64_Decls.va_pbool_and
                              (va_codegen_success_AES256EncryptRound
                                 (Prims.of_int (7)))
                              (Vale_X64_Decls.va_pbool_and
                                 (va_codegen_success_AES256EncryptRound
                                    (Prims.of_int (8)))
                                 (Vale_X64_Decls.va_pbool_and
                                    (va_codegen_success_AES256EncryptRound
                                       (Prims.of_int (9)))
                                    (Vale_X64_Decls.va_pbool_and
                                       (va_codegen_success_AES256EncryptRound
                                          (Prims.of_int (10)))
                                       (Vale_X64_Decls.va_pbool_and
                                          (va_codegen_success_AES256EncryptRound
                                             (Prims.of_int (11)))
                                          (Vale_X64_Decls.va_pbool_and
                                             (va_codegen_success_AES256EncryptRound
                                                (Prims.of_int (12)))
                                             (Vale_X64_Decls.va_pbool_and
                                                (va_codegen_success_AES256EncryptRound
                                                   (Prims.of_int (13)))
                                                (Vale_X64_Decls.va_pbool_and
                                                   (Vale_X64_InsVector.va_codegen_success_Load128_buffer
                                                      Prims.int_zero
                                                      (Prims.of_int (2))
                                                      (Vale_X64_Machine_s.OReg
                                                         (Prims.of_int (8)))
                                                      (Prims.of_int (224))
                                                      Vale_Arch_HeapTypes_s.Secret)
                                                   (Vale_X64_Decls.va_pbool_and
                                                      (Vale_X64_InsAes.va_codegen_success_AESNI_enc_last
                                                         Prims.int_zero
                                                         (Prims.of_int (2)))
                                                      (Vale_X64_Decls.va_pbool_and
                                                         (Vale_X64_InsVector.va_codegen_success_Pxor
                                                            (Prims.of_int (2))
                                                            (Prims.of_int (2)))
                                                         (Vale_X64_Decls.va_ttrue
                                                            ()))))))))))))))))))
let (va_qcode_AES256EncryptBlock :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun input ->
      fun key ->
        fun round_keys ->
          fun keys_buffer ->
            Vale_X64_QuickCodes.qblock
              [Vale_X64_Machine_s.Block [];
              Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                (Prims.of_int (2))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8))) Prims.int_zero
                Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsVector.va_code_Pxor Prims.int_zero
                (Prims.of_int (2));
              va_code_AES256EncryptRound Prims.int_one;
              va_code_AES256EncryptRound (Prims.of_int (2));
              va_code_AES256EncryptRound (Prims.of_int (3));
              va_code_AES256EncryptRound (Prims.of_int (4));
              va_code_AES256EncryptRound (Prims.of_int (5));
              va_code_AES256EncryptRound (Prims.of_int (6));
              va_code_AES256EncryptRound (Prims.of_int (7));
              va_code_AES256EncryptRound (Prims.of_int (8));
              va_code_AES256EncryptRound (Prims.of_int (9));
              va_code_AES256EncryptRound (Prims.of_int (10));
              va_code_AES256EncryptRound (Prims.of_int (11));
              va_code_AES256EncryptRound (Prims.of_int (12));
              va_code_AES256EncryptRound (Prims.of_int (13));
              Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
                (Prims.of_int (2))
                (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                (Prims.of_int (224)) Vale_Arch_HeapTypes_s.Secret;
              Vale_X64_InsAes.va_code_AESNI_enc_last Prims.int_zero
                (Prims.of_int (2));
              Vale_X64_InsVector.va_code_Pxor (Prims.of_int (2))
                (Prims.of_int (2))] va_mods ()

type ('input, 'key, 'roundukeys, 'keysubuffer, 'vaus0,
  'vauk) va_wp_AES256EncryptBlock = unit

let (va_quick_AES256EncryptBlock :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
      Vale_Def_Types_s.quad32 FStar_Seq_Base.seq ->
        Vale_X64_Memory.buffer128 ->
          (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun input ->
    fun key ->
      fun round_keys ->
        fun keys_buffer ->
          Vale_X64_QuickCode.QProc
            ((va_code_AES256EncryptBlock ()),
              [Vale_X64_QuickCode.Mod_flags;
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2))));
              Vale_X64_QuickCode.Mod_reg
                (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))],
              (), ())
let (va_code_AES256EncryptBlockStdcall :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun win ->
    Vale_X64_Machine_s.Block
      [if win
       then
         Vale_X64_Machine_s.Block
           [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret]
       else
         Vale_X64_Machine_s.Block
           [Vale_X64_InsVector.va_code_Load128_buffer Prims.int_zero
              Prims.int_zero (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
              Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
           Vale_X64_InsBasic.va_code_Mov64
             (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
             (Vale_X64_Machine_s.OReg (Prims.of_int (3)))];
      Vale_X64_Machine_s.Block [];
      va_code_AES256EncryptBlock ();
      if win
      then
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
             (Vale_X64_Machine_s.OReg (Prims.of_int (2))) Prims.int_zero
             Prims.int_zero Vale_Arch_HeapTypes_s.Secret]
      else
        Vale_X64_Machine_s.Block
          [Vale_X64_InsVector.va_code_Store128_buffer Prims.int_one
             (Vale_X64_Machine_s.OReg (Prims.of_int (5))) Prims.int_zero
             Prims.int_zero Vale_Arch_HeapTypes_s.Secret]]
let (va_codegen_success_AES256EncryptBlockStdcall :
  Prims.bool -> Vale_X64_Decls.va_pbool) =
  fun win ->
    Vale_X64_Decls.va_pbool_and
      (if win
       then
         Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Load128_buffer
              Prims.int_zero Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (3))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret) (Vale_X64_Decls.va_ttrue ())
       else
         Vale_X64_Decls.va_pbool_and
           (Vale_X64_InsVector.va_codegen_success_Load128_buffer
              Prims.int_zero Prims.int_zero
              (Vale_X64_Machine_s.OReg (Prims.of_int (4))) Prims.int_zero
              Vale_Arch_HeapTypes_s.Secret)
           (Vale_X64_Decls.va_pbool_and
              (Vale_X64_InsBasic.va_codegen_success_Mov64
                 (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                 (Vale_X64_Machine_s.OReg (Prims.of_int (3))))
              (Vale_X64_Decls.va_ttrue ())))
      (Vale_X64_Decls.va_pbool_and (va_codegen_success_AES256EncryptBlock ())
         (Vale_X64_Decls.va_pbool_and
            (if win
             then
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                    Prims.int_one
                    (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                    Prims.int_zero Prims.int_zero
                    Vale_Arch_HeapTypes_s.Secret)
                 (Vale_X64_Decls.va_ttrue ())
             else
               Vale_X64_Decls.va_pbool_and
                 (Vale_X64_InsVector.va_codegen_success_Store128_buffer
                    Prims.int_one
                    (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                    Prims.int_zero Prims.int_zero
                    Vale_Arch_HeapTypes_s.Secret)
                 (Vale_X64_Decls.va_ttrue ())) (Vale_X64_Decls.va_ttrue ())))
let (va_qcode_AES256EncryptBlockStdcall :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Prims.bool ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              Vale_X64_Memory.buffer128 ->
                (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun va_mods ->
    fun win ->
      fun input ->
        fun key ->
          fun input_buffer ->
            fun output_buffer ->
              fun keys_buffer ->
                Vale_X64_QuickCodes.qblock
                  [Vale_X64_QuickCodes.if_code win
                     (Vale_X64_Machine_s.Block
                        [Vale_X64_InsVector.va_code_Load128_buffer
                           Prims.int_zero Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (3)))
                           Prims.int_zero Vale_Arch_HeapTypes_s.Secret])
                     (Vale_X64_Machine_s.Block
                        [Vale_X64_InsVector.va_code_Load128_buffer
                           Prims.int_zero Prims.int_zero
                           (Vale_X64_Machine_s.OReg (Prims.of_int (4)))
                           Prims.int_zero Vale_Arch_HeapTypes_s.Secret;
                        Vale_X64_InsBasic.va_code_Mov64
                          (Vale_X64_Machine_s.OReg (Prims.of_int (8)))
                          (Vale_X64_Machine_s.OReg (Prims.of_int (3)))]);
                  Vale_X64_Machine_s.Block [];
                  va_code_AES256EncryptBlock ();
                  Vale_X64_QuickCodes.if_code win
                    (Vale_X64_Machine_s.Block
                       [Vale_X64_InsVector.va_code_Store128_buffer
                          Prims.int_one
                          (Vale_X64_Machine_s.OReg (Prims.of_int (2)))
                          Prims.int_zero Prims.int_zero
                          Vale_Arch_HeapTypes_s.Secret])
                    (Vale_X64_Machine_s.Block
                       [Vale_X64_InsVector.va_code_Store128_buffer
                          Prims.int_one
                          (Vale_X64_Machine_s.OReg (Prims.of_int (5)))
                          Prims.int_zero Prims.int_zero
                          Vale_Arch_HeapTypes_s.Secret])] va_mods ()

type ('win, 'input, 'key, 'inputubuffer, 'outputubuffer, 'keysubuffer,
  'vaus0, 'vauk) va_wp_AES256EncryptBlockStdcall = unit

let (va_quick_AES256EncryptBlockStdcall :
  Prims.bool ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
        Vale_X64_Memory.buffer128 ->
          Vale_X64_Memory.buffer128 ->
            Vale_X64_Memory.buffer128 ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun win ->
    fun input ->
      fun key ->
        fun input_buffer ->
          fun output_buffer ->
            fun keys_buffer ->
              Vale_X64_QuickCode.QProc
                ((va_code_AES256EncryptBlockStdcall win),
                  [Vale_X64_QuickCode.Mod_flags;
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_one, (Prims.of_int (2))));
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero));
                  Vale_X64_QuickCode.Mod_mem_heaplet Prims.int_one;
                  Vale_X64_QuickCode.Mod_reg
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (8))));
                  Vale_X64_QuickCode.Mod_mem], (), ())