open Prims
let op_String_Access :
  'uuuuu 'uuuuu1 . unit -> ('uuuuu, 'uuuuu1) FStar_Map.t -> 'uuuuu -> 'uuuuu1
  = fun uu___ -> FStar_Map.sel
let op_String_Assignment :
  'uuuuu 'uuuuu1 .
    unit ->
      ('uuuuu, 'uuuuu1) FStar_Map.t ->
        'uuuuu -> 'uuuuu1 -> ('uuuuu, 'uuuuu1) FStar_Map.t
  = fun uu___ -> FStar_Map.upd
type ('ptr1, 'ptr2) disjoint =
  (unit, unit) LowStar_Monotonic_Buffer.loc_disjoint

let rec (write_vale_mem :
  FStar_UInt8.t FStar_Seq_Base.seq ->
    Prims.nat ->
      Prims.int ->
        Prims.nat ->
          Vale_Arch_MachineHeap_s.machine_heap ->
            Vale_Arch_MachineHeap_s.machine_heap)
  =
  fun contents ->
    fun length ->
      fun addr ->
        fun i ->
          fun curr_heap ->
            if i >= length
            then curr_heap
            else
              (let heap =
                 FStar_Map.upd curr_heap (addr + i)
                   (FStar_UInt8.v (FStar_Seq_Base.index contents i)) in
               write_vale_mem contents length addr (i + Prims.int_one) heap)






























