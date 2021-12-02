open Prims
let (test_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x2b));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x15));
    (Prims.of_int (0x16));
    (Prims.of_int (0x28));
    (Prims.of_int (0xae));
    (Prims.of_int (0xd2));
    (Prims.of_int (0xa6));
    (Prims.of_int (0xab));
    (Prims.of_int (0xf7));
    (Prims.of_int (0x15));
    (Prims.of_int (0x88));
    (Prims.of_int (0x09));
    (Prims.of_int (0xcf));
    (Prims.of_int (0x4f));
    (Prims.of_int (0x3c))]
let (test_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xf0));
    (Prims.of_int (0xf1));
    (Prims.of_int (0xf2));
    (Prims.of_int (0xf3));
    (Prims.of_int (0xf4));
    (Prims.of_int (0xf5));
    (Prims.of_int (0xf6));
    (Prims.of_int (0xf7));
    (Prims.of_int (0xf8));
    (Prims.of_int (0xf9));
    (Prims.of_int (0xfa));
    (Prims.of_int (0xfb))]
let (test_counter : Prims.int) = (Prims.parse_int "0xfcfdfeff")
let (test_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x6b));
    (Prims.of_int (0xc1));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xe2));
    (Prims.of_int (0x2e));
    (Prims.of_int (0x40));
    (Prims.of_int (0x9f));
    (Prims.of_int (0x96));
    (Prims.of_int (0xe9));
    (Prims.of_int (0x3d));
    (Prims.of_int (0x7e));
    (Prims.of_int (0x11));
    (Prims.of_int (0x73));
    (Prims.of_int (0x93));
    (Prims.of_int (0x17));
    (Prims.of_int (0x2a))]
let (test_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x87));
    (Prims.of_int (0x4d));
    (Prims.of_int (0x61));
    (Prims.of_int (0x91));
    (Prims.of_int (0xb6));
    (Prims.of_int (0x20));
    (Prims.of_int (0xe3));
    (Prims.of_int (0x26));
    (Prims.of_int (0x1b));
    (Prims.of_int (0xef));
    (Prims.of_int (0x68));
    (Prims.of_int (0x64));
    (Prims.of_int (0x99));
    (Prims.of_int (0x0d));
    (Prims.of_int (0xb6));
    (Prims.of_int (0xce))]
let (test_key1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xAE));
    (Prims.of_int (0x68));
    (Prims.of_int (0x52));
    (Prims.of_int (0xF8));
    (Prims.of_int (0x12));
    (Prims.of_int (0x10));
    (Prims.of_int (0x67));
    (Prims.of_int (0xCC));
    (Prims.of_int (0x4B));
    (Prims.of_int (0xF7));
    (Prims.of_int (0xA5));
    (Prims.of_int (0x76));
    (Prims.of_int (0x55));
    (Prims.of_int (0x77));
    (Prims.of_int (0xF3));
    (Prims.of_int (0x9E))]
let (test_nonce1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_zero;
    Prims.int_zero;
    (Prims.of_int (0x30));
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
let (test_counter1 : Prims.int) = Prims.int_one
let (test_plaintext1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x53));
    (Prims.of_int (0x69));
    (Prims.of_int (0x6E));
    (Prims.of_int (0x67));
    (Prims.of_int (0x6C));
    (Prims.of_int (0x65));
    (Prims.of_int (0x20));
    (Prims.of_int (0x62));
    (Prims.of_int (0x6C));
    (Prims.of_int (0x6F));
    (Prims.of_int (0x63));
    (Prims.of_int (0x6B));
    (Prims.of_int (0x20));
    (Prims.of_int (0x6D));
    (Prims.of_int (0x73));
    (Prims.of_int (0x67))]
let (test_ciphertext1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xE4));
    (Prims.of_int (0x09));
    (Prims.of_int (0x5D));
    (Prims.of_int (0x4F));
    (Prims.of_int (0xB7));
    (Prims.of_int (0xA7));
    (Prims.of_int (0xB3));
    (Prims.of_int (0x79));
    (Prims.of_int (0x2D));
    (Prims.of_int (0x61));
    (Prims.of_int (0x75));
    (Prims.of_int (0xA3));
    (Prims.of_int (0x26));
    (Prims.of_int (0x13));
    (Prims.of_int (0x11));
    (Prims.of_int (0xB8))]
let (test_key2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x7E));
    (Prims.of_int (0x24));
    (Prims.of_int (0x06));
    (Prims.of_int (0x78));
    (Prims.of_int (0x17));
    (Prims.of_int (0xFA));
    (Prims.of_int (0xE0));
    (Prims.of_int (0xD7));
    (Prims.of_int (0x43));
    (Prims.of_int (0xD6));
    (Prims.of_int (0xCE));
    (Prims.of_int (0x1F));
    (Prims.of_int (0x32));
    (Prims.of_int (0x53));
    (Prims.of_int (0x91));
    (Prims.of_int (0x63))]
