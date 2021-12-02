open Prims
type regmap =
  (Vale_X64_Machine_s.reg, Vale_Arch_HeapTypes_s.taint) Vale_Lib_MapTree.map
let (reg_le : Vale_X64_Machine_s.reg -> Vale_X64_Machine_s.reg -> Prims.bool)
  =
  fun r1 ->
    fun r2 ->
      let uu___ = r1 in
      match uu___ with
      | Vale_X64_Machine_s.Reg (f1, n1) ->
          let uu___1 = r2 in
          (match uu___1 with
           | Vale_X64_Machine_s.Reg (f2, n2) ->
               (f1 < f2) || ((f1 = f2) && (n1 <= n2)))
let (map_to_regs : regmap -> Vale_X64_Leakage_s.reg_taint) =
  fun m -> Vale_Lib_MapTree.sel m
type ('m, 'rs) is_map_of = unit
let rec (regs_to_map_rec :
  Vale_X64_Leakage_s.reg_taint -> Prims.nat -> Prims.nat -> regmap) =
  fun rs ->
    fun f ->
      fun n ->
        if n = Prims.int_zero
        then
          (if f = Prims.int_zero
           then Vale_Lib_MapTree.const reg_le Vale_Arch_HeapTypes_s.Secret
           else
             regs_to_map_rec rs (f - Prims.int_one)
               (Vale_X64_Machine_s.n_regs (f - Prims.int_one)))
        else
          (let m = regs_to_map_rec rs f (n - Prims.int_one) in
           let r = Vale_X64_Machine_s.Reg (f, (n - Prims.int_one)) in
           Vale_Lib_MapTree.upd m r (rs r))
let (regs_to_map : Vale_X64_Leakage_s.reg_taint -> regmap) =
  fun rs -> regs_to_map_rec rs Vale_X64_Machine_s.n_reg_files Prims.int_zero
type analysis_taints =
  | AnalysisTaints of Vale_X64_Leakage_s.leakage_taints * regmap 
let (uu___is_AnalysisTaints : analysis_taints -> Prims.bool) =
  fun projectee -> true
let (__proj__AnalysisTaints__item__lts :
  analysis_taints -> Vale_X64_Leakage_s.leakage_taints) =
  fun projectee -> match projectee with | AnalysisTaints (lts, rts) -> lts
let (__proj__AnalysisTaints__item__rts : analysis_taints -> regmap) =
  fun projectee -> match projectee with | AnalysisTaints (lts, rts) -> rts
let (merge_taint :
  Vale_Arch_HeapTypes_s.taint ->
    Vale_Arch_HeapTypes_s.taint -> Vale_Arch_HeapTypes_s.taint)
  =
  fun t1 ->
    fun t2 ->
      if
        (Vale_Arch_HeapTypes_s.uu___is_Secret t1) ||
          (Vale_Arch_HeapTypes_s.uu___is_Secret t2)
      then Vale_Arch_HeapTypes_s.Secret
      else Vale_Arch_HeapTypes_s.Public
let (operand_taint :
  Vale_X64_Machine_s.reg_file_id ->
    unit Vale_X64_Machine_s.operand_rf ->
      analysis_taints -> Vale_Arch_HeapTypes_s.taint)
  =
  fun rf ->
    fun o ->
      fun ts ->
        match o with
        | Vale_X64_Machine_s.OConst uu___ -> Vale_Arch_HeapTypes_s.Public
        | Vale_X64_Machine_s.OReg r ->
            Vale_Lib_MapTree.sel (__proj__AnalysisTaints__item__rts ts)
              (Vale_X64_Machine_s.Reg (rf, r))
        | Vale_X64_Machine_s.OMem (uu___, t) -> t
        | Vale_X64_Machine_s.OStack (uu___, t) -> t
