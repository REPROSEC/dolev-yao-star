open Prims
let (scalar1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4))]
let (scalar2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d))]
let (input1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c))]
let (input2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93))]
let (expected1 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52))]
let (expected2 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x94));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57))]
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let scalar11 = Lib_Sequence.of_list scalar1 in
    let scalar21 = Lib_Sequence.of_list scalar2 in
    let input11 = Lib_Sequence.of_list input1 in
    let input21 = Lib_Sequence.of_list input2 in
    let expected11 = Lib_Sequence.of_list expected1 in
    let expected21 = Lib_Sequence.of_list expected2 in
    let computed1 = Spec_Curve25519.scalarmult scalar11 input11 in
    let computed2 = Spec_Curve25519.scalarmult scalar21 input21 in
    let result1 =
      Lib_Sequence.for_all2 (Prims.of_int (32))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        computed1 expected11 in
    let result2 =
      Lib_Sequence.for_all2 (Prims.of_int (32))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        computed2 expected21 in
    FStar_IO.print_string "Expected Shared Secret:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list expected11);
    FStar_IO.print_string "\nComputed Shared Secret:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list computed1);
    if result1
    then FStar_IO.print_string "\nSuccess!\n"
    else FStar_IO.print_string "\nFailure :(\n";
    FStar_IO.print_string "Expected Shared Secret:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list expected21);
    FStar_IO.print_string "\nComputed Shared Secret:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list computed2);
    if result2
    then FStar_IO.print_string "\nSuccess!\n"
    else FStar_IO.print_string "\nFailure :(\n";
    result1 && result2