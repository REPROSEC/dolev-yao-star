open Prims
let op_String_Access :
  'uuuuu 'uuuuu1 . unit -> ('uuuuu, 'uuuuu1) FStar_Map.t -> 'uuuuu -> 'uuuuu1
  = fun uu___ -> FStar_Map.sel
let op_String_Assignment :
  'uuuuu 'uuuuu1 .
    unit ->
      ('uuuuu, 'uuuuu1) FStar_Map.t ->
        'uuuuu -> 'uuuuu1 -> ('uuuuu, 'uuuuu1) FStar_Map.t
  = fun uu___ -> FStar_Map.upd
let (obs_args :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    Obj.t ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_s.observation Prims.list)
  = Vale_X64_Machine_Semantics_s.obs_args
let (obs_inouts :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t ->
        Vale_X64_Machine_Semantics_s.machine_state ->
          Vale_X64_Machine_s.observation Prims.list)
  = Vale_X64_Machine_Semantics_s.obs_inouts
let (machine_eval_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state
          FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_code

let rec (check_if_consumes_fixed_time_args :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    Obj.t -> Vale_X64_Leakage_Helpers.analysis_taints -> Prims.bool)
  =
  fun args ->
    fun oprs ->
      fun ts ->
        match args with
        | [] -> true
        | (Vale_X64_Instruction_s.IOpEx i)::args1 ->
            let uu___ = Obj.magic oprs in
            (match uu___ with
             | (o, oprs1) ->
                 let o1 = o in
                 let b' =
                   match i with
                   | Vale_X64_Instruction_s.IOp64 ->
                       Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                         (Obj.magic o1) ts
                   | Vale_X64_Instruction_s.IOpXmm ->
                       Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                         (Obj.magic o1) ts in
                 let b'' = check_if_consumes_fixed_time_args args1 oprs1 ts in
                 b' && b'')
        | (Vale_X64_Instruction_s.IOpIm i)::args1 ->
            let b' =
              match i with
              | Vale_X64_Instruction_s.IOp64One o ->
                  Vale_X64_Leakage_Helpers.operand_does_not_use_secrets o ts
              | Vale_X64_Instruction_s.IOpXmmOne o ->
                  Vale_X64_Leakage_Helpers.operand_does_not_use_secrets o ts
              | Vale_X64_Instruction_s.IOpFlagsCf -> true
              | Vale_X64_Instruction_s.IOpFlagsOf -> true in
            let b'' = check_if_consumes_fixed_time_args args1 oprs ts in
            b' && b''
let (check_if_consumes_fixed_time_outs_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t ->
      Vale_X64_Leakage_Helpers.analysis_taints ->
        Vale_Arch_HeapTypes_s.taint -> Prims.bool)
  =
  fun i ->
    fun o ->
      fun ts ->
        fun t_out ->
          match i with
          | Vale_X64_Instruction_s.IOp64 ->
              (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                 (Obj.magic o) ts)
                &&
                (Vale_X64_Leakage_Helpers.operand_taint_allowed (Obj.magic o)
                   t_out)
          | Vale_X64_Instruction_s.IOpXmm ->
              (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                 (Obj.magic o) ts)
                &&
                (Vale_X64_Leakage_Helpers.operand_taint_allowed (Obj.magic o)
                   t_out)
let (check_if_consumes_fixed_time_outs_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      Vale_Arch_HeapTypes_s.taint -> Prims.bool)
  =
  fun i ->
    fun ts ->
      fun t_out ->
        match i with
        | Vale_X64_Instruction_s.IOp64One o ->
            (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets o ts) &&
              (Vale_X64_Leakage_Helpers.operand_taint_allowed o t_out)
        | Vale_X64_Instruction_s.IOpXmmOne o ->
            (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets o ts) &&
              (Vale_X64_Leakage_Helpers.operand_taint_allowed o t_out)
        | Vale_X64_Instruction_s.IOpFlagsCf -> true
        | Vale_X64_Instruction_s.IOpFlagsOf -> true
let rec (check_if_consumes_fixed_time_outs :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t ->
        Vale_X64_Leakage_Helpers.analysis_taints ->
          Vale_Arch_HeapTypes_s.taint -> Prims.bool)
  =
  fun outs ->
    fun args ->
      fun oprs ->
        fun ts ->
          fun t_out ->
            match outs with
            | [] -> check_if_consumes_fixed_time_args args oprs ts
            | (uu___, Vale_X64_Instruction_s.IOpEx i)::outs1 ->
                let uu___1 = Obj.magic oprs in
                (match uu___1 with
                 | (o, oprs1) ->
                     let o1 = o in
                     let b' =
                       check_if_consumes_fixed_time_outs_explicit i o1 ts
                         t_out in
                     let b'' =
                       check_if_consumes_fixed_time_outs outs1 args oprs1 ts
                         t_out in
                     b' && b'')
            | (uu___, Vale_X64_Instruction_s.IOpIm i)::outs1 ->
                let b' =
                  check_if_consumes_fixed_time_outs_implicit i ts t_out in
                let b'' =
                  check_if_consumes_fixed_time_outs outs1 args oprs ts t_out in
                b' && b''


let (instr_set_taint_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t ->
      Vale_X64_Leakage_Helpers.analysis_taints ->
        Vale_Arch_HeapTypes_s.taint ->
          Vale_X64_Leakage_Helpers.analysis_taints)
  =
  fun i ->
    fun o ->
      fun ts ->
        fun t ->
          match i with
          | Vale_X64_Instruction_s.IOp64 ->
              Vale_X64_Leakage_Helpers.set_taint Prims.int_zero (Obj.magic o)
                ts t
          | Vale_X64_Instruction_s.IOpXmm ->
              Vale_X64_Leakage_Helpers.set_taint Prims.int_one (Obj.magic o)
                ts t
let (instr_set_taint_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      Vale_Arch_HeapTypes_s.taint -> Vale_X64_Leakage_Helpers.analysis_taints)
  =
  fun i ->
    fun ts ->
      fun t ->
        match i with
        | Vale_X64_Instruction_s.IOp64One o ->
            Vale_X64_Leakage_Helpers.set_taint Prims.int_zero (Obj.magic o)
              ts t
        | Vale_X64_Instruction_s.IOpXmmOne o ->
            Vale_X64_Leakage_Helpers.set_taint Prims.int_one (Obj.magic o) ts
              t
        | Vale_X64_Instruction_s.IOpFlagsCf ->
            Vale_X64_Leakage_Helpers.set_taint_cf_and_flags ts t
        | Vale_X64_Instruction_s.IOpFlagsOf ->
            Vale_X64_Leakage_Helpers.set_taint_of_and_flags ts t
let rec (instr_set_taints :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t ->
        Vale_X64_Leakage_Helpers.analysis_taints ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Leakage_Helpers.analysis_taints)
  =
  fun outs ->
    fun args ->
      fun oprs ->
        fun ts ->
          fun t ->
            match outs with
            | [] -> ts
            | (uu___, i)::outs1 ->
                (match i with
                 | Vale_X64_Instruction_s.IOpEx i1 ->
                     let oprs1 = Obj.magic oprs in
                     instr_set_taints outs1 args
                       (FStar_Pervasives_Native.snd oprs1)
                       (instr_set_taint_explicit i1
                          (FStar_Pervasives_Native.fst oprs1) ts t) t
                 | Vale_X64_Instruction_s.IOpIm i1 ->
                     instr_set_taints outs1 args oprs
                       (instr_set_taint_implicit i1 ts t) t)

let (update_heap32_val :
  Prims.int -> Vale_Def_Words_s.nat32 -> Prims.int -> Vale_Def_Words_s.nat8)
  =
  fun ptr ->
    fun v ->
      fun i ->
        let v1 = Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)) v in
        match i - ptr with
        | uu___ when uu___ = Prims.int_zero -> v1.Vale_Def_Words_s.lo0
        | uu___ when uu___ = Prims.int_one -> v1.Vale_Def_Words_s.lo1
        | uu___ when uu___ = (Prims.of_int (2)) -> v1.Vale_Def_Words_s.hi2
        | uu___ when uu___ = (Prims.of_int (3)) -> v1.Vale_Def_Words_s.hi3
        | uu___ -> Prims.int_zero
let (valid_addr32 :
  Prims.int -> Vale_Arch_MachineHeap_s.machine_heap -> Prims.bool) =
  fun ptr ->
    fun mem ->
      (((Vale_Arch_MachineHeap_s.valid_addr (ptr + Prims.int_zero) mem) &&
          (Vale_Arch_MachineHeap_s.valid_addr (ptr + Prims.int_one) mem))
         &&
         (Vale_Arch_MachineHeap_s.valid_addr (ptr + (Prims.of_int (2))) mem))
        &&
        (Vale_Arch_MachineHeap_s.valid_addr (ptr + (Prims.of_int (3))) mem)


let (update_heap64_val :
  Prims.int -> Vale_Def_Words_s.nat64 -> Prims.int -> Vale_Def_Words_s.nat8)
  =
  fun ptr ->
    fun v ->
      fun i ->
        let v1 = Vale_Def_Words_Two_s.nat_to_two (Prims.of_int (32)) v in
        let lo =
          Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))
            v1.Vale_Def_Words_s.lo in
        let hi =
          Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))
            v1.Vale_Def_Words_s.hi in
        match i - ptr with
        | uu___ when uu___ = Prims.int_zero -> lo.Vale_Def_Words_s.lo0
        | uu___ when uu___ = Prims.int_one -> lo.Vale_Def_Words_s.lo1
        | uu___ when uu___ = (Prims.of_int (2)) -> lo.Vale_Def_Words_s.hi2
        | uu___ when uu___ = (Prims.of_int (3)) -> lo.Vale_Def_Words_s.hi3
        | uu___ when uu___ = (Prims.of_int (4)) -> hi.Vale_Def_Words_s.lo0
        | uu___ when uu___ = (Prims.of_int (5)) -> hi.Vale_Def_Words_s.lo1
        | uu___ when uu___ = (Prims.of_int (6)) -> hi.Vale_Def_Words_s.hi2
        | uu___ when uu___ = (Prims.of_int (7)) -> hi.Vale_Def_Words_s.hi3
        | uu___ -> Prims.int_zero


