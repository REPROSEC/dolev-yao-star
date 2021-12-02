open Prims
type gcm_plain_LE = Vale_AES_GCTR_s.gctr_plain_LE
type gcm_auth_LE = Vale_AES_GCTR_s.gctr_plain_LE
type supported_iv_LE = Vale_Def_Words_s.nat8 FStar_Seq_Base.seq
let (compute_iv_BE_def :
  Vale_Def_Types_s.quad32 -> supported_iv_LE -> Vale_Def_Types_s.quad32) =
  fun h_LE ->
    fun iv ->
      if
        ((Prims.of_int (8)) * (FStar_Seq_Base.length iv)) =
          (Prims.of_int (96))
      then
        let iv_LE =
          Vale_Def_Types_s.le_bytes_to_quad32
            (Vale_AES_GCTR_s.pad_to_128_bits iv) in
        let iv_BE = Vale_Def_Types_s.reverse_bytes_quad32 iv_LE in
        let j0_BE =
          {
            Vale_Def_Words_s.lo0 = Prims.int_one;
            Vale_Def_Words_s.lo1 = (iv_BE.Vale_Def_Words_s.lo1);
            Vale_Def_Words_s.hi2 = (iv_BE.Vale_Def_Words_s.hi2);
            Vale_Def_Words_s.hi3 = (iv_BE.Vale_Def_Words_s.hi3)
          } in
        j0_BE
      else
        (let padded_iv_quads =
           Vale_Def_Types_s.le_bytes_to_seq_quad32
             (Vale_AES_GCTR_s.pad_to_128_bits iv) in
         let length_BE =
           Vale_Def_Types_s.insert_nat64_def
             {
               Vale_Def_Words_s.lo0 = Prims.int_zero;
               Vale_Def_Words_s.lo1 = Prims.int_zero;
               Vale_Def_Words_s.hi2 = Prims.int_zero;
               Vale_Def_Words_s.hi3 = Prims.int_zero
             } ((Prims.of_int (8)) * (FStar_Seq_Base.length iv))
             Prims.int_zero in
         let length_LE = Vale_Def_Types_s.reverse_bytes_quad32 length_BE in
         let hash_input_LE =
           FStar_Seq_Base.append padded_iv_quads
             (FStar_Seq_Base.create Prims.int_one length_LE) in
         let hash_output_LE = Vale_AES_GHash_s.ghash_LE h_LE hash_input_LE in
         Vale_Def_Types_s.reverse_bytes_quad32 hash_output_LE)
let (compute_iv_BE :
  Vale_Def_Types_s.quad32 -> supported_iv_LE -> Vale_Def_Types_s.quad32) =
  Vale_Def_Opaque_s.opaque_make compute_iv_BE_def

let (gcm_encrypt_LE_def :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      supported_iv_LE ->
        Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
            (Vale_Def_Words_s.nat8 FStar_Seq_Base.seq * Vale_Def_Words_s.nat8
              FStar_Seq_Base.seq))
  =
  fun alg ->
    fun key ->
      fun iv ->
        fun plain ->
          fun auth ->
            let key_LE = Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE key in
            let h_LE =
              Vale_AES_AES_s.aes_encrypt_LE alg key_LE
                {
                  Vale_Def_Words_s.lo0 = Prims.int_zero;
                  Vale_Def_Words_s.lo1 = Prims.int_zero;
                  Vale_Def_Words_s.hi2 = Prims.int_zero;
                  Vale_Def_Words_s.hi3 = Prims.int_zero
                } in
            let j0_BE = compute_iv_BE h_LE iv in
            let c =
              Vale_AES_GCTR_s.gctr_encrypt_LE
                (Vale_AES_GCTR_s.inc32 j0_BE Prims.int_one) plain alg key_LE in
            let lengths_BE =
              Vale_Def_Types_s.insert_nat64_def
                (Vale_Def_Types_s.insert_nat64_def
                   {
                     Vale_Def_Words_s.lo0 = Prims.int_zero;
                     Vale_Def_Words_s.lo1 = Prims.int_zero;
                     Vale_Def_Words_s.hi2 = Prims.int_zero;
                     Vale_Def_Words_s.hi3 = Prims.int_zero
                   } ((Prims.of_int (8)) * (FStar_Seq_Base.length auth))
                   Prims.int_one)
                ((Prims.of_int (8)) * (FStar_Seq_Base.length plain))
                Prims.int_zero in
            let lengths_LE = Vale_Def_Types_s.reverse_bytes_quad32 lengths_BE in
            let zero_padded_c_LE =
              Vale_Def_Types_s.le_bytes_to_seq_quad32
                (Vale_AES_GCTR_s.pad_to_128_bits c) in
            let zero_padded_a_LE =
              Vale_Def_Types_s.le_bytes_to_seq_quad32
                (Vale_AES_GCTR_s.pad_to_128_bits auth) in
            let hash_input_LE =
              FStar_Seq_Base.append zero_padded_a_LE
                (FStar_Seq_Base.append zero_padded_c_LE
                   (FStar_Seq_Base.create Prims.int_one lengths_LE)) in
            let s_LE = Vale_AES_GHash_s.ghash_LE h_LE hash_input_LE in
            let t =
              Vale_AES_GCTR_s.gctr_encrypt_LE j0_BE
                (Vale_Def_Types_s.le_quad32_to_bytes s_LE) alg key_LE in
            (c, t)