let (operand_taint_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t -> analysis_taints -> Vale_Arch_HeapTypes_s.taint)
  =
  fun i ->
    fun o ->
      fun ts ->
        match i with
        | Vale_X64_Instruction_s.IOp64 ->
            operand_taint Prims.int_zero (Obj.magic o) ts
        | Vale_X64_Instruction_s.IOpXmm ->
            operand_taint Prims.int_one (Obj.magic o) ts
let (operand_taint_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    analysis_taints -> Vale_Arch_HeapTypes_s.taint)
  =
  fun i ->
    fun ts ->
      match i with
      | Vale_X64_Instruction_s.IOp64One o ->
          operand_taint Prims.int_zero (Obj.magic o) ts
      | Vale_X64_Instruction_s.IOpXmmOne o ->
          operand_taint Prims.int_one (Obj.magic o) ts
      | Vale_X64_Instruction_s.IOpFlagsCf ->
          Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint
            (__proj__AnalysisTaints__item__lts ts)
      | Vale_X64_Instruction_s.IOpFlagsOf ->
          Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint
            (__proj__AnalysisTaints__item__lts ts)
let rec (args_taint :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    Obj.t -> analysis_taints -> Vale_Arch_HeapTypes_s.taint)
  =
  fun args ->
    fun oprs ->
      fun ts ->
        match args with
        | [] -> Vale_Arch_HeapTypes_s.Public
        | i::args1 ->
            (match i with
             | Vale_X64_Instruction_s.IOpEx i1 ->
                 let oprs1 = Obj.magic oprs in
                 merge_taint
                   (operand_taint_explicit i1
                      (FStar_Pervasives_Native.fst oprs1) ts)
                   (args_taint args1 (FStar_Pervasives_Native.snd oprs1) ts)
             | Vale_X64_Instruction_s.IOpIm i1 ->
                 merge_taint (operand_taint_implicit i1 ts)
                   (args_taint args1 oprs ts))
let rec (inouts_taint :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> analysis_taints -> Vale_Arch_HeapTypes_s.taint)
  =
  fun inouts ->
    fun args ->
      fun oprs ->
        fun ts ->
          match inouts with
          | [] -> args_taint args oprs ts
          | (Vale_X64_Instruction_s.Out, i)::inouts1 ->
              let oprs1 =
                match i with
                | Vale_X64_Instruction_s.IOpEx i1 ->
                    FStar_Pervasives_Native.snd (Obj.magic oprs)
                | Vale_X64_Instruction_s.IOpIm i1 -> oprs in
              inouts_taint inouts1 args oprs1 ts
          | (Vale_X64_Instruction_s.InOut, i)::inouts1 ->
              let uu___ =
                match i with
                | Vale_X64_Instruction_s.IOpEx i1 ->
                    let oprs1 = Obj.magic oprs in
                    ((operand_taint_explicit i1
                        (FStar_Pervasives_Native.fst oprs1) ts),
                      (FStar_Pervasives_Native.snd oprs1))
                | Vale_X64_Instruction_s.IOpIm i1 ->
                    ((operand_taint_implicit i1 ts), oprs) in
              (match uu___ with
               | (v, oprs1) ->
                   merge_taint v (inouts_taint inouts1 args oprs1 ts))
let (maddr_does_not_use_secrets :
  Vale_X64_Machine_s.maddr -> analysis_taints -> Prims.bool) =
  fun addr ->
    fun ts ->
      match addr with
      | Vale_X64_Machine_s.MConst uu___ -> true
      | Vale_X64_Machine_s.MReg (r, uu___) ->
          Vale_Arch_HeapTypes_s.uu___is_Public
            (Vale_Lib_MapTree.sel (__proj__AnalysisTaints__item__rts ts) r)
      | Vale_X64_Machine_s.MIndex (base, uu___, index, uu___1) ->
          let baseTaint =
            Vale_Lib_MapTree.sel (__proj__AnalysisTaints__item__rts ts) base in
          let indexTaint =
            Vale_Lib_MapTree.sel (__proj__AnalysisTaints__item__rts ts) index in
          (Vale_Arch_HeapTypes_s.uu___is_Public baseTaint) &&
            (Vale_Arch_HeapTypes_s.uu___is_Public indexTaint)
