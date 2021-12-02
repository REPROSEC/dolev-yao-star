open Prims
let (test1_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test1_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test1_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test1_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test1_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x58));
    (Prims.of_int (0xe2));
    (Prims.of_int (0xfc));
    (Prims.of_int (0xce));
    (Prims.of_int (0xfa));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x30));
    (Prims.of_int (0x61));
    (Prims.of_int (0x36));
    (Prims.of_int (0x7f));
    (Prims.of_int (0x1d));
    (Prims.of_int (0x57));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xe7));
    (Prims.of_int (0x45));
    (Prims.of_int (0x5a))]
let (test1_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test1_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x66));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x4b));
    (Prims.of_int (0xd4));
    (Prims.of_int (0xef));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x88));
    (Prims.of_int (0x4c));
    (Prims.of_int (0xfa));
    (Prims.of_int (0x59));
    (Prims.of_int (0xca));
    (Prims.of_int (0x34));
    (Prims.of_int (0x2b));
    (Prims.of_int (0x2e))]
let (test1_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test1_nonce_length : Prims.nat) = (Prims.of_int (12))
let (test1_msg_length : Prims.nat) = Prims.int_zero
let (test1_aad_length : Prims.nat) = Prims.int_zero
let (test1_c_length : Prims.nat) = Prims.int_zero
let (test2_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test2_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test2_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test2_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test2_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x03));
    (Prims.of_int (0x88));
    (Prims.of_int (0xda));
    (Prims.of_int (0xce));
    (Prims.of_int (0x60));
    (Prims.of_int (0xb6));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x92));
    (Prims.of_int (0xf3));
    (Prims.of_int (0x28));
    (Prims.of_int (0xc2));
    (Prims.of_int (0xb9));
    (Prims.of_int (0x71));
    (Prims.of_int (0xb2));
    (Prims.of_int (0xfe));
    (Prims.of_int (0x78));
    (Prims.of_int (0xab));
    (Prims.of_int (0x6e));
    (Prims.of_int (0x47));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x2c));
    (Prims.of_int (0xec));
    (Prims.of_int (0x13));
    (Prims.of_int (0xbd));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x3a));
    (Prims.of_int (0x67));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x12));
    (Prims.of_int (0x57));
    (Prims.of_int (0xbd));
    (Prims.of_int (0xdf))]
let (test2_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x03));
    (Prims.of_int (0x88));
    (Prims.of_int (0xda));
    (Prims.of_int (0xce));
    (Prims.of_int (0x60));
    (Prims.of_int (0xb6));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x92));
    (Prims.of_int (0xf3));
    (Prims.of_int (0x28));
    (Prims.of_int (0xc2));
    (Prims.of_int (0xb9));
    (Prims.of_int (0x71));
    (Prims.of_int (0xb2));
    (Prims.of_int (0xfe));
    (Prims.of_int (0x78))]
let (test2_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x66));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x4b));
    (Prims.of_int (0xd4));
    (Prims.of_int (0xef));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x88));
    (Prims.of_int (0x4c));
    (Prims.of_int (0xfa));
    (Prims.of_int (0x59));
    (Prims.of_int (0xca));
    (Prims.of_int (0x34));
    (Prims.of_int (0x2b));
    (Prims.of_int (0x2e))]
let (test2_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xf3));
    (Prims.of_int (0x8c));
    (Prims.of_int (0xbb));
    (Prims.of_int (0x1a));
    (Prims.of_int (0xd6));
    (Prims.of_int (0x92));
    (Prims.of_int (0x23));
    (Prims.of_int (0xdc));
    (Prims.of_int (0xc3));
    (Prims.of_int (0x45));
    (Prims.of_int (0x7a));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xb6));
    (Prims.of_int (0xb0));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x85))]
let (test2_nonce_length : Prims.nat) = (Prims.of_int (12))
let (test2_msg_length : Prims.nat) = (Prims.of_int (16))
let (test2_aad_length : Prims.nat) = Prims.int_zero
let (test2_c_length : Prims.nat) = (Prims.of_int (16))
let (test3_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xff));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x92));
    (Prims.of_int (0x86));
    (Prims.of_int (0x65));
    (Prims.of_int (0x73));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x6d));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x94));
    (Prims.of_int (0x67));
    (Prims.of_int (0x30));
    (Prims.of_int (0x83));
    (Prims.of_int (0x08))]
let (test3_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xca));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xba));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xdb));
    (Prims.of_int (0xad));
    (Prims.of_int (0xde));
    (Prims.of_int (0xca));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x88))]
let (test3_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xd9));
    (Prims.of_int (0x31));
    (Prims.of_int (0x32));
    (Prims.of_int (0x25));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x84));
    (Prims.of_int (0x06));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xa5));
    (Prims.of_int (0x59));
    (Prims.of_int (0x09));
    (Prims.of_int (0xc5));
    (Prims.of_int (0xaf));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x26));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x86));
    (Prims.of_int (0xa7));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x53));
    (Prims.of_int (0x15));
    (Prims.of_int (0x34));
    (Prims.of_int (0xf7));
    (Prims.of_int (0xda));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x30));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x31));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x72));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x0c));
    (Prims.of_int (0x95));
    (Prims.of_int (0x95));
    (Prims.of_int (0x68));
    (Prims.of_int (0x09));
    (Prims.of_int (0x53));
    (Prims.of_int (0x2f));
    (Prims.of_int (0xcf));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x24));
    (Prims.of_int (0x49));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xb5));
    (Prims.of_int (0x25));
    (Prims.of_int (0xb1));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xed));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x0d));
    (Prims.of_int (0xe6));
    (Prims.of_int (0x57));
    (Prims.of_int (0xba));
    (Prims.of_int (0x63));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x39));
    (Prims.of_int (0x1a));
    (Prims.of_int (0xaf));
    (Prims.of_int (0xd2));
    (Prims.of_int (0x55))]
