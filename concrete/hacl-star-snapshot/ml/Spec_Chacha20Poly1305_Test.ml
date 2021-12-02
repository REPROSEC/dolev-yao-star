open Prims
let (test_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x84));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x97));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f))]
let (test_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47))]
let (test_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e))]
let (test_aad : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7))]
let (test_cipher : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16))]
let (test_mac : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91))]
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let test_key1 = Lib_Sequence.of_list test_key in
    let test_nonce1 = Lib_Sequence.of_list test_nonce in
    let test_plaintext1 = Lib_Sequence.of_list test_plaintext in
    let test_aad1 = Lib_Sequence.of_list test_aad in
    let test_cipher1 = Lib_Sequence.of_list test_cipher in
    let test_mac1 = Lib_Sequence.of_list test_mac in
    let enc =
      Spec_Chacha20Poly1305.aead_encrypt test_key1 test_nonce1
        test_plaintext1 test_aad1 in
    let cipher = FStar_Seq_Base.slice enc Prims.int_zero (Prims.of_int (114)) in
    let mac =
      FStar_Seq_Base.slice enc (Prims.of_int (114)) (Prims.of_int (130)) in
    let dec =
      Spec_Chacha20Poly1305.aead_decrypt test_key1 test_nonce1 test_cipher1
        test_mac1 test_aad1 in
    let result_c =
      Lib_Sequence.for_all2 (Prims.of_int (114))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        cipher test_cipher1 in
    let result_m =
      Lib_Sequence.for_all2 (Prims.of_int (16))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        mac test_mac1 in
    let result_p =
      (FStar_Pervasives_Native.uu___is_Some dec) &&
        (Lib_Sequence.for_all2 (Lib_Sequence.length test_cipher1)
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b)))
           (FStar_Pervasives_Native.__proj__Some__item__v dec)
           test_plaintext1) in
    FStar_IO.print_string "Expected cipher:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list test_cipher1);
    FStar_IO.print_string "\nComputed cipher:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list cipher);
    FStar_IO.print_string "\nExpected mac:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list test_mac1);
    FStar_IO.print_string "\nComputed mac:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list mac);
    FStar_IO.print_string "\nExpected plaintext:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list test_plaintext1);
    FStar_IO.print_string "\nComputed plaintext:";
    if FStar_Pervasives_Native.uu___is_Some dec
    then
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list
           (FStar_Pervasives_Native.__proj__Some__item__v dec))
    else ();
    if (result_c && result_m) && result_p
    then (FStar_IO.print_string "\n\nChacha20 : Success!\n"; true)
    else (FStar_IO.print_string "\n\nChacha20: Failure :(\n"; false)