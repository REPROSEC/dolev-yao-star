open Prims
let (msg : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x46));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70))]
let (k : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b))]
let (expected : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x30));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9))]
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let msg1 = Lib_Sequence.of_list msg in
    let k1 = Lib_Sequence.of_list k in
    let expected1 = Lib_Sequence.of_list expected in
    let mac = Spec_Poly1305.poly1305_mac msg1 k1 in
    let result =
      Lib_Sequence.for_all2 Spec_Poly1305.size_block
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC (Obj.magic b)))
        mac expected1 in
    FStar_IO.print_string "Expected MAC:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list expected1);
    FStar_IO.print_string "\nComputed MAC:";
    FStar_List.iter
      (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
      (Lib_Sequence.to_list mac);
    if result
    then (FStar_IO.print_string "\nSuccess!\n"; true)
    else (FStar_IO.print_string "\nFailure :(\n"; false)