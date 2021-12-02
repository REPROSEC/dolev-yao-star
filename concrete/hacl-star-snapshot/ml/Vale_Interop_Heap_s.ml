open Prims
type ('ptr1, 'ptr2) disjoint_or_eq_b8 = unit
type 'ptrs list_disjoint_or_eq_def = unit
type 'uuuuu list_disjoint_or_eq = Obj.t

type ('mem, 'ptrs) list_live = unit
let (global_addrs_map : Vale_Interop_Types.addr_map) =
  Obj.magic (fun uu___ -> failwith "Not yet implemented:global_addrs_map")

type interop_heap =
  | InteropHeap of Vale_Interop_Types.b8 Prims.list *
  Vale_Interop_Types.addr_map * FStar_Monotonic_HyperStack.mem 
let (uu___is_InteropHeap : interop_heap -> Prims.bool) =
  fun projectee -> true
let (__proj__InteropHeap__item__ptrs :
  interop_heap -> Vale_Interop_Types.b8 Prims.list) =
  fun projectee ->
    match projectee with | InteropHeap (ptrs, addrs, hs) -> ptrs
let (__proj__InteropHeap__item__addrs :
  interop_heap -> Vale_Interop_Types.addr_map) =
  fun projectee ->
    match projectee with | InteropHeap (ptrs, addrs, hs) -> addrs
let (__proj__InteropHeap__item__hs :
  interop_heap -> FStar_Monotonic_HyperStack.mem) =
  fun projectee -> match projectee with | InteropHeap (ptrs, addrs, hs) -> hs
let (hs_of_mem : interop_heap -> FStar_Monotonic_HyperStack.mem) =
  fun m -> __proj__InteropHeap__item__hs m
let (ptrs_of_mem : interop_heap -> Vale_Interop_Types.b8 Prims.list) =
  fun m -> __proj__InteropHeap__item__ptrs m
let (addrs_of_mem : interop_heap -> Vale_Interop_Types.addr_map) =
  fun m -> __proj__InteropHeap__item__addrs m


type ('mem, 'h, 'p) correct_down_p = unit
type ('mem, 'h) correct_down = unit
type down_mem_t = unit
