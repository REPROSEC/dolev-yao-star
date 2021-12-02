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
type machine_heap = (Prims.int, Vale_Def_Words_s.nat8) FStar_Map.t
type ('mh, 'mhu) is_machine_heap_update = unit
let (get_heap_val32_def :
  Prims.int -> machine_heap -> Vale_Def_Words_s.nat32) =
  fun ptr ->
    fun mem ->
      Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
        {
          Vale_Def_Words_s.lo0 = (FStar_Map.sel mem ptr);
          Vale_Def_Words_s.lo1 = (FStar_Map.sel mem (ptr + Prims.int_one));
          Vale_Def_Words_s.hi2 =
            (FStar_Map.sel mem (ptr + (Prims.of_int (2))));
          Vale_Def_Words_s.hi3 =
            (FStar_Map.sel mem (ptr + (Prims.of_int (3))))
        }
let (get_heap_val32 : Prims.int -> machine_heap -> Vale_Def_Words_s.nat32) =
  Vale_Def_Opaque_s.opaque_make get_heap_val32_def

let (get_heap_val64_def :
  Prims.int -> machine_heap -> Vale_Def_Words_s.nat64) =
  fun ptr ->
    fun mem ->
      Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
        {
          Vale_Def_Words_s.lo =
            (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
               {
                 Vale_Def_Words_s.lo0 = (FStar_Map.sel mem ptr);
                 Vale_Def_Words_s.lo1 =
                   (FStar_Map.sel mem (ptr + Prims.int_one));
                 Vale_Def_Words_s.hi2 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (2))));
                 Vale_Def_Words_s.hi3 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (3))))
               });
          Vale_Def_Words_s.hi =
            (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
               {
                 Vale_Def_Words_s.lo0 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (4))));
                 Vale_Def_Words_s.lo1 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (5))));
                 Vale_Def_Words_s.hi2 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (6))));
                 Vale_Def_Words_s.hi3 =
                   (FStar_Map.sel mem (ptr + (Prims.of_int (7))))
               })
        }
let (get_heap_val64 : Prims.int -> machine_heap -> Vale_Def_Words_s.nat64) =
  Vale_Def_Opaque_s.opaque_make get_heap_val64_def

let (get_heap_val128_def :
  Prims.int -> machine_heap -> Vale_Def_Types_s.quad32) =
  fun ptr ->
    fun mem ->
      {
        Vale_Def_Words_s.lo0 = (get_heap_val32 ptr mem);
        Vale_Def_Words_s.lo1 =
          (get_heap_val32 (ptr + (Prims.of_int (4))) mem);
        Vale_Def_Words_s.hi2 =
          (get_heap_val32 (ptr + (Prims.of_int (8))) mem);
        Vale_Def_Words_s.hi3 =
          (get_heap_val32 (ptr + (Prims.of_int (12))) mem)
      }
let (get_heap_val128 : Prims.int -> machine_heap -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make get_heap_val128_def

let (update_heap32_def :
  Prims.int -> Vale_Def_Words_s.nat32 -> machine_heap -> machine_heap) =
  fun ptr ->
    fun v ->
      fun mem ->
        let v1 = Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8)) v in
        let mem1 = FStar_Map.upd mem ptr v1.Vale_Def_Words_s.lo0 in
        let mem2 =
          FStar_Map.upd mem1 (ptr + Prims.int_one) v1.Vale_Def_Words_s.lo1 in
        let mem3 =
          FStar_Map.upd mem2 (ptr + (Prims.of_int (2)))
            v1.Vale_Def_Words_s.hi2 in
        let mem4 =
          FStar_Map.upd mem3 (ptr + (Prims.of_int (3)))
            v1.Vale_Def_Words_s.hi3 in
        mem4
let (update_heap32 :
  Prims.int -> Vale_Def_Words_s.nat32 -> machine_heap -> machine_heap) =
  Vale_Def_Opaque_s.opaque_make update_heap32_def