let operand_does_not_use_secrets :
  'tc 'tr .
    ('tc, 'tr) Vale_X64_Machine_s.operand -> analysis_taints -> Prims.bool
  =
  fun o ->
    fun ts ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ -> true
      | Vale_X64_Machine_s.OReg uu___ -> true
      | Vale_X64_Machine_s.OMem (m, uu___) -> maddr_does_not_use_secrets m ts
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          maddr_does_not_use_secrets m ts
let operand_taint_allowed :
  'tc 'tr .
    ('tc, 'tr) Vale_X64_Machine_s.operand ->
      Vale_Arch_HeapTypes_s.taint -> Prims.bool
  =
  fun o ->
    fun t_data ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ -> true
      | Vale_X64_Machine_s.OReg uu___ -> true
      | Vale_X64_Machine_s.OMem (uu___, t_operand) ->
          (t_operand = Vale_Arch_HeapTypes_s.Secret) ||
            (t_data = Vale_Arch_HeapTypes_s.Public)
      | Vale_X64_Machine_s.OStack (uu___, t_operand) ->
          (t_operand = Vale_Arch_HeapTypes_s.Secret) ||
            (t_data = Vale_Arch_HeapTypes_s.Public)
let (set_taint :
  Vale_X64_Machine_s.reg_file_id ->
    unit Vale_X64_Machine_s.operand_rf ->
      analysis_taints -> Vale_Arch_HeapTypes_s.taint -> analysis_taints)
  =
  fun rf ->
    fun dst ->
      fun ts ->
        fun t ->
          match dst with
          | Vale_X64_Machine_s.OConst uu___ -> ts
          | Vale_X64_Machine_s.OReg r ->
              let uu___ = ts in
              (match uu___ with
               | AnalysisTaints
                   (Vale_X64_Leakage_s.LeakageTaints (rs, f, c, o), rts) ->
                   let rts1 =
                     Vale_Lib_MapTree.upd rts
                       (Vale_X64_Machine_s.Reg (rf, r)) t in
                   AnalysisTaints
                     ((Vale_X64_Leakage_s.LeakageTaints
                         ((map_to_regs rts1), f, c, o)), rts1))
          | Vale_X64_Machine_s.OMem uu___ -> ts
          | Vale_X64_Machine_s.OStack uu___ -> ts
let (set_taint_cf_and_flags :
  analysis_taints -> Vale_Arch_HeapTypes_s.taint -> analysis_taints) =
  fun ts ->
    fun t ->
      let uu___ = ts in
      match uu___ with
      | AnalysisTaints
          (Vale_X64_Leakage_s.LeakageTaints (rs, flags, cf, ovf), rts) ->
          AnalysisTaints
            ((Vale_X64_Leakage_s.LeakageTaints
                (rs, (merge_taint t flags), t, ovf)), rts)
let (set_taint_of_and_flags :
  analysis_taints -> Vale_Arch_HeapTypes_s.taint -> analysis_taints) =
  fun ts ->
    fun t ->
      let uu___ = ts in
      match uu___ with
      | AnalysisTaints
          (Vale_X64_Leakage_s.LeakageTaints (rs, flags, cf, ovf), rts) ->
          AnalysisTaints
            ((Vale_X64_Leakage_s.LeakageTaints
                (rs, (merge_taint t flags), cf, t)), rts)
type ('ins, 'ts, 'res) ins_consumes_fixed_time = Obj.t
let (publicFlagValuesAreAsExpected :
  analysis_taints -> analysis_taints -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      (((Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint
           (__proj__AnalysisTaints__item__lts tsExpected))
          = Vale_Arch_HeapTypes_s.Public)
         &&
         ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint
             (__proj__AnalysisTaints__item__lts tsAnalysis))
            = Vale_Arch_HeapTypes_s.Public))
        ||
        ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint
            (__proj__AnalysisTaints__item__lts tsExpected))
           = Vale_Arch_HeapTypes_s.Secret)
