open Prims
type heap_impl = Vale_Arch_HeapImpl.vale_full_heap
let (heap_get : heap_impl -> Vale_Arch_MachineHeap_s.machine_heap) =
  fun hi ->
    Vale_Arch_HeapImpl.__proj__ValeHeap__item__mh
      hi.Vale_Arch_HeapImpl.vf_heap
let (heap_taint : heap_impl -> Vale_Arch_HeapTypes_s.memTaint_t) =
  fun hi -> (hi.Vale_Arch_HeapImpl.vf_layout).Vale_Arch_HeapImpl.vl_taint
let (heaplet_upd_f :
  Vale_Arch_HeapImpl.vale_full_heap ->
    Vale_Arch_MachineHeap_s.machine_heap ->
      Vale_Arch_HeapImpl.heaplet_id -> Vale_Arch_HeapImpl.vale_heap)
  =
  fun vfh ->
    fun mh' ->
      fun k ->
        let hk = Vale_Lib_Map16.sel vfh.Vale_Arch_HeapImpl.vf_heaplets k in
        let mhk = Vale_Arch_HeapImpl.__proj__ValeHeap__item__mh hk in
        let dom_upd =
          FStar_Set.intersect
            (((vfh.Vale_Arch_HeapImpl.vf_layout).Vale_Arch_HeapImpl.vl_inner).Vale_Arch_HeapImpl.vl_heaplet_sets
               k) (FStar_Map.domain mhk) in
        let mhk' = FStar_Map.concat mhk (FStar_Map.restrict dom_upd mh') in
        Vale_Arch_HeapImpl.mi_heap_upd hk mhk'
let (heap_upd :
  heap_impl ->
    Vale_Arch_MachineHeap_s.machine_heap ->
      Vale_Arch_HeapTypes_s.memTaint_t -> heap_impl)
  =
  fun hi ->
    fun mh' ->
      fun mt' ->
        let h' =
          Vale_Arch_HeapImpl.mi_heap_upd hi.Vale_Arch_HeapImpl.vf_heap mh' in
        let hs' = Vale_Lib_Map16.init (heaplet_upd_f hi mh') in
        {
          Vale_Arch_HeapImpl.vf_layout =
            (let uu___ = hi.Vale_Arch_HeapImpl.vf_layout in
             {
               Vale_Arch_HeapImpl.vl_inner =
                 (uu___.Vale_Arch_HeapImpl.vl_inner);
               Vale_Arch_HeapImpl.vl_taint = mt'
             });
          Vale_Arch_HeapImpl.vf_heap = h';
          Vale_Arch_HeapImpl.vf_heaplets = hs'
        }


