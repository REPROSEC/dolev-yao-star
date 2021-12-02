open Prims
let (test1_ciphersuite :
  (Spec_Agile_DH.algorithm * Spec_Agile_AEAD.alg *
    Spec_Hash_Definitions.hash_alg))
  =
  (Spec_Agile_DH.DH_Curve25519, Spec_Agile_AEAD.AES128_GCM,
    Spec_Hash_Definitions.SHA2_256)
let (test1_info : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e))]
let (test1_skR : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9))]
let (test1_skI : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3))]
let (test1_skE : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66))]
let (test1_psk : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39))]
let (test1_pskID : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61))]
let (test1_pkR : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26))]
let (test1_pkI : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06))]
let (test1_pkE : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d))]
let (test1_enc : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d))]
let (test1_zz : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d))]
let (test1_context : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab))]
let (test1_secret : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x97));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b))]
let (test1_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18))]
let (test1_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab))]
let (test1_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79))]
let (test1_aad0 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30))]
let (test1_nonce0 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab))]
let (test1_cipher0 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1))]
let (test2_ciphersuite :
  (Spec_Agile_DH.algorithm * Spec_Agile_AEAD.alg *
    Spec_Hash_Definitions.hash_alg))
  =
  (Spec_Agile_DH.DH_P256, Spec_Agile_AEAD.CHACHA20_POLY1305,
    Spec_Hash_Definitions.SHA2_256)
