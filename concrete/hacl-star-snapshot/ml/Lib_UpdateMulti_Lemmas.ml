open Prims
type uint8 = FStar_UInt8.t


let repeat_f :
  'a .
    Prims.pos ->
      ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
        uint8 FStar_Seq_Base.seq -> 'a -> 'a
  = fun block_length -> fun update -> fun b -> fun acc -> update acc b
let repeat_l :
  'a .
    Prims.pos ->
      ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
        uint8 FStar_Seq_Base.seq ->
          Prims.nat -> (uint8, unit) Lib_Sequence.lseq -> 'a -> 'a
  =
  fun block_length ->
    fun update_last ->
      fun input -> fun l -> fun s -> fun acc -> update_last acc s

