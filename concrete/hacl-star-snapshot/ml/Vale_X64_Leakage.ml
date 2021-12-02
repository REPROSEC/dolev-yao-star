open Prims
let (machine_eval_ocmp :
  Vale_X64_Machine_Semantics_s.machine_state ->
    Vale_X64_Machine_Semantics_s.ocmp ->
      (Vale_X64_Machine_Semantics_s.machine_state * Prims.bool))
  = Vale_X64_Machine_Semantics_s.machine_eval_ocmp
let (machine_eval_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state
          FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_code
let (machine_eval_codes :
  Vale_X64_Machine_Semantics_s.codes ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state
          FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_codes
let (machine_eval_while :
  Vale_X64_Machine_Semantics_s.ocmp ->
    Vale_X64_Machine_Semantics_s.code ->
      Prims.nat ->
        Vale_X64_Machine_Semantics_s.machine_state ->
          Vale_X64_Machine_Semantics_s.machine_state
            FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_while
let (normalize_taints :
  Vale_X64_Leakage_Helpers.analysis_taints ->
    Vale_X64_Leakage_Helpers.analysis_taints)
  =
  fun ts ->
    let uu___ = ts in
    match uu___ with
    | Vale_X64_Leakage_Helpers.AnalysisTaints (lts, rts) ->
        Vale_X64_Leakage_Helpers.AnalysisTaints
          (lts,
            (Vale_X64_Leakage_Helpers.regs_to_map
               (Vale_X64_Leakage_Helpers.map_to_regs rts)))
let (combine_reg_taints :
  Vale_X64_Leakage_s.reg_taint ->
    Vale_X64_Leakage_s.reg_taint -> Vale_X64_Leakage_s.reg_taint)
  =
  fun regs1 ->
    fun regs2 ->
      fun x -> Vale_X64_Leakage_Helpers.merge_taint (regs1 x) (regs2 x)
let rec (eq_regs_file :
  Vale_X64_Leakage_s.reg_taint ->
    Vale_X64_Leakage_s.reg_taint ->
      Vale_X64_Machine_s.reg_file_id -> Prims.nat -> Prims.bool)
  =
  fun regs1 ->
    fun regs2 ->
      fun rf ->
        fun k ->
          if k = Prims.int_zero
          then true
          else
            ((regs1 (Vale_X64_Machine_s.Reg (rf, (k - Prims.int_one)))) =
               (regs2 (Vale_X64_Machine_s.Reg (rf, (k - Prims.int_one)))))
              && (eq_regs_file regs1 regs2 rf (k - Prims.int_one))
let rec (eq_regs :
  Vale_X64_Leakage_s.reg_taint ->
    Vale_X64_Leakage_s.reg_taint -> Prims.nat -> Prims.bool)
  =
  fun regs1 ->
    fun regs2 ->
      fun k ->
        if k = Prims.int_zero
        then true
        else
          (eq_regs_file regs1 regs2 (k - Prims.int_one)
             (Vale_X64_Machine_s.n_regs (k - Prims.int_one)))
            && (eq_regs regs1 regs2 (k - Prims.int_one))


let (eq_registers :
  Vale_X64_Leakage_s.reg_taint -> Vale_X64_Leakage_s.reg_taint -> Prims.bool)
  =
  fun regs1 ->
    fun regs2 ->
      let b = eq_regs regs1 regs2 Vale_X64_Machine_s.n_reg_files in b
let (eq_leakage_taints :
  Vale_X64_Leakage_s.leakage_taints ->
    Vale_X64_Leakage_s.leakage_taints -> Prims.bool)
  =
  fun ts1 ->
    fun ts2 ->
      (((eq_registers
           (Vale_X64_Leakage_s.__proj__LeakageTaints__item__regTaint ts1)
           (Vale_X64_Leakage_s.__proj__LeakageTaints__item__regTaint ts2))
          &&
          ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint ts1) =
             (Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint ts2)))
         &&
         ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint ts1)
            =
            (Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint ts2)))
        &&
        ((Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint ts1) =
           (Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint ts2))
type ('ts, 'tsu) taintstate_monotone_regs = unit
type ('ts, 'tsu) taintstate_monotone = unit




let (combine_leakage_taints :
  Vale_X64_Leakage_s.leakage_taints ->
    Vale_X64_Leakage_s.leakage_taints -> Vale_X64_Leakage_s.leakage_taints)
  =
  fun ts1 ->
    fun ts2 ->
      let uu___ = ts1 in
      match uu___ with
      | Vale_X64_Leakage_s.LeakageTaints (rs1, fs1, c1, o1) ->
          let uu___1 = ts2 in
          (match uu___1 with
           | Vale_X64_Leakage_s.LeakageTaints (rs2, fs2, c2, o2) ->
               let rs = combine_reg_taints rs1 rs2 in
               Vale_X64_Leakage_s.LeakageTaints
                 (rs, (Vale_X64_Leakage_Helpers.merge_taint fs1 fs2),
                   (Vale_X64_Leakage_Helpers.merge_taint c1 c2),
                   (Vale_X64_Leakage_Helpers.merge_taint o1 o2)))