let (test2_info : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e))]
let (test2_skR : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22))]
let (test2_skI : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x84));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11))]
let (test2_skE : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b))]
let (test2_psk : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39))]
let (test2_pskID : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61))]
let (test2_pkR : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13))]
let (test2_pkI : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80))]
let (test2_pkE : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6))]
let (test2_enc : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6))]
let (test2_zz : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb))]
let (test2_context : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab))]
let (test2_secret : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee))]
let (test2_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68))]
let (test2_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d))]
let (test_base_setup :
  Spec_Agile_HPKE.ciphersuite ->
    FStar_UInt8.t Prims.list ->
      FStar_UInt8.t Prims.list ->
        FStar_UInt8.t Prims.list ->
          FStar_UInt8.t Prims.list ->
            FStar_UInt8.t Prims.list ->
              FStar_UInt8.t Prims.list ->
                FStar_UInt8.t Prims.list ->
                  FStar_UInt8.t Prims.list ->
                    FStar_UInt8.t Prims.list ->
                      FStar_UInt8.t Prims.list ->
                        FStar_UInt8.t Prims.list ->
                          FStar_UInt8.t Prims.list ->
                            FStar_UInt8.t Prims.list ->
                              FStar_UInt8.t Prims.list ->
                                FStar_UInt8.t Prims.list -> Prims.bool)
  =
  fun cs ->
    fun info ->
      fun skR ->
        fun skI ->
          fun skE ->
            fun psk ->
              fun pskID ->
                fun pkR ->
                  fun pkI ->
                    fun pkE ->
                      fun enc ->
                        fun zz ->
                          fun context ->
                            fun secret ->
                              fun key ->
                                fun nonce ->
                                  FStar_IO.print_string "Test setupBaseI\n";
                                  (let setupBaseI =
                                     Spec_Agile_HPKE.setupBaseI cs
                                       (Lib_Sequence.of_list skE)
                                       (Lib_Sequence.of_list pkR)
                                       (Lib_Sequence.of_list info) in
                                   let res_setupBaseI =
                                     if
                                       FStar_Pervasives_Native.uu___is_None
                                         setupBaseI
                                     then
                                       (FStar_IO.print_string
                                          "setupBaseI returned None\n";
                                        false)
                                     else
                                       (let uu___2 =
                                          FStar_Pervasives_Native.__proj__Some__item__v
                                            setupBaseI in
                                        match uu___2 with
                                        | (returned_pkE, returned_key,
                                           returned_nonce) ->
                                            let r2_a =
                                              Lib_Sequence.for_all2
                                                (FStar_List_Tot_Base.length
                                                   pkE)
                                                (fun a ->
                                                   fun b ->
                                                     (Lib_IntTypes.v
                                                        Lib_IntTypes.U8
                                                        Lib_IntTypes.SEC
                                                        (Obj.magic a))
                                                       =
                                                       (Lib_IntTypes.v
                                                          Lib_IntTypes.U8
                                                          Lib_IntTypes.SEC
                                                          (Obj.magic b)))
                                                (Lib_Sequence.of_list pkE)
                                                returned_pkE in
                                            let r2_b =
                                              Lib_Sequence.for_all2
                                                (FStar_List_Tot_Base.length
                                                   key)
                                                (fun a ->
                                                   fun b ->
                                                     (Lib_IntTypes.v
                                                        Lib_IntTypes.U8
                                                        Lib_IntTypes.SEC
                                                        (Obj.magic a))
                                                       =
                                                       (Lib_IntTypes.v
                                                          Lib_IntTypes.U8
                                                          Lib_IntTypes.SEC
                                                          (Obj.magic b)))
                                                (Lib_Sequence.of_list key)
                                                returned_key in
                                            let r2_c =
                                              Lib_Sequence.for_all2
                                                (FStar_List_Tot_Base.length
                                                   nonce)
                                                (fun a ->
                                                   fun b ->
                                                     (Lib_IntTypes.v
                                                        Lib_IntTypes.U8
                                                        Lib_IntTypes.SEC
                                                        (Obj.magic a))
                                                       =
                                                       (Lib_IntTypes.v
                                                          Lib_IntTypes.U8
                                                          Lib_IntTypes.SEC
                                                          (Obj.magic b)))
                                                (Lib_Sequence.of_list nonce)
                                                returned_nonce in
                                            (if Prims.op_Negation r2_a
                                             then
                                               (FStar_IO.print_string
                                                  "\nExpected pkE :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a)) pkE;
                                                FStar_IO.print_string
                                                  "\nComputed pkE :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a))
                                                  (Lib_Sequence.to_list
                                                     returned_pkE);
                                                FStar_IO.print_string "\n")
                                             else ();
                                             if Prims.op_Negation r2_b
                                             then
                                               (FStar_IO.print_string
                                                  "\nExpected key :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a)) key;
                                                FStar_IO.print_string
                                                  "\nComputed key :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a))
                                                  (Lib_Sequence.to_list
                                                     returned_key);
                                                FStar_IO.print_string "\n")
                                             else ();
                                             if Prims.op_Negation r2_c
                                             then
                                               (FStar_IO.print_string
                                                  "\nExpected nonce :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a)) nonce;
                                                FStar_IO.print_string
                                                  "\nComputed nonce :";
                                                FStar_List.iter
                                                  (fun a ->
                                                     FStar_IO.print_string
                                                       (FStar_UInt8.to_string
                                                          a))
                                                  (Lib_Sequence.to_list
                                                     returned_nonce);
                                                FStar_IO.print_string "\n")
                                             else ();
                                             (r2_a && r2_b) && r2_c)) in
                                   if res_setupBaseI
                                   then
                                     FStar_IO.print_string
                                       "setupBaseI succeeded\n"
                                   else
                                     FStar_IO.print_string
                                       "setupBaseI failed\n";
                                   FStar_IO.print_string "Test setupBaseR\n";
                                   (let setupBaseR =
                                      Spec_Agile_HPKE.setupBaseR cs
                                        (Lib_Sequence.of_list pkE)
                                        (Lib_Sequence.of_list skR)
                                        (Lib_Sequence.of_list info) in
                                    let res_setupBaseR =
                                      if
                                        FStar_Pervasives_Native.uu___is_None
                                          setupBaseR
                                      then
                                        (FStar_IO.print_string
                                           "setupBaseR returned None\n";
                                         false)
                                      else
                                        (let uu___4 =
                                           FStar_Pervasives_Native.__proj__Some__item__v
                                             setupBaseR in
                                         match uu___4 with
                                         | (returned_key, returned_nonce) ->
                                             let r2_a =
                                               Lib_Sequence.for_all2
                                                 (FStar_List_Tot_Base.length
                                                    key)
                                                 (fun a ->
                                                    fun b ->
                                                      (Lib_IntTypes.v
                                                         Lib_IntTypes.U8
                                                         Lib_IntTypes.SEC
                                                         (Obj.magic a))
                                                        =
                                                        (Lib_IntTypes.v
                                                           Lib_IntTypes.U8
                                                           Lib_IntTypes.SEC
                                                           (Obj.magic b)))
                                                 (Lib_Sequence.of_list key)
                                                 returned_key in
                                             let r2_b =
                                               Lib_Sequence.for_all2
                                                 (FStar_List_Tot_Base.length
                                                    nonce)
                                                 (fun a ->
                                                    fun b ->
                                                      (Lib_IntTypes.v
                                                         Lib_IntTypes.U8
                                                         Lib_IntTypes.SEC
                                                         (Obj.magic a))
                                                        =
                                                        (Lib_IntTypes.v
                                                           Lib_IntTypes.U8
                                                           Lib_IntTypes.SEC
                                                           (Obj.magic b)))
                                                 (Lib_Sequence.of_list nonce)
                                                 returned_nonce in
                                             (if Prims.op_Negation r2_a
                                              then
                                                (FStar_IO.print_string
                                                   "\nExpected key :";
                                                 FStar_List.iter
                                                   (fun a ->
                                                      FStar_IO.print_string
                                                        (FStar_UInt8.to_string
                                                           a)) key;
                                                 FStar_IO.print_string
                                                   "\nComputed key :";
                                                 FStar_List.iter
                                                   (fun a ->
                                                      FStar_IO.print_string
                                                        (FStar_UInt8.to_string
                                                           a))
                                                   (Lib_Sequence.to_list
                                                      returned_key);
                                                 FStar_IO.print_string "\n")
                                              else ();
                                              if Prims.op_Negation r2_b
                                              then
                                                (FStar_IO.print_string
                                                   "\nExpected nonce :";
                                                 FStar_List.iter
                                                   (fun a ->
                                                      FStar_IO.print_string
                                                        (FStar_UInt8.to_string
                                                           a)) nonce;
                                                 FStar_IO.print_string
                                                   "\nComputed nonce :";
                                                 FStar_List.iter
                                                   (fun a ->
                                                      FStar_IO.print_string
                                                        (FStar_UInt8.to_string
                                                           a))
                                                   (Lib_Sequence.to_list
                                                      returned_nonce);
                                                 FStar_IO.print_string "\n")
                                              else ();
                                              r2_a && r2_b)) in
                                    if res_setupBaseR
                                    then
                                      FStar_IO.print_string
                                        "setupBaseR succeeded\n"
                                    else
                                      FStar_IO.print_string
                                        "setupBaseR failed\n";
                                    res_setupBaseI && res_setupBaseR))