let (test3_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test3_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x42));
    (Prims.of_int (0x83));
    (Prims.of_int (0x1e));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x21));
    (Prims.of_int (0x77));
    (Prims.of_int (0x74));
    (Prims.of_int (0x24));
    (Prims.of_int (0x4b));
    (Prims.of_int (0x72));
    (Prims.of_int (0x21));
    (Prims.of_int (0xb7));
    (Prims.of_int (0x84));
    (Prims.of_int (0xd0));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x9c));
    (Prims.of_int (0xe3));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x21));
    (Prims.of_int (0x2f));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x02));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x35));
    (Prims.of_int (0xc1));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x23));
    (Prims.of_int (0x29));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x21));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x14));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x54));
    (Prims.of_int (0x66));
    (Prims.of_int (0x93));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x7d));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x84));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x05));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x0b));
    (Prims.of_int (0x39));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x97));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x58));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x91));
    (Prims.of_int (0x47));
    (Prims.of_int (0x3f));
    (Prims.of_int (0x59));
    (Prims.of_int (0x85));
    (Prims.of_int (0x4d));
    (Prims.of_int (0x5c));
    (Prims.of_int (0x2a));
    (Prims.of_int (0xf3));
    (Prims.of_int (0x27));
    (Prims.of_int (0xcd));
    (Prims.of_int (0x64));
    (Prims.of_int (0xa6));
    (Prims.of_int (0x2c));
    (Prims.of_int (0xf3));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xbd));
    (Prims.of_int (0x2b));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xb4))]
let (test3_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x42));
    (Prims.of_int (0x83));
    (Prims.of_int (0x1e));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x21));
    (Prims.of_int (0x77));
    (Prims.of_int (0x74));
    (Prims.of_int (0x24));
    (Prims.of_int (0x4b));
    (Prims.of_int (0x72));
    (Prims.of_int (0x21));
    (Prims.of_int (0xb7));
    (Prims.of_int (0x84));
    (Prims.of_int (0xd0));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x9c));
    (Prims.of_int (0xe3));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x21));
    (Prims.of_int (0x2f));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x02));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x35));
    (Prims.of_int (0xc1));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x23));
    (Prims.of_int (0x29));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x21));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x14));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x54));
    (Prims.of_int (0x66));
    (Prims.of_int (0x93));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x7d));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x84));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x05));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x0b));
    (Prims.of_int (0x39));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x97));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x58));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x91));
    (Prims.of_int (0x47));
    (Prims.of_int (0x3f));
    (Prims.of_int (0x59));
    (Prims.of_int (0x85))]
let (test3_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xb8));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x53));
    (Prims.of_int (0x37));
    (Prims.of_int (0x08));
    (Prims.of_int (0xbf));
    (Prims.of_int (0x53));
    (Prims.of_int (0x5d));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x29));
    (Prims.of_int (0x80));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x78))]
let (test3_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x7f));
    (Prims.of_int (0x1b));
    (Prims.of_int (0x32));
    (Prims.of_int (0xb8));
    (Prims.of_int (0x1b));
    (Prims.of_int (0x82));
    (Prims.of_int (0x0d));
    (Prims.of_int (0x02));
    (Prims.of_int (0x61));
    (Prims.of_int (0x4f));
    (Prims.of_int (0x88));
    (Prims.of_int (0x95));
    (Prims.of_int (0xac));
    (Prims.of_int (0x1d));
    (Prims.of_int (0x4e));
    (Prims.of_int (0xac))]
let (test3_nonce_length : Prims.nat) = (Prims.of_int (12))
let (test3_msg_length : Prims.nat) = (Prims.of_int (64))
let (test3_aad_length : Prims.nat) = Prims.int_zero
let (test3_c_length : Prims.nat) = (Prims.of_int (64))
let (test4_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xff));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x92));
    (Prims.of_int (0x86));
    (Prims.of_int (0x65));
    (Prims.of_int (0x73));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x6d));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x94));
    (Prims.of_int (0x67));
    (Prims.of_int (0x30));
    (Prims.of_int (0x83));
    (Prims.of_int (0x08))]
let (test4_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xca));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xba));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xdb));
    (Prims.of_int (0xad));
    (Prims.of_int (0xde));
    (Prims.of_int (0xca));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x88))]
let (test4_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xd9));
    (Prims.of_int (0x31));
    (Prims.of_int (0x32));
    (Prims.of_int (0x25));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x84));
    (Prims.of_int (0x06));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xa5));
    (Prims.of_int (0x59));
    (Prims.of_int (0x09));
    (Prims.of_int (0xc5));
    (Prims.of_int (0xaf));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x26));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x86));
    (Prims.of_int (0xa7));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x53));
    (Prims.of_int (0x15));
    (Prims.of_int (0x34));
    (Prims.of_int (0xf7));
    (Prims.of_int (0xda));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x30));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x31));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x72));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x0c));
    (Prims.of_int (0x95));
    (Prims.of_int (0x95));
    (Prims.of_int (0x68));
    (Prims.of_int (0x09));
    (Prims.of_int (0x53));
    (Prims.of_int (0x2f));
    (Prims.of_int (0xcf));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x24));
    (Prims.of_int (0x49));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xb5));
    (Prims.of_int (0x25));
    (Prims.of_int (0xb1));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xed));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x0d));
    (Prims.of_int (0xe6));
    (Prims.of_int (0x57));
    (Prims.of_int (0xba));
    (Prims.of_int (0x63));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x39))]
let (test4_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xab));
    (Prims.of_int (0xad));
    (Prims.of_int (0xda));
    (Prims.of_int (0xd2))]
