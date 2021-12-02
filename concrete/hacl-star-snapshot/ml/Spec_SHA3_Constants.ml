open Prims
type rotc_t = FStar_UInt32.t
let (rotc_list : rotc_t Prims.list) =
  [FStar_UInt32.uint_to_t Prims.int_one;
  FStar_UInt32.uint_to_t (Prims.of_int (3));
  FStar_UInt32.uint_to_t (Prims.of_int (6));
  FStar_UInt32.uint_to_t (Prims.of_int (10));
  FStar_UInt32.uint_to_t (Prims.of_int (15));
  FStar_UInt32.uint_to_t (Prims.of_int (21));
  FStar_UInt32.uint_to_t (Prims.of_int (28));
  FStar_UInt32.uint_to_t (Prims.of_int (36));
  FStar_UInt32.uint_to_t (Prims.of_int (45));
  FStar_UInt32.uint_to_t (Prims.of_int (55));
  FStar_UInt32.uint_to_t (Prims.of_int (2));
  FStar_UInt32.uint_to_t (Prims.of_int (14));
  FStar_UInt32.uint_to_t (Prims.of_int (27));
  FStar_UInt32.uint_to_t (Prims.of_int (41));
  FStar_UInt32.uint_to_t (Prims.of_int (56));
  FStar_UInt32.uint_to_t (Prims.of_int (8));
  FStar_UInt32.uint_to_t (Prims.of_int (25));
  FStar_UInt32.uint_to_t (Prims.of_int (43));
  FStar_UInt32.uint_to_t (Prims.of_int (62));
  FStar_UInt32.uint_to_t (Prims.of_int (18));
  FStar_UInt32.uint_to_t (Prims.of_int (39));
  FStar_UInt32.uint_to_t (Prims.of_int (61));
  FStar_UInt32.uint_to_t (Prims.of_int (20));
  FStar_UInt32.uint_to_t (Prims.of_int (44))]
