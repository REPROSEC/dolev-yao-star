open Prims

type base_typ =
  | TUInt8 
  | TUInt16 
  | TUInt32 
  | TUInt64 
  | TUInt128 
let (uu___is_TUInt8 : base_typ -> Prims.bool) =
  fun projectee -> match projectee with | TUInt8 -> true | uu___ -> false
let (uu___is_TUInt16 : base_typ -> Prims.bool) =
  fun projectee -> match projectee with | TUInt16 -> true | uu___ -> false
let (uu___is_TUInt32 : base_typ -> Prims.bool) =
  fun projectee -> match projectee with | TUInt32 -> true | uu___ -> false
let (uu___is_TUInt64 : base_typ -> Prims.bool) =
  fun projectee -> match projectee with | TUInt64 -> true | uu___ -> false
let (uu___is_TUInt128 : base_typ -> Prims.bool) =
  fun projectee -> match projectee with | TUInt128 -> true | uu___ -> false
type taint =
  | Public 
  | Secret 
let (uu___is_Public : taint -> Prims.bool) =
  fun projectee -> match projectee with | Public -> true | uu___ -> false
let (uu___is_Secret : taint -> Prims.bool) =
  fun projectee -> match projectee with | Secret -> true | uu___ -> false
type memTaint_t = (Prims.int, taint) FStar_Map.t