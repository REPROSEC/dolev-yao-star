open Prims
let (print_and_compare :
  Prims.nat ->
    unit Spec_Agile_HMAC.lbytes -> unit Spec_Agile_HMAC.lbytes -> Prims.bool)
  =
  fun len ->
    fun test_expected ->
      fun test_result ->
        FStar_IO.print_string "\n\nResult:   ";
        FStar_List.iter (fun a -> FStar_IO.print_uint8_hex_pad a)
          (FStar_Seq_Properties.seq_to_list test_result);
        FStar_IO.print_string "\nExpected: ";
        FStar_List.iter (fun a -> FStar_IO.print_uint8_hex_pad a)
          (FStar_Seq_Properties.seq_to_list test_expected);
        (let res =
           Obj.magic
             (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8 len len
                (Obj.magic test_expected) (Obj.magic test_result) len) in
         res = (FStar_UInt8.uint_to_t (Prims.of_int (255))))
let (test_vec : Spec_HMAC_DRBG_Test_Vectors.vec -> Prims.bool) =
  fun uu___ ->
    match uu___ with
    | { Spec_HMAC_DRBG_Test_Vectors.a = a;
        Spec_HMAC_DRBG_Test_Vectors.entropy_input = entropy_input;
        Spec_HMAC_DRBG_Test_Vectors.nonce = nonce;
        Spec_HMAC_DRBG_Test_Vectors.personalization_string =
          personalization_string;
        Spec_HMAC_DRBG_Test_Vectors.entropy_input_reseed =
          entropy_input_reseed;
        Spec_HMAC_DRBG_Test_Vectors.additional_input_reseed =
          additional_input_reseed;
        Spec_HMAC_DRBG_Test_Vectors.additional_input_1 = additional_input_1;
        Spec_HMAC_DRBG_Test_Vectors.additional_input_2 = additional_input_2;
        Spec_HMAC_DRBG_Test_Vectors.returned_bits = returned_bits;_} ->
        let returned_bytes_len =
          (FStar_String.strlen returned_bits) / (Prims.of_int (2)) in
        let entropy_input_len =
          (FStar_String.strlen entropy_input) / (Prims.of_int (2)) in
        let entropy_input_reseed_len =
          (FStar_String.strlen entropy_input_reseed) / (Prims.of_int (2)) in
        let nonce_len = (FStar_String.strlen nonce) / (Prims.of_int (2)) in
        let personalization_string_len =
          (FStar_String.strlen personalization_string) / (Prims.of_int (2)) in
        let additional_input_reseed_len =
          (FStar_String.strlen additional_input_reseed) / (Prims.of_int (2)) in
        let additional_input_1_len =
          (FStar_String.strlen additional_input_1) / (Prims.of_int (2)) in
        let additional_input_2_len =
          (FStar_String.strlen additional_input_2) / (Prims.of_int (2)) in
        let returned_bits_len =
          (FStar_String.strlen returned_bits) / (Prims.of_int (2)) in
        if
          Prims.op_Negation
            ((((((((((((Spec_HMAC_DRBG.is_supported_alg a) &&
                         ((Spec_HMAC_DRBG.min_length a) <= entropy_input_len))
                        && (entropy_input_len <= Spec_HMAC_DRBG.max_length))
                       &&
                       (((Spec_HMAC_DRBG.min_length a) / (Prims.of_int (2)))
                          <= nonce_len))
                      && (nonce_len <= Spec_HMAC_DRBG.max_length))
                     &&
                     (personalization_string_len <=
                        Spec_HMAC_DRBG.max_personalization_string_length))
                    &&
                    (entropy_input_reseed_len <= Spec_HMAC_DRBG.max_length))
                   &&
                   (additional_input_reseed_len <=
                      Spec_HMAC_DRBG.max_additional_input_length))
                  &&
                  (additional_input_1_len <=
                     Spec_HMAC_DRBG.max_additional_input_length))
                 &&
                 (additional_input_2_len <=
                    Spec_HMAC_DRBG.max_additional_input_length))
                && (Prims.int_zero < returned_bits_len))
               && (returned_bits_len <= Spec_HMAC_DRBG.max_output_length))
        then false
        else
          (let st =
             Spec_HMAC_DRBG.instantiate a (Lib_Meta.from_hex entropy_input)
               (Lib_Meta.from_hex nonce)
               (Lib_Meta.from_hex personalization_string) in
           let st1 =
             Spec_HMAC_DRBG.reseed a st
               (Lib_Meta.from_hex entropy_input_reseed)
               (Lib_Meta.from_hex additional_input_reseed) in
           match Spec_HMAC_DRBG.generate a st1 returned_bytes_len
                   (Lib_Meta.from_hex additional_input_1)
           with
           | FStar_Pervasives_Native.None -> false
           | FStar_Pervasives_Native.Some (uu___2, st2) ->
               (match Spec_HMAC_DRBG.generate a st2 returned_bytes_len
                        (Lib_Meta.from_hex additional_input_2)
                with
                | FStar_Pervasives_Native.None -> false
                | FStar_Pervasives_Native.Some (out, st3) ->
                    print_and_compare returned_bytes_len
                      (Lib_Meta.from_hex returned_bits) out))
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let result =
      FStar_List.for_all test_vec Spec_HMAC_DRBG_Test_Vectors.test_vectors in
    if result
    then (FStar_IO.print_string "\n\n[HMAC-DRBG] PASS\n"; true)
    else (FStar_IO.print_string "\n\n[HMAC-DRBG] FAIL\n"; false)