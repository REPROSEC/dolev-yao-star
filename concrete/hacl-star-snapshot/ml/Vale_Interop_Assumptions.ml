open Prims
let st_put : 'a 'p . unit -> 'a =
  fun f -> failwith "Not yet implemented:st_put"
let (init_regs : Vale_X64_Machine_s.reg_64 -> Vale_Def_Words_s.nat64) =
  fun uu___ -> failwith "Not yet implemented:init_regs"
let (init_xmms : Vale_X64_Machine_s.reg_xmm -> Vale_Def_Types_s.quad32) =
  fun uu___ -> failwith "Not yet implemented:init_xmms"
let (init_flags :
  Vale_X64_Machine_s.flag -> Prims.bool FStar_Pervasives_Native.option) =
  fun uu___ -> failwith "Not yet implemented:init_flags"
let (win : Prims.bool) =
  Obj.magic (fun uu___ -> failwith "Not yet implemented:win")