let (test_encrytion :
  Spec_Agile_HPKE.ciphersuite ->
    FStar_UInt8.t Prims.list ->
      FStar_UInt8.t Prims.list ->
        FStar_UInt8.t Prims.list ->
          FStar_UInt8.t Prims.list ->
            FStar_UInt8.t Prims.list ->
              FStar_UInt8.t Prims.list ->
                FStar_UInt8.t Prims.list -> Prims.bool)
  =
  fun cs ->
    fun skE ->
      fun skR ->
        fun pkR ->
          fun pkE ->
            fun plain ->
              fun aad ->
                fun cipher ->
                  let clength =
                    (match Spec_Agile_HPKE.curve_of_cs cs with
                     | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                     | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                      (FStar_List_Tot_Base.length cipher) in
                  let expected_pkcipher =
                    FStar_Seq_Base.append (Lib_Sequence.of_list pkE)
                      (Lib_Sequence.of_list cipher) in
                  let sealBase =
                    Spec_Agile_HPKE.sealBase cs (Lib_Sequence.of_list skE)
                      (Lib_Sequence.of_list pkR) (Lib_Sequence.of_list plain)
                      (Lib_Sequence.of_list aad) in
                  let res_sealBase =
                    if FStar_Pervasives_Native.uu___is_None sealBase
                    then
                      (FStar_IO.print_string "sealBase returned None\n";
                       false)
                    else
                      (let returned_pkcipher =
                         FStar_Pervasives_Native.__proj__Some__item__v
                           sealBase in
                       let res =
                         Lib_Sequence.for_all2 clength
                           (fun a ->
                              fun b ->
                                (Lib_IntTypes.v Lib_IntTypes.U8
                                   Lib_IntTypes.SEC (Obj.magic a))
                                  =
                                  (Lib_IntTypes.v Lib_IntTypes.U8
                                     Lib_IntTypes.SEC (Obj.magic b)))
                           expected_pkcipher returned_pkcipher in
                       if Prims.op_Negation res
                       then
                         (FStar_IO.print_string "\nExpected pkE + cipher :";
                          FStar_List.iter
                            (fun a ->
                               FStar_IO.print_string
                                 (FStar_UInt8.to_string a))
                            (Lib_Sequence.to_list expected_pkcipher);
                          FStar_IO.print_string "\nComputed pkE + cipher :";
                          FStar_List.iter
                            (fun a ->
                               FStar_IO.print_string
                                 (FStar_UInt8.to_string a))
                            (Lib_Sequence.to_list returned_pkcipher);
                          FStar_IO.print_string "\n")
                       else ();
                       res) in
                  if res_sealBase
                  then FStar_IO.print_string "sealBase succeeded\n"
                  else FStar_IO.print_string "sealBase failed\n";
                  (let openBase =
                     Spec_Agile_HPKE.openBase cs (Lib_Sequence.of_list skR)
                       expected_pkcipher (Lib_Sequence.of_list aad) in
                   let res_openBase =
                     if FStar_Pervasives_Native.uu___is_None openBase
                     then
                       (FStar_IO.print_string "openBase returned None\n";
                        false)
                     else
                       (let returned_plain =
                          FStar_Pervasives_Native.__proj__Some__item__v
                            openBase in
                        let res =
                          Lib_Sequence.for_all2
                            (FStar_List_Tot_Base.length plain)
                            (fun a ->
                               fun b ->
                                 (Lib_IntTypes.v Lib_IntTypes.U8
                                    Lib_IntTypes.SEC (Obj.magic a))
                                   =
                                   (Lib_IntTypes.v Lib_IntTypes.U8
                                      Lib_IntTypes.SEC (Obj.magic b)))
                            (Lib_Sequence.of_list plain) returned_plain in
                        if Prims.op_Negation res
                        then
                          (FStar_IO.print_string "\nExpected plain :";
                           FStar_List.iter
                             (fun a ->
                                FStar_IO.print_string
                                  (FStar_UInt8.to_string a)) plain;
                           FStar_IO.print_string "\nComputed plain :";
                           FStar_List.iter
                             (fun a ->
                                FStar_IO.print_string
                                  (FStar_UInt8.to_string a))
                             (Lib_Sequence.to_list returned_plain);
                           FStar_IO.print_string "\n")
                        else ();
                        res) in
                   if res_openBase
                   then FStar_IO.print_string "openBase succeeded\n"
                   else FStar_IO.print_string "openBase failed\n";
                   res_sealBase && res_openBase)
let (test1 : unit -> Prims.bool) =
  fun uu___ ->
    FStar_IO.print_string "\nTest 1\n";
    (let cs1 = test1_ciphersuite in
     let res1 =
       test_base_setup cs1 test1_info test1_skR test1_skI test1_skE test1_psk
         test1_pskID test1_pkR test1_pkI test1_pkE test1_enc test1_zz
         test1_context test1_secret test1_key test1_nonce in
     res1)
let (test2 : unit -> Prims.bool) =
  fun uu___ ->
    FStar_IO.print_string "\nTest 2\n"; (let cs2 = test2_ciphersuite in true)
let (test : unit -> Prims.bool) =
  fun uu___ -> let r1 = test1 () in let r2 = test2 () in r1 && r2