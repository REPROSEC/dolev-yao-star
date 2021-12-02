open Prims
type vale_stack = Vale_X64_Machine_Semantics_s.machine_stack







let (init_rsp : vale_stack -> Vale_Def_Words_s.nat64) =
  fun h ->
    Vale_X64_Machine_Semantics_s.__proj__Machine_stack__item__initial_rsp h
type ('loursp, 'hiursp, 'h, 'hu) modifies_stack = unit
type ('base, 'numuslots, 'h) valid_src_stack64s = unit









type ('ptr, 't, 'stackTaint) valid_taint_stack64 = unit
type ('ptr, 't, 'stackTaint) valid_taint_stack128 = unit






type ('ptr, 'h, 't, 'stackTaint) valid_stack_slot64 = unit
type ('base, 'numuslots, 'h, 't, 'stackTaint) valid_stack_slot64s = unit
type ('loursp, 'hiursp, 'h, 'hu) modifies_stacktaint = unit