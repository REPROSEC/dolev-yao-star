open Prims
type frodo_alg =
  | Frodo64 
  | Frodo640 
  | Frodo976 
  | Frodo1344 
let (uu___is_Frodo64 : frodo_alg -> Prims.bool) =
  fun projectee -> match projectee with | Frodo64 -> true | uu___ -> false
let (uu___is_Frodo640 : frodo_alg -> Prims.bool) =
  fun projectee -> match projectee with | Frodo640 -> true | uu___ -> false
let (uu___is_Frodo976 : frodo_alg -> Prims.bool) =
  fun projectee -> match projectee with | Frodo976 -> true | uu___ -> false
let (uu___is_Frodo1344 : frodo_alg -> Prims.bool) =
  fun projectee -> match projectee with | Frodo1344 -> true | uu___ -> false
type frodo_gen_a =
  | SHAKE128 
  | AES128 
let (uu___is_SHAKE128 : frodo_gen_a -> Prims.bool) =
  fun projectee -> match projectee with | SHAKE128 -> true | uu___ -> false
let (uu___is_AES128 : frodo_gen_a -> Prims.bool) =
  fun projectee -> match projectee with | AES128 -> true | uu___ -> false


let (params_n : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (64))
    | Frodo640 -> (Prims.of_int (640))
    | Frodo976 -> (Prims.of_int (976))
    | Frodo1344 -> (Prims.of_int (1344))
let (params_logq : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (15))
    | Frodo640 -> (Prims.of_int (15))
    | Frodo976 -> (Prims.of_int (16))
    | Frodo1344 -> (Prims.of_int (16))
let (params_extracted_bits : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (2))
    | Frodo640 -> (Prims.of_int (2))
    | Frodo976 -> (Prims.of_int (3))
    | Frodo1344 -> (Prims.of_int (4))
let (crypto_bytes : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (16))
    | Frodo640 -> (Prims.of_int (16))
    | Frodo976 -> (Prims.of_int (24))
    | Frodo1344 -> (Prims.of_int (32))
let (params_nbar : Prims.int) = (Prims.of_int (8))
let (bytes_seed_a : Prims.int) = (Prims.of_int (16))
let (bytes_pkhash : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (16))
    | Frodo640 -> (Prims.of_int (16))
    | Frodo976 -> (Prims.of_int (24))
    | Frodo1344 -> (Prims.of_int (32))
let (bytes_mu : frodo_alg -> Prims.pos) =
  fun a ->
    (((match a with
       | Frodo64 -> (Prims.of_int (2))
       | Frodo640 -> (Prims.of_int (2))
       | Frodo976 -> (Prims.of_int (3))
       | Frodo1344 -> (Prims.of_int (4))) * params_nbar) * params_nbar)
      / (Prims.of_int (8))
let (publicmatrixbytes_len : frodo_alg -> Prims.pos) =
  fun a ->
    (match a with
     | Frodo64 -> (Prims.of_int (15))
     | Frodo640 -> (Prims.of_int (15))
     | Frodo976 -> (Prims.of_int (16))
     | Frodo1344 -> (Prims.of_int (16))) *
      (((match a with
         | Frodo64 -> (Prims.of_int (64))
         | Frodo640 -> (Prims.of_int (640))
         | Frodo976 -> (Prims.of_int (976))
         | Frodo1344 -> (Prims.of_int (1344))) * params_nbar) /
         (Prims.of_int (8)))
let (secretmatrixbytes_len : frodo_alg -> Prims.pos) =
  fun a ->
    ((Prims.of_int (2)) *
       (match a with
        | Frodo64 -> (Prims.of_int (64))
        | Frodo640 -> (Prims.of_int (640))
        | Frodo976 -> (Prims.of_int (976))
        | Frodo1344 -> (Prims.of_int (1344))))
      * params_nbar