let (test4_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x42));
    (Prims.of_int (0x83));
    (Prims.of_int (0x1e));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x21));
    (Prims.of_int (0x77));
    (Prims.of_int (0x74));
    (Prims.of_int (0x24));
    (Prims.of_int (0x4b));
    (Prims.of_int (0x72));
    (Prims.of_int (0x21));
    (Prims.of_int (0xb7));
    (Prims.of_int (0x84));
    (Prims.of_int (0xd0));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x9c));
    (Prims.of_int (0xe3));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x21));
    (Prims.of_int (0x2f));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x02));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x35));
    (Prims.of_int (0xc1));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x23));
    (Prims.of_int (0x29));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x21));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x14));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x54));
    (Prims.of_int (0x66));
    (Prims.of_int (0x93));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x7d));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x84));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x05));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x0b));
    (Prims.of_int (0x39));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x97));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x58));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x91));
    (Prims.of_int (0x5b));
    (Prims.of_int (0xc9));
    (Prims.of_int (0x4f));
    (Prims.of_int (0xbc));
    (Prims.of_int (0x32));
    (Prims.of_int (0x21));
    (Prims.of_int (0xa5));
    (Prims.of_int (0xdb));
    (Prims.of_int (0x94));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xe7));
    (Prims.of_int (0x12));
    (Prims.of_int (0x1a));
    (Prims.of_int (0x47))]
let (test4_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x42));
    (Prims.of_int (0x83));
    (Prims.of_int (0x1e));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x21));
    (Prims.of_int (0x77));
    (Prims.of_int (0x74));
    (Prims.of_int (0x24));
    (Prims.of_int (0x4b));
    (Prims.of_int (0x72));
    (Prims.of_int (0x21));
    (Prims.of_int (0xb7));
    (Prims.of_int (0x84));
    (Prims.of_int (0xd0));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x9c));
    (Prims.of_int (0xe3));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x21));
    (Prims.of_int (0x2f));
    (Prims.of_int (0x2c));
    (Prims.of_int (0x02));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x35));
    (Prims.of_int (0xc1));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x23));
    (Prims.of_int (0x29));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x21));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x14));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x54));
    (Prims.of_int (0x66));
    (Prims.of_int (0x93));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x7d));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x84));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x05));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x0b));
    (Prims.of_int (0x39));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x97));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x58));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x91))]
let (test4_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xb8));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x53));
    (Prims.of_int (0x37));
    (Prims.of_int (0x08));
    (Prims.of_int (0xbf));
    (Prims.of_int (0x53));
    (Prims.of_int (0x5d));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x29));
    (Prims.of_int (0x80));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x78))]
let (test4_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x69));
    (Prims.of_int (0x8e));
    (Prims.of_int (0x57));
    (Prims.of_int (0xf7));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x6e));
    (Prims.of_int (0xcc));
    (Prims.of_int (0x7f));
    (Prims.of_int (0xd9));
    (Prims.of_int (0x46));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x72));
    (Prims.of_int (0x60));
    (Prims.of_int (0xa9));
    (Prims.of_int (0xae));
    (Prims.of_int (0x5f))]
let (test4_nonce_length : Prims.nat) = (Prims.of_int (12))
let (test4_msg_length : Prims.nat) = (Prims.of_int (60))
let (test4_aad_length : Prims.nat) = (Prims.of_int (20))
let (test4_c_length : Prims.nat) = (Prims.of_int (60))
let (test5_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xff));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x92));
    (Prims.of_int (0x86));
    (Prims.of_int (0x65));
    (Prims.of_int (0x73));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x6d));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x94));
    (Prims.of_int (0x67));
    (Prims.of_int (0x30));
    (Prims.of_int (0x83));
    (Prims.of_int (0x08))]
let (test5_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xca));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xba));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xdb));
    (Prims.of_int (0xad))]
let (test5_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xd9));
    (Prims.of_int (0x31));
    (Prims.of_int (0x32));
    (Prims.of_int (0x25));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x84));
    (Prims.of_int (0x06));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xa5));
    (Prims.of_int (0x59));
    (Prims.of_int (0x09));
    (Prims.of_int (0xc5));
    (Prims.of_int (0xaf));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x26));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x86));
    (Prims.of_int (0xa7));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x53));
    (Prims.of_int (0x15));
    (Prims.of_int (0x34));
    (Prims.of_int (0xf7));
    (Prims.of_int (0xda));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x30));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x31));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x72));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x0c));
    (Prims.of_int (0x95));
    (Prims.of_int (0x95));
    (Prims.of_int (0x68));
    (Prims.of_int (0x09));
    (Prims.of_int (0x53));
    (Prims.of_int (0x2f));
    (Prims.of_int (0xcf));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x24));
    (Prims.of_int (0x49));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xb5));
    (Prims.of_int (0x25));
    (Prims.of_int (0xb1));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xed));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x0d));
    (Prims.of_int (0xe6));
    (Prims.of_int (0x57));
    (Prims.of_int (0xba));
    (Prims.of_int (0x63));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x39))]
let (test5_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xab));
    (Prims.of_int (0xad));
    (Prims.of_int (0xda));
    (Prims.of_int (0xd2))]
let (test5_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x61));
    (Prims.of_int (0x35));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x28));
    (Prims.of_int (0x06));
    (Prims.of_int (0x93));
    (Prims.of_int (0x4a));
    (Prims.of_int (0x77));
    (Prims.of_int (0x7f));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x1f));
    (Prims.of_int (0xa2));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x47));
    (Prims.of_int (0x55));
    (Prims.of_int (0x69));
    (Prims.of_int (0x9b));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x71));
    (Prims.of_int (0x4f));
    (Prims.of_int (0xcd));
    (Prims.of_int (0xc6));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x37));
    (Prims.of_int (0x66));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xf9));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x6c));
    (Prims.of_int (0x74));
    (Prims.of_int (0x23));
    (Prims.of_int (0x73));
    (Prims.of_int (0x80));
    (Prims.of_int (0x69));
    Prims.int_zero;
    (Prims.of_int (0xe4));
    (Prims.of_int (0x9f));
    (Prims.of_int (0x24));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x2b));
    (Prims.of_int (0x09));
    (Prims.of_int (0x75));
    (Prims.of_int (0x44));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x89));
    (Prims.of_int (0x6b));
    (Prims.of_int (0x42));
    (Prims.of_int (0x49));
    (Prims.of_int (0x89));
    (Prims.of_int (0xb5));
    (Prims.of_int (0xe1));
    (Prims.of_int (0xeb));
    (Prims.of_int (0xac));
    (Prims.of_int (0x0f));
    (Prims.of_int (0x07));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x3f));
    (Prims.of_int (0x45));
    (Prims.of_int (0x98));
    (Prims.of_int (0x36));
    (Prims.of_int (0x12));
    (Prims.of_int (0xd2));
    (Prims.of_int (0xe7));
    (Prims.of_int (0x9e));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x07));
    (Prims.of_int (0x85));
    (Prims.of_int (0x56));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xe1));
    (Prims.of_int (0x4a));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa2));
    (Prims.of_int (0xfc));
    (Prims.of_int (0xcb))]
