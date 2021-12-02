open Prims
let rec (remove_between' :
  Prims.int FStar_Set.set ->
    Prims.int -> Prims.int -> Prims.int FStar_Set.set)
  =
  fun s ->
    fun start ->
      fun finish ->
        if finish = start
        then s
        else
          remove_between'
            (FStar_Set.intersect s
               (FStar_Set.complement (FStar_Set.singleton start)))
            (start + Prims.int_one) finish
let (remove_between :
  Prims.int FStar_Set.set ->
    Prims.int -> Prims.int -> Prims.int FStar_Set.set)
  =
  fun s ->
    fun start ->
      fun finish ->
        if finish <= start then s else remove_between' s start finish