let (test_nonce2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    (Prims.of_int (0x6C));
    (Prims.of_int (0xB6));
    (Prims.of_int (0xDB));
    (Prims.of_int (0xC0));
    (Prims.of_int (0x54));
    (Prims.of_int (0x3B));
    (Prims.of_int (0x59));
    (Prims.of_int (0xDA));
    (Prims.of_int (0x48));
    (Prims.of_int (0xD9));
    (Prims.of_int (0x0B))]
let (test_counter2 : Prims.int) = Prims.int_one
let (test_plaintext2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [Prims.int_zero;
    Prims.int_one;
    (Prims.of_int (0x02));
    (Prims.of_int (0x03));
    (Prims.of_int (0x04));
    (Prims.of_int (0x05));
    (Prims.of_int (0x06));
    (Prims.of_int (0x07));
    (Prims.of_int (0x08));
    (Prims.of_int (0x09));
    (Prims.of_int (0x0A));
    (Prims.of_int (0x0B));
    (Prims.of_int (0x0C));
    (Prims.of_int (0x0D));
    (Prims.of_int (0x0E));
    (Prims.of_int (0x0F));
    (Prims.of_int (0x10));
    (Prims.of_int (0x11));
    (Prims.of_int (0x12));
    (Prims.of_int (0x13));
    (Prims.of_int (0x14));
    (Prims.of_int (0x15));
    (Prims.of_int (0x16));
    (Prims.of_int (0x17));
    (Prims.of_int (0x18));
    (Prims.of_int (0x19));
    (Prims.of_int (0x1A));
    (Prims.of_int (0x1B));
    (Prims.of_int (0x1C));
    (Prims.of_int (0x1D));
    (Prims.of_int (0x1E));
    (Prims.of_int (0x1F))]
let (test_ciphertext2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x51));
    (Prims.of_int (0x04));
    (Prims.of_int (0xA1));
    (Prims.of_int (0x06));
    (Prims.of_int (0x16));
    (Prims.of_int (0x8A));
    (Prims.of_int (0x72));
    (Prims.of_int (0xD9));
    (Prims.of_int (0x79));
    (Prims.of_int (0x0D));
    (Prims.of_int (0x41));
    (Prims.of_int (0xEE));
    (Prims.of_int (0x8E));
    (Prims.of_int (0xDA));
    (Prims.of_int (0xD3));
    (Prims.of_int (0x88));
    (Prims.of_int (0xEB));
    (Prims.of_int (0x2E));
    (Prims.of_int (0x1E));
    (Prims.of_int (0xFC));
    (Prims.of_int (0x46));
    (Prims.of_int (0xDA));
    (Prims.of_int (0x57));
    (Prims.of_int (0xC8));
    (Prims.of_int (0xFC));
    (Prims.of_int (0xE6));
    (Prims.of_int (0x30));
    (Prims.of_int (0xDF));
    (Prims.of_int (0x91));
    (Prims.of_int (0x41));
    (Prims.of_int (0xBE));
    (Prims.of_int (0x28))]
let (test1_key_block : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x80));
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
let (test1_plaintext_block : FStar_UInt8.t Prims.list) =
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
let (test1_ciphertext_block : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0x0e));
    (Prims.of_int (0xdd));
    (Prims.of_int (0x33));
    (Prims.of_int (0xd3));
    (Prims.of_int (0xc6));
    (Prims.of_int (0x21));
    (Prims.of_int (0xe5));
    (Prims.of_int (0x46));
    (Prims.of_int (0x45));
    (Prims.of_int (0x5b));
    (Prims.of_int (0xd8));
    (Prims.of_int (0xba));
    (Prims.of_int (0x14));
    (Prims.of_int (0x18));
    (Prims.of_int (0xbe));
    (Prims.of_int (0xc8))]