let (update_heap128_val :
  Prims.int -> Vale_Def_Types_s.quad32 -> Prims.int -> Vale_Def_Words_s.nat8)
  =
  fun ptr ->
    fun v ->
      fun i ->
        let j = i - ptr in
        if (Prims.int_zero <= j) && (j < (Prims.of_int (4)))
        then
          update_heap32_val (ptr + Prims.int_zero) v.Vale_Def_Words_s.lo0 i
        else
          if ((Prims.of_int (4)) <= j) && (j < (Prims.of_int (8)))
          then
            update_heap32_val (ptr + (Prims.of_int (4)))
              v.Vale_Def_Words_s.lo1 i
          else
            if ((Prims.of_int (8)) <= j) && (j < (Prims.of_int (12)))
            then
              update_heap32_val (ptr + (Prims.of_int (8)))
                v.Vale_Def_Words_s.hi2 i
            else
              if ((Prims.of_int (12)) <= j) && (j < (Prims.of_int (16)))
              then
                update_heap32_val (ptr + (Prims.of_int (12)))
                  v.Vale_Def_Words_s.hi3 i
              else Prims.int_zero
let (valid_addr128 :
  Prims.int -> Vale_Arch_MachineHeap_s.machine_heap -> Prims.bool) =
  fun ptr ->
    fun mem ->
      (((valid_addr32 (ptr + Prims.int_zero) mem) &&
          (valid_addr32 (ptr + (Prims.of_int (4))) mem))
         && (valid_addr32 (ptr + (Prims.of_int (8))) mem))
        && (valid_addr32 (ptr + (Prims.of_int (12))) mem)