let (ct1bytes_len : frodo_alg -> Prims.pos) =
  fun a ->
    (match a with
     | Frodo64 -> (Prims.of_int (15))
     | Frodo640 -> (Prims.of_int (15))
     | Frodo976 -> (Prims.of_int (16))
     | Frodo1344 -> (Prims.of_int (16))) *
      ((params_nbar *
          (match a with
           | Frodo64 -> (Prims.of_int (64))
           | Frodo640 -> (Prims.of_int (640))
           | Frodo976 -> (Prims.of_int (976))
           | Frodo1344 -> (Prims.of_int (1344))))
         / (Prims.of_int (8)))
let (ct2bytes_len : frodo_alg -> Prims.pos) =
  fun a ->
    (match a with
     | Frodo64 -> (Prims.of_int (15))
     | Frodo640 -> (Prims.of_int (15))
     | Frodo976 -> (Prims.of_int (16))
     | Frodo1344 -> (Prims.of_int (16))) *
      ((params_nbar * params_nbar) / (Prims.of_int (8)))
let (crypto_publickeybytes : frodo_alg -> Prims.pos) =
  fun a -> bytes_seed_a + (publicmatrixbytes_len a)
let (crypto_secretkeybytes : frodo_alg -> Prims.pos) =
  fun a ->
    (((match a with
       | Frodo64 -> (Prims.of_int (16))
       | Frodo640 -> (Prims.of_int (16))
       | Frodo976 -> (Prims.of_int (24))
       | Frodo1344 -> (Prims.of_int (32))) + (crypto_publickeybytes a)) +
       (secretmatrixbytes_len a))
      + (bytes_pkhash a)
let (crypto_ciphertextbytes : frodo_alg -> Prims.pos) =
  fun a -> (ct1bytes_len a) + (ct2bytes_len a)




