open Prims
type reg_taint =
  (Vale_X64_Machine_s.reg, Vale_Arch_HeapTypes_s.taint)
    FStar_FunctionalExtensionality.restricted_t
type leakage_taints =
  | LeakageTaints of reg_taint * Vale_Arch_HeapTypes_s.taint *
  Vale_Arch_HeapTypes_s.taint * Vale_Arch_HeapTypes_s.taint 
let (uu___is_LeakageTaints : leakage_taints -> Prims.bool) =
  fun projectee -> true
let (__proj__LeakageTaints__item__regTaint : leakage_taints -> reg_taint) =
  fun projectee ->
    match projectee with
    | LeakageTaints (regTaint, flagsTaint, cfFlagsTaint, ofFlagsTaint) ->
        regTaint
let (__proj__LeakageTaints__item__flagsTaint :
  leakage_taints -> Vale_Arch_HeapTypes_s.taint) =
  fun projectee ->
    match projectee with
    | LeakageTaints (regTaint, flagsTaint, cfFlagsTaint, ofFlagsTaint) ->
        flagsTaint
let (__proj__LeakageTaints__item__cfFlagsTaint :
  leakage_taints -> Vale_Arch_HeapTypes_s.taint) =
  fun projectee ->
    match projectee with
    | LeakageTaints (regTaint, flagsTaint, cfFlagsTaint, ofFlagsTaint) ->
        cfFlagsTaint
let (__proj__LeakageTaints__item__ofFlagsTaint :
  leakage_taints -> Vale_Arch_HeapTypes_s.taint) =
  fun projectee ->
    match projectee with
    | LeakageTaints (regTaint, flagsTaint, cfFlagsTaint, ofFlagsTaint) ->
        ofFlagsTaint
type ('ts, 's1, 's2) publicFlagValuesAreSame = unit
type ('ts, 's1, 's2) publicCfFlagValuesAreSame = unit
type ('ts, 's1, 's2) publicOfFlagValuesAreSame = unit
type ('ts, 's1, 's2) publicRegisterValuesAreSame = unit
type ('mem1, 'mem2, 'memTaint1, 'memTaint2, 'x) publicMemValueIsSame = unit
type ('s1, 's2) publicMemValuesAreSame = unit
type ('stack1, 'stack2, 'stackTaint1, 'stackTaint2,
  'x) publicStackValueIsSame = unit
type ('s1, 's2) publicStackValuesAreSame = Obj.t
type ('ts, 's1, 's2) publicValuesAreSame = unit
type ('ts, 's, 'su) constTimeInvariant = unit
type ('code, 'fuel, 'ts, 's1, 's2) isConstantTimeGivenStates = unit
type ('code, 'ts) isConstantTime = unit
type ('code, 'fuel, 'ts, 'tsu, 's1, 's2) is_explicit_leakage_free_lhs = unit
type ('code, 'fuel, 'ts, 'tsu, 's1, 's2) is_explicit_leakage_free_rhs = unit
type ('code, 'fuel, 'ts, 'tsu, 's1, 's2) isExplicitLeakageFreeGivenStates =
  unit
type ('code, 'ts, 'tsu) isExplicitLeakageFree = unit
type ('code, 'ts, 'tsu) isLeakageFree = unit