open Prims
type 'a state_s = (Obj.t, unit) Lib_Sequence.lseq
type idx = Prims.nat
let (g1 :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      idx -> idx -> FStar_UInt32.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          fun r ->
            Lib_Sequence.upd (Prims.of_int (16)) wv i
              (Lib_IntTypes.rotate_right
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_IntTypes.logxor
                    (match a with
                     | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                     | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                    Lib_IntTypes.SEC
                    (Lib_Sequence.index (Prims.of_int (16)) wv i)
                    (Lib_Sequence.index (Prims.of_int (16)) wv j)) r)
let (g2 :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      idx -> idx -> Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          fun x ->
            Lib_Sequence.upd (Prims.of_int (16)) wv i
              (Lib_IntTypes.add_mod
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_IntTypes.add_mod
                    (match a with
                     | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                     | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                    Lib_IntTypes.SEC
                    (Lib_Sequence.index (Prims.of_int (16)) wv i)
                    (Lib_Sequence.index (Prims.of_int (16)) wv j)) x)
let (g2z :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      idx -> idx -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          Lib_Sequence.upd (Prims.of_int (16)) wv i
            (Lib_IntTypes.add_mod
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_Sequence.index (Prims.of_int (16)) wv i)
               (Lib_Sequence.index (Prims.of_int (16)) wv j))
let (blake2_mixing :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      idx ->
        idx ->
          idx -> idx -> Obj.t -> Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun al ->
    fun wv ->
      fun a ->
        fun b ->
          fun c ->
            fun d ->
              fun x ->
                fun y ->
                  let rt =
                    match al with
                    | Spec_Blake2.Blake2S ->
                        Lib_Sequence.of_list
                          [FStar_UInt32.uint_to_t (Prims.of_int (16));
                          FStar_UInt32.uint_to_t (Prims.of_int (12));
                          FStar_UInt32.uint_to_t (Prims.of_int (8));
                          FStar_UInt32.uint_to_t (Prims.of_int (7))]
                    | Spec_Blake2.Blake2B ->
                        Lib_Sequence.of_list
                          [FStar_UInt32.uint_to_t (Prims.of_int (32));
                          FStar_UInt32.uint_to_t (Prims.of_int (24));
                          FStar_UInt32.uint_to_t (Prims.of_int (16));
                          FStar_UInt32.uint_to_t (Prims.of_int (63))] in
                  let wv1 = g2 al wv a b x in
                  let wv2 =
                    g1 al wv1 d a
                      (Lib_Sequence.index (Prims.of_int (4)) rt
                         Prims.int_zero) in
                  let wv3 = g2z al wv2 c d in
                  let wv4 =
                    g1 al wv3 b c
                      (Lib_Sequence.index (Prims.of_int (4)) rt Prims.int_one) in
                  let wv5 = g2 al wv4 a b y in
                  let wv6 =
                    g1 al wv5 d a
                      (Lib_Sequence.index (Prims.of_int (4)) rt
                         (Prims.of_int (2))) in
                  let wv7 = g2z al wv6 c d in
                  let wv8 =
                    g1 al wv7 b c
                      (Lib_Sequence.index (Prims.of_int (4)) rt
                         (Prims.of_int (3))) in
                  wv8
let (gather_state :
  Spec_Blake2.alg ->
    unit Spec_Blake2.block_w -> Prims.nat -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun al ->
    fun m ->
      fun start ->
        let m0 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero]) start))) in
        let m1 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + Prims.int_one)))) in
        let m2 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (2)))))) in
        let m3 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (3)))))) in
        let m4 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (4)))))) in
        let m5 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (5)))))) in
        let m6 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (6)))))) in
        let m7 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (7)))))) in
        let m8 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (8)))))) in
        let m9 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (9)))))) in
        let m10 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (10)))))) in
        let m11 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (11)))))) in
        let m12 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (12)))))) in
        let m13 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (13)))))) in
        let m14 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (14)))))) in
        let m15 =
          Lib_Sequence.index (Prims.of_int (16)) m
            (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
               (Obj.magic
                  (Lib_Sequence.index (Prims.of_int (160))
                     (Lib_Sequence.of_list
                        [FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t Prims.int_zero;
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (10));
                        FStar_UInt32.uint_to_t (Prims.of_int (2));
                        FStar_UInt32.uint_to_t (Prims.of_int (8));
                        FStar_UInt32.uint_to_t (Prims.of_int (4));
                        FStar_UInt32.uint_to_t (Prims.of_int (7));
                        FStar_UInt32.uint_to_t (Prims.of_int (6));
                        FStar_UInt32.uint_to_t Prims.int_one;
                        FStar_UInt32.uint_to_t (Prims.of_int (5));
                        FStar_UInt32.uint_to_t (Prims.of_int (15));
                        FStar_UInt32.uint_to_t (Prims.of_int (11));
                        FStar_UInt32.uint_to_t (Prims.of_int (9));
                        FStar_UInt32.uint_to_t (Prims.of_int (14));
                        FStar_UInt32.uint_to_t (Prims.of_int (3));
                        FStar_UInt32.uint_to_t (Prims.of_int (12));
                        FStar_UInt32.uint_to_t (Prims.of_int (13));
                        FStar_UInt32.uint_to_t Prims.int_zero])
                     (start + (Prims.of_int (15)))))) in
        let l =
          [m0;
          m1;
          m2;
          m3;
          m4;
          m5;
          m6;
          m7;
          m8;
          m9;
          m10;
          m11;
          m12;
          m13;
          m14;
          m15] in
        Lib_Sequence.of_list l
