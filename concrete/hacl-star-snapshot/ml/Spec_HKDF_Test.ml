open Prims
let (test1_hash : Spec_Hash_Definitions.hash_alg) =
  Spec_Hash_Definitions.SHA2_256
let (test1_ikm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b))]
let (test1_salt : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c))]
let (test1_info : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9))]
let (test1_len : Prims.int) = (Prims.of_int (42))
let (test1_expected_prk : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x84));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5))]
let (test1_expected_okm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65))]
let (test2_hash : Spec_Hash_Definitions.hash_alg) =
  Spec_Hash_Definitions.SHA2_256
let (test2_ikm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f))]
let (test2_salt : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
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
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf))]
let (test2_info : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff))]
let (test2_len : Prims.int) = (Prims.of_int (82))
let (test2_expected_prk : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44))]
let (test2_expected_okm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87))]
let (test3_hash : Spec_Hash_Definitions.hash_alg) =
  Spec_Hash_Definitions.SHA2_256
let (test3_ikm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b))]
let (test3_salt : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x) []
let (test3_info : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x) []
let (test3_len : Prims.int) = (Prims.of_int (42))
let (test3_expected_prk : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04))]
let (test3_expected_okm : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8))]
let (test : unit -> Prims.bool) =
  fun uu___ ->
    FStar_IO.print_string "\nTEST 1\n";
    (let test1_ikm_len = FStar_List_Tot_Base.length test1_ikm in
     let test1_ikm1 = Lib_Sequence.of_list test1_ikm in
     let test1_salt_len = FStar_List_Tot_Base.length test1_salt in
     let test1_salt1 = Lib_Sequence.of_list test1_salt in
     let test1_info_len = FStar_List_Tot_Base.length test1_info in
     let test1_info1 = Lib_Sequence.of_list test1_info in
     let test1_expected_prk_len =
       FStar_List_Tot_Base.length test1_expected_prk in
     let test1_expected_prk1 = Lib_Sequence.of_list test1_expected_prk in
     let test1_expected_okm_len =
       FStar_List_Tot_Base.length test1_expected_okm in
     let test1_expected_okm1 = Lib_Sequence.of_list test1_expected_okm in
     let test1_prk =
       Spec_Agile_HKDF.extract test1_hash test1_salt1 test1_ikm1 in
     let test1_okm =
       Spec_Agile_HKDF.expand test1_hash test1_expected_prk1 test1_info1
         test1_len in
     let r1_a =
       Lib_Sequence.for_all2 test1_expected_prk_len
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected_prk1 test1_prk in
     let r1_b =
       Lib_Sequence.for_all2 test1_expected_okm_len
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected_okm1 test1_okm in
     FStar_IO.print_string "\nExpected PRK: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected_prk1);
     FStar_IO.print_string "\nComputed PRK: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_prk);
     FStar_IO.print_string "\nExpected OKM: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected_okm1);
     FStar_IO.print_string "\nComputed OKM: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_okm);
     if r1_a
     then FStar_IO.print_string "\nHKDF Extract: Success!\n"
     else FStar_IO.print_string "\nHKDF Extract: Failure :(\n";
     if r1_b
     then FStar_IO.print_string "HKDF Expand: Success!\n"
     else FStar_IO.print_string "HKDF Expand: Failure :(\n";
     FStar_IO.print_string "\nTEST 2\n";
     (let test2_ikm_len = FStar_List_Tot_Base.length test2_ikm in
      let test2_ikm1 = Lib_Sequence.of_list test2_ikm in
      let test2_salt_len = FStar_List_Tot_Base.length test2_salt in
      let test2_salt1 = Lib_Sequence.of_list test2_salt in
      let test2_info_len = FStar_List_Tot_Base.length test2_info in
      let test2_info1 = Lib_Sequence.of_list test2_info in
      let test2_expected_prk_len =
        FStar_List_Tot_Base.length test2_expected_prk in
      let test2_expected_prk1 = Lib_Sequence.of_list test2_expected_prk in
      let test2_expected_okm_len =
        FStar_List_Tot_Base.length test2_expected_okm in
      let test2_expected_okm1 = Lib_Sequence.of_list test2_expected_okm in
      let test2_prk =
        Spec_Agile_HKDF.extract test2_hash test2_salt1 test2_ikm1 in
      let test2_okm =
        Spec_Agile_HKDF.expand test2_hash test2_expected_prk1 test2_info1
          test2_len in
      let r2_a =
        Lib_Sequence.for_all2 test2_expected_prk_len
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected_prk1 test2_prk in
      let r2_b =
        Lib_Sequence.for_all2 test2_expected_okm_len
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected_okm1 test2_okm in
      FStar_IO.print_string "\nExpected PRK: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected_prk1);
      FStar_IO.print_string "\nComputed PRK: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_prk);
      FStar_IO.print_string "\nExpected OKM: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected_okm1);
      FStar_IO.print_string "\nComputed OKM: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_okm);
      if r2_a
      then FStar_IO.print_string "\nHKDF Extract: Success!\n"
      else FStar_IO.print_string "\nHKDF Extract: Failure :(\n";
      if r2_b
      then FStar_IO.print_string "HKDF Expand: Success!\n"
      else FStar_IO.print_string "HKDF Expand: Failure :(\n";
      FStar_IO.print_string "\nTEST 3\n";
      (let test3_ikm_len = FStar_List_Tot_Base.length test3_ikm in
       let test3_ikm1 = Lib_Sequence.of_list test3_ikm in
       let test3_salt_len = FStar_List_Tot_Base.length test3_salt in
       let test3_salt1 = Lib_Sequence.of_list test3_salt in
       let test3_info_len = FStar_List_Tot_Base.length test3_info in
       let test3_info1 = Lib_Sequence.of_list test3_info in
       let test3_expected_prk_len =
         FStar_List_Tot_Base.length test3_expected_prk in
       let test3_expected_prk1 = Lib_Sequence.of_list test3_expected_prk in
       let test3_expected_okm_len =
         FStar_List_Tot_Base.length test3_expected_okm in
       let test3_expected_okm1 = Lib_Sequence.of_list test3_expected_okm in
       let test3_prk =
         Spec_Agile_HKDF.extract test3_hash test3_salt1 test3_ikm1 in
       let test3_okm =
         Spec_Agile_HKDF.expand test3_hash test3_expected_prk1 test3_info1
           test3_len in
       let r3_a =
         Lib_Sequence.for_all2 test3_expected_prk_len
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected_prk1 test3_prk in
       let r3_b =
         Lib_Sequence.for_all2 test3_expected_okm_len
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected_okm1 test3_okm in
       FStar_IO.print_string "\nExpected PRK: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected_prk1);
       FStar_IO.print_string "\nComputed PRK: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_prk);
       FStar_IO.print_string "\nExpected OKM: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected_okm1);
       FStar_IO.print_string "\nComputed OKM: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_okm);
       if r3_a
       then FStar_IO.print_string "\nHKDF Extract: Success!\n"
       else FStar_IO.print_string "\nHKDF Extract: Failure :(\n";
       if r3_b
       then FStar_IO.print_string "HKDF Expand: Success!\n"
       else FStar_IO.print_string "HKDF Expand: Failure :(\n";
       if ((((r1_a && r1_b) && r2_a) && r2_b) && r3_a) && r3_b
       then (FStar_IO.print_string "\nComposite result: Success!\n"; true)
       else (FStar_IO.print_string "\nComposite result: Failure :(\n"; false))))