let (test5_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x61));
    (Prims.of_int (0x35));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x28));
    (Prims.of_int (0x06));
    (Prims.of_int (0x93));
    (Prims.of_int (0x4a));
    (Prims.of_int (0x77));
    (Prims.of_int (0x7f));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x1f));
    (Prims.of_int (0xa2));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x47));
    (Prims.of_int (0x55));
    (Prims.of_int (0x69));
    (Prims.of_int (0x9b));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x71));
    (Prims.of_int (0x4f));
    (Prims.of_int (0xcd));
    (Prims.of_int (0xc6));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x37));
    (Prims.of_int (0x66));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xf9));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x6c));
    (Prims.of_int (0x74));
    (Prims.of_int (0x23));
    (Prims.of_int (0x73));
    (Prims.of_int (0x80));
    (Prims.of_int (0x69));
    Prims.int_zero;
    (Prims.of_int (0xe4));
    (Prims.of_int (0x9f));
    (Prims.of_int (0x24));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x2b));
    (Prims.of_int (0x09));
    (Prims.of_int (0x75));
    (Prims.of_int (0x44));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x89));
    (Prims.of_int (0x6b));
    (Prims.of_int (0x42));
    (Prims.of_int (0x49));
    (Prims.of_int (0x89));
    (Prims.of_int (0xb5));
    (Prims.of_int (0xe1));
    (Prims.of_int (0xeb));
    (Prims.of_int (0xac));
    (Prims.of_int (0x0f));
    (Prims.of_int (0x07));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x3f));
    (Prims.of_int (0x45));
    (Prims.of_int (0x98))]
let (test5_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xb8));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x53));
    (Prims.of_int (0x37));
    (Prims.of_int (0x08));
    (Prims.of_int (0xbf));
    (Prims.of_int (0x53));
    (Prims.of_int (0x5d));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x29));
    (Prims.of_int (0x80));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x78))]
let (test5_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xdf));
    (Prims.of_int (0x58));
    (Prims.of_int (0x6b));
    (Prims.of_int (0xb4));
    (Prims.of_int (0xc2));
    (Prims.of_int (0x49));
    (Prims.of_int (0xb9));
    (Prims.of_int (0x2c));
    (Prims.of_int (0xb6));
    (Prims.of_int (0x92));
    (Prims.of_int (0x28));
    (Prims.of_int (0x77));
    (Prims.of_int (0xe4));
    (Prims.of_int (0x44));
    (Prims.of_int (0xd3));
    (Prims.of_int (0x7b))]
let (test5_nonce_length : Prims.nat) = (Prims.of_int (8))
let (test5_msg_length : Prims.nat) = (Prims.of_int (60))
let (test5_aad_length : Prims.nat) = (Prims.of_int (20))
let (test5_c_length : Prims.nat) = (Prims.of_int (60))
let (test6_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xff));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x92));
    (Prims.of_int (0x86));
    (Prims.of_int (0x65));
    (Prims.of_int (0x73));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x6d));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x8f));
    (Prims.of_int (0x94));
    (Prims.of_int (0x67));
    (Prims.of_int (0x30));
    (Prims.of_int (0x83));
    (Prims.of_int (0x08))]
let (test6_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x93));
    (Prims.of_int (0x13));
    (Prims.of_int (0x22));
    (Prims.of_int (0x5d));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x84));
    (Prims.of_int (0x06));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x55));
    (Prims.of_int (0x90));
    (Prims.of_int (0x9c));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xff));
    (Prims.of_int (0x52));
    (Prims.of_int (0x69));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x7a));
    (Prims.of_int (0x95));
    (Prims.of_int (0x38));
    (Prims.of_int (0x53));
    (Prims.of_int (0x4f));
    (Prims.of_int (0x7d));
    (Prims.of_int (0xa1));
    (Prims.of_int (0xe4));
    (Prims.of_int (0xc3));
    (Prims.of_int (0x03));
    (Prims.of_int (0xd2));
    (Prims.of_int (0xa3));
    (Prims.of_int (0x18));
    (Prims.of_int (0xa7));
    (Prims.of_int (0x28));
    (Prims.of_int (0xc3));
    (Prims.of_int (0xc0));
    (Prims.of_int (0xc9));
    (Prims.of_int (0x51));
    (Prims.of_int (0x56));
    (Prims.of_int (0x80));
    (Prims.of_int (0x95));
    (Prims.of_int (0x39));
    (Prims.of_int (0xfc));
    (Prims.of_int (0xf0));
    (Prims.of_int (0xe2));
    (Prims.of_int (0x42));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x6b));
    (Prims.of_int (0x52));
    (Prims.of_int (0x54));
    (Prims.of_int (0x16));
    (Prims.of_int (0xae));
    (Prims.of_int (0xdb));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xa0));
    (Prims.of_int (0xde));
    (Prims.of_int (0x6a));
    (Prims.of_int (0x57));
    (Prims.of_int (0xa6));
    (Prims.of_int (0x37));
    (Prims.of_int (0xb3));
    (Prims.of_int (0x9b))]
