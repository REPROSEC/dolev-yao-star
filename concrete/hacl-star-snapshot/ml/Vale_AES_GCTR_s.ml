open Prims
type 'p is_gctr_plain_LE = unit
type gctr_plain_LE = Vale_Def_Words_s.nat8 FStar_Seq_Base.seq
type gctr_plain_internal_LE = Vale_Def_Types_s.quad32 FStar_Seq_Base.seq
let (inc32 : Vale_Def_Types_s.quad32 -> Prims.int -> Vale_Def_Types_s.quad32)
  =
  fun cb ->
    fun i ->
      {
        Vale_Def_Words_s.lo0 =
          ((cb.Vale_Def_Words_s.lo0 + i) mod (Prims.parse_int "0x100000000"));
        Vale_Def_Words_s.lo1 = (cb.Vale_Def_Words_s.lo1);
        Vale_Def_Words_s.hi2 = (cb.Vale_Def_Words_s.hi2);
        Vale_Def_Words_s.hi3 = (cb.Vale_Def_Words_s.hi3)
      }
let (gctr_encrypt_block :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_AES_AES_s.algorithm ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Prims.int -> Vale_Def_Types_s.quad32)
  =
  fun icb_BE ->
    fun plain_LE ->
      fun alg ->
        fun key ->
          fun i ->
            let icb_LE =
              Vale_Def_Types_s.reverse_bytes_quad32 (inc32 icb_BE i) in
            Vale_Def_Types_s.quad32_xor plain_LE
              (Vale_AES_AES_s.aes_encrypt_LE alg key icb_LE)
let rec (gctr_encrypt_recursive :
  Vale_Def_Types_s.quad32 ->
    gctr_plain_internal_LE ->
      Vale_AES_AES_s.algorithm ->
        unit Vale_AES_AES_s.aes_key_LE ->
          Prims.int -> Vale_Def_Types_s.quad32 FStar_Seq_Base.seq)
  =
  fun icb_BE ->
    fun plain ->
      fun alg ->
        fun key ->
          fun i ->
            if (FStar_Seq_Base.length plain) = Prims.int_zero
            then FStar_Seq_Base.empty ()
            else
              FStar_Seq_Properties.cons
                (gctr_encrypt_block icb_BE (FStar_Seq_Properties.head plain)
                   alg key i)
                (gctr_encrypt_recursive icb_BE
                   (FStar_Seq_Properties.tail plain) alg key
                   (i + Prims.int_one))
let (pad_to_128_bits :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun p ->
    let num_extra_bytes = (FStar_Seq_Base.length p) mod (Prims.of_int (16)) in
    if num_extra_bytes = Prims.int_zero
    then p
    else
      FStar_Seq_Base.op_At_Bar p
        (FStar_Seq_Base.create ((Prims.of_int (16)) - num_extra_bytes)
           Prims.int_zero)
let (gctr_encrypt_LE_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      Vale_AES_AES_s.algorithm ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun icb_BE ->
    fun plain ->
      fun alg ->
        fun key ->
          let num_extra =
            (FStar_Seq_Base.length plain) mod (Prims.of_int (16)) in
          if num_extra = Prims.int_zero
          then
            let plain_quads_LE =
              Vale_Def_Types_s.le_bytes_to_seq_quad32 plain in
            let cipher_quads_LE =
              gctr_encrypt_recursive icb_BE plain_quads_LE alg key
                Prims.int_zero in
            Vale_Def_Types_s.le_seq_quad32_to_bytes cipher_quads_LE
          else
            (let full_bytes_len = (FStar_Seq_Base.length plain) - num_extra in
             let uu___1 = FStar_Seq_Properties.split plain full_bytes_len in
             match uu___1 with
             | (full_blocks, final_block) ->
                 let full_quads_LE =
                   Vale_Def_Types_s.le_bytes_to_seq_quad32 full_blocks in
                 let final_quad_LE =
                   Vale_Def_Types_s.le_bytes_to_quad32
                     (pad_to_128_bits final_block) in
                 let cipher_quads_LE =
                   gctr_encrypt_recursive icb_BE full_quads_LE alg key
                     Prims.int_zero in
                 let final_cipher_quad_LE =
                   gctr_encrypt_block icb_BE final_quad_LE alg key
                     (full_bytes_len / (Prims.of_int (16))) in
                 let cipher_bytes_full_LE =
                   Vale_Def_Types_s.le_seq_quad32_to_bytes cipher_quads_LE in
                 let final_cipher_bytes_LE =
                   FStar_Seq_Base.slice
                     (Vale_Def_Types_s.le_quad32_to_bytes
                        final_cipher_quad_LE) Prims.int_zero num_extra in
                 FStar_Seq_Base.op_At_Bar cipher_bytes_full_LE
                   final_cipher_bytes_LE)
let (gctr_encrypt_LE :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      Vale_AES_AES_s.algorithm ->
        Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  = Vale_Def_Opaque_s.opaque_make gctr_encrypt_LE_def
