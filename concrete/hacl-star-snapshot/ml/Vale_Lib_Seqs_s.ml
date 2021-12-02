open Prims
let compose : 'a 'b 'c . ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c =
  fun f -> fun g -> fun x -> f (g x)
let seq_map :
  'a 'b . ('a -> 'b) -> 'a FStar_Seq_Base.seq -> 'b FStar_Seq_Base.seq =
  fun f ->
    fun s ->
      if (FStar_Seq_Base.length s) = Prims.int_zero
      then FStar_Seq_Base.MkSeq []
      else
        FStar_Seq_Base.init_aux (FStar_Seq_Base.length s) Prims.int_zero
          (compose f (FStar_Seq_Base.index s))
let all_but_last : 'a . 'a FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun s ->
    FStar_Seq_Base.slice s Prims.int_zero
      ((FStar_Seq_Base.length s) - Prims.int_one)
let reverse_seq : 'a . 'a FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun s ->
    if (FStar_Seq_Base.length s) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux (FStar_Seq_Base.length s) Prims.int_zero
        (fun i ->
           FStar_Seq_Base.index s
             (((FStar_Seq_Base.length s) - i) - Prims.int_one))