open Prims
type vale_heap = Vale_Arch_HeapImpl.vale_heap
type vale_full_heap = Vale_Arch_HeapImpl.vale_full_heap
type heaplet_id = Vale_Arch_HeapImpl.heaplet_id
let (get_vale_heap :
  Vale_Arch_HeapImpl.vale_full_heap -> Vale_Arch_HeapImpl.vale_heap) =
  fun vhi -> vhi.Vale_Arch_HeapImpl.vf_heap
let (set_vale_heap :
  Vale_Arch_HeapImpl.vale_full_heap ->
    Vale_Arch_HeapImpl.vale_heap -> Vale_Arch_HeapImpl.vale_full_heap)
  =
  fun vfh ->
    fun vh ->
      let uu___ = vfh in
      {
        Vale_Arch_HeapImpl.vf_layout = (uu___.Vale_Arch_HeapImpl.vf_layout);
        Vale_Arch_HeapImpl.vf_heap = vh;
        Vale_Arch_HeapImpl.vf_heaplets =
          (uu___.Vale_Arch_HeapImpl.vf_heaplets)
      }
type ('h1, 'h2) vale_full_heap_equal = unit
type b8 = Vale_Interop_Types.b8
let op_String_Access :
  'uuuuu 'uuuuu1 . unit -> ('uuuuu, 'uuuuu1) FStar_Map.t -> 'uuuuu -> 'uuuuu1
  = fun uu___ -> FStar_Map.sel
let op_String_Assignment :
  'uuuuu 'uuuuu1 .
    unit ->
      ('uuuuu, 'uuuuu1) FStar_Map.t ->
        'uuuuu -> 'uuuuu1 -> ('uuuuu, 'uuuuu1) FStar_Map.t
  = fun uu___ -> FStar_Map.upd
let (get_heaplet_id :
  Vale_Arch_HeapImpl.vale_heap ->
    Vale_Arch_HeapImpl.heaplet_id FStar_Pervasives_Native.option)
  = fun h -> Vale_Arch_HeapImpl.__proj__ValeHeap__item__heapletId h
type nat8 = Vale_Def_Words_s.nat8
type nat16 = Vale_Def_Words_s.nat16
type nat32 = Vale_Def_Words_s.nat32
type nat64 = Vale_Def_Words_s.nat64
type quad32 = Vale_Def_Types_s.quad32
type 't base_typ_as_vale_type = Obj.t
let (scale_by : Prims.int -> Prims.int -> Prims.int) =
  fun scale -> fun index -> scale * index
let (scale2 : Prims.int -> Prims.int) =
  fun index -> scale_by (Prims.of_int (2)) index
let (scale4 : Prims.int -> Prims.int) =
  fun index -> scale_by (Prims.of_int (4)) index
let (scale8 : Prims.int -> Prims.int) =
  fun index -> scale_by (Prims.of_int (8)) index
let (scale16 : Prims.int -> Prims.int) =
  fun index -> scale_by (Prims.of_int (16)) index
