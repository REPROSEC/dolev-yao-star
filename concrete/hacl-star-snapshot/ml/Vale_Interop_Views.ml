open Prims
let (get8_def :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt8.t) =
  fun s -> FStar_Seq_Base.index s Prims.int_zero
let (get8 : (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt8.t)
  = Vale_Def_Opaque_s.opaque_make get8_def





let (up_view8 : (FStar_UInt8.t, FStar_UInt8.t) LowStar_BufferView_Up.view) =
  LowStar_BufferView_Up.View (Prims.int_one, (), ())
let (down_view8 :
  (FStar_UInt8.t, FStar_UInt8.t) LowStar_BufferView_Down.view) =
  LowStar_BufferView_Down.View (Prims.int_one, (), ())
let (get16_def :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt16.t) =
  fun s ->
    FStar_UInt16.uint_to_t
      ((FStar_UInt8.v (FStar_Seq_Base.index s Prims.int_zero)) +
         ((FStar_UInt8.v (FStar_Seq_Base.index s Prims.int_one)) *
            (Prims.of_int (0x100))))
let (get16 :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt16.t) =
  Vale_Def_Opaque_s.opaque_make get16_def





let (up_view16 : (FStar_UInt8.t, FStar_UInt16.t) LowStar_BufferView_Up.view)
  = LowStar_BufferView_Up.View ((Prims.of_int (2)), (), ())
let (down_view16 :
  (FStar_UInt16.t, FStar_UInt8.t) LowStar_BufferView_Down.view) =
  LowStar_BufferView_Down.View ((Prims.of_int (2)), (), ())
let (get32_def :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt32.t) =
  fun s ->
    FStar_UInt32.uint_to_t
      (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8))
         (Vale_Def_Words_Seq_s.seq_to_four_LE
            (Vale_Def_Words_Seq_s.seq_uint8_to_seq_nat8 s)))
let (get32 :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt32.t) =
  Vale_Def_Opaque_s.opaque_make get32_def





let (up_view32 : (FStar_UInt8.t, FStar_UInt32.t) LowStar_BufferView_Up.view)
  = LowStar_BufferView_Up.View ((Prims.of_int (4)), (), ())
let (down_view32 :
  (FStar_UInt32.t, FStar_UInt8.t) LowStar_BufferView_Down.view) =
  LowStar_BufferView_Down.View ((Prims.of_int (4)), (), ())
let (get64_def :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt64.t) =
  fun s ->
    FStar_UInt64.uint_to_t
      (Vale_Def_Types_s.le_bytes_to_nat64
         (Vale_Def_Words_Seq_s.seq_uint8_to_seq_nat8 s))
let (get64 :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt64.t) =
  Vale_Def_Opaque_s.opaque_make get64_def





let (up_view64 : (FStar_UInt8.t, FStar_UInt64.t) LowStar_BufferView_Up.view)
  = LowStar_BufferView_Up.View ((Prims.of_int (8)), (), ())
let (down_view64 :
  (FStar_UInt64.t, FStar_UInt8.t) LowStar_BufferView_Down.view) =
  LowStar_BufferView_Down.View ((Prims.of_int (8)), (), ())
let (get128_def :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> Vale_Def_Types_s.quad32)
  =
  fun s ->
    Vale_Def_Types_s.le_bytes_to_quad32
      (Vale_Def_Words_Seq_s.seq_uint8_to_seq_nat8 s)
let (get128 :
  (FStar_UInt8.t, unit) FStar_Seq_Properties.lseq -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make get128_def





let (up_view128 :
  (FStar_UInt8.t, Vale_Def_Types_s.quad32) LowStar_BufferView_Up.view) =
  LowStar_BufferView_Up.View ((Prims.of_int (16)), (), ())
let (down_view128 :
  (Vale_Def_Types_s.quad32, FStar_UInt8.t) LowStar_BufferView_Down.view) =
  LowStar_BufferView_Down.View ((Prims.of_int (16)), (), ())
let (nat32s_to_nat128 :
  Vale_Def_Words_s.nat32 ->
    Vale_Def_Words_s.nat32 ->
      Vale_Def_Words_s.nat32 ->
        Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat128)
  =
  fun v1 ->
    fun v2 ->
      fun v3 ->
        fun v4 ->
          ((v1 + (v2 * (Prims.parse_int "0x100000000"))) +
             (v3 * (Prims.parse_int "0x1000000000000")))
            + (v4 * (Prims.parse_int "0x1000000000000000000000000"))
let (get32_128_def :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq -> Vale_Def_Types_s.quad32)
  =
  fun s ->
    Vale_Def_Words_Seq_s.seq_to_four_LE
      (Vale_Lib_Seqs_s.seq_map FStar_UInt32.v s)
let (get32_128 :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make get32_128_def







let (view32_128 :
  (FStar_UInt32.t, Vale_Def_Types_s.quad32) LowStar_BufferView_Up.view) =
  LowStar_BufferView_Up.View ((Prims.of_int (4)), (), ())