let (test6_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xd9));
    (Prims.of_int (0x31));
    (Prims.of_int (0x32));
    (Prims.of_int (0x25));
    (Prims.of_int (0xf8));
    (Prims.of_int (0x84));
    (Prims.of_int (0x06));
    (Prims.of_int (0xe5));
    (Prims.of_int (0xa5));
    (Prims.of_int (0x59));
    (Prims.of_int (0x09));
    (Prims.of_int (0xc5));
    (Prims.of_int (0xaf));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x26));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x86));
    (Prims.of_int (0xa7));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x53));
    (Prims.of_int (0x15));
    (Prims.of_int (0x34));
    (Prims.of_int (0xf7));
    (Prims.of_int (0xda));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x30));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x31));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x72));
    (Prims.of_int (0x1c));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x0c));
    (Prims.of_int (0x95));
    (Prims.of_int (0x95));
    (Prims.of_int (0x68));
    (Prims.of_int (0x09));
    (Prims.of_int (0x53));
    (Prims.of_int (0x2f));
    (Prims.of_int (0xcf));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x24));
    (Prims.of_int (0x49));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xb5));
    (Prims.of_int (0x25));
    (Prims.of_int (0xb1));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xed));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xaa));
    (Prims.of_int (0x0d));
    (Prims.of_int (0xe6));
    (Prims.of_int (0x57));
    (Prims.of_int (0xba));
    (Prims.of_int (0x63));
    (Prims.of_int (0x7b));
    (Prims.of_int (0x39))]
let (test6_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xed));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xce));
    (Prims.of_int (0xde));
    (Prims.of_int (0xad));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xef));
    (Prims.of_int (0xab));
    (Prims.of_int (0xad));
    (Prims.of_int (0xda));
    (Prims.of_int (0xd2))]
let (test6_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x8c));
    (Prims.of_int (0xe2));
    (Prims.of_int (0x49));
    (Prims.of_int (0x98));
    (Prims.of_int (0x62));
    (Prims.of_int (0x56));
    (Prims.of_int (0x15));
    (Prims.of_int (0xb6));
    (Prims.of_int (0x03));
    (Prims.of_int (0xa0));
    (Prims.of_int (0x33));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x3f));
    (Prims.of_int (0xb8));
    (Prims.of_int (0x94));
    (Prims.of_int (0xbe));
    (Prims.of_int (0x91));
    (Prims.of_int (0x12));
    (Prims.of_int (0xa5));
    (Prims.of_int (0xc3));
    (Prims.of_int (0xa2));
    (Prims.of_int (0x11));
    (Prims.of_int (0xa8));
    (Prims.of_int (0xba));
    (Prims.of_int (0x26));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x3c));
    (Prims.of_int (0xca));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x2c));
    (Prims.of_int (0xa7));
    Prims.int_one;
    (Prims.of_int (0xe4));
    (Prims.of_int (0xa9));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xfb));
    (Prims.of_int (0xa4));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x90));
    (Prims.of_int (0xcc));
    (Prims.of_int (0xdc));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x81));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x8c));
    (Prims.of_int (0x7c));
    (Prims.of_int (0x6f));
    (Prims.of_int (0xd6));
    (Prims.of_int (0x28));
    (Prims.of_int (0x75));
    (Prims.of_int (0xd2));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa4));
    (Prims.of_int (0x17));
    (Prims.of_int (0x03));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x34));
    (Prims.of_int (0xae));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x61));
    (Prims.of_int (0x9c));
    (Prims.of_int (0xc5));
    (Prims.of_int (0xae));
    (Prims.of_int (0xff));
    (Prims.of_int (0xfe));
    (Prims.of_int (0x0b));
    (Prims.of_int (0xfa));
    (Prims.of_int (0x46));
    (Prims.of_int (0x2a));
    (Prims.of_int (0xf4));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x16));
    (Prims.of_int (0x99));
    (Prims.of_int (0xd0));
    (Prims.of_int (0x50))]
let (test6_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x8c));
    (Prims.of_int (0xe2));
    (Prims.of_int (0x49));
    (Prims.of_int (0x98));
    (Prims.of_int (0x62));
    (Prims.of_int (0x56));
    (Prims.of_int (0x15));
    (Prims.of_int (0xb6));
    (Prims.of_int (0x03));
    (Prims.of_int (0xa0));
    (Prims.of_int (0x33));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x3f));
    (Prims.of_int (0xb8));
    (Prims.of_int (0x94));
    (Prims.of_int (0xbe));
    (Prims.of_int (0x91));
    (Prims.of_int (0x12));
    (Prims.of_int (0xa5));
    (Prims.of_int (0xc3));
    (Prims.of_int (0xa2));
    (Prims.of_int (0x11));
    (Prims.of_int (0xa8));
    (Prims.of_int (0xba));
    (Prims.of_int (0x26));
    (Prims.of_int (0x2a));
    (Prims.of_int (0x3c));
    (Prims.of_int (0xca));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x2c));
    (Prims.of_int (0xa7));
    Prims.int_one;
    (Prims.of_int (0xe4));
    (Prims.of_int (0xa9));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xfb));
    (Prims.of_int (0xa4));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x90));
    (Prims.of_int (0xcc));
    (Prims.of_int (0xdc));
    (Prims.of_int (0xb2));
    (Prims.of_int (0x81));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x8c));
    (Prims.of_int (0x7c));
    (Prims.of_int (0x6f));
    (Prims.of_int (0xd6));
    (Prims.of_int (0x28));
    (Prims.of_int (0x75));
    (Prims.of_int (0xd2));
    (Prims.of_int (0xac));
    (Prims.of_int (0xa4));
    (Prims.of_int (0x17));
    (Prims.of_int (0x03));
    (Prims.of_int (0x4c));
    (Prims.of_int (0x34));
    (Prims.of_int (0xae));
    (Prims.of_int (0xe5))]