let (update_heap64_def :
  Prims.int -> Vale_Def_Words_s.nat64 -> machine_heap -> machine_heap) =
  fun ptr ->
    fun v ->
      fun mem ->
        let v1 = Vale_Def_Words_Two_s.nat_to_two (Prims.of_int (32)) v in
        let lo =
          Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))
            v1.Vale_Def_Words_s.lo in
        let hi =
          Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))
            v1.Vale_Def_Words_s.hi in
        let mem1 = FStar_Map.upd mem ptr lo.Vale_Def_Words_s.lo0 in
        let mem2 =
          FStar_Map.upd mem1 (ptr + Prims.int_one) lo.Vale_Def_Words_s.lo1 in
        let mem3 =
          FStar_Map.upd mem2 (ptr + (Prims.of_int (2)))
            lo.Vale_Def_Words_s.hi2 in
        let mem4 =
          FStar_Map.upd mem3 (ptr + (Prims.of_int (3)))
            lo.Vale_Def_Words_s.hi3 in
        let mem5 =
          FStar_Map.upd mem4 (ptr + (Prims.of_int (4)))
            hi.Vale_Def_Words_s.lo0 in
        let mem6 =
          FStar_Map.upd mem5 (ptr + (Prims.of_int (5)))
            hi.Vale_Def_Words_s.lo1 in
        let mem7 =
          FStar_Map.upd mem6 (ptr + (Prims.of_int (6)))
            hi.Vale_Def_Words_s.hi2 in
        let mem8 =
          FStar_Map.upd mem7 (ptr + (Prims.of_int (7)))
            hi.Vale_Def_Words_s.hi3 in
        mem8
let (update_heap64 :
  Prims.int -> Vale_Def_Words_s.nat64 -> machine_heap -> machine_heap) =
  Vale_Def_Opaque_s.opaque_make update_heap64_def

let (update_heap128_def :
  Prims.int -> Vale_Def_Types_s.quad32 -> machine_heap -> machine_heap) =
  fun ptr ->
    fun v ->
      fun mem ->
        let mem1 = update_heap32 ptr v.Vale_Def_Words_s.lo0 mem in
        let mem2 =
          update_heap32 (ptr + (Prims.of_int (4))) v.Vale_Def_Words_s.lo1
            mem1 in
        let mem3 =
          update_heap32 (ptr + (Prims.of_int (8))) v.Vale_Def_Words_s.hi2
            mem2 in
        let mem4 =
          update_heap32 (ptr + (Prims.of_int (12))) v.Vale_Def_Words_s.hi3
            mem3 in
        mem4
let (update_heap128 :
  Prims.int -> Vale_Def_Types_s.quad32 -> machine_heap -> machine_heap) =
  Vale_Def_Opaque_s.opaque_make update_heap128_def

let (valid_addr : Prims.int -> machine_heap -> Prims.bool) =
  fun ptr -> fun mem -> FStar_Map.contains mem ptr
let (valid_addr64 : Prims.int -> machine_heap -> Prims.bool) =
  fun ptr ->
    fun mem ->
      (((((((valid_addr ptr mem) && (valid_addr (ptr + Prims.int_one) mem))
             && (valid_addr (ptr + (Prims.of_int (2))) mem))
            && (valid_addr (ptr + (Prims.of_int (3))) mem))
           && (valid_addr (ptr + (Prims.of_int (4))) mem))
          && (valid_addr (ptr + (Prims.of_int (5))) mem))
         && (valid_addr (ptr + (Prims.of_int (6))) mem))
        && (valid_addr (ptr + (Prims.of_int (7))) mem)
let (valid_addr128 : Prims.int -> machine_heap -> Prims.bool) =
  fun ptr ->
    fun mem ->
      (((((((((((((((valid_addr ptr mem) &&
                      (valid_addr (ptr + Prims.int_one) mem))
                     && (valid_addr (ptr + (Prims.of_int (2))) mem))
                    && (valid_addr (ptr + (Prims.of_int (3))) mem))
                   && (valid_addr (ptr + (Prims.of_int (4))) mem))
                  && (valid_addr (ptr + (Prims.of_int (5))) mem))
                 && (valid_addr (ptr + (Prims.of_int (6))) mem))
                && (valid_addr (ptr + (Prims.of_int (7))) mem))
               && (valid_addr (ptr + (Prims.of_int (8))) mem))
              && (valid_addr (ptr + (Prims.of_int (9))) mem))
             && (valid_addr (ptr + (Prims.of_int (10))) mem))
            && (valid_addr (ptr + (Prims.of_int (11))) mem))
           && (valid_addr (ptr + (Prims.of_int (12))) mem))
          && (valid_addr (ptr + (Prims.of_int (13))) mem))
         && (valid_addr (ptr + (Prims.of_int (14))) mem))
        && (valid_addr (ptr + (Prims.of_int (15))) mem)