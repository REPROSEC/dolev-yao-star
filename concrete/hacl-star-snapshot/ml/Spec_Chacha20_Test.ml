open Prims
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
let (test_ciphertext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x56));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d))]
let (test_key : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (2));
    FStar_UInt8.uint_to_t (Prims.of_int (3));
    FStar_UInt8.uint_to_t (Prims.of_int (4));
    FStar_UInt8.uint_to_t (Prims.of_int (5));
    FStar_UInt8.uint_to_t (Prims.of_int (6));
    FStar_UInt8.uint_to_t (Prims.of_int (7));
    FStar_UInt8.uint_to_t (Prims.of_int (8));
    FStar_UInt8.uint_to_t (Prims.of_int (9));
    FStar_UInt8.uint_to_t (Prims.of_int (10));
    FStar_UInt8.uint_to_t (Prims.of_int (11));
    FStar_UInt8.uint_to_t (Prims.of_int (12));
    FStar_UInt8.uint_to_t (Prims.of_int (13));
    FStar_UInt8.uint_to_t (Prims.of_int (14));
    FStar_UInt8.uint_to_t (Prims.of_int (15));
    FStar_UInt8.uint_to_t (Prims.of_int (16));
    FStar_UInt8.uint_to_t (Prims.of_int (17));
    FStar_UInt8.uint_to_t (Prims.of_int (18));
    FStar_UInt8.uint_to_t (Prims.of_int (19));
    FStar_UInt8.uint_to_t (Prims.of_int (20));
    FStar_UInt8.uint_to_t (Prims.of_int (21));
    FStar_UInt8.uint_to_t (Prims.of_int (22));
    FStar_UInt8.uint_to_t (Prims.of_int (23));
    FStar_UInt8.uint_to_t (Prims.of_int (24));
    FStar_UInt8.uint_to_t (Prims.of_int (25));
    FStar_UInt8.uint_to_t (Prims.of_int (26));
    FStar_UInt8.uint_to_t (Prims.of_int (27));
    FStar_UInt8.uint_to_t (Prims.of_int (28));
    FStar_UInt8.uint_to_t (Prims.of_int (29));
    FStar_UInt8.uint_to_t (Prims.of_int (30));
    FStar_UInt8.uint_to_t (Prims.of_int (31))]
let (test_nonce : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t Prims.int_zero]
let (test_counter : Prims.int) = Prims.int_one
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let test_plaintext1 = Lib_Sequence.of_list test_plaintext in
    let test_ciphertext1 = Lib_Sequence.of_list test_ciphertext in
    let test_key1 = Lib_Sequence.of_list test_key in
    let test_nonce1 = Lib_Sequence.of_list test_nonce in
    let cipher =
      Spec_Chacha20.chacha20_encrypt_bytes test_key1 test_nonce1 test_counter
        test_plaintext1 in
    let result =
      Lib_Sequence.for_all2 (Prims.of_int (114))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        cipher test_ciphertext1 in
    FStar_IO.print_string "Expected cipher:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list test_ciphertext1);
    FStar_IO.print_string "\nComputed cipher:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list cipher);
    if result
    then (FStar_IO.print_string "\n\nChacha20 : Success!\n"; true)
    else (FStar_IO.print_string "\n\nChacha20: Failure :(\n"; false)