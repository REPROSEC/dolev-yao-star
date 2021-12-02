open Prims
type flags_t = Vale_X64_Flags.t
let (bool_to_nat1 : Prims.bool -> Vale_Def_Words_s.nat1) =
  fun b -> if b then Prims.int_one else Prims.int_zero
let (flag_cf : flags_t -> Vale_Def_Words_s.nat1) =
  fun f -> bool_to_nat1 (Vale_X64_Decls.cf f)
let (flag_of : flags_t -> Vale_Def_Words_s.nat1) =
  fun f -> bool_to_nat1 (Vale_X64_Decls.overflow f)
type ('fu, 'c) update_cf = unit
type ('fu, 'o) update_of = unit
type ('fu, 'f) maintain_cf = unit
type ('fu, 'f) maintain_of = unit


let (va_code_Adcx_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Machine_s.Block [Vale_X64_InsBasic.va_code_Adcx64Wrap dst src]
let (va_codegen_success_Adcx_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsBasic.va_codegen_success_Adcx64Wrap dst src)
        (Vale_X64_Decls.va_ttrue ())

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adcx_64 = unit

let (va_quick_Adcx_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adcx_64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Adox_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst ->
    fun src ->
      Vale_X64_Machine_s.Block [Vale_X64_InsBasic.va_code_Adox64Wrap dst src]
let (va_codegen_success_Adox_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst ->
    fun src ->
      Vale_X64_Decls.va_pbool_and
        (Vale_X64_InsBasic.va_codegen_success_Adox64Wrap dst src)
        (Vale_X64_Decls.va_ttrue ())

type ('dst, 'src, 'vaus0, 'vauk) va_wp_Adox_64 = unit

let (va_quick_Adox_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun dst ->
    fun src ->
      Vale_X64_QuickCode.QProc
        ((va_code_Adox_64 dst src),
          [Vale_X64_QuickCode.Mod_flags;
          Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Mulx_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun dst_hi ->
    fun dst_lo ->
      fun src ->
        Vale_X64_Machine_s.Block
          [Vale_X64_InsBasic.va_code_Mulx64 dst_hi dst_lo src]
let (va_codegen_success_Mulx_64 :
  Vale_X64_Machine_s.operand64 ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Machine_s.operand64 -> Vale_X64_Decls.va_pbool)
  =
  fun dst_hi ->
    fun dst_lo ->
      fun src ->
        Vale_X64_Decls.va_pbool_and
          (Vale_X64_InsBasic.va_codegen_success_Mulx64 dst_hi dst_lo src)
          (Vale_X64_Decls.va_ttrue ())