let (test2_key_block : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xff));
    (Prims.of_int (0xff));
    (Prims.of_int (0xff));
    (Prims.of_int (0xff));
    (Prims.of_int (0xff));
    (Prims.of_int (0xf0));
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
let (test2_plaintext_block : FStar_UInt8.t Prims.list) =
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
let (test2_ciphertext_block : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
    [(Prims.of_int (0xe6));
    (Prims.of_int (0xc4));
    (Prims.of_int (0x80));
    (Prims.of_int (0x7a));
    (Prims.of_int (0xe1));
    (Prims.of_int (0x1f));
    (Prims.of_int (0x36));
    (Prims.of_int (0xf0));
    (Prims.of_int (0x91));
    (Prims.of_int (0xc5));
    (Prims.of_int (0x7d));
    (Prims.of_int (0x9f));
    (Prims.of_int (0xb6));
    (Prims.of_int (0x85));
    (Prims.of_int (0x48));
    (Prims.of_int (0xd1))]
let (test3_key_block : FStar_UInt8.t Prims.list) =
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
let (test3_ciphertext_block : FStar_UInt8.t Prims.list) =
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
let (test1_input_key1 : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0x60));
       (Prims.of_int (0x3d));
       (Prims.of_int (0xeb));
       (Prims.of_int (0x10));
       (Prims.of_int (0x15));
       (Prims.of_int (0xca));
       (Prims.of_int (0x71));
       (Prims.of_int (0xbe));
       (Prims.of_int (0x2b));
       (Prims.of_int (0x73));
       (Prims.of_int (0xae));
       (Prims.of_int (0xf0));
       (Prims.of_int (0x85));
       (Prims.of_int (0x7d));
       (Prims.of_int (0x77));
       (Prims.of_int (0x81));
       (Prims.of_int (0x1f));
       (Prims.of_int (0x35));
       (Prims.of_int (0x2c));
       (Prims.of_int (0x07));
       (Prims.of_int (0x3b));
       (Prims.of_int (0x61));
       (Prims.of_int (0x08));
       (Prims.of_int (0xd7));
       (Prims.of_int (0x2d));
       (Prims.of_int (0x98));
       (Prims.of_int (0x10));
       (Prims.of_int (0xa3));
       (Prims.of_int (0x09));
       (Prims.of_int (0x14));
       (Prims.of_int (0xdf));
       (Prims.of_int (0xf4))])
