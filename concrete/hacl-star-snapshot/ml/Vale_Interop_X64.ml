open Prims
type ('s0, 's1, 'regsumodified, 'xmmsumodified) calling_conventions = unit
type 'n reg_nat = Prims.nat
type ('n, 'a) arity_ok = 'a Prims.list
type arg_list = Vale_Interop_Base.arg Prims.list
type arg_list_sb = Vale_Interop_Base.arg Prims.list
type ('uuuuu, 'uuuuu1, 'f) injective = unit
type 'n arg_reg_relation' =
  | Rel of
  (Vale_X64_Machine_s.reg_64 -> unit reg_nat FStar_Pervasives_Native.option)
  * (unit reg_nat -> Vale_X64_Machine_s.reg_64) 
let (uu___is_Rel : Prims.nat -> unit arg_reg_relation' -> Prims.bool) =
  fun n -> fun projectee -> true
let (__proj__Rel__item__of_reg :
  Prims.nat ->
    unit arg_reg_relation' ->
      Vale_X64_Machine_s.reg_64 ->
        unit reg_nat FStar_Pervasives_Native.option)
  =
  fun n ->
    fun projectee -> match projectee with | Rel (of_reg, of_arg) -> of_reg
let (__proj__Rel__item__of_arg :
  Prims.nat ->
    unit arg_reg_relation' -> unit reg_nat -> Vale_X64_Machine_s.reg_64)
  =
  fun n ->
    fun projectee -> match projectee with | Rel (of_reg, of_arg) -> of_arg
type 'n arg_reg_relation = unit arg_reg_relation'
type registers = Vale_X64_Machine_s.reg_64 -> Vale_Def_Words_s.nat64
let (upd_reg :
  Prims.nat ->
    unit arg_reg_relation' ->
      registers -> Prims.nat -> Vale_Def_Words_s.nat64 -> registers)
  =
  fun n ->
    fun arg_reg ->
      fun regs ->
        fun i ->
          fun v ->
            fun r ->
              match __proj__Rel__item__of_reg n arg_reg r with
              | FStar_Pervasives_Native.Some j -> if i = j then v else regs r
              | uu___ -> regs r




type taint_map = unit




let (taint_of_arg :
  Vale_Interop_Base.arg ->
    Vale_Arch_HeapTypes_s.taint FStar_Pervasives_Native.option)
  =
  fun a ->
    let uu___ = a in
    match uu___ with
    | Prims.Mkdtuple2 (tag, x) ->
        (match tag with
         | Vale_Interop_Base.TD_ImmBuffer
             (uu___1, Vale_Arch_HeapTypes_s.TUInt64,
              { Vale_Interop_Base.modified = uu___2;
                Vale_Interop_Base.taint = tnt;
                Vale_Interop_Base.strict_disjointness = uu___3;_})
             -> FStar_Pervasives_Native.Some tnt
         | Vale_Interop_Base.TD_ImmBuffer
             (uu___1, Vale_Arch_HeapTypes_s.TUInt128,
              { Vale_Interop_Base.modified = uu___2;
                Vale_Interop_Base.taint = tnt;
                Vale_Interop_Base.strict_disjointness = uu___3;_})
             -> FStar_Pervasives_Native.Some tnt
         | Vale_Interop_Base.TD_Buffer
             (uu___1, Vale_Arch_HeapTypes_s.TUInt64,
              { Vale_Interop_Base.modified = uu___2;
                Vale_Interop_Base.taint = tnt;
                Vale_Interop_Base.strict_disjointness = uu___3;_})
             -> FStar_Pervasives_Native.Some tnt
         | Vale_Interop_Base.TD_Buffer
             (uu___1, Vale_Arch_HeapTypes_s.TUInt128,
              { Vale_Interop_Base.modified = uu___2;
                Vale_Interop_Base.taint = tnt;
                Vale_Interop_Base.strict_disjointness = uu___3;_})
             -> FStar_Pervasives_Native.Some tnt
         | uu___1 -> FStar_Pervasives_Native.None)



type ('maxuarity, 'args, 'codom) state_builder_t = unit

type ('c, 'args) prediction_pre_rel_t = unit
type 'sn return_val_t = FStar_UInt64.t
let (return_val :
  Vale_X64_Machine_Semantics_s.machine_state -> unit return_val_t) =
  fun sn ->
    FStar_UInt64.uint_to_t
      (Obj.magic
         (sn.Vale_X64_Machine_Semantics_s.ms_regs
            (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))))
type ('c, 'args) prediction_post_rel_t = unit
type ('n, 'argureg, 'c, 'args, 'preurel, 'h0, 's0) prediction_pre = unit
type ('n, 'regsumodified, 'xmmsumodified, 'c, 'args, 'posturel, 'h0, 
  's0, 'raxufuelumem) prediction_post = Obj.t
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'args, 'preurel,
  'posturel) prediction = unit
type as_lowstar_sig_ret =
  | As_lowstar_sig_ret of Prims.nat * arg_list * Prims.nat *
  Vale_Interop_Heap_s.interop_heap 
let (uu___is_As_lowstar_sig_ret : as_lowstar_sig_ret -> Prims.bool) =
  fun projectee -> true
let (__proj__As_lowstar_sig_ret__item__n : as_lowstar_sig_ret -> Prims.nat) =
  fun projectee ->
    match projectee with | As_lowstar_sig_ret (n, args, fuel, final_mem) -> n
let (__proj__As_lowstar_sig_ret__item__args : as_lowstar_sig_ret -> arg_list)
  =
  fun projectee ->
    match projectee with
    | As_lowstar_sig_ret (n, args, fuel, final_mem) -> args
let (__proj__As_lowstar_sig_ret__item__fuel :
  as_lowstar_sig_ret -> Prims.nat) =
  fun projectee ->
    match projectee with
    | As_lowstar_sig_ret (n, args, fuel, final_mem) -> fuel
let (__proj__As_lowstar_sig_ret__item__final_mem :
  as_lowstar_sig_ret -> Vale_Interop_Heap_s.interop_heap) =
  fun projectee ->
    match projectee with
    | As_lowstar_sig_ret (n, args, fuel, final_mem) -> final_mem
type als_ret = (FStar_UInt64.t * unit)
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'args, 'h0, 'preurel,
  'posturel, 'predict, 'ret, 'h1) as_lowstar_sig_post = unit
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'args, 'h0, 'preurel,
  'posturel, 'predict, 'ret, 'h1) as_lowstar_sig_post_weak = unit
type 'c as_lowstar_sig =
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          arg_list -> unit -> unit -> unit -> als_ret
let (wrap_variadic :
  Vale_X64_Machine_Semantics_s.code -> unit as_lowstar_sig) =
  fun c ->
    fun n ->
      fun arg_reg ->
        fun regs_modified ->
          fun xmms_modified ->
            fun args ->
              fun pre_rel ->
                fun post_rel ->
                  fun predict ->
                    let h0 = FStar_HyperStack_ST.get () in
                    let uu___ = Vale_Interop_Assumptions.st_put () in
                    match uu___ with | (rax, fuel, final_mem) -> (rax, ())
let (op_Plus_Plus :
  Vale_Interop_Base.td ->
    Obj.t ->
      Vale_Interop_Base.arg Prims.list -> Vale_Interop_Base.arg Prims.list)
  = fun t -> fun x -> fun args -> (Prims.Mkdtuple2 (t, x)) :: args
type ('c, 'td, 'args, 'f) rel_gen_t = Obj.t
let (elim_rel_gen_t_nil :
  Vale_X64_Machine_Semantics_s.code -> arg_list -> unit -> Obj.t -> Obj.t) =
  fun c -> fun args -> fun f -> fun x -> x
let (elim_rel_gen_t_cons :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_Interop_Base.td ->
      Vale_Interop_Base.td Prims.list ->
        arg_list -> unit -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___6 ->
    fun uu___5 ->
      fun uu___4 ->
        fun uu___3 ->
          fun uu___2 ->
            fun uu___1 ->
              fun uu___ ->
                (fun c ->
                   fun hd ->
                     fun tl -> fun args -> fun f -> fun p -> Obj.magic p)
                  uu___6 uu___5 uu___4 uu___3 uu___2 uu___1 uu___
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'dom, 'args,
  'preurel, 'posturel) prediction_t = Obj.t

let (elim_predict_t_cons :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            Vale_Interop_Base.td ->
              Vale_Interop_Base.td Prims.list ->
                arg_list -> Obj.t -> Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___11 ->
    fun uu___10 ->
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
                          (fun n ->
                             fun arg_reg ->
                               fun regs_modified ->
                                 fun xmms_modified ->
                                   fun c ->
                                     fun hd ->
                                       fun tl ->
                                         fun args ->
                                           fun pre_rel ->
                                             fun post_rel ->
                                               fun p -> Obj.magic p) uu___11
                            uu___10 uu___9 uu___8 uu___7 uu___6 uu___5 uu___4
                            uu___3 uu___2 uu___1 uu___
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'dom, 'args,
  'preurel, 'posturel, 'predict) as_lowstar_sig_t = Obj.t
let rec (wrap_aux :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            Vale_Interop_Base.td Prims.list ->
              Vale_Interop_Base.arg Prims.list ->
                Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun n ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun c ->
            fun dom ->
              fun args ->
                fun pre_rel ->
                  fun post_rel ->
                    fun predict ->
                      match dom with
                      | [] ->
                          Obj.repr
                            (let f uu___ =
                               wrap_variadic c n arg_reg regs_modified
                                 xmms_modified args () () () in
                             f)
                      | hd::tl ->
                          Obj.repr
                            (fun x ->
                               wrap_aux n arg_reg regs_modified xmms_modified
                                 c tl (op_Plus_Plus hd x args)
                                 (elim_rel_gen_t_cons c hd tl args () pre_rel
                                    x)
                                 (elim_rel_gen_t_cons c hd tl args ()
                                    post_rel x)
                                 (elim_predict_t_cons n arg_reg regs_modified
                                    xmms_modified c hd tl args pre_rel
                                    post_rel predict x))
let (wrap' :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            Vale_Interop_Base.td Prims.list ->
              Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun n ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun c ->
            fun dom ->
              fun pre_rel ->
                fun post_rel ->
                  fun predict ->
                    wrap_aux n arg_reg regs_modified xmms_modified c dom []
                      pre_rel post_rel predict
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'dom, 'args,
  'preurel, 'posturel, 'predict) as_lowstar_sig_t_weak' = Obj.t
let rec (wrap_aux_weak :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            Vale_Interop_Base.td Prims.list ->
              Vale_Interop_Base.arg Prims.list ->
                Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun n ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun c ->
            fun dom ->
              fun args ->
                fun pre_rel ->
                  fun post_rel ->
                    fun predict ->
                      match dom with
                      | [] ->
                          Obj.repr
                            (let f uu___ =
                               wrap_variadic c n arg_reg regs_modified
                                 xmms_modified args () () () in
                             f)
                      | hd::tl ->
                          Obj.repr
                            (fun x ->
                               wrap_aux_weak n arg_reg regs_modified
                                 xmms_modified c tl (op_Plus_Plus hd x args)
                                 (elim_rel_gen_t_cons c hd tl args () pre_rel
                                    x)
                                 (elim_rel_gen_t_cons c hd tl args ()
                                    post_rel x)
                                 (elim_predict_t_cons n arg_reg regs_modified
                                    xmms_modified c hd tl args pre_rel
                                    post_rel predict x))
let (wrap_weak' :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            Vale_Interop_Base.td Prims.list ->
              Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun n ->
    fun arg_reg ->
      fun regs_modified ->
        fun xmms_modified ->
          fun c ->
            fun dom ->
              fun pre_rel ->
                fun post_rel ->
                  fun predict ->
                    wrap_aux_weak n arg_reg regs_modified xmms_modified c dom
                      [] pre_rel post_rel predict
type ('n, 'argureg, 'regsumodified, 'xmmsumodified, 'c, 'dom, 'args,
  'preurel, 'posturel, 'predict) as_lowstar_sig_t_weak = Obj.t
let (wrap_weak :
  Prims.nat ->
    unit arg_reg_relation' ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_xmm -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code ->
            (unit, Vale_Interop_Base.td) arity_ok ->
              Obj.t -> Obj.t -> Obj.t -> Obj.t)
  = fun n -> wrap_weak' n
let (register_of_arg_i : unit reg_nat -> Vale_X64_Machine_s.reg_64) =
  fun i ->
    if Vale_Interop_Assumptions.win
    then
      match i with
      | uu___ when uu___ = Prims.int_zero -> (Prims.of_int (2))
      | uu___ when uu___ = Prims.int_one -> (Prims.of_int (3))
      | uu___ when uu___ = (Prims.of_int (2)) -> (Prims.of_int (8))
      | uu___ when uu___ = (Prims.of_int (3)) -> (Prims.of_int (9))
    else
      (match i with
       | uu___1 when uu___1 = Prims.int_zero -> (Prims.of_int (5))
       | uu___1 when uu___1 = Prims.int_one -> (Prims.of_int (4))
       | uu___1 when uu___1 = (Prims.of_int (2)) -> (Prims.of_int (3))
       | uu___1 when uu___1 = (Prims.of_int (3)) -> (Prims.of_int (2))
       | uu___1 when uu___1 = (Prims.of_int (4)) -> (Prims.of_int (8))
       | uu___1 when uu___1 = (Prims.of_int (5)) -> (Prims.of_int (9)))
let (arg_of_register :
  Vale_X64_Machine_s.reg_64 -> unit reg_nat FStar_Pervasives_Native.option) =
  fun r ->
    if Vale_Interop_Assumptions.win
    then
      match r with
      | uu___ when uu___ = (Prims.of_int (2)) ->
          FStar_Pervasives_Native.Some Prims.int_zero
      | uu___ when uu___ = (Prims.of_int (3)) ->
          FStar_Pervasives_Native.Some Prims.int_one
      | uu___ when uu___ = (Prims.of_int (8)) ->
          FStar_Pervasives_Native.Some (Prims.of_int (2))
      | uu___ when uu___ = (Prims.of_int (9)) ->
          FStar_Pervasives_Native.Some (Prims.of_int (3))
      | uu___ -> FStar_Pervasives_Native.None
    else
      (match r with
       | uu___1 when uu___1 = (Prims.of_int (5)) ->
           FStar_Pervasives_Native.Some Prims.int_zero
       | uu___1 when uu___1 = (Prims.of_int (4)) ->
           FStar_Pervasives_Native.Some Prims.int_one
       | uu___1 when uu___1 = (Prims.of_int (3)) ->
           FStar_Pervasives_Native.Some (Prims.of_int (2))
       | uu___1 when uu___1 = (Prims.of_int (2)) ->
           FStar_Pervasives_Native.Some (Prims.of_int (3))
       | uu___1 when uu___1 = (Prims.of_int (8)) ->
           FStar_Pervasives_Native.Some (Prims.of_int (4))
       | uu___1 when uu___1 = (Prims.of_int (9)) ->
           FStar_Pervasives_Native.Some (Prims.of_int (5))
       | uu___1 -> FStar_Pervasives_Native.None)
let (max_stdcall : Prims.nat) =
  if Vale_Interop_Assumptions.win
  then (Prims.of_int (4))
  else (Prims.of_int (6))
type 'a arity_ok_stdcall = (unit, 'a) arity_ok
let (arg_reg_stdcall : unit arg_reg_relation') =
  Rel (arg_of_register, register_of_arg_i)
let (regs_modified_stdcall : Vale_X64_Machine_s.reg_64 -> Prims.bool) =
  fun r ->
    if Vale_Interop_Assumptions.win
    then
      (if
         ((((((((r = Prims.int_one) || (r = (Prims.of_int (6)))) ||
                 (r = (Prims.of_int (5))))
                || (r = (Prims.of_int (4))))
               || (r = (Prims.of_int (7))))
              || (r = (Prims.of_int (12))))
             || (r = (Prims.of_int (13))))
            || (r = (Prims.of_int (14))))
           || (r = (Prims.of_int (15)))
       then false
       else true)
    else
      if
        (((((r = Prims.int_one) || (r = (Prims.of_int (6)))) ||
             (r = (Prims.of_int (12))))
            || (r = (Prims.of_int (13))))
           || (r = (Prims.of_int (14))))
          || (r = (Prims.of_int (15)))
      then false
      else true
let (xmms_modified_stdcall : Vale_X64_Machine_s.reg_xmm -> Prims.bool) =
  fun x ->
    if Vale_Interop_Assumptions.win
    then
      (if
         (((((((((x = (Prims.of_int (6))) || (x = (Prims.of_int (7)))) ||
                  (x = (Prims.of_int (8))))
                 || (x = (Prims.of_int (9))))
                || (x = (Prims.of_int (10))))
               || (x = (Prims.of_int (11))))
              || (x = (Prims.of_int (12))))
             || (x = (Prims.of_int (13))))
            || (x = (Prims.of_int (14))))
           || (x = (Prims.of_int (15)))
       then false
       else true)
    else true
type ('c, 'dom, 'args, 'preurel, 'posturel,
  'predict) as_lowstar_sig_t_weak_stdcall = Obj.t
let (wrap_weak_stdcall :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_Interop_Base.td Prims.list -> Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  wrap_weak' max_stdcall arg_reg_stdcall regs_modified_stdcall
    xmms_modified_stdcall