let (check_if_instr_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord
           (outs, args, havoc_flags, iins), oprs, uu___1)
          ->
          let t = Vale_X64_Leakage_Helpers.inouts_taint outs args oprs ts in
          let b = check_if_consumes_fixed_time_outs outs args oprs ts t in
          let uu___2 = ts in
          (match uu___2 with
           | Vale_X64_Leakage_Helpers.AnalysisTaints
               (Vale_X64_Leakage_s.LeakageTaints (rs, flags, cf, ovf), rts)
               ->
               let flags1 =
                 match havoc_flags with
                 | Vale_X64_Instruction_s.HavocFlags ->
                     Vale_Arch_HeapTypes_s.Secret
                 | Vale_X64_Instruction_s.PreserveFlags -> flags in
               let cf1 =
                 match havoc_flags with
                 | Vale_X64_Instruction_s.HavocFlags ->
                     Vale_Arch_HeapTypes_s.Secret
                 | Vale_X64_Instruction_s.PreserveFlags -> cf in
               let ovf1 =
                 match havoc_flags with
                 | Vale_X64_Instruction_s.HavocFlags ->
                     Vale_Arch_HeapTypes_s.Secret
                 | Vale_X64_Instruction_s.PreserveFlags -> ovf in
               let ts1 =
                 Vale_X64_Leakage_Helpers.AnalysisTaints
                   ((Vale_X64_Leakage_s.LeakageTaints (rs, flags1, cf1, ovf1)),
                     rts) in
               (b, (instr_set_taints outs args oprs ts1 t)))
