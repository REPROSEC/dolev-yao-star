open Prims
let (init_as_list : FStar_UInt32.t Prims.list) =
  [FStar_UInt32.uint_to_t (Prims.parse_int "0x67452301");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xefcdab89");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x98badcfe");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x10325476")]
let (h0 : FStar_UInt32.t FStar_Seq_Base.seq) =
  FStar_Seq_Properties.seq_of_list
    [FStar_UInt32.uint_to_t (Prims.parse_int "0x67452301");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xefcdab89");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x98badcfe");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x10325476")]
let (init : unit Spec_Hash_Definitions.init_t) = Obj.magic (h0, ())
let (f :
  FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) =
  fun x ->
    fun y ->
      fun z ->
        FStar_UInt32.logor (FStar_UInt32.logand x y)
          (FStar_UInt32.logand (FStar_UInt32.lognot x) z)
let (g :
  FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) =
  fun x ->
    fun y ->
      fun z ->
        FStar_UInt32.logor (FStar_UInt32.logand x z)
          (FStar_UInt32.logand y (FStar_UInt32.lognot z))
let (h :
  FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) =
  fun x -> fun y -> fun z -> FStar_UInt32.logxor x (FStar_UInt32.logxor y z)
let (i :
  FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) =
  fun x ->
    fun y ->
      fun z ->
        FStar_UInt32.logxor y (FStar_UInt32.logor x (FStar_UInt32.lognot z))
let (t_as_list : FStar_UInt32.t Prims.list) =
  [FStar_UInt32.uint_to_t (Prims.parse_int "0xd76aa478");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xe8c7b756");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x242070db");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xc1bdceee");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf57c0faf");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x4787c62a");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xa8304613");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfd469501");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x698098d8");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x8b44f7af");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xffff5bb1");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x895cd7be");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x6b901122");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfd987193");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xa679438e");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x49b40821");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf61e2562");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xc040b340");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x265e5a51");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xe9b6c7aa");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xd62f105d");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x02441453");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xd8a1e681");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xe7d3fbc8");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x21e1cde6");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xc33707d6");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf4d50d87");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x455a14ed");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xa9e3e905");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfcefa3f8");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x676f02d9");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x8d2a4c8a");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfffa3942");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x8771f681");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x6d9d6122");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfde5380c");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xa4beea44");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x4bdecfa9");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf6bb4b60");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xbebfbc70");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x289b7ec6");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xeaa127fa");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xd4ef3085");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x4881d05");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xd9d4d039");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xe6db99e5");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x1fa27cf8");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xc4ac5665");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf4292244");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x432aff97");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xab9423a7");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfc93a039");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x655b59c3");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x8f0ccc92");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xffeff47d");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x85845dd1");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x6fa87e4f");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xfe2ce6e0");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xa3014314");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x4e0811a1");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xf7537e82");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xbd3af235");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x2ad7d2bb");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xeb86d391")]
let (t : (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq) =
  FStar_Seq_Properties.seq_of_list
    [FStar_UInt32.uint_to_t (Prims.parse_int "0xd76aa478");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xe8c7b756");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x242070db");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xc1bdceee");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf57c0faf");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x4787c62a");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xa8304613");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfd469501");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x698098d8");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x8b44f7af");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xffff5bb1");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x895cd7be");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x6b901122");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfd987193");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xa679438e");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x49b40821");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf61e2562");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xc040b340");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x265e5a51");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xe9b6c7aa");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xd62f105d");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x02441453");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xd8a1e681");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xe7d3fbc8");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x21e1cde6");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xc33707d6");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf4d50d87");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x455a14ed");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xa9e3e905");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfcefa3f8");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x676f02d9");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x8d2a4c8a");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfffa3942");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x8771f681");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x6d9d6122");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfde5380c");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xa4beea44");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x4bdecfa9");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf6bb4b60");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xbebfbc70");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x289b7ec6");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xeaa127fa");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xd4ef3085");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x4881d05");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xd9d4d039");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xe6db99e5");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x1fa27cf8");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xc4ac5665");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf4292244");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x432aff97");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xab9423a7");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfc93a039");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x655b59c3");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x8f0ccc92");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xffeff47d");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x85845dd1");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x6fa87e4f");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xfe2ce6e0");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xa3014314");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x4e0811a1");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xf7537e82");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xbd3af235");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x2ad7d2bb");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xeb86d391")]
