open Prims
type heaplet_id = Prims.nat
type 't buffer = Vale_Interop_Types.b8
type mutability =
  | Mutable 
  | Immutable 
let (uu___is_Mutable : mutability -> Prims.bool) =
  fun projectee -> match projectee with | Mutable -> true | uu___ -> false
let (uu___is_Immutable : mutability -> Prims.bool) =
  fun projectee -> match projectee with | Immutable -> true | uu___ -> false
type buffer_info =
  {
  bi_typ: Vale_Arch_HeapTypes_s.base_typ ;
  bi_buffer: unit buffer ;
  bi_heaplet: heaplet_id ;
  bi_taint: Vale_Arch_HeapTypes_s.taint ;
  bi_mutable: mutability }
let (__proj__Mkbuffer_info__item__bi_typ :
  buffer_info -> Vale_Arch_HeapTypes_s.base_typ) =
  fun projectee ->
    match projectee with
    | { bi_typ; bi_buffer; bi_heaplet; bi_taint; bi_mutable;_} -> bi_typ
let (__proj__Mkbuffer_info__item__bi_buffer : buffer_info -> unit buffer) =
  fun projectee ->
    match projectee with
    | { bi_typ; bi_buffer; bi_heaplet; bi_taint; bi_mutable;_} -> bi_buffer
let (__proj__Mkbuffer_info__item__bi_heaplet : buffer_info -> heaplet_id) =
  fun projectee ->
    match projectee with
    | { bi_typ; bi_buffer; bi_heaplet; bi_taint; bi_mutable;_} -> bi_heaplet
let (__proj__Mkbuffer_info__item__bi_taint :
  buffer_info -> Vale_Arch_HeapTypes_s.taint) =
  fun projectee ->
    match projectee with
    | { bi_typ; bi_buffer; bi_heaplet; bi_taint; bi_mutable;_} -> bi_taint
let (__proj__Mkbuffer_info__item__bi_mutable : buffer_info -> mutability) =
  fun projectee ->
    match projectee with
    | { bi_typ; bi_buffer; bi_heaplet; bi_taint; bi_mutable;_} -> bi_mutable
type vale_heap =
  | ValeHeap of Vale_Arch_MachineHeap_s.machine_heap * unit * heaplet_id
  FStar_Pervasives_Native.option 
let (uu___is_ValeHeap : vale_heap -> Prims.bool) = fun projectee -> true
let (__proj__ValeHeap__item__mh :
  vale_heap -> Vale_Arch_MachineHeap_s.machine_heap) =
  fun projectee -> match projectee with | ValeHeap (mh, ih, heapletId) -> mh

let (__proj__ValeHeap__item__heapletId :
  vale_heap -> heaplet_id FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with | ValeHeap (mh, ih, heapletId) -> heapletId
type vale_heap_layout_inner =
  {
  vl_heaplets_initialized: Prims.bool ;
  vl_heaplet_map: Prims.int -> heaplet_id FStar_Pervasives_Native.option ;
  vl_heaplet_sets: heaplet_id -> Prims.int FStar_Set.set ;
  vl_old_heap: vale_heap ;
  vl_buffers: buffer_info FStar_Seq_Base.seq ;
  vl_mod_loc: LowStar_Monotonic_Buffer.loc }
let (__proj__Mkvale_heap_layout_inner__item__vl_heaplets_initialized :
  vale_heap_layout_inner -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_heaplets_initialized
let (__proj__Mkvale_heap_layout_inner__item__vl_heaplet_map :
  vale_heap_layout_inner ->
    Prims.int -> heaplet_id FStar_Pervasives_Native.option)
  =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_heaplet_map
let (__proj__Mkvale_heap_layout_inner__item__vl_heaplet_sets :
  vale_heap_layout_inner -> heaplet_id -> Prims.int FStar_Set.set) =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_heaplet_sets
let (__proj__Mkvale_heap_layout_inner__item__vl_old_heap :
  vale_heap_layout_inner -> vale_heap) =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_old_heap
let (__proj__Mkvale_heap_layout_inner__item__vl_buffers :
  vale_heap_layout_inner -> buffer_info FStar_Seq_Base.seq) =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_buffers
let (__proj__Mkvale_heap_layout_inner__item__vl_mod_loc :
  vale_heap_layout_inner -> LowStar_Monotonic_Buffer.loc) =
  fun projectee ->
    match projectee with
    | { vl_heaplets_initialized; vl_heaplet_map; vl_heaplet_sets;
        vl_old_heap; vl_buffers; vl_mod_loc;_} -> vl_mod_loc
type vale_heap_layout =
  {
  vl_inner: vale_heap_layout_inner ;
  vl_taint: Vale_Arch_HeapTypes_s.memTaint_t }
let (__proj__Mkvale_heap_layout__item__vl_inner :
  vale_heap_layout -> vale_heap_layout_inner) =
  fun projectee -> match projectee with | { vl_inner; vl_taint;_} -> vl_inner
let (__proj__Mkvale_heap_layout__item__vl_taint :
  vale_heap_layout -> Vale_Arch_HeapTypes_s.memTaint_t) =
  fun projectee -> match projectee with | { vl_inner; vl_taint;_} -> vl_taint
type vale_heaplets = vale_heap Vale_Lib_Map16.map16
type vale_full_heap =
  {
  vf_layout: vale_heap_layout ;
  vf_heap: vale_heap ;
  vf_heaplets: vale_heaplets }
let (__proj__Mkvale_full_heap__item__vf_layout :
  vale_full_heap -> vale_heap_layout) =
  fun projectee ->
    match projectee with | { vf_layout; vf_heap; vf_heaplets;_} -> vf_layout
let (__proj__Mkvale_full_heap__item__vf_heap : vale_full_heap -> vale_heap) =
  fun projectee ->
    match projectee with | { vf_layout; vf_heap; vf_heaplets;_} -> vf_heap
let (__proj__Mkvale_full_heap__item__vf_heaplets :
  vale_full_heap -> vale_heaplets) =
  fun projectee ->
    match projectee with
    | { vf_layout; vf_heap; vf_heaplets;_} -> vf_heaplets
let (full_heap_taint : vale_full_heap -> Vale_Arch_HeapTypes_s.memTaint_t) =
  fun vfh -> (vfh.vf_layout).vl_taint
let (empty_vale_heap_layout_inner : vale_heap -> vale_heap_layout_inner) =
  fun h ->
    {
      vl_heaplets_initialized = false;
      vl_heaplet_map = (fun uu___ -> FStar_Pervasives_Native.None);
      vl_heaplet_sets = (fun uu___ -> FStar_Set.empty ());
      vl_old_heap = h;
      vl_buffers = (FStar_Seq_Base.empty ());
      vl_mod_loc = LowStar_Monotonic_Buffer.loc_none
    }
let (empty_heaplet : vale_heap -> Prims.nat -> vale_heap) =
  fun h ->
    fun n ->
      let uu___ = h in
      match uu___ with
      | ValeHeap (mh, ih, uu___1) ->
          ValeHeap (mh, (), (FStar_Pervasives_Native.Some n))
let (empty_vale_heaplets : vale_heap -> vale_heaplets) =
  fun h -> Vale_Lib_Map16.init (empty_heaplet h)

let (mi_heap_upd :
  vale_heap -> Vale_Arch_MachineHeap_s.machine_heap -> vale_heap) =
  fun vh ->
    fun mh' -> ValeHeap (mh', (), (__proj__ValeHeap__item__heapletId vh))