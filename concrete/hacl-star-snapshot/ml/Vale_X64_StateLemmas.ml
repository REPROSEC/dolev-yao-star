open Prims
type machine_state = Vale_X64_Machine_Semantics_s.machine_state
type code = Vale_X64_Machine_Semantics_s.code
let (machine_eval_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state
          FStar_Pervasives_Native.option)
  = Vale_X64_Machine_Semantics_s.machine_eval_code

let coerce : 'b 'a . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___
type ('s1, 's2) machine_state_eq = unit
type ('s1, 's2) machine_state_equal = unit










