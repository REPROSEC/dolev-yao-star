open Prims
let (set_to_one_LE : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q -> Vale_Def_Words_Four_s.four_insert q Prims.int_one Prims.int_zero
let (upper3_equal :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q0 ->
    fun q1 ->
      ((q0.Vale_Def_Words_s.lo1 = q1.Vale_Def_Words_s.lo1) &&
         (q0.Vale_Def_Words_s.hi2 = q1.Vale_Def_Words_s.hi2))
        && (q0.Vale_Def_Words_s.hi3 = q1.Vale_Def_Words_s.hi3)
let (lower3_equal :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q0 ->
    fun q1 ->
      ((q0.Vale_Def_Words_s.lo0 = q1.Vale_Def_Words_s.lo0) &&
         (q0.Vale_Def_Words_s.lo1 = q1.Vale_Def_Words_s.lo1))
        && (q0.Vale_Def_Words_s.hi2 = q1.Vale_Def_Words_s.hi2)

















let (gcm_decrypt_LE_tag :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
      Vale_AES_GCM_s.supported_iv_LE ->
        Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
          Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
            Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun alg ->
    fun key ->
      fun iv ->
        fun cipher ->
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
            let j0_BE = Vale_AES_GCM_s.compute_iv_BE h_LE iv in
            let lengths_BE =
              Vale_Def_Types_s.insert_nat64
                (Vale_Def_Types_s.insert_nat64
                   {
                     Vale_Def_Words_s.lo0 = Prims.int_zero;
                     Vale_Def_Words_s.lo1 = Prims.int_zero;
                     Vale_Def_Words_s.hi2 = Prims.int_zero;
                     Vale_Def_Words_s.hi3 = Prims.int_zero
                   } ((Prims.of_int (8)) * (FStar_Seq_Base.length auth))
                   Prims.int_one)
                ((Prims.of_int (8)) * (FStar_Seq_Base.length cipher))
                Prims.int_zero in
            let lengths_LE = Vale_Def_Types_s.reverse_bytes_quad32 lengths_BE in
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
            t


