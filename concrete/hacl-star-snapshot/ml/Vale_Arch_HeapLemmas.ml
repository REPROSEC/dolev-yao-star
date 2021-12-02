open Prims

let (empty_vale_heap_layout_inner :
  Vale_Arch_HeapImpl.vale_heap -> Vale_Arch_HeapImpl.vale_heap_layout_inner)
  = fun h -> Vale_Arch_HeapImpl.empty_vale_heap_layout_inner h
let (empty_vale_heaplets :
  Vale_Arch_HeapImpl.vale_heap -> Vale_Arch_HeapImpl.vale_heaplets) =
  fun h -> Vale_Arch_HeapImpl.empty_vale_heaplets h
let (heap_ignore_ghost :
  Vale_Arch_HeapImpl.vale_full_heap -> Vale_Arch_HeapImpl.vale_full_heap) =
  fun vfh ->
    let uu___ = vfh in
    {
      Vale_Arch_HeapImpl.vf_layout =
        (let uu___1 = vfh.Vale_Arch_HeapImpl.vf_layout in
         {
           Vale_Arch_HeapImpl.vl_inner =
             (empty_vale_heap_layout_inner vfh.Vale_Arch_HeapImpl.vf_heap);
           Vale_Arch_HeapImpl.vl_taint = (uu___1.Vale_Arch_HeapImpl.vl_taint)
         });
      Vale_Arch_HeapImpl.vf_heap = (uu___.Vale_Arch_HeapImpl.vf_heap);
      Vale_Arch_HeapImpl.vf_heaplets =
        (empty_vale_heaplets vfh.Vale_Arch_HeapImpl.vf_heap)
    }
let coerce : 'b 'a . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___
let (heap_ignore_ghost_machine :
  Vale_Arch_Heap.heap_impl -> Vale_Arch_Heap.heap_impl) =
  fun h -> heap_ignore_ghost h