let (blake2_round :
  Spec_Blake2.alg ->
    unit Spec_Blake2.block_w ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun alg ->
    fun m ->
      fun i ->
        fun st ->
          let start = (i mod (Prims.of_int (10))) * (Prims.of_int (16)) in
          let m_s = gather_state alg m start in
          let st1 =
            blake2_mixing alg st Prims.int_zero (Prims.of_int (4))
              (Prims.of_int (8)) (Prims.of_int (12))
              (Lib_Sequence.index (Prims.of_int (16)) m_s Prims.int_zero)
              (Lib_Sequence.index (Prims.of_int (16)) m_s Prims.int_one) in
          let st2 =
            blake2_mixing alg st1 Prims.int_one (Prims.of_int (5))
              (Prims.of_int (9)) (Prims.of_int (13))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (2)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (3))) in
          let st3 =
            blake2_mixing alg st2 (Prims.of_int (2)) (Prims.of_int (6))
              (Prims.of_int (10)) (Prims.of_int (14))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (4)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (5))) in
          let st4 =
            blake2_mixing alg st3 (Prims.of_int (3)) (Prims.of_int (7))
              (Prims.of_int (11)) (Prims.of_int (15))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (6)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (7))) in
          let st5 =
            blake2_mixing alg st4 Prims.int_zero (Prims.of_int (5))
              (Prims.of_int (10)) (Prims.of_int (15))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (8)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (9))) in
          let st6 =
            blake2_mixing alg st5 Prims.int_one (Prims.of_int (6))
              (Prims.of_int (11)) (Prims.of_int (12))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (10)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (11))) in
          let st7 =
            blake2_mixing alg st6 (Prims.of_int (2)) (Prims.of_int (7))
              (Prims.of_int (8)) (Prims.of_int (13))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (12)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (13))) in
          let st8 =
            blake2_mixing alg st7 (Prims.of_int (3)) (Prims.of_int (4))
              (Prims.of_int (9)) (Prims.of_int (14))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (14)))
              (Lib_Sequence.index (Prims.of_int (16)) m_s (Prims.of_int (15))) in
          st8