let coerce_to_normal : 'a . 'a -> 'a = fun x -> x
let (check_if_xor_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord
           (outs, args, havoc_flags, iins), oprs,
           Vale_X64_Machine_Semantics_s.AnnotateXor64 eq)
          ->
          let oprs1 = Obj.magic (coerce_to_normal oprs) in
          let uu___1 = oprs1 in
          (match uu___1 with
           | (o1, (o2, ())) ->
               if o1 = o2
               then
                 let t = Vale_Arch_HeapTypes_s.Public in
                 let b =
                   check_if_consumes_fixed_time_outs outs args
                     (Obj.magic oprs1) ts t in
                 let uu___2 = ts in
                 (match uu___2 with
                  | Vale_X64_Leakage_Helpers.AnalysisTaints
                      (Vale_X64_Leakage_s.LeakageTaints
                       (rs, uu___3, uu___4, uu___5), rts)
                      ->
                      let ts1 =
                        Vale_X64_Leakage_Helpers.AnalysisTaints
                          ((Vale_X64_Leakage_s.LeakageTaints
                              (rs, Vale_Arch_HeapTypes_s.Secret,
                                Vale_Arch_HeapTypes_s.Public,
                                Vale_Arch_HeapTypes_s.Public)), rts) in
                      (b,
                        (instr_set_taints outs args (Obj.magic oprs1) ts1 t)))
               else check_if_instr_consumes_fixed_time ins ts)
let (check_if_pxor_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord
           (outs, args, havoc_flags, iins), oprs,
           Vale_X64_Machine_Semantics_s.AnnotatePxor eq)
          ->
          let oprs1 = Obj.magic (coerce_to_normal oprs) in
          let uu___1 = oprs1 in
          (match uu___1 with
           | (o1, (o2, ())) ->
               if o1 = o2
               then
                 let t = Vale_Arch_HeapTypes_s.Public in
                 let b =
                   check_if_consumes_fixed_time_outs outs args
                     (Obj.magic oprs1) ts t in
                 let uu___2 = ts in
                 (match uu___2 with
                  | Vale_X64_Leakage_Helpers.AnalysisTaints
                      (Vale_X64_Leakage_s.LeakageTaints (rs, ft, cft, oft),
                       rts)
                      ->
                      let ts1 =
                        Vale_X64_Leakage_Helpers.AnalysisTaints
                          ((Vale_X64_Leakage_s.LeakageTaints
                              (rs, ft, cft, oft)), rts) in
                      (b,
                        (instr_set_taints outs args (Obj.magic oprs1) ts1 t)))
               else check_if_instr_consumes_fixed_time ins ts)
