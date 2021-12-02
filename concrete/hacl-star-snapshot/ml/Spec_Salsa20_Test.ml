open Prims
let (test_quarter_round : unit -> Prims.bool) =
  fun uu___ ->
    let expected1_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero] in
    let expected2_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t (Prims.parse_int "0x08008145");
        FStar_UInt32.uint_to_t (Prims.of_int (0x80));
        FStar_UInt32.uint_to_t (Prims.parse_int "0x010200");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x20500000")] in
    let expected1 = Lib_Sequence.of_list expected1_l in
    let expected2 = Lib_Sequence.of_list expected2_l in
    let st =
      Lib_Sequence.create (Prims.of_int (16))
        (FStar_UInt32.uint_to_t Prims.int_zero) in
    let st1 =
      Spec_Salsa20.quarter_round Prims.int_zero Prims.int_one
        (Prims.of_int (2)) (Prims.of_int (3)) st in
    let st2 =
      Spec_Salsa20.quarter_round Prims.int_zero Prims.int_one
        (Prims.of_int (2)) (Prims.of_int (3))
        (Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
           (FStar_UInt32.uint_to_t Prims.int_one)) in
    let computed1 =
      Lib_Sequence.slice (Prims.of_int (16)) st1 Prims.int_zero
        (Prims.of_int (4)) in
    let computed2 =
      Lib_Sequence.slice (Prims.of_int (16)) st2 Prims.int_zero
        (Prims.of_int (4)) in
    let res1 =
      Lib_Sequence.for_all2 (Prims.of_int (4))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC
                  (Obj.magic b))) computed1 expected1 in
    let res2 =
      Lib_Sequence.for_all2 (Prims.of_int (4))
        (fun a ->
           fun b ->
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a))
               =
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC
                  (Obj.magic b))) computed2 expected2 in
    res1 && res2
let (test_row_round : unit -> Prims.bool) =
  fun uu___ ->
    let expected_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t (Prims.parse_int "0x08008145");
        FStar_UInt32.uint_to_t (Prims.of_int (0x00000080));
        FStar_UInt32.uint_to_t (Prims.parse_int "0x00010200");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x20500000");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x20100001");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x00048044");
        FStar_UInt32.uint_to_t (Prims.of_int (0x00000080));
        FStar_UInt32.uint_to_t (Prims.parse_int "0x00010000");
        FStar_UInt32.uint_to_t Prims.int_one;
        FStar_UInt32.uint_to_t (Prims.of_int (0x00002000));
        FStar_UInt32.uint_to_t (Prims.parse_int "0x80040000");
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_one;
        FStar_UInt32.uint_to_t (Prims.of_int (0x00000200));
        FStar_UInt32.uint_to_t (Prims.parse_int "0x00402000");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x88000100")] in
    let expected = Lib_Sequence.of_list expected_l in
    let st =
      Lib_Sequence.create (Prims.of_int (16))
        (FStar_UInt32.uint_to_t Prims.int_zero) in
    let st1 =
      Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st2 =
      Lib_Sequence.upd (Prims.of_int (16)) st1 (Prims.of_int (4))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st3 =
      Lib_Sequence.upd (Prims.of_int (16)) st2 (Prims.of_int (8))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st4 =
      Lib_Sequence.upd (Prims.of_int (16)) st3 (Prims.of_int (12))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st5 = Spec_Salsa20.row_round st4 in
    Lib_Sequence.for_all2 (Prims.of_int (16))
      (fun a ->
         fun b ->
           (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a)) =
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic b)))
      st5 expected
let (test_column_round : unit -> Prims.bool) =
  fun uu___ ->
    let expected_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t (Prims.parse_int "0x10090288");
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t (Prims.of_int (0x00000101));
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t (Prims.parse_int "0x00020401");
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t (Prims.parse_int "0x40a04001");
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero;
        FStar_UInt32.uint_to_t Prims.int_zero] in
    let expected = Lib_Sequence.of_list expected_l in
    let st =
      Lib_Sequence.create (Prims.of_int (16))
        (FStar_UInt32.uint_to_t Prims.int_zero) in
    let st1 =
      Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st2 =
      Lib_Sequence.upd (Prims.of_int (16)) st1 (Prims.of_int (4))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st3 =
      Lib_Sequence.upd (Prims.of_int (16)) st2 (Prims.of_int (8))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st4 =
      Lib_Sequence.upd (Prims.of_int (16)) st3 (Prims.of_int (12))
        (FStar_UInt32.uint_to_t Prims.int_one) in
    let st5 = Spec_Salsa20.column_round st4 in
    Lib_Sequence.for_all2 (Prims.of_int (16))
      (fun a ->
         fun b ->
           (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a)) =
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic b)))
      st5 expected