let (blake2_compress0 :
  Spec_Blake2.alg -> unit Spec_Blake2.block_s -> unit Spec_Blake2.block_w) =
  fun a ->
    fun m ->
      Lib_Sequence.createi (Prims.of_int (16))
        (fun i ->
           let n =
             Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC
               (Obj.magic
                  (Lib_Sequence.sub
                     ((Prims.of_int (16)) *
                        (Lib_IntTypes.numbytes
                           (match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) m
                     (i *
                        (Lib_IntTypes.numbytes
                           (match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))
                     (Lib_IntTypes.numbytes
                        (match a with
                         | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                         | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))) in
           Lib_IntTypes.mk_int
             (match a with
              | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
              | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC n)
let (blake2_compress1 :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      Obj.t -> Prims.bool -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s_iv ->
      fun offset ->
        fun flag ->
          let wv = s_iv in
          let low_offset =
            match match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
            with
            | Lib_IntTypes.U32 ->
                Obj.repr
                  (Lib_IntTypes.to_u32
                     (match match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC offset)
            | Lib_IntTypes.U64 ->
                Obj.repr
                  (Lib_IntTypes.to_u64
                     (match match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC offset) in
          let high_offset =
            match match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
            with
            | Lib_IntTypes.U32 ->
                Obj.repr
                  (Lib_IntTypes.to_u32
                     (match match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC
                     (Lib_IntTypes.shift_right
                        (match match a with
                               | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                               | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                         with
                         | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                         | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                        Lib_IntTypes.SEC offset
                        (FStar_UInt32.uint_to_t
                           (Lib_IntTypes.bits
                              (match a with
                               | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                               | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))))
            | Lib_IntTypes.U64 ->
                Obj.repr
                  (Lib_IntTypes.to_u64
                     (match match a with
                            | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                            | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC
                     (Lib_IntTypes.shift_right
                        (match match a with
                               | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                               | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                         with
                         | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                         | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                        Lib_IntTypes.SEC offset
                        (FStar_UInt32.uint_to_t
                           (Lib_IntTypes.bits
                              (match a with
                               | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                               | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))))) in
          let m_12 = low_offset in
          let m_13 = high_offset in
          let m_14 =
            if flag
            then
              Lib_IntTypes.ones
                (match a with
                 | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                 | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
            else
              (match a with
               | Spec_Blake2.Blake2S ->
                   Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
               | Spec_Blake2.Blake2B ->
                   Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)) in
          let m_15 =
            match a with
            | Spec_Blake2.Blake2S ->
                Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
            | Spec_Blake2.Blake2B ->
                Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero) in
          let wv1 =
            Lib_Sequence.upd (Prims.of_int (16)) wv (Prims.of_int (12))
              (Lib_IntTypes.logxor
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_Sequence.index (Prims.of_int (16)) wv
                    (Prims.of_int (12))) m_12) in
          let wv2 =
            Lib_Sequence.upd (Prims.of_int (16)) wv1 (Prims.of_int (13))
              (Lib_IntTypes.logxor
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_Sequence.index (Prims.of_int (16)) wv1
                    (Prims.of_int (13))) m_13) in
          let wv3 =
            Lib_Sequence.upd (Prims.of_int (16)) wv2 (Prims.of_int (14))
              (Lib_IntTypes.logxor
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_Sequence.index (Prims.of_int (16)) wv2
                    (Prims.of_int (14))) m_14) in
          let wv4 =
            Lib_Sequence.upd (Prims.of_int (16)) wv3 (Prims.of_int (15))
              (Lib_IntTypes.logxor
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                 (Lib_Sequence.index (Prims.of_int (16)) wv3
                    (Prims.of_int (15))) m_15) in
          wv4
let (blake2_compress2 :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      unit Spec_Blake2.block_w -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun m ->
        Lib_LoopCombinators.repeati
          (match a with
           | Spec_Blake2.Blake2S -> (Prims.of_int (10))
           | Spec_Blake2.Blake2B -> (Prims.of_int (12))) (blake2_round a m)
          wv
let (blake2_compress3 :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun s ->
        let s1 =
          Lib_Sequence.upd (Prims.of_int (16)) s Prims.int_zero
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s Prims.int_zero)
                  (Lib_Sequence.index (Prims.of_int (16)) wv Prims.int_zero))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (8)))) in
        let s2 =
          Lib_Sequence.upd (Prims.of_int (16)) s1 Prims.int_one
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s1 Prims.int_one)
                  (Lib_Sequence.index (Prims.of_int (16)) wv Prims.int_one))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (9)))) in
        let s3 =
          Lib_Sequence.upd (Prims.of_int (16)) s2 (Prims.of_int (2))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s2
                     (Prims.of_int (2)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (2))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (10)))) in
        let s4 =
          Lib_Sequence.upd (Prims.of_int (16)) s3 (Prims.of_int (3))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s3
                     (Prims.of_int (3)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (3))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (11)))) in
        let s5 =
          Lib_Sequence.upd (Prims.of_int (16)) s4 (Prims.of_int (4))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s4
                     (Prims.of_int (4)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (4))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (12)))) in
        let s6 =
          Lib_Sequence.upd (Prims.of_int (16)) s5 (Prims.of_int (5))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s5
                     (Prims.of_int (5)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (5))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (13)))) in
        let s7 =
          Lib_Sequence.upd (Prims.of_int (16)) s6 (Prims.of_int (6))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s6
                     (Prims.of_int (6)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (6))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (14)))) in
        let s8 =
          Lib_Sequence.upd (Prims.of_int (16)) s7 (Prims.of_int (7))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.logxor
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (Lib_Sequence.index (Prims.of_int (16)) s7
                     (Prims.of_int (7)))
                  (Lib_Sequence.index (Prims.of_int (16)) wv
                     (Prims.of_int (7))))
               (Lib_Sequence.index (Prims.of_int (16)) wv (Prims.of_int (15)))) in
        s8