type 't buffer = unit Vale_Arch_HeapImpl.buffer
type tuint8 = FStar_UInt8.t
type tuint16 = FStar_UInt16.t
type tuint32 = FStar_UInt32.t
type tuint64 = FStar_UInt64.t
let (v_of_typ : Vale_Arch_HeapTypes_s.base_typ -> Obj.t -> Obj.t) =
  fun t ->
    fun v ->
      match t with
      | Vale_Arch_HeapTypes_s.TUInt8 ->
          Obj.repr (FStar_UInt8.uint_to_t (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt16 ->
          Obj.repr (FStar_UInt16.uint_to_t (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt32 ->
          Obj.repr (FStar_UInt32.uint_to_t (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt64 ->
          Obj.repr (FStar_UInt64.uint_to_t (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt128 -> Obj.repr v
let (v_to_typ : Vale_Arch_HeapTypes_s.base_typ -> Obj.t -> Obj.t) =
  fun t ->
    fun v ->
      match t with
      | Vale_Arch_HeapTypes_s.TUInt8 ->
          Obj.repr (FStar_UInt8.v (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt16 ->
          Obj.repr (FStar_UInt16.v (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt32 ->
          Obj.repr (FStar_UInt32.v (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt64 ->
          Obj.repr (FStar_UInt64.v (Obj.magic v))
      | Vale_Arch_HeapTypes_s.TUInt128 -> Obj.repr v

let (uint8_view : (FStar_UInt8.t, FStar_UInt8.t) LowStar_BufferView_Up.view)
  = Vale_Interop_Views.up_view8
let (uint16_view :
  (FStar_UInt8.t, FStar_UInt16.t) LowStar_BufferView_Up.view) =
  Vale_Interop_Views.up_view16
let (uint32_view :
  (FStar_UInt8.t, FStar_UInt32.t) LowStar_BufferView_Up.view) =
  Vale_Interop_Views.up_view32
let (uint64_view :
  (FStar_UInt8.t, FStar_UInt64.t) LowStar_BufferView_Up.view) =
  Vale_Interop_Views.up_view64
let (uint128_view :
  (FStar_UInt8.t, Vale_Def_Types_s.quad32) LowStar_BufferView_Up.view) =
  Vale_Interop_Views.up_view128
let (uint_view :
  Vale_Arch_HeapTypes_s.base_typ ->
    (FStar_UInt8.t, Obj.t) LowStar_BufferView_Up.view)
  =
  fun uu___ ->
    (fun t ->
       match t with
       | Vale_Arch_HeapTypes_s.TUInt8 -> Obj.magic (Obj.repr uint8_view)
       | Vale_Arch_HeapTypes_s.TUInt16 -> Obj.magic (Obj.repr uint16_view)
       | Vale_Arch_HeapTypes_s.TUInt32 -> Obj.magic (Obj.repr uint32_view)
       | Vale_Arch_HeapTypes_s.TUInt64 -> Obj.magic (Obj.repr uint64_view)
       | Vale_Arch_HeapTypes_s.TUInt128 -> Obj.magic (Obj.repr uint128_view))
      uu___

type ('t, 'h, 'b) buffer_readable = Obj.t
type ('t, 'b) buffer_writeable = unit

type loc = LowStar_Monotonic_Buffer.loc
let (loc_none : loc) = LowStar_Monotonic_Buffer.loc_none


type ('s1, 's2) loc_disjoint =
  (unit, unit) LowStar_Monotonic_Buffer.loc_disjoint
type ('s1, 's2) loc_includes =
  (unit, unit) LowStar_Monotonic_Buffer.loc_includes
type ('s, 'h, 'hu) modifies = unit
type ('t, 'h, 'b, 'i) valid_buffer_read = unit
type ('t, 'h, 'b, 'i) valid_buffer_write = unit
let (vuint8 : Vale_Arch_HeapTypes_s.base_typ) = Vale_Arch_HeapTypes_s.TUInt8
let (vuint16 : Vale_Arch_HeapTypes_s.base_typ) =
  Vale_Arch_HeapTypes_s.TUInt16
let (vuint32 : Vale_Arch_HeapTypes_s.base_typ) =
  Vale_Arch_HeapTypes_s.TUInt32
let (vuint64 : Vale_Arch_HeapTypes_s.base_typ) =
  Vale_Arch_HeapTypes_s.TUInt64
let (vuint128 : Vale_Arch_HeapTypes_s.base_typ) =
  Vale_Arch_HeapTypes_s.TUInt128
type buffer8 = unit Vale_Arch_HeapImpl.buffer
type buffer16 = unit Vale_Arch_HeapImpl.buffer
type buffer32 = unit Vale_Arch_HeapImpl.buffer
type buffer64 = unit Vale_Arch_HeapImpl.buffer
type buffer128 = unit Vale_Arch_HeapImpl.buffer

type 'ls locs_disjoint = Obj.t






type ('s, 'h1, 'h2) modifies_goal_directed = unit




















let (default_of_typ : Vale_Arch_HeapTypes_s.base_typ -> Obj.t) =
  fun t ->
    match t with
    | Vale_Arch_HeapTypes_s.TUInt8 -> Obj.repr Prims.int_zero
    | Vale_Arch_HeapTypes_s.TUInt16 -> Obj.repr Prims.int_zero
    | Vale_Arch_HeapTypes_s.TUInt32 -> Obj.repr Prims.int_zero
    | Vale_Arch_HeapTypes_s.TUInt64 -> Obj.repr Prims.int_zero
    | Vale_Arch_HeapTypes_s.TUInt128 ->
        Obj.repr
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = Prims.int_zero;
            Vale_Def_Words_s.hi2 = Prims.int_zero;
            Vale_Def_Words_s.hi3 = Prims.int_zero
          }



let (scale_t : Vale_Arch_HeapTypes_s.base_typ -> Prims.int -> Prims.int) =
  fun t -> fun index -> scale_by (Vale_Interop_Types.view_n t) index

type ('t, 'n, 'base, 'addr, 'i) valid_offset = unit



type ('a, 'p1, 'p2) sub_list = unit


































type memtaint = Vale_Arch_HeapTypes_s.memTaint_t
type ('b, 'h, 'mt, 'tn) valid_taint_b8 = unit
type ('t, 'b, 'h, 'mt, 'tn) valid_taint_buf = unit
type ('b, 'h, 'mt, 'tn) valid_taint_buf64 = unit
type ('b, 'h, 'mt, 'tn) valid_taint_buf128 = unit








type ('bi1, 'bi2) buffer_info_disjoint = unit
type ('h, 'bs) init_heaplets_req = unit

type ('mem, 'memTaint, 'ps, 'ts) valid_taint_bufs = unit


type ('t, 'b, 'layout, 'hid, 'write) valid_layout_data_buffer = unit
type ('t, 'b, 'layout, 'huid, 'write) valid_layout_buffer_id = Obj.t
type ('t, 'b, 'layout, 'h, 'write) valid_layout_buffer = unit
type 'hs inv_heaplet_ids = unit
type ('owns, 'h, 'hi) inv_heaplet = unit
type ('bi, 'owners, 'h, 'hs, 'mt, 'modloc) inv_buffer_info = unit
type ('layout, 'h, 'hs, 'mt) inv_heaplets = unit
type ('layout, 'h) is_initial_heap = unit
type 'h mem_inv = unit
let (layout_heaplets_initialized :
  Vale_Arch_HeapImpl.vale_heap_layout_inner -> Prims.bool) =
  fun layout -> layout.Vale_Arch_HeapImpl.vl_heaplets_initialized
let (layout_old_heap :
  Vale_Arch_HeapImpl.vale_heap_layout_inner -> Vale_Arch_HeapImpl.vale_heap)
  = fun layout -> layout.Vale_Arch_HeapImpl.vl_old_heap
let (layout_modifies_loc : Vale_Arch_HeapImpl.vale_heap_layout_inner -> loc)
  = fun layout -> layout.Vale_Arch_HeapImpl.vl_mod_loc
let (layout_buffers :
  Vale_Arch_HeapImpl.vale_heap_layout_inner ->
    Vale_Arch_HeapImpl.buffer_info FStar_Seq_Base.seq)
  = fun layout -> layout.Vale_Arch_HeapImpl.vl_buffers
type ('bs, 'i, 'id) buffer_info_has_id = unit
type ('bs, 'mt, 'h1, 'h2, 'id) heaps_match = unit
