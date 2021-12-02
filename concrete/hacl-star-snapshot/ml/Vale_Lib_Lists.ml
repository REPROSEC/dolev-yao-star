open Prims






let rec (from_list_le : Prims.bool Prims.list -> Prims.int) =
  fun l ->
    match l with
    | [] -> Prims.int_zero
    | h::t ->
        (if h then Prims.int_one else Prims.int_zero) +
          ((Prims.of_int (2)) * (from_list_le t))
let (from_list_be : Prims.bool Prims.list -> Prims.int) =
  fun l -> from_list_le (FStar_List_Tot_Base.rev l)

