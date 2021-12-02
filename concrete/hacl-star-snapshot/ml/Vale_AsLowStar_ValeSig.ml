open Prims
type 'dom vale_pre_tl = Obj.t
type 'dom vale_pre =
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Obj.t
type 'dom vale_post_tl = Obj.t
type 'dom vale_post =
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Obj.t
type ('r, 's0, 's1) vale_save_reg = unit
type ('r, 's0, 's1) vale_save_xmm = unit
type ('s0, 's1, 'regsumodified, 'xmmsumodified) vale_calling_conventions =
  unit


let (state_of :
  (Vale_X64_State.vale_state * Vale_X64_Decls.va_fuel) ->
    Vale_X64_State.vale_state)
  = fun x -> FStar_Pervasives_Native.fst x
let (fuel_of :
  (Vale_X64_State.vale_state * Vale_X64_Decls.va_fuel) ->
    Vale_X64_Decls.va_fuel)
  = fun x -> FStar_Pervasives_Native.snd x
type sprop = unit
type ('s, 'arg) readable_one = Obj.t
type ('args, 's) readable = Obj.t
type ('a, 'b) disjoint_or_eq_1 = Obj.t
type 'l disjoint_or_eq = Obj.t
type ('regsumodified, 'xmmsumodified, 'args, 'code, 'pre,
  'post) vale_sig_nil = unit
type ('regsumodified, 'xmmsumodified, 'dom, 'args, 'code, 'pre,
  'post) vale_sig_tl = Obj.t

let (elim_vale_sig_cons :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
      (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
        Vale_Interop_Base.td ->
          Vale_Interop_Base.td Prims.list ->
            Vale_Interop_Base.arg Prims.list ->
              Obj.t -> Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___9 ->
    fun uu___8 ->
      fun uu___7 ->
        fun uu___6 ->
          fun uu___5 ->
            fun uu___4 ->
              fun uu___3 ->
                fun uu___2 ->
                  fun uu___1 ->
                    fun uu___ ->
                      (fun code ->
                         fun regs_modified ->
                           fun xmms_modified ->
                             fun hd ->
                               fun tl ->
                                 fun args ->
                                   fun pre ->
                                     fun post -> fun v -> Obj.magic v) uu___9
                        uu___8 uu___7 uu___6 uu___5 uu___4 uu___3 uu___2
                        uu___1 uu___
type ('dom, 'regsumodified, 'xmmsumodified, 'pre, 'post) vale_sig =
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Prims.bool -> Obj.t
type ('dom, 'pre, 'post) vale_sig_stdcall =
  (unit, unit, unit, 'pre, 'post) vale_sig
type ('s0, 's1) vale_calling_conventions_stdcall = unit