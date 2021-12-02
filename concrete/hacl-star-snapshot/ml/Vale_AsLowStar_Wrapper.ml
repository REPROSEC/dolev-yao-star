open Prims
type ('maxuarity, 'argureg, 'pre, 'code, 'args, 'h0) prediction_pre_rel =
  unit
type ('maxuarity, 'post, 'code, 'args, 'h0, 'us0, 'raxufuelumem,
  's1) prediction_post_rel = Obj.t



type ('h, 'a) arg_is_registered_root = Obj.t




type ('maxuarity, 'argureg, 'n, 'args, 'regs) register_args' = Obj.t




type ('maxuarity, 'n, 'args, 'rsp, 'stack) stack_args' = Obj.t






type ('c, 's0, 'f0, 's1) eval_code_ts = Obj.t




let rec (pre_rel_generic :
  Prims.nat ->
    unit Vale_Interop_X64.arg_reg_relation' ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
        Vale_Interop_Base.td Prims.list ->
          Vale_Interop_Base.arg Prims.list -> Obj.t -> Obj.t)
  =
  fun max_arity ->
    fun arg_reg ->
      fun code ->
        fun dom ->
          fun args ->
            fun pre ->
              match dom with
              | [] -> Obj.repr ()
              | hd::tl ->
                  Obj.repr
                    (fun x ->
                       pre_rel_generic max_arity arg_reg code tl
                         (Vale_Interop_X64.op_Plus_Plus hd x args)
                         (Vale_Interop_Base.elim_1 dom () pre x))
let rec (post_rel_generic :
  Prims.nat ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      Vale_Interop_Base.td Prims.list ->
        Vale_Interop_Base.arg Prims.list -> Obj.t -> Obj.t)
  =
  fun max_arity ->
    fun code ->
      fun dom ->
        fun args ->
          fun post ->
            match dom with
            | [] -> Obj.repr ()
            | hd::tl ->
                Obj.repr
                  (fun x ->
                     post_rel_generic max_arity code tl
                       (Vale_Interop_X64.op_Plus_Plus hd x args)
                       (Vale_Interop_Base.elim_1 dom () post x))
let rec (mk_prediction :
  Prims.nat ->
    unit Vale_Interop_X64.arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
            Vale_X64_Machine_s.precode ->
            Vale_Interop_Base.td Prims.list ->
              Vale_Interop_Base.arg Prims.list ->
                Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun max_arity ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun code ->
            fun dom ->
              fun args ->
                fun pre ->
                  fun post ->
                    fun v ->
                      match dom with
                      | [] -> Obj.repr ()
                      | hd::tl ->
                          Obj.repr
                            (fun x ->
                               mk_prediction max_arity arg_reg regs_modified
                                 xmms_modified code tl
                                 (Vale_Interop_X64.op_Plus_Plus hd x args)
                                 (Vale_Interop_Base.elim_1 dom () pre x)
                                 (Vale_Interop_Base.elim_1 dom () post x)
                                 (Vale_AsLowStar_ValeSig.elim_vale_sig_cons
                                    (Vale_Interop_Base.coerce code)
                                    regs_modified xmms_modified hd tl args
                                    pre post v x))
type ('maxuarity, 'argureg, 'dom, 'code, 'args, 'pre, 'post) lowstar_typ =
  Obj.t
let rec (__test__wrap :
  Prims.nat ->
    unit Vale_Interop_X64.arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_Interop_Base.td Prims.list ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode ->
              Vale_Interop_Base.arg Prims.list ->
                Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun max_arity ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun dom ->
            fun code ->
              fun args ->
                fun pre ->
                  fun post ->
                    fun v ->
                      match dom with
                      | [] ->
                          Obj.repr
                            (let f uu___ =
                               let h0 = FStar_HyperStack_ST.get () in
                               let uu___1 =
                                 Vale_Interop_X64.wrap_variadic
                                   (Vale_Interop_Base.coerce code) max_arity
                                   arg_reg regs_modified xmms_modified args
                                   () () () in
                               match uu___1 with | (rax, ret) -> rax in
                             f)
                      | hd::tl ->
                          Obj.repr
                            (fun x ->
                               __test__wrap max_arity arg_reg regs_modified
                                 xmms_modified
                                 (Prims.__proj__Cons__item__tl dom) code
                                 (Vale_Interop_X64.op_Plus_Plus hd x args)
                                 (Vale_Interop_Base.elim_1 dom () pre x)
                                 (Vale_Interop_Base.elim_1 dom () post x)
                                 (Vale_AsLowStar_ValeSig.elim_vale_sig_cons
                                    (Vale_Interop_Base.coerce code)
                                    regs_modified xmms_modified hd tl args
                                    pre post v x))