let (blake2_compress :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      unit Spec_Blake2.block_s ->
        Obj.t -> Prims.bool -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s_iv ->
      fun m ->
        fun offset ->
          fun flag ->
            let m_w = blake2_compress0 a m in
            let wv = blake2_compress1 a s_iv offset flag in
            let wv1 = blake2_compress2 a wv m_w in
            let s_iv1 = blake2_compress3 a wv1 s_iv in s_iv1
let (blake2_update_block :
  Spec_Blake2.alg ->
    Prims.bool ->
      Prims.nat ->
        unit Spec_Blake2.block_s ->
          (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun flag ->
      fun totlen ->
        fun d ->
          fun s ->
            let offset =
              match match a with
                    | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                    | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
              with
              | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt64.uint_to_t totlen)
              | Lib_IntTypes.U64 ->
                  Obj.repr
                    (let h =
                       FStar_UInt64.uint_to_t
                         (totlen / (Prims.pow2 (Prims.of_int (64)))) in
                     let l =
                       FStar_UInt64.uint_to_t
                         (totlen mod (Prims.pow2 (Prims.of_int (64)))) in
                     FStar_UInt128.add
                       (FStar_UInt128.shift_left
                          (FStar_UInt128.uint64_to_uint128 h)
                          (FStar_UInt32.uint_to_t (Prims.of_int (64))))
                       (FStar_UInt128.uint64_to_uint128 l)) in
            blake2_compress a s d offset flag
let (get_blocki :
  Spec_Blake2.alg ->
    FStar_UInt8.t Lib_Sequence.seq -> Prims.nat -> unit Spec_Blake2.block_s)
  =
  fun a ->
    fun m ->
      fun i ->
        FStar_Seq_Base.slice m
          (i *
             ((Prims.of_int (16)) *
                (Lib_IntTypes.numbytes
                   (match a with
                    | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                    | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))))
          ((i + Prims.int_one) *
             ((Prims.of_int (16)) *
                (Lib_IntTypes.numbytes
                   (match a with
                    | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                    | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))))
let (blake2_update1 :
  Spec_Blake2.alg ->
    Prims.nat ->
      FStar_UInt8.t Lib_Sequence.seq ->
        Prims.nat ->
          (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun prev ->
      fun m ->
        fun i ->
          fun s ->
            let totlen =
              prev +
                ((i + Prims.int_one) *
                   ((Prims.of_int (16)) *
                      (Lib_IntTypes.numbytes
                         (match a with
                          | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                          | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))) in
            let d = get_blocki a m i in
            blake2_update_block a false totlen d s
let (get_last_padded_block :
  Spec_Blake2.alg ->
    FStar_UInt8.t Lib_Sequence.seq -> Prims.nat -> unit Spec_Blake2.block_s)
  =
  fun a ->
    fun m ->
      fun rem ->
        let last =
          FStar_Seq_Base.slice m ((Lib_Sequence.length m) - rem)
            (Lib_Sequence.length m) in
        let last_block =
          Lib_Sequence.create
            ((Prims.of_int (16)) *
               (Lib_IntTypes.numbytes
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))
            (FStar_UInt8.uint_to_t Prims.int_zero) in
        let last_block1 =
          Lib_Sequence.update_sub
            ((Prims.of_int (16)) *
               (Lib_IntTypes.numbytes
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) last_block
            Prims.int_zero rem last in
        last_block1
let (blake2_update_last :
  Spec_Blake2.alg ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun prev ->
      fun rem ->
        fun m ->
          fun s ->
            let inlen = Lib_Sequence.length m in
            let totlen = prev + inlen in
            let last_block = get_last_padded_block a m rem in
            blake2_update_block a true totlen last_block s
let (split : Spec_Blake2.alg -> Prims.nat -> (Prims.nat * Prims.nat)) =
  fun a ->
    fun len ->
      let nb =
        len /
          ((Prims.of_int (16)) *
             (Lib_IntTypes.numbytes
                (match a with
                 | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                 | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) in
      let rem =
        len mod
          ((Prims.of_int (16)) *
             (Lib_IntTypes.numbytes
                (match a with
                 | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                 | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) in
      let nb' =
        if (rem = Prims.int_zero) && (nb > Prims.int_zero)
        then nb - Prims.int_one
        else nb in
      let rem' =
        if (rem = Prims.int_zero) && (nb > Prims.int_zero)
        then
          (Prims.of_int (16)) *
            (Lib_IntTypes.numbytes
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))
        else rem in
      (nb', rem')
let (blake2_update_blocks :
  Spec_Blake2.alg ->
    Prims.nat ->
      FStar_UInt8.t Lib_Sequence.seq ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun prev ->
      fun m ->
        fun s ->
          let uu____6884 = split a (Lib_Sequence.length m) in
          match uu____6884 with
          | (nb, rem) ->
              let s1 =
                Lib_LoopCombinators.repeati nb (blake2_update1 a prev m) s in
              blake2_update_last a prev rem m s1
let (blake2_init_hash :
  Spec_Blake2.alg ->
    Prims.nat -> Prims.nat -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun nn ->
        let iv0 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            Prims.int_zero in
        let iv1 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            Prims.int_one in
        let iv2 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (2)) in
        let iv3 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (3)) in
        let iv4 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (4)) in
        let iv5 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (5)) in
        let iv6 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (6)) in
        let iv7 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Spec_Blake2.Blake2S ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt32.uint_to_t
                            (Prims.parse_int "0x6A09E667");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xBB67AE85");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x3C6EF372");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0xA54FF53A");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x510E527F");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x9B05688C");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x1F83D9AB");
                         FStar_UInt32.uint_to_t
                           (Prims.parse_int "0x5BE0CD19")]))
             | Spec_Blake2.Blake2B ->
                 Obj.magic
                   (Obj.repr
                      (Lib_Sequence.of_list
                         [FStar_UInt64.uint_to_t
                            (Prims.parse_int "0x6A09E667F3BCC908");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xBB67AE8584CAA73B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x3C6EF372FE94F82B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0xA54FF53A5F1D36F1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x510E527FADE682D1");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x9B05688C2B3E6C1F");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x1F83D9ABFB41BD6B");
                         FStar_UInt64.uint_to_t
                           (Prims.parse_int "0x5BE0CD19137E2179")])))
            (Prims.of_int (7)) in
        let r0 = Lib_Sequence.of_list [iv0; iv1; iv2; iv3] in
        let r1 = Lib_Sequence.of_list [iv4; iv5; iv6; iv7] in
        let s0' =
          Lib_IntTypes.logxor
            (match a with
             | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
             | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
            (match match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
             with
             | Lib_IntTypes.U32 ->
                 Obj.repr
                   (FStar_UInt32.uint_to_t (Prims.parse_int "0x01010000"))
             | Lib_IntTypes.U64 ->
                 Obj.repr
                   (FStar_UInt64.uint_to_t (Prims.parse_int "0x01010000")))
            (Lib_IntTypes.logxor
               (match a with
                | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.shift_left
                  (match a with
                   | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                   | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                  Lib_IntTypes.SEC
                  (match match a with
                         | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                         | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                   with
                   | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt32.uint_to_t kk)
                   | Lib_IntTypes.U64 -> Obj.repr (FStar_UInt64.uint_to_t kk))
                  (FStar_UInt32.uint_to_t (Prims.of_int (8))))
               (match match a with
                      | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                      | Spec_Blake2.Blake2B -> Lib_IntTypes.U64
                with
                | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt32.uint_to_t nn)
                | Lib_IntTypes.U64 -> Obj.repr (FStar_UInt64.uint_to_t nn))) in
        let iv0' =
          Lib_IntTypes.logxor
            (match a with
             | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
             | Spec_Blake2.Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC iv0
            s0' in
        let l =
          [iv0';
          iv1;
          iv2;
          iv3;
          iv4;
          iv5;
          iv6;
          iv7;
          iv0;
          iv1;
          iv2;
          iv3;
          iv4;
          iv5;
          iv6;
          iv7] in
        Lib_Sequence.of_list l
let (blake2_init :
  Spec_Blake2.alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun k ->
        fun nn ->
          let key_block =
            Lib_Sequence.create
              ((Prims.of_int (16)) *
                 (Lib_IntTypes.numbytes
                    (match a with
                     | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                     | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let s = blake2_init_hash a kk nn in
          if kk = Prims.int_zero
          then s
          else
            (let key_block1 =
               Lib_Sequence.update_sub
                 ((Prims.of_int (16)) *
                    (Lib_IntTypes.numbytes
                       (match a with
                        | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                        | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)))
                 key_block Prims.int_zero kk k in
             blake2_update1 a Prims.int_zero key_block1 Prims.int_zero s)
let (blake2_finish :
  Spec_Blake2.alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s ->
      fun nn ->
        let full =
          let uu____7462 =
            Lib_Sequence.generate_blocks
              (Lib_IntTypes.numbytes
                 (match a with
                  | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                  | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))
              (Prims.of_int (8)) (Prims.of_int (8)) ()
              (fun uu____7478 ->
                 fun uu____7477 ->
                   (Obj.magic
                      (Lib_ByteSequence.uints_to_bytes_le_inner
                         (match a with
                          | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                          | Spec_Blake2.Blake2B -> Lib_IntTypes.U64)
                         Lib_IntTypes.SEC (Prims.of_int (8))
                         (Lib_Sequence.sub (Prims.of_int (16)) s
                            Prims.int_zero (Prims.of_int (8))))) uu____7478
                     uu____7477) (Obj.repr ()) in
          match uu____7462 with | (uu____7479, o) -> o in
        Lib_Sequence.sub
          ((Prims.of_int (8)) *
             (Lib_IntTypes.numbytes
                (match a with
                 | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                 | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) full
          Prims.int_zero nn
let (compute_prev0 : Spec_Blake2.alg -> Prims.int -> Prims.int) =
  fun a ->
    fun kk ->
      let kn = if kk = Prims.int_zero then Prims.int_zero else Prims.int_one in
      let prev0 =
        kn *
          ((Prims.of_int (16)) *
             (Lib_IntTypes.numbytes
                (match a with
                 | Spec_Blake2.Blake2S -> Lib_IntTypes.U32
                 | Spec_Blake2.Blake2B -> Lib_IntTypes.U64))) in
      prev0
let (blake2 :
  Spec_Blake2.alg ->
    FStar_UInt8.t Lib_Sequence.seq ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun d ->
      fun kk ->
        fun k ->
          fun nn ->
            let prev0 = compute_prev0 a kk in
            let s = blake2_init a kk k nn in
            let s1 = blake2_update_blocks a prev0 d s in
            blake2_finish a s1 nn
let (blake2s :
  FStar_UInt8.t Lib_Sequence.seq ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  = fun d -> fun kk -> fun k -> fun n -> blake2 Spec_Blake2.Blake2S d kk k n
let (blake2b :
  FStar_UInt8.t Lib_Sequence.seq ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  = fun d -> fun kk -> fun k -> fun n -> blake2 Spec_Blake2.Blake2B d kk k n