let (publicCfFlagValuesAreAsExpected :
  analysis_taints -> analysis_taints -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      (((Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint
           (__proj__AnalysisTaints__item__lts tsExpected))
          = Vale_Arch_HeapTypes_s.Public)
         &&
         ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint
             (__proj__AnalysisTaints__item__lts tsAnalysis))
            = Vale_Arch_HeapTypes_s.Public))
        ||
        ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint
            (__proj__AnalysisTaints__item__lts tsExpected))
           = Vale_Arch_HeapTypes_s.Secret)
let (publicOfFlagValuesAreAsExpected :
  analysis_taints -> analysis_taints -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      (((Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint
           (__proj__AnalysisTaints__item__lts tsExpected))
          = Vale_Arch_HeapTypes_s.Public)
         &&
         ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint
             (__proj__AnalysisTaints__item__lts tsAnalysis))
            = Vale_Arch_HeapTypes_s.Public))
        ||
        ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint
            (__proj__AnalysisTaints__item__lts tsExpected))
           = Vale_Arch_HeapTypes_s.Secret)
let (registerAsExpected :
  Vale_X64_Machine_s.reg -> analysis_taints -> analysis_taints -> Prims.bool)
  =
  fun r ->
    fun tsAnalysis ->
      fun tsExpected ->
        (((Vale_Lib_MapTree.sel
             (__proj__AnalysisTaints__item__rts tsExpected) r)
            = Vale_Arch_HeapTypes_s.Public)
           &&
           ((Vale_Lib_MapTree.sel
               (__proj__AnalysisTaints__item__rts tsAnalysis) r)
              = Vale_Arch_HeapTypes_s.Public))
          ||
          ((Vale_Lib_MapTree.sel
              (__proj__AnalysisTaints__item__rts tsExpected) r)
             = Vale_Arch_HeapTypes_s.Secret)
let rec (publicRegisterValuesAreAsExpected_reg_file :
  analysis_taints ->
    analysis_taints ->
      Vale_X64_Machine_s.reg_file_id -> Prims.nat -> Prims.bool)
  =
  fun tsAnalysis ->
    fun tsExpected ->
      fun rf ->
        fun k ->
          if k = Prims.int_zero
          then true
          else
            (registerAsExpected
               (Vale_X64_Machine_s.Reg (rf, (k - Prims.int_one))) tsAnalysis
               tsExpected)
              &&
              (publicRegisterValuesAreAsExpected_reg_file tsAnalysis
                 tsExpected rf (k - Prims.int_one))
let rec (publicRegisterValuesAreAsExpected_regs :
  analysis_taints -> analysis_taints -> Prims.nat -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      fun k ->
        if k = Prims.int_zero
        then true
        else
          (publicRegisterValuesAreAsExpected_reg_file tsAnalysis tsExpected
             (k - Prims.int_one)
             (Vale_X64_Machine_s.n_regs (k - Prims.int_one)))
            &&
            (publicRegisterValuesAreAsExpected_regs tsAnalysis tsExpected
               (k - Prims.int_one))
let (publicRegisterValuesAreAsExpected :
  analysis_taints -> analysis_taints -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      publicRegisterValuesAreAsExpected_regs tsAnalysis tsExpected
        Vale_X64_Machine_s.n_reg_files
let (publicTaintsAreAsExpected :
  analysis_taints -> analysis_taints -> Prims.bool) =
  fun tsAnalysis ->
    fun tsExpected ->
      (((publicFlagValuesAreAsExpected tsAnalysis tsExpected) &&
          (publicCfFlagValuesAreAsExpected tsAnalysis tsExpected))
         && (publicOfFlagValuesAreAsExpected tsAnalysis tsExpected))
        && (publicRegisterValuesAreAsExpected tsAnalysis tsExpected)