let (test1_output_expanded : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0x60));
       (Prims.of_int (0x3d));
       (Prims.of_int (0xeb));
       (Prims.of_int (0x10));
       (Prims.of_int (0x15));
       (Prims.of_int (0xca));
       (Prims.of_int (0x71));
       (Prims.of_int (0xbe));
       (Prims.of_int (0x2b));
       (Prims.of_int (0x73));
       (Prims.of_int (0xae));
       (Prims.of_int (0xf0));
       (Prims.of_int (0x85));
       (Prims.of_int (0x7d));
       (Prims.of_int (0x77));
       (Prims.of_int (0x81));
       (Prims.of_int (0x1f));
       (Prims.of_int (0x35));
       (Prims.of_int (0x2c));
       (Prims.of_int (0x07));
       (Prims.of_int (0x3b));
       (Prims.of_int (0x61));
       (Prims.of_int (0x08));
       (Prims.of_int (0xd7));
       (Prims.of_int (0x2d));
       (Prims.of_int (0x98));
       (Prims.of_int (0x10));
       (Prims.of_int (0xa3));
       (Prims.of_int (0x09));
       (Prims.of_int (0x14));
       (Prims.of_int (0xdf));
       (Prims.of_int (0xf4));
       (Prims.of_int (0x9b));
       (Prims.of_int (0xa3));
       (Prims.of_int (0x54));
       (Prims.of_int (0x11));
       (Prims.of_int (0x8e));
       (Prims.of_int (0x69));
       (Prims.of_int (0x25));
       (Prims.of_int (0xaf));
       (Prims.of_int (0xa5));
       (Prims.of_int (0x1a));
       (Prims.of_int (0x8b));
       (Prims.of_int (0x5f));
       (Prims.of_int (0x20));
       (Prims.of_int (0x67));
       (Prims.of_int (0xfc));
       (Prims.of_int (0xde));
       (Prims.of_int (0xa8));
       (Prims.of_int (0xb0));
       (Prims.of_int (0x9c));
       (Prims.of_int (0x1a));
       (Prims.of_int (0x93));
       (Prims.of_int (0xd1));
       (Prims.of_int (0x94));
       (Prims.of_int (0xcd));
       (Prims.of_int (0xbe));
       (Prims.of_int (0x49));
       (Prims.of_int (0x84));
       (Prims.of_int (0x6e));
       (Prims.of_int (0xb7));
       (Prims.of_int (0x5d));
       (Prims.of_int (0x5b));
       (Prims.of_int (0x9a));
       (Prims.of_int (0xd5));
       (Prims.of_int (0x9a));
       (Prims.of_int (0xec));
       (Prims.of_int (0xb8));
       (Prims.of_int (0x5b));
       (Prims.of_int (0xf3));
       (Prims.of_int (0xc9));
       (Prims.of_int (0x17));
       (Prims.of_int (0xfe));
       (Prims.of_int (0xe9));
       (Prims.of_int (0x42));
       (Prims.of_int (0x48));
       (Prims.of_int (0xde));
       (Prims.of_int (0x8e));
       (Prims.of_int (0xbe));
       (Prims.of_int (0x96));
       (Prims.of_int (0xb5));
       (Prims.of_int (0xa9));
       (Prims.of_int (0x32));
       (Prims.of_int (0x8a));
       (Prims.of_int (0x26));
       (Prims.of_int (0x78));
       (Prims.of_int (0xa6));
       (Prims.of_int (0x47));
       (Prims.of_int (0x98));
       (Prims.of_int (0x31));
       (Prims.of_int (0x22));
       (Prims.of_int (0x29));
       (Prims.of_int (0x2f));
       (Prims.of_int (0x6c));
       (Prims.of_int (0x79));
       (Prims.of_int (0xb3));
       (Prims.of_int (0x81));
       (Prims.of_int (0x2c));
       (Prims.of_int (0x81));
       (Prims.of_int (0xad));
       (Prims.of_int (0xda));
       (Prims.of_int (0xdf));
       (Prims.of_int (0x48));
       (Prims.of_int (0xba));
       (Prims.of_int (0x24));
       (Prims.of_int (0x36));
       (Prims.of_int (0x0a));
       (Prims.of_int (0xf2));
       (Prims.of_int (0xfa));
       (Prims.of_int (0xb8));
       (Prims.of_int (0xb4));
       (Prims.of_int (0x64));
       (Prims.of_int (0x98));
       (Prims.of_int (0xc5));
       (Prims.of_int (0xbf));
       (Prims.of_int (0xc9));
       (Prims.of_int (0xbe));
       (Prims.of_int (0xbd));
       (Prims.of_int (0x19));
       (Prims.of_int (0x8e));
       (Prims.of_int (0x26));
       (Prims.of_int (0x8c));
       (Prims.of_int (0x3b));
       (Prims.of_int (0xa7));
       (Prims.of_int (0x09));
       (Prims.of_int (0xe0));
       (Prims.of_int (0x42));
       (Prims.of_int (0x14));
       (Prims.of_int (0x68));
       Prims.int_zero;
       (Prims.of_int (0x7b));
       (Prims.of_int (0xac));
       (Prims.of_int (0xb2));
       (Prims.of_int (0xdf));
       (Prims.of_int (0x33));
       (Prims.of_int (0x16));
       (Prims.of_int (0x96));
       (Prims.of_int (0xe9));
       (Prims.of_int (0x39));
       (Prims.of_int (0xe4));
       (Prims.of_int (0x6c));
       (Prims.of_int (0x51));
       (Prims.of_int (0x8d));
       (Prims.of_int (0x80));
       (Prims.of_int (0xc8));
       (Prims.of_int (0x14));
       (Prims.of_int (0xe2));
       (Prims.of_int (0x04));
       (Prims.of_int (0x76));
       (Prims.of_int (0xa9));
       (Prims.of_int (0xfb));
       (Prims.of_int (0x8a));
       (Prims.of_int (0x50));
       (Prims.of_int (0x25));
       (Prims.of_int (0xc0));
       (Prims.of_int (0x2d));
       (Prims.of_int (0x59));
       (Prims.of_int (0xc5));
       (Prims.of_int (0x82));
       (Prims.of_int (0x39));
       (Prims.of_int (0xde));
       (Prims.of_int (0x13));
       (Prims.of_int (0x69));
       (Prims.of_int (0x67));
       (Prims.of_int (0x6c));
       (Prims.of_int (0xcc));
       (Prims.of_int (0x5a));
       (Prims.of_int (0x71));
       (Prims.of_int (0xfa));
       (Prims.of_int (0x25));
       (Prims.of_int (0x63));
       (Prims.of_int (0x95));
       (Prims.of_int (0x96));
       (Prims.of_int (0x74));
       (Prims.of_int (0xee));
       (Prims.of_int (0x15));
       (Prims.of_int (0x58));
       (Prims.of_int (0x86));
       (Prims.of_int (0xca));
       (Prims.of_int (0x5d));
       (Prims.of_int (0x2e));
       (Prims.of_int (0x2f));
       (Prims.of_int (0x31));
       (Prims.of_int (0xd7));
       (Prims.of_int (0x7e));
       (Prims.of_int (0x0a));
       (Prims.of_int (0xf1));
       (Prims.of_int (0xfa));
       (Prims.of_int (0x27));
       (Prims.of_int (0xcf));
       (Prims.of_int (0x73));
       (Prims.of_int (0xc3));
       (Prims.of_int (0x74));
       (Prims.of_int (0x9c));
       (Prims.of_int (0x47));
       (Prims.of_int (0xab));
       (Prims.of_int (0x18));
       (Prims.of_int (0x50));
       (Prims.of_int (0x1d));
       (Prims.of_int (0xda));
       (Prims.of_int (0xe2));
       (Prims.of_int (0x75));
       (Prims.of_int (0x7e));
       (Prims.of_int (0x4f));
       (Prims.of_int (0x74));
       Prims.int_one;
       (Prims.of_int (0x90));
       (Prims.of_int (0x5a));
       (Prims.of_int (0xca));
       (Prims.of_int (0xfa));
       (Prims.of_int (0xaa));
       (Prims.of_int (0xe3));
       (Prims.of_int (0xe4));
       (Prims.of_int (0xd5));
       (Prims.of_int (0x9b));
       (Prims.of_int (0x34));
       (Prims.of_int (0x9a));
       (Prims.of_int (0xdf));
       (Prims.of_int (0x6a));
       (Prims.of_int (0xce));
       (Prims.of_int (0xbd));
       (Prims.of_int (0x10));
       (Prims.of_int (0x19));
       (Prims.of_int (0x0d));
       (Prims.of_int (0xfe));
       (Prims.of_int (0x48));
       (Prims.of_int (0x90));
       (Prims.of_int (0xd1));
       (Prims.of_int (0xe6));
       (Prims.of_int (0x18));
       (Prims.of_int (0x8d));
       (Prims.of_int (0x0b));
       (Prims.of_int (0x04));
       (Prims.of_int (0x6d));
       (Prims.of_int (0xf3));
       (Prims.of_int (0x44));
       (Prims.of_int (0x70));
       (Prims.of_int (0x6c));
       (Prims.of_int (0x63));
       (Prims.of_int (0x1e))])