let (keccak_rotc : (rotc_t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    [FStar_UInt32.uint_to_t Prims.int_one;
    FStar_UInt32.uint_to_t (Prims.of_int (3));
    FStar_UInt32.uint_to_t (Prims.of_int (6));
    FStar_UInt32.uint_to_t (Prims.of_int (10));
    FStar_UInt32.uint_to_t (Prims.of_int (15));
    FStar_UInt32.uint_to_t (Prims.of_int (21));
    FStar_UInt32.uint_to_t (Prims.of_int (28));
    FStar_UInt32.uint_to_t (Prims.of_int (36));
    FStar_UInt32.uint_to_t (Prims.of_int (45));
    FStar_UInt32.uint_to_t (Prims.of_int (55));
    FStar_UInt32.uint_to_t (Prims.of_int (2));
    FStar_UInt32.uint_to_t (Prims.of_int (14));
    FStar_UInt32.uint_to_t (Prims.of_int (27));
    FStar_UInt32.uint_to_t (Prims.of_int (41));
    FStar_UInt32.uint_to_t (Prims.of_int (56));
    FStar_UInt32.uint_to_t (Prims.of_int (8));
    FStar_UInt32.uint_to_t (Prims.of_int (25));
    FStar_UInt32.uint_to_t (Prims.of_int (43));
    FStar_UInt32.uint_to_t (Prims.of_int (62));
    FStar_UInt32.uint_to_t (Prims.of_int (18));
    FStar_UInt32.uint_to_t (Prims.of_int (39));
    FStar_UInt32.uint_to_t (Prims.of_int (61));
    FStar_UInt32.uint_to_t (Prims.of_int (20));
    FStar_UInt32.uint_to_t (Prims.of_int (44))]
type piln_t = FStar_UInt32.t
let (piln_list : piln_t Prims.list) =
  [FStar_UInt32.uint_to_t (Prims.of_int (10));
  FStar_UInt32.uint_to_t (Prims.of_int (7));
  FStar_UInt32.uint_to_t (Prims.of_int (11));
  FStar_UInt32.uint_to_t (Prims.of_int (17));
  FStar_UInt32.uint_to_t (Prims.of_int (18));
  FStar_UInt32.uint_to_t (Prims.of_int (3));
  FStar_UInt32.uint_to_t (Prims.of_int (5));
  FStar_UInt32.uint_to_t (Prims.of_int (16));
  FStar_UInt32.uint_to_t (Prims.of_int (8));
  FStar_UInt32.uint_to_t (Prims.of_int (21));
  FStar_UInt32.uint_to_t (Prims.of_int (24));
  FStar_UInt32.uint_to_t (Prims.of_int (4));
  FStar_UInt32.uint_to_t (Prims.of_int (15));
  FStar_UInt32.uint_to_t (Prims.of_int (23));
  FStar_UInt32.uint_to_t (Prims.of_int (19));
  FStar_UInt32.uint_to_t (Prims.of_int (13));
  FStar_UInt32.uint_to_t (Prims.of_int (12));
  FStar_UInt32.uint_to_t (Prims.of_int (2));
  FStar_UInt32.uint_to_t (Prims.of_int (20));
  FStar_UInt32.uint_to_t (Prims.of_int (14));
  FStar_UInt32.uint_to_t (Prims.of_int (22));
  FStar_UInt32.uint_to_t (Prims.of_int (9));
  FStar_UInt32.uint_to_t (Prims.of_int (6));
  FStar_UInt32.uint_to_t Prims.int_one]
let (keccak_piln : (piln_t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    [FStar_UInt32.uint_to_t (Prims.of_int (10));
    FStar_UInt32.uint_to_t (Prims.of_int (7));
    FStar_UInt32.uint_to_t (Prims.of_int (11));
    FStar_UInt32.uint_to_t (Prims.of_int (17));
    FStar_UInt32.uint_to_t (Prims.of_int (18));
    FStar_UInt32.uint_to_t (Prims.of_int (3));
    FStar_UInt32.uint_to_t (Prims.of_int (5));
    FStar_UInt32.uint_to_t (Prims.of_int (16));
    FStar_UInt32.uint_to_t (Prims.of_int (8));
    FStar_UInt32.uint_to_t (Prims.of_int (21));
    FStar_UInt32.uint_to_t (Prims.of_int (24));
    FStar_UInt32.uint_to_t (Prims.of_int (4));
    FStar_UInt32.uint_to_t (Prims.of_int (15));
    FStar_UInt32.uint_to_t (Prims.of_int (23));
    FStar_UInt32.uint_to_t (Prims.of_int (19));
    FStar_UInt32.uint_to_t (Prims.of_int (13));
    FStar_UInt32.uint_to_t (Prims.of_int (12));
    FStar_UInt32.uint_to_t (Prims.of_int (2));
    FStar_UInt32.uint_to_t (Prims.of_int (20));
    FStar_UInt32.uint_to_t (Prims.of_int (14));
    FStar_UInt32.uint_to_t (Prims.of_int (22));
    FStar_UInt32.uint_to_t (Prims.of_int (9));
    FStar_UInt32.uint_to_t (Prims.of_int (6));
    FStar_UInt32.uint_to_t Prims.int_one]
let (rndc_list : FStar_UInt64.t Prims.list) =
  [FStar_UInt64.uint_to_t Prims.int_one;
  FStar_UInt64.uint_to_t (Prims.of_int (0x0000000000008082));
  FStar_UInt64.uint_to_t (Prims.parse_int "0x800000000000808a");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008000");
  FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000808b));
  FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080000001");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008081");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008009");
  FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000008a));
  FStar_UInt64.uint_to_t (Prims.of_int (0x0000000000000088));
  FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080008009");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x000000008000000a");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x000000008000808b");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x800000000000008b");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008089");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008003");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008002");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000000080");
  FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000800a));
  FStar_UInt64.uint_to_t (Prims.parse_int "0x800000008000000a");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008081");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008080");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080000001");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008008")]
let (keccak_rndc : (FStar_UInt64.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list
    [FStar_UInt64.uint_to_t Prims.int_one;
    FStar_UInt64.uint_to_t (Prims.of_int (0x0000000000008082));
    FStar_UInt64.uint_to_t (Prims.parse_int "0x800000000000808a");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008000");
    FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000808b));
    FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080000001");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008081");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008009");
    FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000008a));
    FStar_UInt64.uint_to_t (Prims.of_int (0x0000000000000088));
    FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080008009");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x000000008000000a");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x000000008000808b");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x800000000000008b");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008089");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008003");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008002");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000000080");
    FStar_UInt64.uint_to_t (Prims.of_int (0x000000000000800a));
    FStar_UInt64.uint_to_t (Prims.parse_int "0x800000008000000a");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008081");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000000008080");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x0000000080000001");
    FStar_UInt64.uint_to_t (Prims.parse_int "0x8000000080008008")]