let (combine_analysis_taints :
  Vale_X64_Leakage_Helpers.analysis_taints ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      Vale_X64_Leakage_Helpers.analysis_taints)
  =
  fun ts1 ->
    fun ts2 ->
      let uu___ = ts1 in
      match uu___ with
      | Vale_X64_Leakage_Helpers.AnalysisTaints
          (Vale_X64_Leakage_s.LeakageTaints (rs1_old, fs1, c1, o1), rts1) ->
          let uu___1 = ts2 in
          (match uu___1 with
           | Vale_X64_Leakage_Helpers.AnalysisTaints
               (Vale_X64_Leakage_s.LeakageTaints (rs2_old, fs2, c2, o2),
                rts2)
               ->
               let rts11 =
                 Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__rts
                   ts1 in
               let rts21 =
                 Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__rts
                   ts2 in
               let rs1 = Vale_X64_Leakage_Helpers.map_to_regs rts11 in
               let rs2 = Vale_X64_Leakage_Helpers.map_to_regs rts21 in
               let rs = combine_reg_taints rs1 rs2 in
               let rts = Vale_X64_Leakage_Helpers.regs_to_map rs in
               let lts =
                 Vale_X64_Leakage_s.LeakageTaints
                   (rs, (Vale_X64_Leakage_Helpers.merge_taint fs1 fs2),
                     (Vale_X64_Leakage_Helpers.merge_taint c1 c2),
                     (Vale_X64_Leakage_Helpers.merge_taint o1 o2)) in
               Vale_X64_Leakage_Helpers.AnalysisTaints (lts, rts))
let (count_public_register :
  Vale_X64_Leakage_s.reg_taint -> Vale_X64_Machine_s.reg -> Prims.int) =
  fun regs ->
    fun r ->
      if Vale_Arch_HeapTypes_s.uu___is_Public (regs r)
      then Prims.int_one
      else Prims.int_zero
let rec (count_public_registers_file :
  Vale_X64_Leakage_s.reg_taint ->
    Vale_X64_Machine_s.reg_file_id -> Prims.nat -> Prims.nat)
  =
  fun regs ->
    fun rf ->
      fun k ->
        if k = Prims.int_zero
        then Prims.int_zero
        else
          (count_public_register regs
             (Vale_X64_Machine_s.Reg (rf, (k - Prims.int_one))))
            + (count_public_registers_file regs rf (k - Prims.int_one))

let rec (count_public_registers :
  Vale_X64_Leakage_s.reg_taint -> Prims.nat -> Prims.nat) =
  fun regs ->
    fun k ->
      if k = Prims.int_zero
      then Prims.int_zero
      else
        (count_public_registers_file regs (k - Prims.int_one)
           (Vale_X64_Machine_s.n_regs (k - Prims.int_one)))
          + (count_public_registers regs (k - Prims.int_one))

let (count_flagTaint : Vale_X64_Leakage_Helpers.analysis_taints -> Prims.nat)
  =
  fun ts ->
    if
      Vale_Arch_HeapTypes_s.uu___is_Public
        (Vale_X64_Leakage_s.__proj__LeakageTaints__item__flagsTaint
           (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts ts))
    then Prims.int_one
    else Prims.int_zero
let (count_cfFlagTaint :
  Vale_X64_Leakage_Helpers.analysis_taints -> Prims.nat) =
  fun ts ->
    if
      Vale_Arch_HeapTypes_s.uu___is_Public
        (Vale_X64_Leakage_s.__proj__LeakageTaints__item__cfFlagsTaint
           (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts ts))
    then Prims.int_one
    else Prims.int_zero
let (count_ofFlagTaint :
  Vale_X64_Leakage_Helpers.analysis_taints -> Prims.nat) =
  fun ts ->
    if
      Vale_Arch_HeapTypes_s.uu___is_Public
        (Vale_X64_Leakage_s.__proj__LeakageTaints__item__ofFlagsTaint
           (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts ts))
    then Prims.int_one
    else Prims.int_zero
let (count_publics : Vale_X64_Leakage_Helpers.analysis_taints -> Prims.nat) =
  fun ts ->
    (((count_public_registers
         (Vale_X64_Leakage_s.__proj__LeakageTaints__item__regTaint
            (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts ts))
         Vale_X64_Machine_s.n_reg_files)
        + (count_flagTaint ts))
       + (count_cfFlagTaint ts))
      + (count_ofFlagTaint ts)

