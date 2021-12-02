open Prims
let (test1_key : FStar_UInt8.t Prims.list) =
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
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b))]
let (test1_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65))]
let (test1_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22))]
let (test1_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7))]
let (test1_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6))]
let (test1_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54))]
let (test2_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65))]
let (test2_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f))]
let (test2_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44))]
let (test2_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43))]
let (test2_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49))]
let (test2_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x97));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37))]
let (test3_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa))]
let (test3_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd))]
let (test3_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea))]
let (test3_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe))]
let (test3_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27))]
let (test3_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x84));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x84));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb))]
let (test4_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_one;
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
    FStar_UInt8.uint_to_t (Prims.of_int (0x19))]
let (test4_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd))]
let (test4_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a))]
let (test4_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b))]
let (test4_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb))]
let (test4_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x97));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd))]
let (test5_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c))]
let (test5_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e))]
let (test5_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8))]
let (test5_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b))]
let (test5_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x97))]
let (test5_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6))]
let (test6_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa))]
let (test6_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74))]
let (test6_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e))]
let (test6_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54))]
let (test6_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52))]
let (test6_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98))]
let (test7_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa))]
let (test7_data : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e))]
let (test7_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1))]
let (test7_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2))]
let (test7_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e))]
let (test7_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58))]
let (test : unit -> Prims.bool) =
  fun uu___ ->
    FStar_IO.print_string "\nTEST 1\n";
    (let test1_key_len = (Prims.of_int (20)) in
     let test1_key1 = Lib_Sequence.of_list test1_key in
     let test1_data_len = (Prims.of_int (8)) in
     let test1_data1 = Lib_Sequence.of_list test1_data in
     let test1_expected2241 = Lib_Sequence.of_list test1_expected224 in
     let test1_expected2561 = Lib_Sequence.of_list test1_expected256 in
     let test1_expected3841 = Lib_Sequence.of_list test1_expected384 in
     let test1_expected5121 = Lib_Sequence.of_list test1_expected512 in
     let test1_result224 =
       Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test1_key1
         test1_data1 in
     let test1_result256 =
       Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test1_key1
         test1_data1 in
     let test1_result384 =
       Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test1_key1
         test1_data1 in
     let test1_result512 =
       Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test1_key1
         test1_data1 in
     let result1_224 =
       Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test1_expected224)
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected2241 test1_result224 in
     let result1_256 =
       Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test1_expected256)
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected2561 test1_result256 in
     let result1_384 =
       Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test1_expected384)
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected3841 test1_result384 in
     let result1_512 =
       Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test1_expected512)
         (fun a ->
            fun b ->
              (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                =
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic b))) test1_expected5121 test1_result512 in
     let result1 =
       ((result1_224 && result1_256) && result1_384) && result1_512 in
     FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected2241);
     FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_result224);
     FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected2561);
     FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_result256);
     FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected3841);
     FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_result384);
     FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_expected5121);
     FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
     FStar_List.iter
       (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
       (Lib_Sequence.to_list test1_result512);
     if result1
     then FStar_IO.print_string "\nHMAC SHA2 Test1 ontime: Success!\n"
     else FStar_IO.print_string "\nHMAC SHA2 Test1 ontime: Failure :(\n";
     FStar_IO.print_string "\nTEST 2\n";
     (let test2_key_len = FStar_List_Tot_Base.length test2_key in
      let test2_key1 = Lib_Sequence.of_list test2_key in
      let test2_data_len = FStar_List_Tot_Base.length test2_data in
      let test2_data1 = Lib_Sequence.of_list test2_data in
      let test2_expected2241 = Lib_Sequence.of_list test2_expected224 in
      let test2_expected2561 = Lib_Sequence.of_list test2_expected256 in
      let test2_expected3841 = Lib_Sequence.of_list test2_expected384 in
      let test2_expected5121 = Lib_Sequence.of_list test2_expected512 in
      let test2_result224 =
        Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test2_key1
          test2_data1 in
      let test2_result256 =
        Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test2_key1
          test2_data1 in
      let test2_result384 =
        Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test2_key1
          test2_data1 in
      let test2_result512 =
        Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test2_key1
          test2_data1 in
      let result2_224 =
        Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test2_expected224)
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected2241 test2_result224 in
      let result2_256 =
        Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test2_expected256)
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected2561 test2_result256 in
      let result2_384 =
        Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test2_expected384)
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected3841 test2_result384 in
      let result2_512 =
        Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test2_expected512)
          (fun a ->
             fun b ->
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
                 =
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic b))) test2_expected5121 test2_result512 in
      let result2 =
        ((result2_224 && result2_256) && result2_384) && result2_512 in
      FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected2241);
      FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_result224);
      FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected2561);
      FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_result256);
      FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected3841);
      FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_result384);
      FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_expected5121);
      FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
      FStar_List.iter
        (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
        (Lib_Sequence.to_list test2_result512);
      if result2
      then FStar_IO.print_string "\nHMAC SHA2 Test2 ontime: Success!\n"
      else FStar_IO.print_string "\nHMAC SHA2 Test2 ontime: Failure :(\n";
      FStar_IO.print_string "\nTEST 3\n";
      (let test3_key_len = FStar_List_Tot_Base.length test3_key in
       let test3_key1 = Lib_Sequence.of_list test3_key in
       let test3_data_len = FStar_List_Tot_Base.length test3_data in
       let test3_data1 = Lib_Sequence.of_list test3_data in
       let test3_expected2241 = Lib_Sequence.of_list test3_expected224 in
       let test3_expected2561 = Lib_Sequence.of_list test3_expected256 in
       let test3_expected3841 = Lib_Sequence.of_list test3_expected384 in
       let test3_expected5121 = Lib_Sequence.of_list test3_expected512 in
       let test3_result224 =
         Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test3_key1
           test3_data1 in
       let test3_result256 =
         Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test3_key1
           test3_data1 in
       let test3_result384 =
         Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test3_key1
           test3_data1 in
       let test3_result512 =
         Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test3_key1
           test3_data1 in
       let result3_224 =
         Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test3_expected224)
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected2241 test3_result224 in
       let result3_256 =
         Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test3_expected256)
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected2561 test3_result256 in
       let result3_384 =
         Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test3_expected384)
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected3841 test3_result384 in
       let result3_512 =
         Lib_Sequence.for_all2 (FStar_List_Tot_Base.length test3_expected512)
           (fun a ->
              fun b ->
                (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                   (Obj.magic a))
                  =
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic b))) test3_expected5121 test3_result512 in
       let result3 =
         ((result3_224 && result3_256) && result3_384) && result3_512 in
       FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected2241);
       FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_result224);
       FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected2561);
       FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_result256);
       FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected3841);
       FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_result384);
       FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_expected5121);
       FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
       FStar_List.iter
         (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
         (Lib_Sequence.to_list test3_result512);
       if result3
       then FStar_IO.print_string "\nHMAC SHA2 Test3 ontime: Success!\n"
       else FStar_IO.print_string "\nHMAC SHA2 Test3 ontime: Failure :(\n";
       FStar_IO.print_string "\nTEST 4\n";
       (let test4_key_len = FStar_List_Tot_Base.length test4_key in
        let test4_key1 = Lib_Sequence.of_list test4_key in
        let test4_data_len = FStar_List_Tot_Base.length test4_data in
        let test4_data1 = Lib_Sequence.of_list test4_data in
        let test4_expected2241 = Lib_Sequence.of_list test4_expected224 in
        let test4_expected2561 = Lib_Sequence.of_list test4_expected256 in
        let test4_expected3841 = Lib_Sequence.of_list test4_expected384 in
        let test4_expected5121 = Lib_Sequence.of_list test4_expected512 in
        let test4_result224 =
          Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test4_key1
            test4_data1 in
        let test4_result256 =
          Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test4_key1
            test4_data1 in
        let test4_result384 =
          Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test4_key1
            test4_data1 in
        let test4_result512 =
          Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test4_key1
            test4_data1 in
        let result4_224 =
          Lib_Sequence.for_all2
            (FStar_List_Tot_Base.length test4_expected224)
            (fun a ->
               fun b ->
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic a))
                   =
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic b))) test4_expected2241 test4_result224 in
        let result4_256 =
          Lib_Sequence.for_all2
            (FStar_List_Tot_Base.length test4_expected256)
            (fun a ->
               fun b ->
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic a))
                   =
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic b))) test4_expected2561 test4_result256 in
        let result4_384 =
          Lib_Sequence.for_all2
            (FStar_List_Tot_Base.length test4_expected384)
            (fun a ->
               fun b ->
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic a))
                   =
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic b))) test4_expected3841 test4_result384 in
        let result4_512 =
          Lib_Sequence.for_all2
            (FStar_List_Tot_Base.length test4_expected512)
            (fun a ->
               fun b ->
                 (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                    (Obj.magic a))
                   =
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic b))) test4_expected5121 test4_result512 in
        let result4 =
          ((result4_224 && result4_256) && result4_384) && result4_512 in
        FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_expected2241);
        FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_result224);
        FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_expected2561);
        FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_result256);
        FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_expected3841);
        FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_result384);
        FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_expected5121);
        FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
        FStar_List.iter
          (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
          (Lib_Sequence.to_list test4_result512);
        if result4
        then FStar_IO.print_string "\nHMAC SHA2 Test4 ontime: Success!\n"
        else FStar_IO.print_string "\nHMAC SHA2 Test4 ontime: Failure :(\n";
        FStar_IO.print_string "\nTEST 5\n";
        (let test5_key_len = FStar_List_Tot_Base.length test5_key in
         let test5_key1 = Lib_Sequence.of_list test5_key in
         let test5_data_len = FStar_List_Tot_Base.length test5_data in
         let test5_data1 = Lib_Sequence.of_list test5_data in
         let test5_expected2241 = Lib_Sequence.of_list test5_expected224 in
         let test5_expected2561 = Lib_Sequence.of_list test5_expected256 in
         let test5_expected3841 = Lib_Sequence.of_list test5_expected384 in
         let test5_expected5121 = Lib_Sequence.of_list test5_expected512 in
         let test5_result224b =
           Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test5_key1
             test5_data1 in
         let test5_result256b =
           Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test5_key1
             test5_data1 in
         let test5_result384b =
           Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test5_key1
             test5_data1 in
         let test5_result512b =
           Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test5_key1
             test5_data1 in
         let test5_result224 =
           FStar_Seq_Base.slice test5_result224b Prims.int_zero
             (Prims.of_int (16)) in
         let test5_result256 =
           FStar_Seq_Base.slice test5_result256b Prims.int_zero
             (Prims.of_int (16)) in
         let test5_result384 =
           FStar_Seq_Base.slice test5_result384b Prims.int_zero
             (Prims.of_int (16)) in
         let test5_result512 =
           FStar_Seq_Base.slice test5_result512b Prims.int_zero
             (Prims.of_int (16)) in
         let result5_224 =
           Lib_Sequence.for_all2 (Prims.of_int (16))
             (fun a ->
                fun b ->
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic a))
                    =
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic b))) test5_expected2241 test5_result224 in
         let result5_256 =
           Lib_Sequence.for_all2 (Prims.of_int (16))
             (fun a ->
                fun b ->
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic a))
                    =
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic b))) test5_expected2561 test5_result256 in
         let result5_384 =
           Lib_Sequence.for_all2 (Prims.of_int (16))
             (fun a ->
                fun b ->
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic a))
                    =
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic b))) test5_expected3841 test5_result384 in
         let result5_512 =
           Lib_Sequence.for_all2 (Prims.of_int (16))
             (fun a ->
                fun b ->
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic a))
                    =
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic b))) test5_expected5121 test5_result512 in
         let result5 =
           ((result5_224 && result5_256) && result5_384) && result5_512 in
         FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_expected2241);
         FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_result224);
         FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_expected2561);
         FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_result256);
         FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_expected3841);
         FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_result384);
         FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_expected5121);
         FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
         FStar_List.iter
           (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
           (Lib_Sequence.to_list test5_result512);
         if result5
         then FStar_IO.print_string "\nHMAC SHA2 Test5 ontime: Success!\n"
         else FStar_IO.print_string "\nHMAC SHA2 Test5 ontime: Failure :(\n";
         FStar_IO.print_string "\nTEST 6\n";
         (let test6_key_len = FStar_List_Tot_Base.length test6_key in
          let test6_key1 = Lib_Sequence.of_list test6_key in
          let test6_data_len = FStar_List_Tot_Base.length test6_data in
          let test6_data1 = Lib_Sequence.of_list test6_data in
          let test6_expected2241 = Lib_Sequence.of_list test6_expected224 in
          let test6_expected2561 = Lib_Sequence.of_list test6_expected256 in
          let test6_expected3841 = Lib_Sequence.of_list test6_expected384 in
          let test6_expected5121 = Lib_Sequence.of_list test6_expected512 in
          let test6_result224 =
            Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test6_key1
              test6_data1 in
          let test6_result256 =
            Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test6_key1
              test6_data1 in
          let test6_result384 =
            Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test6_key1
              test6_data1 in
          let test6_result512 =
            Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test6_key1
              test6_data1 in
          let result6_224 =
            Lib_Sequence.for_all2
              (FStar_List_Tot_Base.length test6_expected224)
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) test6_expected2241 test6_result224 in
          let result6_256 =
            Lib_Sequence.for_all2
              (FStar_List_Tot_Base.length test6_expected256)
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) test6_expected2561 test6_result256 in
          let result6_384 =
            Lib_Sequence.for_all2
              (FStar_List_Tot_Base.length test6_expected384)
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) test6_expected3841 test6_result384 in
          let result6_512 =
            Lib_Sequence.for_all2
              (FStar_List_Tot_Base.length test6_expected512)
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) test6_expected5121 test6_result512 in
          let result6 =
            ((result6_224 && result6_256) && result6_384) && result6_512 in
          FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_expected2241);
          FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_result224);
          FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_expected2561);
          FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_result256);
          FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_expected3841);
          FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_result384);
          FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_expected5121);
          FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
          FStar_List.iter
            (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
            (Lib_Sequence.to_list test6_result512);
          if result6
          then FStar_IO.print_string "\nHMAC SHA2 Test6 ontime: Success!\n"
          else FStar_IO.print_string "\nHMAC SHA2 Test6 ontime: Failure :(\n";
          FStar_IO.print_string "\nTEST 7\n";
          (let test7_key_len = FStar_List_Tot_Base.length test7_key in
           let test7_key1 = Lib_Sequence.of_list test7_key in
           let test7_data_len = FStar_List_Tot_Base.length test7_data in
           let test7_data1 = Lib_Sequence.of_list test7_data in
           let test7_expected2241 = Lib_Sequence.of_list test7_expected224 in
           let test7_expected2561 = Lib_Sequence.of_list test7_expected256 in
           let test7_expected3841 = Lib_Sequence.of_list test7_expected384 in
           let test7_expected5121 = Lib_Sequence.of_list test7_expected512 in
           let test7_result224 =
             Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_224 test7_key1
               test7_data1 in
           let test7_result256 =
             Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_256 test7_key1
               test7_data1 in
           let test7_result384 =
             Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_384 test7_key1
               test7_data1 in
           let test7_result512 =
             Spec_Agile_HMAC.hmac Spec_Hash_Definitions.SHA2_512 test7_key1
               test7_data1 in
           let result7_224 =
             Lib_Sequence.for_all2
               (FStar_List_Tot_Base.length test7_expected224)
               (fun a ->
                  fun b ->
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic a))
                      =
                      (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                         (Obj.magic b))) test7_expected2241 test7_result224 in
           let result7_256 =
             Lib_Sequence.for_all2
               (FStar_List_Tot_Base.length test7_expected256)
               (fun a ->
                  fun b ->
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic a))
                      =
                      (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                         (Obj.magic b))) test7_expected2561 test7_result256 in
           let result7_384 =
             Lib_Sequence.for_all2
               (FStar_List_Tot_Base.length test7_expected384)
               (fun a ->
                  fun b ->
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic a))
                      =
                      (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                         (Obj.magic b))) test7_expected3841 test7_result384 in
           let result7_512 =
             Lib_Sequence.for_all2
               (FStar_List_Tot_Base.length test7_expected512)
               (fun a ->
                  fun b ->
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic a))
                      =
                      (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                         (Obj.magic b))) test7_expected5121 test7_result512 in
           let result7 =
             ((result7_224 && result7_256) && result7_384) && result7_512 in
           FStar_IO.print_string "\nExpected HMAC SHA2 224: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_expected2241);
           FStar_IO.print_string "\nComputed HMAC SHA2 224: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_result224);
           FStar_IO.print_string "\nExpected HMAC SHA2 256: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_expected2561);
           FStar_IO.print_string "\nComputed HMAC SHA2 256: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_result256);
           FStar_IO.print_string "\nExpected HMAC SHA2 384: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_expected3841);
           FStar_IO.print_string "\nComputed HMAC SHA2 384: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_result384);
           FStar_IO.print_string "\nExpected HMAC SHA2 512: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_expected5121);
           FStar_IO.print_string "\nComputed HMAC SHA2 512: ";
           FStar_List.iter
             (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
             (Lib_Sequence.to_list test7_result512);
           if result7
           then FStar_IO.print_string "\nHMAC SHA2 Test7 ontime: Success!\n"
           else
             FStar_IO.print_string "\nHMAC SHA2 Test7 ontime: Failure :(\n";
           if
             (((((result1 && result2) && result3) && result4) && result5) &&
                result6)
               && result7
           then
             (FStar_IO.print_string "\nComposite result: Success!\n"; true)
           else
             (FStar_IO.print_string "\nComposite result: Failure :(\n"; false))))))))