let (test_column_round2 : unit -> Prims.bool) =
  fun uu___ ->
    let expected_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t (Prims.parse_int "0x8c9d190a");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xce8e4c90");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x1ef8e9d3");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x1326a71a");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x90a20123");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xead3c4f3");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x63a091a0");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xf0708d69");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x789b010c");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xd195a681");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xeb7d5504");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xa774135c");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x481c2027");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x53a8e4b5");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x4c1f89c5");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x3f78c9c8")] in
    let expected = Lib_Sequence.of_list expected_l in
    let st0_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt32.uint_to_t (Prims.parse_int "0x08521bd6");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x1fe88837");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xbb2aa576");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x3aa26365");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xc54c6a5b");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x2fc74c2f");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x6dd39cc3");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xda0a64f6");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x90a2f23d");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x067f95a6");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x06b35f61");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x41e4732e");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xe859c100");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xea4d84b7");
        FStar_UInt32.uint_to_t (Prims.parse_int "0x0f619bff");
        FStar_UInt32.uint_to_t (Prims.parse_int "0xbc6e965a")] in
    let st0 = Lib_Sequence.of_list st0_l in
    let st = Spec_Salsa20.column_round st0 in
    Lib_Sequence.for_all2 (Prims.of_int (16))
      (fun a ->
         fun b ->
           (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a)) =
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic b)))
      st expected
