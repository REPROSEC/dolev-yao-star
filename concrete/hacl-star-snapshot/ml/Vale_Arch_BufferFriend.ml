open Prims
let op_String_Access :
  'uuuuu . unit -> 'uuuuu FStar_Seq_Base.seq -> Prims.nat -> 'uuuuu =
  fun uu___ -> FStar_Seq_Base.index
let (to_bytes :
  FStar_UInt8.t FStar_Seq_Base.seq -> FStar_UInt8.t Lib_Sequence.seq) =
  fun s -> s
let (of_bytes :
  FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t FStar_Seq_Base.seq) =
  fun b -> b













let rec (le_to_n_indexed_rec :
  FStar_Endianness.bytes -> Prims.nat -> Prims.nat) =
  fun b ->
    fun i ->
      if i = Prims.int_zero
      then Prims.int_zero
      else
        (FStar_UInt8.v
           (FStar_Seq_Base.index b ((FStar_Seq_Base.length b) - i)))
          +
          ((Prims.pow2 (Prims.of_int (8))) *
             (le_to_n_indexed_rec b (i - Prims.int_one)))
let (le_to_n_indexed : FStar_Endianness.bytes -> Prims.nat) =
  fun b -> le_to_n_indexed_rec b (FStar_Seq_Base.length b)

