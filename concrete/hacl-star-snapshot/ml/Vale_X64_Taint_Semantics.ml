open Prims

let (mk_ins :
  Vale_X64_Machine_Semantics_s.ins -> Vale_X64_Machine_Semantics_s.code) =
  fun i -> Vale_X64_Machine_s.Ins i