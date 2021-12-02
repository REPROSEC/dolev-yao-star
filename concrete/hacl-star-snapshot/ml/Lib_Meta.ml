open Prims
let (is_hex_digit : FStar_Char.char -> Prims.bool) =
  fun uu___ ->
    match uu___ with
    | 48 -> true
    | 49 -> true
    | 50 -> true
    | 51 -> true
    | 52 -> true
    | 53 -> true
    | 54 -> true
    | 55 -> true
    | 56 -> true
    | 57 -> true
    | 97 -> true
    | 65 -> true
    | 98 -> true
    | 66 -> true
    | 99 -> true
    | 67 -> true
    | 100 -> true
    | 68 -> true
    | 101 -> true
    | 69 -> true
    | 102 -> true
    | 70 -> true
    | uu___1 -> false
type hex_digit = FStar_Char.char
let (int_of_hex : hex_digit -> Prims.int) =
  fun uu___ ->
    match uu___ with
    | 48 -> Prims.int_zero
    | 49 -> Prims.int_one
    | 50 -> (Prims.of_int (2))
    | 51 -> (Prims.of_int (3))
    | 52 -> (Prims.of_int (4))
    | 53 -> (Prims.of_int (5))
    | 54 -> (Prims.of_int (6))
    | 55 -> (Prims.of_int (7))
    | 56 -> (Prims.of_int (8))
    | 57 -> (Prims.of_int (9))
    | 97 -> (Prims.of_int (10))
    | 65 -> (Prims.of_int (10))
    | 98 -> (Prims.of_int (11))
    | 66 -> (Prims.of_int (11))
    | 99 -> (Prims.of_int (12))
    | 67 -> (Prims.of_int (12))
    | 100 -> (Prims.of_int (13))
    | 68 -> (Prims.of_int (13))
    | 101 -> (Prims.of_int (14))
    | 69 -> (Prims.of_int (14))
    | 102 -> (Prims.of_int (15))
    | 70 -> (Prims.of_int (15))
let (byte_of_hex : hex_digit -> hex_digit -> Prims.int) =
  fun a -> fun b -> ((int_of_hex a) * (Prims.of_int (16))) + (int_of_hex b)
type hex_string = Prims.string
let rec (as_uint8s :
  FStar_UInt8.t Prims.list ->
    FStar_Char.char Prims.list -> FStar_UInt8.t Prims.list)
  =
  fun acc ->
    fun cs ->
      match cs with
      | c1::c2::cs' ->
          as_uint8s ((FStar_UInt8.uint_to_t (byte_of_hex c1 c2)) :: acc) cs'
      | uu___ -> FStar_List_Tot_Base.rev acc
let (from_hex :
  Prims.string -> (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq) =
  fun s ->
    FStar_Seq_Properties.seq_of_list
      (as_uint8s [] (FStar_String.list_of_string s))