open Prims
type ('h, 'm) same_domain = (Prims.int, unit, unit) FStar_Set.equal




let coerce : 'b 'a . 'a -> 'b = fun uu___ -> (fun x -> Obj.magic x) uu___



type ('t, 'h1, 'h2, 'b, 'i) is_full_read = unit
type ('vfh, 'hu, 'hid, 'mhu, 'mtu) is_full_update = unit
let rec (set_of_range : Prims.int -> Prims.nat -> Prims.int FStar_Set.set) =
  fun a ->
    fun n ->
      if n = Prims.int_zero
      then FStar_Set.empty ()
      else
        FStar_Set.union (set_of_range a (n - Prims.int_one))
          (FStar_Set.singleton ((a + n) - Prims.int_one))
type ('bi, 'a) buffer_info_has_addr = unit
type ('bi, 'a) buffer_info_has_addr_opt = Obj.t


























