let (test_salsa20_core : unit -> Prims.bool) =
  fun uu___ ->
    let inp_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt8.uint_to_t (Prims.of_int (211));
        FStar_UInt8.uint_to_t (Prims.of_int (159));
        FStar_UInt8.uint_to_t (Prims.of_int (13));
        FStar_UInt8.uint_to_t (Prims.of_int (115));
        FStar_UInt8.uint_to_t (Prims.of_int (76));
        FStar_UInt8.uint_to_t (Prims.of_int (55));
        FStar_UInt8.uint_to_t (Prims.of_int (82));
        FStar_UInt8.uint_to_t (Prims.of_int (183));
        FStar_UInt8.uint_to_t (Prims.of_int (3));
        FStar_UInt8.uint_to_t (Prims.of_int (117));
        FStar_UInt8.uint_to_t (Prims.of_int (222));
        FStar_UInt8.uint_to_t (Prims.of_int (37));
        FStar_UInt8.uint_to_t (Prims.of_int (191));
        FStar_UInt8.uint_to_t (Prims.of_int (187));
        FStar_UInt8.uint_to_t (Prims.of_int (234));
        FStar_UInt8.uint_to_t (Prims.of_int (136));
        FStar_UInt8.uint_to_t (Prims.of_int (49));
        FStar_UInt8.uint_to_t (Prims.of_int (237));
        FStar_UInt8.uint_to_t (Prims.of_int (179));
        FStar_UInt8.uint_to_t (Prims.of_int (48));
        FStar_UInt8.uint_to_t Prims.int_one;
        FStar_UInt8.uint_to_t (Prims.of_int (106));
        FStar_UInt8.uint_to_t (Prims.of_int (178));
        FStar_UInt8.uint_to_t (Prims.of_int (219));
        FStar_UInt8.uint_to_t (Prims.of_int (175));
        FStar_UInt8.uint_to_t (Prims.of_int (199));
        FStar_UInt8.uint_to_t (Prims.of_int (166));
        FStar_UInt8.uint_to_t (Prims.of_int (48));
        FStar_UInt8.uint_to_t (Prims.of_int (86));
        FStar_UInt8.uint_to_t (Prims.of_int (16));
        FStar_UInt8.uint_to_t (Prims.of_int (179));
        FStar_UInt8.uint_to_t (Prims.of_int (207));
        FStar_UInt8.uint_to_t (Prims.of_int (31));
        FStar_UInt8.uint_to_t (Prims.of_int (240));
        FStar_UInt8.uint_to_t (Prims.of_int (32));
        FStar_UInt8.uint_to_t (Prims.of_int (63));
        FStar_UInt8.uint_to_t (Prims.of_int (15));
        FStar_UInt8.uint_to_t (Prims.of_int (83));
        FStar_UInt8.uint_to_t (Prims.of_int (93));
        FStar_UInt8.uint_to_t (Prims.of_int (161));
        FStar_UInt8.uint_to_t (Prims.of_int (116));
        FStar_UInt8.uint_to_t (Prims.of_int (147));
        FStar_UInt8.uint_to_t (Prims.of_int (48));
        FStar_UInt8.uint_to_t (Prims.of_int (113));
        FStar_UInt8.uint_to_t (Prims.of_int (238));
        FStar_UInt8.uint_to_t (Prims.of_int (55));
        FStar_UInt8.uint_to_t (Prims.of_int (204));
        FStar_UInt8.uint_to_t (Prims.of_int (36));
        FStar_UInt8.uint_to_t (Prims.of_int (79));
        FStar_UInt8.uint_to_t (Prims.of_int (201));
        FStar_UInt8.uint_to_t (Prims.of_int (235));
        FStar_UInt8.uint_to_t (Prims.of_int (79));
        FStar_UInt8.uint_to_t (Prims.of_int (3));
        FStar_UInt8.uint_to_t (Prims.of_int (81));
        FStar_UInt8.uint_to_t (Prims.of_int (156));
        FStar_UInt8.uint_to_t (Prims.of_int (47));
        FStar_UInt8.uint_to_t (Prims.of_int (203));
        FStar_UInt8.uint_to_t (Prims.of_int (26));
        FStar_UInt8.uint_to_t (Prims.of_int (244));
        FStar_UInt8.uint_to_t (Prims.of_int (243));
        FStar_UInt8.uint_to_t (Prims.of_int (88));
        FStar_UInt8.uint_to_t (Prims.of_int (118));
        FStar_UInt8.uint_to_t (Prims.of_int (104));
        FStar_UInt8.uint_to_t (Prims.of_int (54))] in
    let inp = Lib_Sequence.of_list inp_l in
    let expected_l =
      FStar_List_Tot_Base.map (fun x -> x)
        [FStar_UInt8.uint_to_t (Prims.of_int (109));
        FStar_UInt8.uint_to_t (Prims.of_int (42));
        FStar_UInt8.uint_to_t (Prims.of_int (178));
        FStar_UInt8.uint_to_t (Prims.of_int (168));
        FStar_UInt8.uint_to_t (Prims.of_int (156));
        FStar_UInt8.uint_to_t (Prims.of_int (240));
        FStar_UInt8.uint_to_t (Prims.of_int (248));
        FStar_UInt8.uint_to_t (Prims.of_int (238));
        FStar_UInt8.uint_to_t (Prims.of_int (168));
        FStar_UInt8.uint_to_t (Prims.of_int (196));
        FStar_UInt8.uint_to_t (Prims.of_int (190));
        FStar_UInt8.uint_to_t (Prims.of_int (203));
        FStar_UInt8.uint_to_t (Prims.of_int (26));
        FStar_UInt8.uint_to_t (Prims.of_int (110));
        FStar_UInt8.uint_to_t (Prims.of_int (170));
        FStar_UInt8.uint_to_t (Prims.of_int (154));
        FStar_UInt8.uint_to_t (Prims.of_int (29));
        FStar_UInt8.uint_to_t (Prims.of_int (29));
        FStar_UInt8.uint_to_t (Prims.of_int (150));
        FStar_UInt8.uint_to_t (Prims.of_int (26));
        FStar_UInt8.uint_to_t (Prims.of_int (150));
        FStar_UInt8.uint_to_t (Prims.of_int (30));
        FStar_UInt8.uint_to_t (Prims.of_int (235));
        FStar_UInt8.uint_to_t (Prims.of_int (249));
        FStar_UInt8.uint_to_t (Prims.of_int (190));
        FStar_UInt8.uint_to_t (Prims.of_int (163));
        FStar_UInt8.uint_to_t (Prims.of_int (251));
        FStar_UInt8.uint_to_t (Prims.of_int (48));
        FStar_UInt8.uint_to_t (Prims.of_int (69));
        FStar_UInt8.uint_to_t (Prims.of_int (144));
        FStar_UInt8.uint_to_t (Prims.of_int (51));
        FStar_UInt8.uint_to_t (Prims.of_int (57));
        FStar_UInt8.uint_to_t (Prims.of_int (118));
        FStar_UInt8.uint_to_t (Prims.of_int (40));
        FStar_UInt8.uint_to_t (Prims.of_int (152));
        FStar_UInt8.uint_to_t (Prims.of_int (157));
        FStar_UInt8.uint_to_t (Prims.of_int (180));
        FStar_UInt8.uint_to_t (Prims.of_int (57));
        FStar_UInt8.uint_to_t (Prims.of_int (27));
        FStar_UInt8.uint_to_t (Prims.of_int (94));
        FStar_UInt8.uint_to_t (Prims.of_int (107));
        FStar_UInt8.uint_to_t (Prims.of_int (42));
        FStar_UInt8.uint_to_t (Prims.of_int (236));
        FStar_UInt8.uint_to_t (Prims.of_int (35));
        FStar_UInt8.uint_to_t (Prims.of_int (27));
        FStar_UInt8.uint_to_t (Prims.of_int (111));
        FStar_UInt8.uint_to_t (Prims.of_int (114));
        FStar_UInt8.uint_to_t (Prims.of_int (114));
        FStar_UInt8.uint_to_t (Prims.of_int (219));
        FStar_UInt8.uint_to_t (Prims.of_int (236));
        FStar_UInt8.uint_to_t (Prims.of_int (232));
        FStar_UInt8.uint_to_t (Prims.of_int (135));
        FStar_UInt8.uint_to_t (Prims.of_int (111));
        FStar_UInt8.uint_to_t (Prims.of_int (155));
        FStar_UInt8.uint_to_t (Prims.of_int (110));
        FStar_UInt8.uint_to_t (Prims.of_int (18));
        FStar_UInt8.uint_to_t (Prims.of_int (24));
        FStar_UInt8.uint_to_t (Prims.of_int (232));
        FStar_UInt8.uint_to_t (Prims.of_int (95));
        FStar_UInt8.uint_to_t (Prims.of_int (158));
        FStar_UInt8.uint_to_t (Prims.of_int (179));
        FStar_UInt8.uint_to_t (Prims.of_int (19));
        FStar_UInt8.uint_to_t (Prims.of_int (48));
        FStar_UInt8.uint_to_t (Prims.of_int (202))] in
    let expected = Lib_Sequence.of_list expected_l in
    let st =
      Lib_Sequence.createi (Prims.of_int (16))
        (fun i ->
           let n =
             Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC
               (Obj.magic
                  (Lib_Sequence.sub (Prims.of_int (64)) inp
                     (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
           FStar_UInt32.uint_to_t n) in
    let st1 = Spec_Salsa20.salsa20_core Prims.int_zero st in
    Lib_Sequence.for_all2 (Prims.of_int (16))
      (fun a ->
         fun b ->
           (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic a)) =
             (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic b)))
      st1
      (Lib_Sequence.createi (Prims.of_int (16))
         (fun i ->
            let n =
              Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC
                (Obj.magic
                   (Lib_Sequence.sub (Prims.of_int (64)) expected
                      (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
            FStar_UInt32.uint_to_t n))
let (test : unit -> Prims.bool) =
  fun uu___ ->
    let result =
      ((((test_quarter_round ()) && (test_row_round ())) &&
          (test_column_round ()))
         && (test_column_round2 ()))
        && (test_salsa20_core ()) in
    if result
    then (FStar_IO.print_string "\nSuccess!\n"; true)
    else (FStar_IO.print_string "\nFailure :("; false)