type abcd_idx = Prims.nat
type abcd_t = (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq
type x_idx = Prims.nat
type x_t = (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq
type t_idx = Prims.nat
type rotate_idx = FStar_UInt32.t
let (round_op_gen_aux :
  (FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) ->
    abcd_t ->
      x_t ->
        abcd_idx ->
          abcd_idx ->
            abcd_idx ->
              abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  =
  fun f1 ->
    fun abcd ->
      fun x ->
        fun a ->
          fun b ->
            fun c ->
              fun d ->
                fun k ->
                  fun s ->
                    fun i1 ->
                      let va = FStar_Seq_Base.index abcd a in
                      let vb = FStar_Seq_Base.index abcd b in
                      let vc = FStar_Seq_Base.index abcd c in
                      let vd = FStar_Seq_Base.index abcd d in
                      FStar_Seq_Base.upd abcd a
                        (FStar_UInt32.add_mod vb
                           (FStar_UInt32.logor
                              (FStar_UInt32.shift_left
                                 (FStar_UInt32.add_mod
                                    (FStar_UInt32.add_mod
                                       (FStar_UInt32.add_mod va (f1 vb vc vd))
                                       (FStar_Seq_Base.index x k))
                                    (FStar_Seq_Base.index t
                                       (i1 - Prims.int_one))) s)
                              (FStar_UInt32.shift_right
                                 (FStar_UInt32.add_mod
                                    (FStar_UInt32.add_mod
                                       (FStar_UInt32.add_mod va (f1 vb vc vd))
                                       (FStar_Seq_Base.index x k))
                                    (FStar_Seq_Base.index t
                                       (i1 - Prims.int_one)))
                                 (FStar_UInt32.sub
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (32))) s))))
let (round_op_gen :
  (FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t) ->
    abcd_t ->
      x_t ->
        abcd_idx ->
          abcd_idx ->
            abcd_idx ->
              abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  = round_op_gen_aux
let (round1_op :
  abcd_t ->
    x_t ->
      abcd_idx ->
        abcd_idx ->
          abcd_idx -> abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  =
  round_op_gen
    (fun x ->
       fun y ->
         fun z ->
           FStar_UInt32.logor (FStar_UInt32.logand x y)
             (FStar_UInt32.logand (FStar_UInt32.lognot x) z))
let (ia : abcd_idx) = Prims.int_zero
let (ib : abcd_idx) = Prims.int_one
let (ic : abcd_idx) = (Prims.of_int (2))
let (id : abcd_idx) = (Prims.of_int (3))
let (round1_aux : abcd_t -> x_t -> abcd_t) =
  fun abcd ->
    fun x ->
      let abcd1 =
        round1_op abcd x ia ib ic id Prims.int_zero
          (FStar_UInt32.uint_to_t (Prims.of_int (7))) Prims.int_one in
      let abcd2 =
        round1_op abcd1 x id ia ib ic Prims.int_one
          (FStar_UInt32.uint_to_t (Prims.of_int (12))) (Prims.of_int (2)) in
      let abcd3 =
        round1_op abcd2 x ic id ia ib (Prims.of_int (2))
          (FStar_UInt32.uint_to_t (Prims.of_int (17))) (Prims.of_int (3)) in
      let abcd4 =
        round1_op abcd3 x ib ic id ia (Prims.of_int (3))
          (FStar_UInt32.uint_to_t (Prims.of_int (22))) (Prims.of_int (4)) in
      let abcd5 =
        round1_op abcd4 x ia ib ic id (Prims.of_int (4))
          (FStar_UInt32.uint_to_t (Prims.of_int (7))) (Prims.of_int (5)) in
      let abcd6 =
        round1_op abcd5 x id ia ib ic (Prims.of_int (5))
          (FStar_UInt32.uint_to_t (Prims.of_int (12))) (Prims.of_int (6)) in
      let abcd7 =
        round1_op abcd6 x ic id ia ib (Prims.of_int (6))
          (FStar_UInt32.uint_to_t (Prims.of_int (17))) (Prims.of_int (7)) in
      let abcd8 =
        round1_op abcd7 x ib ic id ia (Prims.of_int (7))
          (FStar_UInt32.uint_to_t (Prims.of_int (22))) (Prims.of_int (8)) in
      let abcd9 =
        round1_op abcd8 x ia ib ic id (Prims.of_int (8))
          (FStar_UInt32.uint_to_t (Prims.of_int (7))) (Prims.of_int (9)) in
      let abcd10 =
        round1_op abcd9 x id ia ib ic (Prims.of_int (9))
          (FStar_UInt32.uint_to_t (Prims.of_int (12))) (Prims.of_int (10)) in
      let abcd11 =
        round1_op abcd10 x ic id ia ib (Prims.of_int (10))
          (FStar_UInt32.uint_to_t (Prims.of_int (17))) (Prims.of_int (11)) in
      let abcd12 =
        round1_op abcd11 x ib ic id ia (Prims.of_int (11))
          (FStar_UInt32.uint_to_t (Prims.of_int (22))) (Prims.of_int (12)) in
      let abcd13 =
        round1_op abcd12 x ia ib ic id (Prims.of_int (12))
          (FStar_UInt32.uint_to_t (Prims.of_int (7))) (Prims.of_int (13)) in
      let abcd14 =
        round1_op abcd13 x id ia ib ic (Prims.of_int (13))
          (FStar_UInt32.uint_to_t (Prims.of_int (12))) (Prims.of_int (14)) in
      let abcd15 =
        round1_op abcd14 x ic id ia ib (Prims.of_int (14))
          (FStar_UInt32.uint_to_t (Prims.of_int (17))) (Prims.of_int (15)) in
      let abcd16 =
        round1_op abcd15 x ib ic id ia (Prims.of_int (15))
          (FStar_UInt32.uint_to_t (Prims.of_int (22))) (Prims.of_int (16)) in
      abcd16
let (round1 : abcd_t -> x_t -> abcd_t) = round1_aux
let (round2_op :
  abcd_t ->
    x_t ->
      abcd_idx ->
        abcd_idx ->
          abcd_idx -> abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  =
  round_op_gen
    (fun x ->
       fun y ->
         fun z ->
           FStar_UInt32.logor (FStar_UInt32.logand x z)
             (FStar_UInt32.logand y (FStar_UInt32.lognot z)))
let (round2_aux : abcd_t -> x_t -> abcd_t) =
  fun abcd ->
    fun x ->
      let abcd1 =
        round2_op abcd x ia ib ic id Prims.int_one
          (FStar_UInt32.uint_to_t (Prims.of_int (5))) (Prims.of_int (17)) in
      let abcd2 =
        round2_op abcd1 x id ia ib ic (Prims.of_int (6))
          (FStar_UInt32.uint_to_t (Prims.of_int (9))) (Prims.of_int (18)) in
      let abcd3 =
        round2_op abcd2 x ic id ia ib (Prims.of_int (11))
          (FStar_UInt32.uint_to_t (Prims.of_int (14))) (Prims.of_int (19)) in
      let abcd4 =
        round2_op abcd3 x ib ic id ia Prims.int_zero
          (FStar_UInt32.uint_to_t (Prims.of_int (20))) (Prims.of_int (20)) in
      let abcd5 =
        round2_op abcd4 x ia ib ic id (Prims.of_int (5))
          (FStar_UInt32.uint_to_t (Prims.of_int (5))) (Prims.of_int (21)) in
      let abcd6 =
        round2_op abcd5 x id ia ib ic (Prims.of_int (10))
          (FStar_UInt32.uint_to_t (Prims.of_int (9))) (Prims.of_int (22)) in
      let abcd7 =
        round2_op abcd6 x ic id ia ib (Prims.of_int (15))
          (FStar_UInt32.uint_to_t (Prims.of_int (14))) (Prims.of_int (23)) in
      let abcd8 =
        round2_op abcd7 x ib ic id ia (Prims.of_int (4))
          (FStar_UInt32.uint_to_t (Prims.of_int (20))) (Prims.of_int (24)) in
      let abcd9 =
        round2_op abcd8 x ia ib ic id (Prims.of_int (9))
          (FStar_UInt32.uint_to_t (Prims.of_int (5))) (Prims.of_int (25)) in
      let abcd10 =
        round2_op abcd9 x id ia ib ic (Prims.of_int (14))
          (FStar_UInt32.uint_to_t (Prims.of_int (9))) (Prims.of_int (26)) in
      let abcd11 =
        round2_op abcd10 x ic id ia ib (Prims.of_int (3))
          (FStar_UInt32.uint_to_t (Prims.of_int (14))) (Prims.of_int (27)) in
      let abcd12 =
        round2_op abcd11 x ib ic id ia (Prims.of_int (8))
          (FStar_UInt32.uint_to_t (Prims.of_int (20))) (Prims.of_int (28)) in
      let abcd13 =
        round2_op abcd12 x ia ib ic id (Prims.of_int (13))
          (FStar_UInt32.uint_to_t (Prims.of_int (5))) (Prims.of_int (29)) in
      let abcd14 =
        round2_op abcd13 x id ia ib ic (Prims.of_int (2))
          (FStar_UInt32.uint_to_t (Prims.of_int (9))) (Prims.of_int (30)) in
      let abcd15 =
        round2_op abcd14 x ic id ia ib (Prims.of_int (7))
          (FStar_UInt32.uint_to_t (Prims.of_int (14))) (Prims.of_int (31)) in
      let abcd16 =
        round2_op abcd15 x ib ic id ia (Prims.of_int (12))
          (FStar_UInt32.uint_to_t (Prims.of_int (20))) (Prims.of_int (32)) in
      abcd16
let (round2 : abcd_t -> x_t -> abcd_t) = round2_aux
let (round3_op :
  abcd_t ->
    x_t ->
      abcd_idx ->
        abcd_idx ->
          abcd_idx -> abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  =
  round_op_gen
    (fun x ->
       fun y -> fun z -> FStar_UInt32.logxor x (FStar_UInt32.logxor y z))
let (round3_aux : abcd_t -> x_t -> abcd_t) =
  fun abcd ->
    fun x ->
      let abcd1 =
        round3_op abcd x ia ib ic id (Prims.of_int (5))
          (FStar_UInt32.uint_to_t (Prims.of_int (4))) (Prims.of_int (33)) in
      let abcd2 =
        round3_op abcd1 x id ia ib ic (Prims.of_int (8))
          (FStar_UInt32.uint_to_t (Prims.of_int (11))) (Prims.of_int (34)) in
      let abcd3 =
        round3_op abcd2 x ic id ia ib (Prims.of_int (11))
          (FStar_UInt32.uint_to_t (Prims.of_int (16))) (Prims.of_int (35)) in
      let abcd4 =
        round3_op abcd3 x ib ic id ia (Prims.of_int (14))
          (FStar_UInt32.uint_to_t (Prims.of_int (23))) (Prims.of_int (36)) in
      let abcd5 =
        round3_op abcd4 x ia ib ic id Prims.int_one
          (FStar_UInt32.uint_to_t (Prims.of_int (4))) (Prims.of_int (37)) in
      let abcd6 =
        round3_op abcd5 x id ia ib ic (Prims.of_int (4))
          (FStar_UInt32.uint_to_t (Prims.of_int (11))) (Prims.of_int (38)) in
      let abcd7 =
        round3_op abcd6 x ic id ia ib (Prims.of_int (7))
          (FStar_UInt32.uint_to_t (Prims.of_int (16))) (Prims.of_int (39)) in
      let abcd8 =
        round3_op abcd7 x ib ic id ia (Prims.of_int (10))
          (FStar_UInt32.uint_to_t (Prims.of_int (23))) (Prims.of_int (40)) in
      let abcd9 =
        round3_op abcd8 x ia ib ic id (Prims.of_int (13))
          (FStar_UInt32.uint_to_t (Prims.of_int (4))) (Prims.of_int (41)) in
      let abcd10 =
        round3_op abcd9 x id ia ib ic Prims.int_zero
          (FStar_UInt32.uint_to_t (Prims.of_int (11))) (Prims.of_int (42)) in
      let abcd11 =
        round3_op abcd10 x ic id ia ib (Prims.of_int (3))
          (FStar_UInt32.uint_to_t (Prims.of_int (16))) (Prims.of_int (43)) in
      let abcd12 =
        round3_op abcd11 x ib ic id ia (Prims.of_int (6))
          (FStar_UInt32.uint_to_t (Prims.of_int (23))) (Prims.of_int (44)) in
      let abcd13 =
        round3_op abcd12 x ia ib ic id (Prims.of_int (9))
          (FStar_UInt32.uint_to_t (Prims.of_int (4))) (Prims.of_int (45)) in
      let abcd14 =
        round3_op abcd13 x id ia ib ic (Prims.of_int (12))
          (FStar_UInt32.uint_to_t (Prims.of_int (11))) (Prims.of_int (46)) in
      let abcd15 =
        round3_op abcd14 x ic id ia ib (Prims.of_int (15))
          (FStar_UInt32.uint_to_t (Prims.of_int (16))) (Prims.of_int (47)) in
      let abcd16 =
        round3_op abcd15 x ib ic id ia (Prims.of_int (2))
          (FStar_UInt32.uint_to_t (Prims.of_int (23))) (Prims.of_int (48)) in
      abcd16
let (round3 : abcd_t -> x_t -> abcd_t) = round3_aux
let (round4_op :
  abcd_t ->
    x_t ->
      abcd_idx ->
        abcd_idx ->
          abcd_idx -> abcd_idx -> x_idx -> FStar_UInt32.t -> t_idx -> abcd_t)
  =
  round_op_gen
    (fun x ->
       fun y ->
         fun z ->
           FStar_UInt32.logxor y
             (FStar_UInt32.logor x (FStar_UInt32.lognot z)))
let (round4_aux : abcd_t -> x_t -> abcd_t) =
  fun abcd ->
    fun x ->
      let abcd1 =
        round4_op abcd x ia ib ic id Prims.int_zero
          (FStar_UInt32.uint_to_t (Prims.of_int (6))) (Prims.of_int (49)) in
      let abcd2 =
        round4_op abcd1 x id ia ib ic (Prims.of_int (7))
          (FStar_UInt32.uint_to_t (Prims.of_int (10))) (Prims.of_int (50)) in
      let abcd3 =
        round4_op abcd2 x ic id ia ib (Prims.of_int (14))
          (FStar_UInt32.uint_to_t (Prims.of_int (15))) (Prims.of_int (51)) in
      let abcd4 =
        round4_op abcd3 x ib ic id ia (Prims.of_int (5))
          (FStar_UInt32.uint_to_t (Prims.of_int (21))) (Prims.of_int (52)) in
      let abcd5 =
        round4_op abcd4 x ia ib ic id (Prims.of_int (12))
          (FStar_UInt32.uint_to_t (Prims.of_int (6))) (Prims.of_int (53)) in
      let abcd6 =
        round4_op abcd5 x id ia ib ic (Prims.of_int (3))
          (FStar_UInt32.uint_to_t (Prims.of_int (10))) (Prims.of_int (54)) in
      let abcd7 =
        round4_op abcd6 x ic id ia ib (Prims.of_int (10))
          (FStar_UInt32.uint_to_t (Prims.of_int (15))) (Prims.of_int (55)) in
      let abcd8 =
        round4_op abcd7 x ib ic id ia Prims.int_one
          (FStar_UInt32.uint_to_t (Prims.of_int (21))) (Prims.of_int (56)) in
      let abcd9 =
        round4_op abcd8 x ia ib ic id (Prims.of_int (8))
          (FStar_UInt32.uint_to_t (Prims.of_int (6))) (Prims.of_int (57)) in
      let abcd10 =
        round4_op abcd9 x id ia ib ic (Prims.of_int (15))
          (FStar_UInt32.uint_to_t (Prims.of_int (10))) (Prims.of_int (58)) in
      let abcd11 =
        round4_op abcd10 x ic id ia ib (Prims.of_int (6))
          (FStar_UInt32.uint_to_t (Prims.of_int (15))) (Prims.of_int (59)) in
      let abcd12 =
        round4_op abcd11 x ib ic id ia (Prims.of_int (13))
          (FStar_UInt32.uint_to_t (Prims.of_int (21))) (Prims.of_int (60)) in
      let abcd13 =
        round4_op abcd12 x ia ib ic id (Prims.of_int (4))
          (FStar_UInt32.uint_to_t (Prims.of_int (6))) (Prims.of_int (61)) in
      let abcd14 =
        round4_op abcd13 x id ia ib ic (Prims.of_int (11))
          (FStar_UInt32.uint_to_t (Prims.of_int (10))) (Prims.of_int (62)) in
      let abcd15 =
        round4_op abcd14 x ic id ia ib (Prims.of_int (2))
          (FStar_UInt32.uint_to_t (Prims.of_int (15))) (Prims.of_int (63)) in
      let abcd16 =
        round4_op abcd15 x ib ic id ia (Prims.of_int (9))
          (FStar_UInt32.uint_to_t (Prims.of_int (21))) (Prims.of_int (64)) in
      abcd16
let (round4 : abcd_t -> x_t -> abcd_t) = round4_aux
let (rounds_aux : abcd_t -> x_t -> abcd_t) =
  fun abcd ->
    fun x ->
      let abcd1 = round1 abcd x in
      let abcd2 = round2 abcd1 x in
      let abcd3 = round3 abcd2 x in let abcd4 = round4 abcd3 x in abcd4
let (rounds : abcd_t -> x_t -> abcd_t) = rounds_aux
let (overwrite_aux :
  abcd_t ->
    FStar_UInt32.t ->
      FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> abcd_t)
  =
  fun abcd ->
    fun a' ->
      fun b' ->
        fun c' ->
          fun d' ->
            let abcd1 = FStar_Seq_Base.upd abcd ia a' in
            let abcd2 = FStar_Seq_Base.upd abcd1 ib b' in
            let abcd3 = FStar_Seq_Base.upd abcd2 ic c' in
            let abcd4 = FStar_Seq_Base.upd abcd3 id d' in abcd4
let (overwrite :
  abcd_t ->
    FStar_UInt32.t ->
      FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> abcd_t)
  = overwrite_aux
let (update_aux :
  unit Spec_Hash_Definitions.words_state ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      unit Spec_Hash_Definitions.words_state)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun abcd ->
         fun x ->
           let uu___ = abcd in
           match Obj.magic uu___ with
           | (abcd1, uu___1) ->
               let x1 =
                 Obj.magic
                   (Spec_Hash_Definitions.words_of_bytes
                      Spec_Hash_Definitions.MD5 (Prims.of_int (16)) x) in
               let aa = FStar_Seq_Base.index abcd1 ia in
               let bb = FStar_Seq_Base.index abcd1 ib in
               let cc = FStar_Seq_Base.index abcd1 ic in
               let dd = FStar_Seq_Base.index abcd1 id in
               let abcd2 = rounds abcd1 x1 in
               Obj.magic
                 ((overwrite abcd2
                     (FStar_UInt32.add_mod (FStar_Seq_Base.index abcd2 ia) aa)
                     (FStar_UInt32.add_mod (FStar_Seq_Base.index abcd2 ib) bb)
                     (FStar_UInt32.add_mod (FStar_Seq_Base.index abcd2 ic) cc)
                     (FStar_UInt32.add_mod (FStar_Seq_Base.index abcd2 id) dd)),
                   ())) uu___1 uu___
let (update : unit Spec_Hash_Definitions.update_t) = update_aux
let (pad : unit Spec_Hash_Definitions.pad_t) =
  Spec_Hash_PadFinish.pad Spec_Hash_Definitions.MD5
let (finish : unit Spec_Hash_Definitions.finish_t) =
  Spec_Hash_PadFinish.finish Spec_Hash_Definitions.MD5