let (test6_hash_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xb8));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x53));
    (Prims.of_int (0x37));
    (Prims.of_int (0x08));
    (Prims.of_int (0xbf));
    (Prims.of_int (0x53));
    (Prims.of_int (0x5d));
    (Prims.of_int (0x0a));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x29));
    (Prims.of_int (0x80));
    (Prims.of_int (0xd5));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x78))]
let (test6_ghash : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x1c));
    (Prims.of_int (0x5a));
    (Prims.of_int (0xfe));
    (Prims.of_int (0x97));
    (Prims.of_int (0x60));
    (Prims.of_int (0xd3));
    (Prims.of_int (0x93));
    (Prims.of_int (0x2f));
    (Prims.of_int (0x3c));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x87));
    (Prims.of_int (0x8a));
    (Prims.of_int (0xac));
    (Prims.of_int (0x3d));
    (Prims.of_int (0xc3));
    (Prims.of_int (0xde))]
let (test6_nonce_length : Prims.nat) = (Prims.of_int (60))
let (test6_msg_length : Prims.nat) = (Prims.of_int (60))
let (test6_aad_length : Prims.nat) = (Prims.of_int (20))
let (test6_c_length : Prims.nat) = (Prims.of_int (60))
let (test7_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test7_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero]
let (test7_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test7_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test7_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x53));
    (Prims.of_int (0xe20f));
    (Prims.of_int (0x8a));
    (Prims.of_int (0xfd));
    (Prims.of_int (0xc7));
    (Prims.of_int (0x45));
    (Prims.of_int (0x36));
    (Prims.of_int (0xb9));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x63));
    (Prims.of_int (0xd4));
    (Prims.of_int (0xf1));
    (Prims.of_int (0xc4));
    (Prims.of_int (0xcd));
    (Prims.of_int (0x73));
    (Prims.of_int (0x8b))]
let (test7_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n) []
let (test8_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x84));
    (Prims.of_int (0x0f));
    (Prims.of_int (0x02));
    (Prims.of_int (0xff));
    (Prims.of_int (0x9b));
    (Prims.of_int (0xa0));
    (Prims.of_int (0xa8));
    (Prims.of_int (0x8a));
    (Prims.of_int (0x8b));
    (Prims.of_int (0xde));
    (Prims.of_int (0x50));
    (Prims.of_int (0x66));
    (Prims.of_int (0xa6));
    (Prims.of_int (0x60));
    (Prims.of_int (0x89));
    (Prims.of_int (0x20));
    (Prims.of_int (0xfd));
    (Prims.of_int (0x7a));
    (Prims.of_int (0xab));
    (Prims.of_int (0xa4));
    (Prims.of_int (0xed));
    (Prims.of_int (0xa1));
    (Prims.of_int (0x0e));
    (Prims.of_int (0x93));
    Prims.int_one;
    (Prims.of_int (0x68));
    (Prims.of_int (0x35));
    (Prims.of_int (0x7d));
    (Prims.of_int (0xca));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xb9));
    (Prims.of_int (0x42))]
let (test8_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xad));
    (Prims.of_int (0x77));
    (Prims.of_int (0x02));
    (Prims.of_int (0xeb));
    (Prims.of_int (0xd4));
    (Prims.of_int (0x6f));
    (Prims.of_int (0xeb));
    (Prims.of_int (0x36));
    (Prims.of_int (0xb0));
    (Prims.of_int (0x6a));
    (Prims.of_int (0xad));
    (Prims.of_int (0xb4))]
let (test8_msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x73));
    (Prims.of_int (0xf2));
    (Prims.of_int (0xd6));
    (Prims.of_int (0xda));
    (Prims.of_int (0x5f));
    (Prims.of_int (0x4e));
    (Prims.of_int (0x03));
    (Prims.of_int (0x28));
    (Prims.of_int (0x6b));
    (Prims.of_int (0x05));
    (Prims.of_int (0x29));
    (Prims.of_int (0x66));
    (Prims.of_int (0xc3));
    (Prims.of_int (0xd6));
    (Prims.of_int (0xe8));
    (Prims.of_int (0xf6))]
let (test8_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x2c));
    (Prims.of_int (0x3b));
    (Prims.of_int (0x09));
    (Prims.of_int (0x03));
    (Prims.of_int (0xe7));
    (Prims.of_int (0x7d));
    (Prims.of_int (0xc8));
    (Prims.of_int (0xa1));
    (Prims.of_int (0xb3));
    (Prims.of_int (0x78));
    (Prims.of_int (0xf6));
    (Prims.of_int (0xd1));
    (Prims.of_int (0xb5));
    (Prims.of_int (0x6e));
    (Prims.of_int (0xbd));
    (Prims.of_int (0x8b));
    (Prims.of_int (0xf5));
    (Prims.of_int (0x65));
    (Prims.of_int (0x57));
    (Prims.of_int (0xb3))]
let (test8_expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xc7));
    (Prims.of_int (0xf2));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x47));
    (Prims.of_int (0x88));
    (Prims.of_int (0xad));
    (Prims.of_int (0xf6));
    (Prims.of_int (0x6e));
    (Prims.of_int (0x66));
    (Prims.of_int (0x87));
    (Prims.of_int (0x19));
    Prims.int_zero;
    (Prims.of_int (0x2f));
    (Prims.of_int (0x59));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x2e));
    (Prims.of_int (0xf2));
    (Prims.of_int (0x76));
    (Prims.of_int (0x3a));
    (Prims.of_int (0xfe));
    (Prims.of_int (0xde));
    (Prims.of_int (0x44));
    (Prims.of_int (0x52));
    (Prims.of_int (0xbe));
    (Prims.of_int (0x55));
    (Prims.of_int (0x93));
    (Prims.of_int (0x16));
    (Prims.of_int (0x9a));
    (Prims.of_int (0x13))]