let (check_if_vpxor_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord
           (outs, args, havoc_flags, iins), oprs,
           Vale_X64_Machine_Semantics_s.AnnotateVPxor eq)
          ->
          let oprs1 = Obj.magic (coerce_to_normal oprs) in
          let uu___1 = oprs1 in
          (match uu___1 with
           | (uu___2, (o2, (o3, ()))) ->
               if o2 = o3
               then
                 let t = Vale_Arch_HeapTypes_s.Public in
                 let b =
                   check_if_consumes_fixed_time_outs outs args
                     (Obj.magic oprs1) ts t in
                 let uu___3 = ts in
                 (match uu___3 with
                  | Vale_X64_Leakage_Helpers.AnalysisTaints
                      (Vale_X64_Leakage_s.LeakageTaints (rs, ft, cft, oft),
                       rts)
                      ->
                      let ts1 =
                        Vale_X64_Leakage_Helpers.AnalysisTaints
                          ((Vale_X64_Leakage_s.LeakageTaints
                              (rs, ft, cft, oft)), rts) in
                      (b,
                        (instr_set_taints outs args (Obj.magic oprs1) ts1 t)))
               else check_if_instr_consumes_fixed_time ins ts)
let (check_if_alloc_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  = fun ins -> fun ts -> (true, ts)
let (check_if_dealloc_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  = fun ins -> fun ts -> (true, ts)
let (check_if_push_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Push (src, t_stk) ->
          let t_out =
            Vale_X64_Leakage_Helpers.operand_taint Prims.int_zero
              (Obj.magic src) ts in
          ((((Vale_Arch_HeapTypes_s.uu___is_Public
                (Vale_Lib_MapTree.sel
                   (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__rts
                      ts)
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_zero, (Prims.of_int (7))))))
               &&
               (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets src ts))
              &&
              ((t_out = Vale_Arch_HeapTypes_s.Public) ||
                 (t_stk = Vale_Arch_HeapTypes_s.Secret))), ts)
let (check_if_pop_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      let uu___ = ins in
      match uu___ with
      | Vale_X64_Bytes_Code_s.Pop (dst, t_stk) ->
          let allowed =
            Vale_X64_Leakage_Helpers.operand_taint_allowed dst t_stk in
          ((((Vale_Arch_HeapTypes_s.uu___is_Public
                (Vale_Lib_MapTree.sel
                   (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__rts
                      ts)
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_zero, (Prims.of_int (7))))))
               &&
               (Vale_X64_Leakage_Helpers.operand_does_not_use_secrets dst ts))
              && allowed),
            (Vale_X64_Leakage_Helpers.set_taint Prims.int_zero
               (Obj.magic dst) ts t_stk))
let (check_if_ins_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun ins ->
    fun ts ->
      match ins with
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateXor64 uu___2)
          -> check_if_xor_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotatePxor uu___2)
          -> check_if_pxor_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateVPxor uu___2)
          -> check_if_vpxor_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Instr (uu___, uu___1, uu___2) ->
          check_if_instr_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Push (uu___, uu___1) ->
          check_if_push_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Pop (uu___, uu___1) ->
          check_if_pop_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Alloc uu___ ->
          check_if_alloc_consumes_fixed_time ins ts
      | Vale_X64_Bytes_Code_s.Dealloc uu___ ->
          check_if_dealloc_consumes_fixed_time ins ts