let (test2_input_key : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [Prims.int_zero;
       Prims.int_one;
       (Prims.of_int (0x02));
       (Prims.of_int (0x03));
       (Prims.of_int (0x04));
       (Prims.of_int (0x05));
       (Prims.of_int (0x06));
       (Prims.of_int (0x07));
       (Prims.of_int (0x08));
       (Prims.of_int (0x09));
       (Prims.of_int (0x0a));
       (Prims.of_int (0x0b));
       (Prims.of_int (0x0c));
       (Prims.of_int (0x0d));
       (Prims.of_int (0x0e));
       (Prims.of_int (0x0f));
       (Prims.of_int (0x10));
       (Prims.of_int (0x11));
       (Prims.of_int (0x12));
       (Prims.of_int (0x13));
       (Prims.of_int (0x14));
       (Prims.of_int (0x15));
       (Prims.of_int (0x16));
       (Prims.of_int (0x17));
       (Prims.of_int (0x18));
       (Prims.of_int (0x19));
       (Prims.of_int (0x1a));
       (Prims.of_int (0x1b));
       (Prims.of_int (0x1c));
       (Prims.of_int (0x1d));
       (Prims.of_int (0x1e));
       (Prims.of_int (0x1f))])
let (test2_input_plaintext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [Prims.int_zero;
       (Prims.of_int (0x11));
       (Prims.of_int (0x22));
       (Prims.of_int (0x33));
       (Prims.of_int (0x44));
       (Prims.of_int (0x55));
       (Prims.of_int (0x66));
       (Prims.of_int (0x77));
       (Prims.of_int (0x88));
       (Prims.of_int (0x99));
       (Prims.of_int (0xaa));
       (Prims.of_int (0xbb));
       (Prims.of_int (0xcc));
       (Prims.of_int (0xdd));
       (Prims.of_int (0xee));
       (Prims.of_int (0xff))])
let (test2_output_ciphertext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0x8e));
       (Prims.of_int (0xa2));
       (Prims.of_int (0xb7));
       (Prims.of_int (0xca));
       (Prims.of_int (0x51));
       (Prims.of_int (0x67));
       (Prims.of_int (0x45));
       (Prims.of_int (0xbf));
       (Prims.of_int (0xea));
       (Prims.of_int (0xfc));
       (Prims.of_int (0x49));
       (Prims.of_int (0x90));
       (Prims.of_int (0x4b));
       (Prims.of_int (0x49));
       (Prims.of_int (0x60));
       (Prims.of_int (0x89))])
let (test3_input_key : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0xc4));
       (Prims.of_int (0x7b));
       (Prims.of_int (0x02));
       (Prims.of_int (0x94));
       (Prims.of_int (0xdb));
       (Prims.of_int (0xbb));
       (Prims.of_int (0xee));
       (Prims.of_int (0x0f));
       (Prims.of_int (0xec));
       (Prims.of_int (0x47));
       (Prims.of_int (0x57));
       (Prims.of_int (0xf2));
       (Prims.of_int (0x2f));
       (Prims.of_int (0xfe));
       (Prims.of_int (0xee));
       (Prims.of_int (0x35));
       (Prims.of_int (0x87));
       (Prims.of_int (0xca));
       (Prims.of_int (0x47));
       (Prims.of_int (0x30));
       (Prims.of_int (0xc3));
       (Prims.of_int (0xd3));
       (Prims.of_int (0x3b));
       (Prims.of_int (0x69));
       (Prims.of_int (0x1d));
       (Prims.of_int (0xf3));
       (Prims.of_int (0x8b));
       (Prims.of_int (0xab));
       (Prims.of_int (0x07));
       (Prims.of_int (0x6b));
       (Prims.of_int (0xc5));
       (Prims.of_int (0x58))])