let (gcm_encrypt_LE :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      supported_iv_LE ->
        Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
            (Vale_Def_Words_s.nat8 FStar_Seq_Base.seq * Vale_Def_Words_s.nat8
              FStar_Seq_Base.seq))
  = Vale_Def_Opaque_s.opaque_make gcm_encrypt_LE_def

let (gcm_decrypt_LE_def :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      supported_iv_LE ->
        Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
            Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
              (Vale_Def_Words_s.nat8 FStar_Seq_Base.seq * Prims.bool))
  =
  fun alg ->
    fun key ->
      fun iv ->
        fun cipher ->
          fun auth ->
            fun tag ->
              let key_LE = Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE key in
              let h_LE =
                Vale_AES_AES_s.aes_encrypt_LE alg key_LE
                  {
                    Vale_Def_Words_s.lo0 = Prims.int_zero;
                    Vale_Def_Words_s.lo1 = Prims.int_zero;
                    Vale_Def_Words_s.hi2 = Prims.int_zero;
                    Vale_Def_Words_s.hi3 = Prims.int_zero
                  } in
              let j0_BE = compute_iv_BE h_LE iv in
              let p =
                Vale_AES_GCTR_s.gctr_encrypt_LE
                  (Vale_AES_GCTR_s.inc32 j0_BE Prims.int_one) cipher alg
                  key_LE in
              let lengths_BE =
                Vale_Def_Types_s.insert_nat64_def
                  (Vale_Def_Types_s.insert_nat64_def
                     {
                       Vale_Def_Words_s.lo0 = Prims.int_zero;
                       Vale_Def_Words_s.lo1 = Prims.int_zero;
                       Vale_Def_Words_s.hi2 = Prims.int_zero;
                       Vale_Def_Words_s.hi3 = Prims.int_zero
                     } ((Prims.of_int (8)) * (FStar_Seq_Base.length auth))
                     Prims.int_one)
                  ((Prims.of_int (8)) * (FStar_Seq_Base.length cipher))
                  Prims.int_zero in
              let lengths_LE =
                Vale_Def_Types_s.reverse_bytes_quad32 lengths_BE in
              let zero_padded_c_LE =
                Vale_Def_Types_s.le_bytes_to_seq_quad32
                  (Vale_AES_GCTR_s.pad_to_128_bits cipher) in
              let zero_padded_a_LE =
                Vale_Def_Types_s.le_bytes_to_seq_quad32
                  (Vale_AES_GCTR_s.pad_to_128_bits auth) in
              let hash_input_LE =
                FStar_Seq_Base.append zero_padded_a_LE
                  (FStar_Seq_Base.append zero_padded_c_LE
                     (FStar_Seq_Base.create Prims.int_one lengths_LE)) in
              let s_LE = Vale_AES_GHash_s.ghash_LE h_LE hash_input_LE in
              let t =
                Vale_AES_GCTR_s.gctr_encrypt_LE j0_BE
                  (Vale_Def_Types_s.le_quad32_to_bytes s_LE) alg key_LE in
              (p, (t = tag))
let (gcm_decrypt_LE :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      supported_iv_LE ->
        Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
            Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
              (Vale_Def_Words_s.nat8 FStar_Seq_Base.seq * Prims.bool))
  = Vale_Def_Opaque_s.opaque_make gcm_decrypt_LE_def