let (frodo_shake :
  frodo_alg ->
    Prims.nat ->
      FStar_UInt8.t Lib_Sequence.seq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    match a with
    | Frodo64 -> Spec_SHA3.shake128
    | Frodo640 -> Spec_SHA3.shake128
    | Frodo976 -> Spec_SHA3.shake256
    | Frodo1344 -> Spec_SHA3.shake256
let (frodo_gen_matrix :
  frodo_gen_a ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    match a with
    | SHAKE128 -> Spec_Frodo_Gen.frodo_gen_matrix_shake
    | AES128 -> Spec_Frodo_Gen.frodo_gen_matrix_aes
let (cdf_list_640 : FStar_UInt16.t Prims.list) =
  [FStar_UInt16.uint_to_t (Prims.of_int (4643));
  FStar_UInt16.uint_to_t (Prims.of_int (13363));
  FStar_UInt16.uint_to_t (Prims.of_int (20579));
  FStar_UInt16.uint_to_t (Prims.of_int (25843));
  FStar_UInt16.uint_to_t (Prims.of_int (29227));
  FStar_UInt16.uint_to_t (Prims.of_int (31145));
  FStar_UInt16.uint_to_t (Prims.of_int (32103));
  FStar_UInt16.uint_to_t (Prims.of_int (32525));
  FStar_UInt16.uint_to_t (Prims.of_int (32689));
  FStar_UInt16.uint_to_t (Prims.of_int (32745));
  FStar_UInt16.uint_to_t (Prims.of_int (32762));
  FStar_UInt16.uint_to_t (Prims.of_int (32766));
  FStar_UInt16.uint_to_t (Prims.of_int (32767))]
let (cdf_list_976 : FStar_UInt16.t Prims.list) =
  [FStar_UInt16.uint_to_t (Prims.of_int (5638));
  FStar_UInt16.uint_to_t (Prims.of_int (15915));
  FStar_UInt16.uint_to_t (Prims.of_int (23689));
  FStar_UInt16.uint_to_t (Prims.of_int (28571));
  FStar_UInt16.uint_to_t (Prims.of_int (31116));
  FStar_UInt16.uint_to_t (Prims.of_int (32217));
  FStar_UInt16.uint_to_t (Prims.of_int (32613));
  FStar_UInt16.uint_to_t (Prims.of_int (32731));
  FStar_UInt16.uint_to_t (Prims.of_int (32760));
  FStar_UInt16.uint_to_t (Prims.of_int (32766));
  FStar_UInt16.uint_to_t (Prims.of_int (32767))]
let (cdf_list_1344 : FStar_UInt16.t Prims.list) =
  [FStar_UInt16.uint_to_t (Prims.of_int (9142));
  FStar_UInt16.uint_to_t (Prims.of_int (23462));
  FStar_UInt16.uint_to_t (Prims.of_int (30338));
  FStar_UInt16.uint_to_t (Prims.of_int (32361));
  FStar_UInt16.uint_to_t (Prims.of_int (32725));
  FStar_UInt16.uint_to_t (Prims.of_int (32765));
  FStar_UInt16.uint_to_t (Prims.of_int (32767))]
let (cdf_table_len : frodo_alg -> Prims.pos) =
  fun a ->
    match a with
    | Frodo64 -> (Prims.of_int (13))
    | Frodo640 -> (Prims.of_int (13))
    | Frodo976 -> (Prims.of_int (11))
    | Frodo1344 -> (Prims.of_int (7))
let (cdf_list : frodo_alg -> FStar_UInt16.t Prims.list) =
  fun a ->
    match a with
    | Frodo64 ->
        [FStar_UInt16.uint_to_t (Prims.of_int (4643));
        FStar_UInt16.uint_to_t (Prims.of_int (13363));
        FStar_UInt16.uint_to_t (Prims.of_int (20579));
        FStar_UInt16.uint_to_t (Prims.of_int (25843));
        FStar_UInt16.uint_to_t (Prims.of_int (29227));
        FStar_UInt16.uint_to_t (Prims.of_int (31145));
        FStar_UInt16.uint_to_t (Prims.of_int (32103));
        FStar_UInt16.uint_to_t (Prims.of_int (32525));
        FStar_UInt16.uint_to_t (Prims.of_int (32689));
        FStar_UInt16.uint_to_t (Prims.of_int (32745));
        FStar_UInt16.uint_to_t (Prims.of_int (32762));
        FStar_UInt16.uint_to_t (Prims.of_int (32766));
        FStar_UInt16.uint_to_t (Prims.of_int (32767))]
    | Frodo640 ->
        [FStar_UInt16.uint_to_t (Prims.of_int (4643));
        FStar_UInt16.uint_to_t (Prims.of_int (13363));
        FStar_UInt16.uint_to_t (Prims.of_int (20579));
        FStar_UInt16.uint_to_t (Prims.of_int (25843));
        FStar_UInt16.uint_to_t (Prims.of_int (29227));
        FStar_UInt16.uint_to_t (Prims.of_int (31145));
        FStar_UInt16.uint_to_t (Prims.of_int (32103));
        FStar_UInt16.uint_to_t (Prims.of_int (32525));
        FStar_UInt16.uint_to_t (Prims.of_int (32689));
        FStar_UInt16.uint_to_t (Prims.of_int (32745));
        FStar_UInt16.uint_to_t (Prims.of_int (32762));
        FStar_UInt16.uint_to_t (Prims.of_int (32766));
        FStar_UInt16.uint_to_t (Prims.of_int (32767))]
    | Frodo976 ->
        [FStar_UInt16.uint_to_t (Prims.of_int (5638));
        FStar_UInt16.uint_to_t (Prims.of_int (15915));
        FStar_UInt16.uint_to_t (Prims.of_int (23689));
        FStar_UInt16.uint_to_t (Prims.of_int (28571));
        FStar_UInt16.uint_to_t (Prims.of_int (31116));
        FStar_UInt16.uint_to_t (Prims.of_int (32217));
        FStar_UInt16.uint_to_t (Prims.of_int (32613));
        FStar_UInt16.uint_to_t (Prims.of_int (32731));
        FStar_UInt16.uint_to_t (Prims.of_int (32760));
        FStar_UInt16.uint_to_t (Prims.of_int (32766));
        FStar_UInt16.uint_to_t (Prims.of_int (32767))]
    | Frodo1344 ->
        [FStar_UInt16.uint_to_t (Prims.of_int (9142));
        FStar_UInt16.uint_to_t (Prims.of_int (23462));
        FStar_UInt16.uint_to_t (Prims.of_int (30338));
        FStar_UInt16.uint_to_t (Prims.of_int (32361));
        FStar_UInt16.uint_to_t (Prims.of_int (32725));
        FStar_UInt16.uint_to_t (Prims.of_int (32765));
        FStar_UInt16.uint_to_t (Prims.of_int (32767))]
let (cdf_table : frodo_alg -> (FStar_UInt16.t, unit) Lib_Sequence.lseq) =
  fun a ->
    Lib_Sequence.of_list
      (match a with
       | Frodo64 ->
           [FStar_UInt16.uint_to_t (Prims.of_int (4643));
           FStar_UInt16.uint_to_t (Prims.of_int (13363));
           FStar_UInt16.uint_to_t (Prims.of_int (20579));
           FStar_UInt16.uint_to_t (Prims.of_int (25843));
           FStar_UInt16.uint_to_t (Prims.of_int (29227));
           FStar_UInt16.uint_to_t (Prims.of_int (31145));
           FStar_UInt16.uint_to_t (Prims.of_int (32103));
           FStar_UInt16.uint_to_t (Prims.of_int (32525));
           FStar_UInt16.uint_to_t (Prims.of_int (32689));
           FStar_UInt16.uint_to_t (Prims.of_int (32745));
           FStar_UInt16.uint_to_t (Prims.of_int (32762));
           FStar_UInt16.uint_to_t (Prims.of_int (32766));
           FStar_UInt16.uint_to_t (Prims.of_int (32767))]
       | Frodo640 ->
           [FStar_UInt16.uint_to_t (Prims.of_int (4643));
           FStar_UInt16.uint_to_t (Prims.of_int (13363));
           FStar_UInt16.uint_to_t (Prims.of_int (20579));
           FStar_UInt16.uint_to_t (Prims.of_int (25843));
           FStar_UInt16.uint_to_t (Prims.of_int (29227));
           FStar_UInt16.uint_to_t (Prims.of_int (31145));
           FStar_UInt16.uint_to_t (Prims.of_int (32103));
           FStar_UInt16.uint_to_t (Prims.of_int (32525));
           FStar_UInt16.uint_to_t (Prims.of_int (32689));
           FStar_UInt16.uint_to_t (Prims.of_int (32745));
           FStar_UInt16.uint_to_t (Prims.of_int (32762));
           FStar_UInt16.uint_to_t (Prims.of_int (32766));
           FStar_UInt16.uint_to_t (Prims.of_int (32767))]
       | Frodo976 ->
           [FStar_UInt16.uint_to_t (Prims.of_int (5638));
           FStar_UInt16.uint_to_t (Prims.of_int (15915));
           FStar_UInt16.uint_to_t (Prims.of_int (23689));
           FStar_UInt16.uint_to_t (Prims.of_int (28571));
           FStar_UInt16.uint_to_t (Prims.of_int (31116));
           FStar_UInt16.uint_to_t (Prims.of_int (32217));
           FStar_UInt16.uint_to_t (Prims.of_int (32613));
           FStar_UInt16.uint_to_t (Prims.of_int (32731));
           FStar_UInt16.uint_to_t (Prims.of_int (32760));
           FStar_UInt16.uint_to_t (Prims.of_int (32766));
           FStar_UInt16.uint_to_t (Prims.of_int (32767))]
       | Frodo1344 ->
           [FStar_UInt16.uint_to_t (Prims.of_int (9142));
           FStar_UInt16.uint_to_t (Prims.of_int (23462));
           FStar_UInt16.uint_to_t (Prims.of_int (30338));
           FStar_UInt16.uint_to_t (Prims.of_int (32361));
           FStar_UInt16.uint_to_t (Prims.of_int (32725));
           FStar_UInt16.uint_to_t (Prims.of_int (32765));
           FStar_UInt16.uint_to_t (Prims.of_int (32767))])