let (test3_input_plaintext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
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
       Prims.int_zero])
let (test3_output_ciphertext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0x46));
       (Prims.of_int (0xf2));
       (Prims.of_int (0xfb));
       (Prims.of_int (0x34));
       (Prims.of_int (0x2d));
       (Prims.of_int (0x6f));
       (Prims.of_int (0x0a));
       (Prims.of_int (0xb4));
       (Prims.of_int (0x77));
       (Prims.of_int (0x47));
       (Prims.of_int (0x6f));
       (Prims.of_int (0xc5));
       Prims.int_one;
       (Prims.of_int (0x24));
       (Prims.of_int (0x2c));
       (Prims.of_int (0x5f))])
let (test4_input_key : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0xcc));
       (Prims.of_int (0xd1));
       (Prims.of_int (0xbc));
       (Prims.of_int (0x3c));
       (Prims.of_int (0x65));
       (Prims.of_int (0x9c));
       (Prims.of_int (0xd3));
       (Prims.of_int (0xc5));
       (Prims.of_int (0x9b));
       (Prims.of_int (0xc4));
       (Prims.of_int (0x37));
       (Prims.of_int (0x48));
       (Prims.of_int (0x4e));
       (Prims.of_int (0x3c));
       (Prims.of_int (0x5c));
       (Prims.of_int (0x72));
       (Prims.of_int (0x44));
       (Prims.of_int (0x41));
       (Prims.of_int (0xda));
       (Prims.of_int (0x8d));
       (Prims.of_int (0x6e));
       (Prims.of_int (0x90));
       (Prims.of_int (0xce));
       (Prims.of_int (0x55));
       (Prims.of_int (0x6c));
       (Prims.of_int (0xd5));
       (Prims.of_int (0x7d));
       (Prims.of_int (0x07));
       (Prims.of_int (0x52));
       (Prims.of_int (0x66));
       (Prims.of_int (0x3b));
       (Prims.of_int (0xbc))])
let (test4_input_plaintext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
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
       Prims.int_zero])
