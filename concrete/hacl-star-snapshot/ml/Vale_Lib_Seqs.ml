open Prims




let rec seq_map_i_indexed :
  'a 'b .
    (Prims.int -> 'a -> 'b) ->
      'a FStar_Seq_Base.seq -> Prims.int -> 'b FStar_Seq_Base.seq
  =
  fun f ->
    fun s ->
      fun i ->
        if (FStar_Seq_Base.length s) = Prims.int_zero
        then FStar_Seq_Base.empty ()
        else
          FStar_Seq_Properties.cons (f i (FStar_Seq_Properties.head s))
            (seq_map_i_indexed f (FStar_Seq_Properties.tail s)
               (i + Prims.int_one))
let seq_map_i :
  'a 'b .
    (Prims.int -> 'a -> 'b) -> 'a FStar_Seq_Base.seq -> 'b FStar_Seq_Base.seq
  = fun f -> fun s -> seq_map_i_indexed f s Prims.int_zero






let list_to_seq : 'a . 'a Prims.list -> 'a FStar_Seq_Base.seq =
  fun l -> FStar_Seq_Properties.seq_of_list l
type ('a, 'l, 's, 'n) list_to_seq_post = Obj.t


