open Prims
type 't base_typ_as_type = Obj.t
let (view_n_unfold : Vale_Arch_HeapTypes_s.base_typ -> Prims.pos) =
  fun t ->
    match t with
    | Vale_Arch_HeapTypes_s.TUInt8 -> Prims.int_one
    | Vale_Arch_HeapTypes_s.TUInt16 -> (Prims.of_int (2))
    | Vale_Arch_HeapTypes_s.TUInt32 -> (Prims.of_int (4))
    | Vale_Arch_HeapTypes_s.TUInt64 -> (Prims.of_int (8))
    | Vale_Arch_HeapTypes_s.TUInt128 -> (Prims.of_int (16))
let (view_n : Vale_Arch_HeapTypes_s.base_typ -> Prims.pos) =
  fun t ->
    match t with
    | Vale_Arch_HeapTypes_s.TUInt8 -> Prims.int_one
    | Vale_Arch_HeapTypes_s.TUInt16 -> (Prims.of_int (2))
    | Vale_Arch_HeapTypes_s.TUInt32 -> (Prims.of_int (4))
    | Vale_Arch_HeapTypes_s.TUInt64 -> (Prims.of_int (8))
    | Vale_Arch_HeapTypes_s.TUInt128 -> (Prims.of_int (16))
let (down_view :
  Vale_Arch_HeapTypes_s.base_typ ->
    (Obj.t, FStar_UInt8.t) LowStar_BufferView_Down.view)
  =
  fun uu___ ->
    (fun t ->
       match t with
       | Vale_Arch_HeapTypes_s.TUInt8 ->
           Obj.magic (Obj.repr Vale_Interop_Views.down_view8)
       | Vale_Arch_HeapTypes_s.TUInt16 ->
           Obj.magic (Obj.repr Vale_Interop_Views.down_view16)
       | Vale_Arch_HeapTypes_s.TUInt32 ->
           Obj.magic (Obj.repr Vale_Interop_Views.down_view32)
       | Vale_Arch_HeapTypes_s.TUInt64 ->
           Obj.magic (Obj.repr Vale_Interop_Views.down_view64)
       | Vale_Arch_HeapTypes_s.TUInt128 ->
           Obj.magic (Obj.repr Vale_Interop_Views.down_view128)) uu___
type ('writeable, 'a, 'uuuuu, 'uuuuu1) b8_preorder = Obj.t
type b8 =
  | Buffer of Vale_Arch_HeapTypes_s.base_typ * Prims.bool * (Obj.t, Obj.t,
  Obj.t) LowStar_Monotonic_Buffer.mbuffer 
let (uu___is_Buffer : b8 -> Prims.bool) = fun projectee -> true
let (__proj__Buffer__item__src : b8 -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee ->
    match projectee with | Buffer (src, writeable, bsrc) -> src
let (__proj__Buffer__item__writeable : b8 -> Prims.bool) =
  fun projectee ->
    match projectee with | Buffer (src, writeable, bsrc) -> writeable
let (__proj__Buffer__item__bsrc :
  b8 -> (Obj.t, Obj.t, Obj.t) LowStar_Monotonic_Buffer.mbuffer) =
  fun projectee ->
    match projectee with | Buffer (src, writeable, bsrc) -> bsrc
let (disjoint_addr :
  Prims.int -> Prims.int -> Prims.int -> Prims.int -> Prims.bool) =
  fun addr1 ->
    fun length1 ->
      fun addr2 ->
        fun length2 ->
          ((addr1 + length1) < addr2) || ((addr2 + length2) < addr1)

type 'm addr_map_pred = unit
type addr_map = b8 -> Vale_Def_Words_s.nat64