let (test8_tag : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xc7));
    (Prims.of_int (0xf2));
    (Prims.of_int (0xe0));
    (Prims.of_int (0x47));
    (Prims.of_int (0x88));
    (Prims.of_int (0xad));
    (Prims.of_int (0xf6));
    (Prims.of_int (0x6e));
    (Prims.of_int (0x66));
    (Prims.of_int (0x87));
    (Prims.of_int (0x19));
    Prims.int_zero;
    (Prims.of_int (0x2f));
    (Prims.of_int (0x59));
    (Prims.of_int (0xa9));
    (Prims.of_int (0x2e))]
let (test_aesgcm :
  Spec_AES.variant ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            Prims.nat ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                    Prims.nat -> Prims.bool)
  =
  fun v ->
    fun text_len ->
      fun text ->
        fun aad_len ->
          fun aad ->
            fun n_len ->
              fun n ->
                fun k ->
                  fun expected ->
                    fun i ->
                      FStar_IO.print_string
                        " ================================ CIPHER ";
                      FStar_IO.print_string
                        (FStar_UInt8.to_string (FStar_UInt8.uint_to_t i));
                      FStar_IO.print_string
                        " ================================\n";
                      (let output = Spec_AES_GCM.aead_encrypt v k n text aad in
                       let ciphertext =
                         Lib_Sequence.sub (Lib_Sequence.length output)
                           (Lib_Sequence.to_lseq output) Prims.int_zero
                           ((Lib_Sequence.length output) -
                              (Prims.of_int (16))) in
                       let mac =
                         Lib_Sequence.sub (Lib_Sequence.length output)
                           (Lib_Sequence.to_lseq output)
                           ((Lib_Sequence.length output) -
                              (Prims.of_int (16))) (Prims.of_int (16)) in
                       let decrypted =
                         Spec_AES_GCM.aead_decrypt v k n aad ciphertext mac in
                       let result0 =
                         Lib_Sequence.for_all2
                           ((Lib_Sequence.length output) -
                              (Prims.of_int (16)))
                           (fun a ->
                              fun b ->
                                (Lib_IntTypes.v Lib_IntTypes.U8
                                   Lib_IntTypes.SEC (Obj.magic a))
                                  =
                                  (Lib_IntTypes.v Lib_IntTypes.U8
                                     Lib_IntTypes.SEC (Obj.magic b)))
                           ciphertext expected in
                       let result1 =
                         match decrypted with
                         | FStar_Pervasives_Native.Some dec ->
                             Lib_Sequence.for_all2 text_len
                               (fun a ->
                                  fun b ->
                                    (Lib_IntTypes.v Lib_IntTypes.U8
                                       Lib_IntTypes.SEC (Obj.magic a))
                                      =
                                      (Lib_IntTypes.v Lib_IntTypes.U8
                                         Lib_IntTypes.SEC (Obj.magic b))) dec
                               text
                         | FStar_Pervasives_Native.None -> false in
                       if result0 && result1
                       then (FStar_IO.print_string "Success!\n"; true)
                       else
                         (FStar_IO.print_string "Failure!\n";
                          FStar_IO.print_string "\nExpected ciphertext: ";
                          FStar_List.iter
                            (fun a ->
                               FStar_IO.print_uint8 a;
                               FStar_IO.print_string ":")
                            (Lib_Sequence.to_list expected);
                          FStar_IO.print_string "\nComputed ciphertext: ";
                          FStar_List.iter
                            (fun a ->
                               FStar_IO.print_uint8 a;
                               FStar_IO.print_string ":")
                            (Lib_Sequence.to_list ciphertext);
                          FStar_IO.print_string "\nExpected plaintext: ";
                          FStar_List.iter
                            (fun a ->
                               FStar_IO.print_uint8 a;
                               FStar_IO.print_string ":")
                            (Lib_Sequence.to_list text);
                          (match decrypted with
                           | FStar_Pervasives_Native.Some dec ->
                               (FStar_IO.print_string
                                  "\nComputed plaintext: ";
                                FStar_List.iter
                                  (fun a ->
                                     FStar_IO.print_uint8 a;
                                     FStar_IO.print_string ":")
                                  (Lib_Sequence.to_list dec);
                                FStar_IO.print_string "\n")
                           | FStar_Pervasives_Native.None ->
                               FStar_IO.print_string
                                 "\n AEAD decryption failed!\n");
                          false))
let (test_ghash :
  Spec_AES.variant ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                Prims.nat -> Prims.bool)
  =
  fun v ->
    fun expected ->
      fun text_len ->
        fun text ->
          fun aad_len ->
            fun aad ->
              fun k ->
                fun i ->
                  FStar_IO.print_string
                    " ================================ GHASH ";
                  FStar_IO.print_string
                    (FStar_UInt8.to_string (FStar_UInt8.uint_to_t i));
                  FStar_IO.print_string " ================================\n";
                  (let k1 =
                     Spec_AES.aes_ctr_key_block0 v k (Prims.of_int (12))
                       (Lib_Sequence.create (Prims.of_int (12))
                          (FStar_UInt8.uint_to_t Prims.int_zero)) in
                   let output =
                     Spec_AES_GCM.ghash text aad (Obj.magic k1)
                       (Lib_Sequence.create (Prims.of_int (16))
                          (FStar_UInt8.uint_to_t Prims.int_zero)) in
                   let result =
                     Lib_Sequence.for_all2 Spec_GF128.size_block
                       (fun a ->
                          fun b ->
                            (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                               (Obj.magic a))
                              =
                              (Lib_IntTypes.v Lib_IntTypes.U8
                                 Lib_IntTypes.SEC (Obj.magic b))) output
                       expected in
                   if result
                   then (FStar_IO.print_string "Success!\n"; true)
                   else
                     (FStar_IO.print_string "Failure :(\n";
                      FStar_IO.print_string "Expected tag: ";
                      FStar_List.iter
                        (fun a ->
                           FStar_IO.print_uint8 a; FStar_IO.print_string ":")
                        (Lib_Sequence.to_list expected);
                      FStar_IO.print_string "\nComputed tag: ";
                      FStar_List.iter
                        (fun a ->
                           FStar_IO.print_uint8 a; FStar_IO.print_string ":")
                        (Lib_Sequence.to_list output);
                      FStar_IO.print_string "\n";
                      false))