let rec (check_if_block_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.codes ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun block ->
    fun ts ->
      match block with
      | [] -> (true, ts)
      | hd::tl ->
          let uu___ = check_if_code_consumes_fixed_time hd ts in
          (match uu___ with
           | (fixedTime, ts_int) ->
               if Prims.op_Negation fixedTime
               then (fixedTime, ts_int)
               else check_if_block_consumes_fixed_time tl ts_int)
and (check_if_code_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun code ->
    fun ts ->
      match code with
      | Vale_X64_Machine_s.Ins ins ->
          let uu___ =
            Vale_X64_Leakage_Ins.check_if_ins_consumes_fixed_time ins ts in
          (match uu___ with | (b, ts1) -> (b, ts1))
      | Vale_X64_Machine_s.Block block ->
          check_if_block_consumes_fixed_time block ts
      | Vale_X64_Machine_s.IfElse (ifCond, ifTrue, ifFalse) ->
          let o1 =
            Vale_X64_Leakage_Helpers.operand_taint Prims.int_zero
              (Obj.magic (Vale_X64_Machine_Semantics_s.get_fst_ocmp ifCond))
              ts in
          let o2 =
            Vale_X64_Leakage_Helpers.operand_taint Prims.int_zero
              (Obj.magic (Vale_X64_Machine_Semantics_s.get_snd_ocmp ifCond))
              ts in
          let predTaint = Vale_X64_Leakage_Helpers.merge_taint o1 o2 in
          if Vale_Arch_HeapTypes_s.uu___is_Secret predTaint
          then (false, ts)
          else
            (let o1Public =
               Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                 (Vale_X64_Machine_Semantics_s.get_fst_ocmp ifCond) ts in
             if Prims.op_Negation o1Public
             then (false, ts)
             else
               (let o2Public =
                  Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                    (Vale_X64_Machine_Semantics_s.get_snd_ocmp ifCond) ts in
                if Prims.op_Negation o2Public
                then (false, ts)
                else
                  (let uu___3 = check_if_code_consumes_fixed_time ifTrue ts in
                   match uu___3 with
                   | (validIfTrue, tsIfTrue) ->
                       if Prims.op_Negation validIfTrue
                       then (false, ts)
                       else
                         (let uu___5 =
                            check_if_code_consumes_fixed_time ifFalse ts in
                          match uu___5 with
                          | (validIfFalse, tsIfFalse) ->
                              if Prims.op_Negation validIfFalse
                              then (false, ts)
                              else
                                (true,
                                  (combine_analysis_taints tsIfTrue tsIfFalse))))))
      | Vale_X64_Machine_s.While (cond, body) ->
          check_if_loop_consumes_fixed_time code ts
and (check_if_loop_consumes_fixed_time :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      (Prims.bool * Vale_X64_Leakage_Helpers.analysis_taints))
  =
  fun c ->
    fun ts ->
      let ts1 = normalize_taints ts in
      let uu___ = c in
      match uu___ with
      | Vale_X64_Machine_s.While (pred, body) ->
          let o1 =
            Vale_X64_Leakage_Helpers.operand_taint Prims.int_zero
              (Obj.magic (Vale_X64_Machine_Semantics_s.get_fst_ocmp pred))
              ts1 in
          let o2 =
            Vale_X64_Leakage_Helpers.operand_taint Prims.int_zero
              (Obj.magic (Vale_X64_Machine_Semantics_s.get_snd_ocmp pred))
              ts1 in
          let predTaint = Vale_X64_Leakage_Helpers.merge_taint o1 o2 in
          if Vale_Arch_HeapTypes_s.uu___is_Secret predTaint
          then (false, ts1)
          else
            (let o1Public =
               Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                 (Vale_X64_Machine_Semantics_s.get_fst_ocmp pred) ts1 in
             if Prims.op_Negation o1Public
             then (false, ts1)
             else
               (let o2Public =
                  Vale_X64_Leakage_Helpers.operand_does_not_use_secrets
                    (Vale_X64_Machine_Semantics_s.get_snd_ocmp pred) ts1 in
                if Prims.op_Negation o2Public
                then (false, ts1)
                else
                  (let uu___4 = check_if_code_consumes_fixed_time body ts1 in
                   match uu___4 with
                   | (fixedTime, next_ts) ->
                       if Prims.op_Negation fixedTime
                       then (false, ts1)
                       else
                         (let combined_ts =
                            combine_analysis_taints ts1 next_ts in
                          if
                            eq_leakage_taints
                              (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts
                                 combined_ts)
                              (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__lts
                                 ts1)
                          then (true, combined_ts)
                          else
                            check_if_loop_consumes_fixed_time c combined_ts))))





let (check_if_code_is_leakage_free' :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Leakage_Helpers.analysis_taints ->
      Vale_X64_Leakage_Helpers.analysis_taints -> Prims.bool)
  =
  fun code ->
    fun ts ->
      fun tsExpected ->
        let uu___ = check_if_code_consumes_fixed_time code ts in
        match uu___ with
        | (b, ts') ->
            if b
            then
              Vale_X64_Leakage_Helpers.publicTaintsAreAsExpected ts'
                tsExpected
            else b
let (check_if_code_is_leakage_free :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Leakage_Helpers.analysis_taints -> Prims.bool -> Prims.bool)
  =
  fun code ->
    fun ts ->
      fun public_return ->
        let uu___ = check_if_code_consumes_fixed_time code ts in
        match uu___ with
        | (b, ts') ->
            if public_return
            then
              b &&
                (Vale_Arch_HeapTypes_s.uu___is_Public
                   (Vale_Lib_MapTree.sel
                      (Vale_X64_Leakage_Helpers.__proj__AnalysisTaints__item__rts
                         ts')
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, Prims.int_zero))))
            else b
let (mk_analysis_taints :
  Prims.bool -> Prims.nat -> Vale_X64_Leakage_Helpers.analysis_taints) =
  fun win ->
    fun nbr_args ->
      let regTaint r =
        if win
        then
          (if
             r =
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))
           then Vale_Arch_HeapTypes_s.Public
           else
             if
               (r =
                  (Vale_X64_Machine_s.Reg
                     (Prims.int_zero, (Prims.of_int (2)))))
                 && (nbr_args >= Prims.int_one)
             then Vale_Arch_HeapTypes_s.Public
             else
               if
                 (r =
                    (Vale_X64_Machine_s.Reg
                       (Prims.int_zero, (Prims.of_int (3)))))
                   && (nbr_args >= (Prims.of_int (2)))
               then Vale_Arch_HeapTypes_s.Public
               else
                 if
                   (r =
                      (Vale_X64_Machine_s.Reg
                         (Prims.int_zero, (Prims.of_int (8)))))
                     && (nbr_args >= (Prims.of_int (3)))
                 then Vale_Arch_HeapTypes_s.Public
                 else
                   if
                     (r =
                        (Vale_X64_Machine_s.Reg
                           (Prims.int_zero, (Prims.of_int (9)))))
                       && (nbr_args >= (Prims.of_int (4)))
                   then Vale_Arch_HeapTypes_s.Public
                   else Vale_Arch_HeapTypes_s.Secret)
        else
          if
            r = (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))
          then Vale_Arch_HeapTypes_s.Public
          else
            if
              (r =
                 (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5)))))
                && (nbr_args >= Prims.int_one)
            then Vale_Arch_HeapTypes_s.Public
            else
              if
                (r =
                   (Vale_X64_Machine_s.Reg
                      (Prims.int_zero, (Prims.of_int (4)))))
                  && (nbr_args >= (Prims.of_int (2)))
              then Vale_Arch_HeapTypes_s.Public
              else
                if
                  (r =
                     (Vale_X64_Machine_s.Reg
                        (Prims.int_zero, (Prims.of_int (3)))))
                    && (nbr_args >= (Prims.of_int (3)))
                then Vale_Arch_HeapTypes_s.Public
                else
                  if
                    (r =
                       (Vale_X64_Machine_s.Reg
                          (Prims.int_zero, (Prims.of_int (2)))))
                      && (nbr_args >= (Prims.of_int (4)))
                  then Vale_Arch_HeapTypes_s.Public
                  else
                    if
                      (r =
                         (Vale_X64_Machine_s.Reg
                            (Prims.int_zero, (Prims.of_int (8)))))
                        && (nbr_args >= (Prims.of_int (5)))
                    then Vale_Arch_HeapTypes_s.Public
                    else
                      if
                        (r =
                           (Vale_X64_Machine_s.Reg
                              (Prims.int_zero, (Prims.of_int (9)))))
                          && (nbr_args >= (Prims.of_int (6)))
                      then Vale_Arch_HeapTypes_s.Public
                      else Vale_Arch_HeapTypes_s.Secret in
      let rs = regTaint in
      let rts = Vale_X64_Leakage_Helpers.regs_to_map rs in
      let lts =
        Vale_X64_Leakage_s.LeakageTaints
          ((Vale_X64_Leakage_Helpers.map_to_regs rts),
            Vale_Arch_HeapTypes_s.Secret, Vale_Arch_HeapTypes_s.Secret,
            Vale_Arch_HeapTypes_s.Secret) in
      Vale_X64_Leakage_Helpers.AnalysisTaints (lts, rts)