let (test4_output_ciphertext : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    (FStar_List_Tot_Base.map (fun n -> FStar_UInt8.uint_to_t n)
       [(Prims.of_int (0x30));
       (Prims.of_int (0x4f));
       (Prims.of_int (0x81));
       (Prims.of_int (0xab));
       (Prims.of_int (0x61));
       (Prims.of_int (0xa8));
       (Prims.of_int (0x0c));
       (Prims.of_int (0x2e));
       (Prims.of_int (0x74));
       (Prims.of_int (0x3b));
       (Prims.of_int (0x94));
       (Prims.of_int (0xd5));
       Prims.int_zero;
       (Prims.of_int (0x2a));
       (Prims.of_int (0x12));
       (Prims.of_int (0x6b))])
let (test_compare_buffers :
  Prims.string ->
    FStar_UInt8.t Lib_Sequence.seq ->
      FStar_UInt8.t Lib_Sequence.seq -> Prims.bool)
  =
  fun msg ->
    fun expected ->
      fun computed ->
        FStar_IO.print_string "\n";
        FStar_IO.print_string msg;
        FStar_IO.print_string "\nexpected (";
        FStar_IO.print_uint32_dec
          (FStar_UInt32.uint_to_t (Lib_Sequence.length expected));
        FStar_IO.print_string "):\n";
        FStar_List.iter (fun a -> FStar_IO.print_uint8_hex_pad a)
          (Lib_Sequence.to_list expected);
        FStar_IO.print_string "\n";
        FStar_IO.print_string "computed (";
        FStar_IO.print_uint32_dec
          (FStar_UInt32.uint_to_t (Lib_Sequence.length computed));
        FStar_IO.print_string "):\n";
        FStar_List.iter (fun a -> FStar_IO.print_uint8_hex_pad a)
          (Lib_Sequence.to_list computed);
        FStar_IO.print_string "\n";
        (let result =
           Lib_Sequence.for_all2 (Lib_Sequence.length computed)
             (fun x ->
                fun y ->
                  (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                     (Obj.magic x))
                    =
                    (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                       (Obj.magic y))) computed expected in
         if result
         then (FStar_IO.print_string "\nSuccess !\n"; true)
         else (FStar_IO.print_string "\nFailed !\n"; false))
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let seq =
      Lib_Sequence.create (Prims.of_int (256))
        (FStar_UInt8.uint_to_t Prims.int_zero) in
    let seqi =
      Lib_LoopCombinators.repeati (Prims.of_int (256))
        (fun i ->
           fun s ->
             Lib_Sequence.upd (Prims.of_int (256)) s i
               (FStar_UInt8.uint_to_t i)) seq in
    let seqsbox =
      Lib_Sequence.map (Prims.of_int (256)) (fun s -> Spec_AES.sub_byte s)
        (Obj.magic seqi) in
    FStar_IO.print_string "sbox i:     \n";
    FStar_List.iter
      (fun a ->
         FStar_IO.print_string (FStar_UInt8.to_string a);
         FStar_IO.print_string " ; ") (Lib_Sequence.to_list seqsbox);
    FStar_IO.print_string "\n";
    (let key = Lib_Sequence.of_list test_key in
     let nonce = Lib_Sequence.of_list test_nonce in
     let counter = test_counter in
     let plain = Lib_Sequence.of_list test_plaintext in
     let expected = Lib_Sequence.of_list test_ciphertext in
     let cip =
       Spec_AES.aes128_ctr_encrypt_bytes key (Prims.of_int (12)) nonce
         counter plain in
     FStar_IO.print_string "aes_cip computed 0:\n";
     FStar_List.iter
       (fun a ->
          FStar_IO.print_string (FStar_UInt8.to_string a);
          FStar_IO.print_string " ; ") (Lib_Sequence.to_list cip);
     FStar_IO.print_string "\n";
     FStar_IO.print_string "aes_cip expected 0:\n";
     FStar_List.iter
       (fun a ->
          FStar_IO.print_string (FStar_UInt8.to_string a);
          FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected);
     FStar_IO.print_string "\n";
     (let key1 = Lib_Sequence.of_list test_key1 in
      let nonce1 = Lib_Sequence.of_list test_nonce1 in
      let counter1 = test_counter1 in
      let plain1 = Lib_Sequence.of_list test_plaintext1 in
      let expected1 = Lib_Sequence.of_list test_ciphertext1 in
      let cip1 =
        Spec_AES.aes128_ctr_encrypt_bytes key1 (Prims.of_int (12)) nonce1
          counter1 plain1 in
      FStar_IO.print_string "aes_cip computed 1:\n";
      FStar_List.iter
        (fun a ->
           FStar_IO.print_string (FStar_UInt8.to_string a);
           FStar_IO.print_string " ; ") (Lib_Sequence.to_list cip1);
      FStar_IO.print_string "\n";
      FStar_IO.print_string "aes_cip expected 1:\n";
      FStar_List.iter
        (fun a ->
           FStar_IO.print_string (FStar_UInt8.to_string a);
           FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected1);
      FStar_IO.print_string "\n";
      (let key2 = Lib_Sequence.of_list test_key2 in
       let nonce2 = Lib_Sequence.of_list test_nonce2 in
       let counter2 = test_counter2 in
       let plain2 = Lib_Sequence.of_list test_plaintext2 in
       let expected2 = Lib_Sequence.of_list test_ciphertext2 in
       let cip2 =
         Spec_AES.aes128_ctr_encrypt_bytes key2 (Prims.of_int (12)) nonce2
           counter2 plain2 in
       FStar_IO.print_string "aes_cip computed 2:\n";
       FStar_List.iter
         (fun a ->
            FStar_IO.print_string (FStar_UInt8.to_string a);
            FStar_IO.print_string " ; ") (Lib_Sequence.to_list cip2);
       FStar_IO.print_string "\n";
       FStar_IO.print_string "aes_cip expected 2:\n";
       FStar_List.iter
         (fun a ->
            FStar_IO.print_string (FStar_UInt8.to_string a);
            FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected2);
       FStar_IO.print_string "\n";
       (let key3 = Lib_Sequence.of_list test1_key_block in
        let plain3 = Lib_Sequence.of_list test1_plaintext_block in
        let expected3 = Lib_Sequence.of_list test1_ciphertext_block in
        let xkey = Spec_AES.aes_key_expansion Spec_AES.AES128 key3 in
        let cip3 =
          Spec_AES.aes_encrypt_block Spec_AES.AES128 xkey (Obj.magic plain3) in
        FStar_IO.print_string "aes_cip computed 3:\n";
        FStar_List.iter
          (fun a ->
             FStar_IO.print_string (FStar_UInt8.to_string a);
             FStar_IO.print_string " ; ")
          (Lib_Sequence.to_list (Obj.magic cip3));
        FStar_IO.print_string "\n";
        FStar_IO.print_string "aes_cip expected 3:\n";
        FStar_List.iter
          (fun a ->
             FStar_IO.print_string (FStar_UInt8.to_string a);
             FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected3);
        FStar_IO.print_string "\n";
        (let key4 = Lib_Sequence.of_list test2_key_block in
         let plain4 = Lib_Sequence.of_list test2_plaintext_block in
         let expected4 = Lib_Sequence.of_list test2_ciphertext_block in
         let xkey1 = Spec_AES.aes_key_expansion Spec_AES.AES128 key4 in
         let cip4 =
           Spec_AES.aes_encrypt_block Spec_AES.AES128 xkey1
             (Obj.magic plain4) in
         FStar_IO.print_string "aes_cip computed 4:\n";
         FStar_List.iter
           (fun a ->
              FStar_IO.print_string (FStar_UInt8.to_string a);
              FStar_IO.print_string " ; ")
           (Lib_Sequence.to_list (Obj.magic cip4));
         FStar_IO.print_string "\n";
         FStar_IO.print_string "aes_cip expected 4:\n";
         FStar_List.iter
           (fun a ->
              FStar_IO.print_string (FStar_UInt8.to_string a);
              FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected4);
         FStar_IO.print_string "\n";
         (let key5 = Lib_Sequence.of_list test3_key_block in
          let plain5 = Lib_Sequence.of_list test2_plaintext_block in
          let expected5 = Lib_Sequence.of_list test3_ciphertext_block in
          let xkey2 = Spec_AES.aes_key_expansion Spec_AES.AES128 key5 in
          let cip5 =
            Spec_AES.aes_encrypt_block Spec_AES.AES128 xkey2
              (Obj.magic plain5) in
          FStar_IO.print_string "aes_cip computed 5:\n";
          FStar_List.iter
            (fun a ->
               FStar_IO.print_string (FStar_UInt8.to_string a);
               FStar_IO.print_string " ; ")
            (Lib_Sequence.to_list (Obj.magic cip5));
          FStar_IO.print_string "\n";
          FStar_IO.print_string "aes_cip expected 5:\n";
          FStar_List.iter
            (fun a ->
               FStar_IO.print_string (FStar_UInt8.to_string a);
               FStar_IO.print_string " ; ") (Lib_Sequence.to_list expected5);
          FStar_IO.print_string "\n";
          FStar_IO.print_string "AES-256 TESTS 6:\n";
          (let computed1 =
             Spec_AES.aes_key_expansion Spec_AES.AES256 test1_input_key1 in
           let result1 =
             test_compare_buffers "TEST1: key expansion"
               test1_output_expanded (Obj.magic computed1) in
           let test2_xkey =
             Spec_AES.aes_key_expansion Spec_AES.AES256 test2_input_key in
           let test2_computed =
             Spec_AES.aes_encrypt_block Spec_AES.AES256 test2_xkey
               (Obj.magic test2_input_plaintext) in
           let result2 =
             test_compare_buffers "TEST2: cipher" test2_output_ciphertext
               (Obj.magic test2_computed) in
           let test2_xkey1 =
             Spec_AES.aes_dec_key_expansion Spec_AES.AES256 test2_input_key in
           let test2_inv_computed =
             Spec_AES.aes_decrypt_block Spec_AES.AES256 test2_xkey1
               (Obj.magic test2_output_ciphertext) in
           let result3 =
             test_compare_buffers "TEST3: inv_cipher" test2_input_plaintext
               (Obj.magic test2_inv_computed) in
           let test3_xkey =
             Spec_AES.aes_key_expansion Spec_AES.AES256 test3_input_key in
           let test3_computed =
             Spec_AES.aes_encrypt_block Spec_AES.AES256 test3_xkey
               (Obj.magic test3_input_plaintext) in
           let result4 =
             test_compare_buffers "TEST4: cipher" test3_output_ciphertext
               (Obj.magic test3_computed) in
           let test3_xkey1 =
             Spec_AES.aes_dec_key_expansion Spec_AES.AES256 test3_input_key in
           let test3_inv_computed =
             Spec_AES.aes_decrypt_block Spec_AES.AES256 test3_xkey1
               (Obj.magic test3_output_ciphertext) in
           let result5 =
             test_compare_buffers "TEST5: inv_cipher" test3_input_plaintext
               (Obj.magic test3_inv_computed) in
           let test4_xkey =
             Spec_AES.aes_key_expansion Spec_AES.AES256 test4_input_key in
           let test4_computed =
             Spec_AES.aes_encrypt_block Spec_AES.AES256 test4_xkey
               (Obj.magic test4_input_plaintext) in
           let result6 =
             test_compare_buffers "TEST5: cipher" test4_output_ciphertext
               (Obj.magic test4_computed) in
           let test4_xkey1 =
             Spec_AES.aes_dec_key_expansion Spec_AES.AES256 test4_input_key in
           let test4_inv_computed =
             Spec_AES.aes_decrypt_block Spec_AES.AES256 test4_xkey1
               (Obj.magic test4_output_ciphertext) in
           let result7 =
             test_compare_buffers "TEST6: inv_cipher" test4_input_plaintext
               (Obj.magic test4_inv_computed) in
           (((((result1 && result2) && result3) && result4) && result5) &&
              result6)
             && result7)))))))