let (test : unit -> Prims.bool) =
  fun uu____4623 ->
    FStar_IO.print_string "\nComputed hash key: ";
    FStar_List.iter
      (fun a -> FStar_IO.print_uint8 a; FStar_IO.print_string ":")
      (Obj.magic
         (Lib_Sequence.to_list
            (Spec_AES.aes128_ctr_key_block0 (Lib_Sequence.of_list test2_key)
               (Prims.of_int (12))
               (Lib_Sequence.create (Prims.of_int (12))
                  (FStar_UInt8.uint_to_t Prims.int_zero)))));
    FStar_IO.print_string "\n";
    FStar_IO.print_string "\nExpected hash key: ";
    FStar_List.iter
      (fun a -> FStar_IO.print_uint8 a; FStar_IO.print_string ":")
      test2_hash_key;
    FStar_IO.print_string "\n";
    (let g1 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test1_ghash)
         test1_c_length (Lib_Sequence.of_list test1_ciphertext)
         test1_aad_length (Lib_Sequence.of_list test1_aad)
         (Lib_Sequence.of_list test1_key) Prims.int_one in
     let a1 =
       test_aesgcm Spec_AES.AES128 test1_msg_length
         (Lib_Sequence.of_list test1_msg) test1_aad_length
         (Lib_Sequence.of_list test1_aad) test1_nonce_length
         (Lib_Sequence.of_list test1_nonce) (Lib_Sequence.of_list test1_key)
         (Lib_Sequence.of_list test1_expected) Prims.int_one in
     let g2 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test2_ghash)
         test2_c_length (Lib_Sequence.of_list test2_ciphertext)
         test2_aad_length (Lib_Sequence.of_list test2_aad)
         (Lib_Sequence.of_list test2_key) (Prims.of_int (2)) in
     let a2 =
       test_aesgcm Spec_AES.AES128 test2_msg_length
         (Lib_Sequence.of_list test2_msg) test2_aad_length
         (Lib_Sequence.of_list test2_aad) test2_nonce_length
         (Lib_Sequence.of_list test2_nonce) (Lib_Sequence.of_list test2_key)
         (Lib_Sequence.of_list test2_expected) (Prims.of_int (2)) in
     let g3 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test3_ghash)
         test3_c_length (Lib_Sequence.of_list test3_ciphertext)
         test3_aad_length (Lib_Sequence.of_list test3_aad)
         (Lib_Sequence.of_list test3_key) (Prims.of_int (3)) in
     let a3 =
       test_aesgcm Spec_AES.AES128 test3_msg_length
         (Lib_Sequence.of_list test3_msg) test3_aad_length
         (Lib_Sequence.of_list test3_aad) test3_nonce_length
         (Lib_Sequence.of_list test3_nonce) (Lib_Sequence.of_list test3_key)
         (Lib_Sequence.of_list test3_expected) (Prims.of_int (3)) in
     let g4 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test4_ghash)
         test4_c_length (Lib_Sequence.of_list test4_ciphertext)
         test4_aad_length (Lib_Sequence.of_list test4_aad)
         (Lib_Sequence.of_list test4_key) (Prims.of_int (4)) in
     let a4 =
       test_aesgcm Spec_AES.AES128 test4_msg_length
         (Lib_Sequence.of_list test4_msg) test4_aad_length
         (Lib_Sequence.of_list test4_aad) test4_nonce_length
         (Lib_Sequence.of_list test4_nonce) (Lib_Sequence.of_list test4_key)
         (Lib_Sequence.of_list test4_expected) (Prims.of_int (4)) in
     let g5 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test5_ghash)
         test5_c_length (Lib_Sequence.of_list test5_ciphertext)
         test5_aad_length (Lib_Sequence.of_list test5_aad)
         (Lib_Sequence.of_list test5_key) (Prims.of_int (5)) in
     let g6 =
       test_ghash Spec_AES.AES128 (Lib_Sequence.of_list test6_ghash)
         test6_c_length (Lib_Sequence.of_list test6_ciphertext)
         test6_aad_length (Lib_Sequence.of_list test6_aad)
         (Lib_Sequence.of_list test6_key) (Prims.of_int (6)) in
     let a7 =
       test_aesgcm Spec_AES.AES256 (FStar_List_Tot_Base.length test7_msg)
         (Lib_Sequence.of_list test7_msg)
         (FStar_List_Tot_Base.length test7_aad)
         (Lib_Sequence.of_list test7_aad)
         (FStar_List_Tot_Base.length test7_nonce)
         (Lib_Sequence.of_list test7_nonce) (Lib_Sequence.of_list test7_key)
         (Lib_Sequence.of_list test7_expected) (Prims.of_int (7)) in
     let a8 =
       test_aesgcm Spec_AES.AES256 (FStar_List_Tot_Base.length test8_msg)
         (Lib_Sequence.of_list test8_msg)
         (FStar_List_Tot_Base.length test8_aad)
         (Lib_Sequence.of_list test8_aad)
         (FStar_List_Tot_Base.length test8_nonce)
         (Lib_Sequence.of_list test8_nonce) (Lib_Sequence.of_list test8_key)
         (Lib_Sequence.of_list test8_expected) (Prims.of_int (8)) in
     ((((((((((g1 && a1) && g2) && a2) && g3) && a3) && g4) && a4) && g5) &&
         g6)
        && a7)
       && a8)