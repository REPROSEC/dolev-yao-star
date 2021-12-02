open Prims
let (sha256_rnds2_spec_update :
  FStar_UInt32.t ->
    FStar_UInt32.t ->
      FStar_UInt32.t ->
        FStar_UInt32.t ->
          FStar_UInt32.t ->
            FStar_UInt32.t ->
              FStar_UInt32.t ->
                FStar_UInt32.t ->
                  FStar_UInt32.t ->
                    (FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t *
                      FStar_UInt32.t * FStar_UInt32.t * FStar_UInt32.t *
                      FStar_UInt32.t * FStar_UInt32.t))
  =
  fun a ->
    fun b ->
      fun c ->
        fun d ->
          fun e ->
            fun f ->
              fun g ->
                fun h ->
                  fun wk ->
                    let a' =
                      FStar_UInt32.add_mod
                        (FStar_UInt32.logxor (FStar_UInt32.logand e f)
                           (FStar_UInt32.logand (FStar_UInt32.lognot e) g))
                        (FStar_UInt32.add_mod
                           (FStar_UInt32.logxor
                              (FStar_UInt32.logor
                                 (FStar_UInt32.shift_right e
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6))))
                                 (FStar_UInt32.shift_left e
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (26)))))
                              (FStar_UInt32.logxor
                                 (FStar_UInt32.logor
                                    (FStar_UInt32.shift_right e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (11))))
                                    (FStar_UInt32.shift_left e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (21)))))
                                 (FStar_UInt32.logor
                                    (FStar_UInt32.shift_right e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (25))))
                                    (FStar_UInt32.shift_left e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (7)))))))
                           (FStar_UInt32.add_mod wk
                              (FStar_UInt32.add_mod h
                                 (FStar_UInt32.add_mod
                                    (FStar_UInt32.logxor
                                       (FStar_UInt32.logand a b)
                                       (FStar_UInt32.logxor
                                          (FStar_UInt32.logand a c)
                                          (FStar_UInt32.logand b c)))
                                    (FStar_UInt32.logxor
                                       (FStar_UInt32.logor
                                          (FStar_UInt32.shift_right a
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (2))))
                                          (FStar_UInt32.shift_left a
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (30)))))
                                       (FStar_UInt32.logxor
                                          (FStar_UInt32.logor
                                             (FStar_UInt32.shift_right a
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (13))))
                                             (FStar_UInt32.shift_left a
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (19)))))
                                          (FStar_UInt32.logor
                                             (FStar_UInt32.shift_right a
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (22))))
                                             (FStar_UInt32.shift_left a
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (10))))))))))) in
                    let b' = a in
                    let c' = b in
                    let d' = c in
                    let e' =
                      FStar_UInt32.add_mod
                        (FStar_UInt32.logxor (FStar_UInt32.logand e f)
                           (FStar_UInt32.logand (FStar_UInt32.lognot e) g))
                        (FStar_UInt32.add_mod
                           (FStar_UInt32.logxor
                              (FStar_UInt32.logor
                                 (FStar_UInt32.shift_right e
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6))))
                                 (FStar_UInt32.shift_left e
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (26)))))
                              (FStar_UInt32.logxor
                                 (FStar_UInt32.logor
                                    (FStar_UInt32.shift_right e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (11))))
                                    (FStar_UInt32.shift_left e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (21)))))
                                 (FStar_UInt32.logor
                                    (FStar_UInt32.shift_right e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (25))))
                                    (FStar_UInt32.shift_left e
                                       (FStar_UInt32.uint_to_t
                                          (Prims.of_int (7)))))))
                           (FStar_UInt32.add_mod wk
                              (FStar_UInt32.add_mod h d))) in
                    let f' = e in
                    let g' = f in
                    let h' = g in (a', b', c', d', e', f', g', h')
let (sha256_rnds2_spec_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun src1 ->
    fun src2 ->
      fun wk ->
        let a0 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.hi3 in
        let b0 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.hi2 in
        let c0 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi3 in
        let d0 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi2 in
        let e0 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.lo1 in
        let f0 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.lo0 in
        let g0 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo1 in
        let h0 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo0 in
        let wk0 = FStar_UInt32.uint_to_t wk.Vale_Def_Words_s.lo0 in
        let wk1 = FStar_UInt32.uint_to_t wk.Vale_Def_Words_s.lo1 in
        let uu___ = sha256_rnds2_spec_update a0 b0 c0 d0 e0 f0 g0 h0 wk0 in
        match uu___ with
        | (a1, b1, c1, d1, e1, f1, g1, h1) ->
            let uu___1 = sha256_rnds2_spec_update a1 b1 c1 d1 e1 f1 g1 h1 wk1 in
            (match uu___1 with
             | (a2, b2, c2, d2, e2, f2, g2, h2) ->
                 let dst =
                   {
                     Vale_Def_Words_s.lo0 = (FStar_UInt32.v f2);
                     Vale_Def_Words_s.lo1 = (FStar_UInt32.v e2);
                     Vale_Def_Words_s.hi2 = (FStar_UInt32.v b2);
                     Vale_Def_Words_s.hi3 = (FStar_UInt32.v a2)
                   } in
                 dst)
let (sha256_rnds2_spec :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make sha256_rnds2_spec_def

let (sha256_msg1_spec_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun src1 ->
    fun src2 ->
      let w4 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.lo0 in
      let w3 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi3 in
      let w2 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi2 in
      let w1 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo1 in
      let w0 = FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo0 in
      {
        Vale_Def_Words_s.lo0 =
          (FStar_UInt32.v
             (FStar_UInt32.add_mod w0
                (FStar_UInt32.logxor
                   (FStar_UInt32.logor
                      (FStar_UInt32.shift_right w1
                         (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                      (FStar_UInt32.shift_left w1
                         (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
                   (FStar_UInt32.logxor
                      (FStar_UInt32.logor
                         (FStar_UInt32.shift_right w1
                            (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                         (FStar_UInt32.shift_left w1
                            (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                      (FStar_UInt32.shift_right w1
                         (FStar_UInt32.uint_to_t (Prims.of_int (3))))))));
        Vale_Def_Words_s.lo1 =
          (FStar_UInt32.v
             (FStar_UInt32.add_mod w1
                (FStar_UInt32.logxor
                   (FStar_UInt32.logor
                      (FStar_UInt32.shift_right w2
                         (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                      (FStar_UInt32.shift_left w2
                         (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
                   (FStar_UInt32.logxor
                      (FStar_UInt32.logor
                         (FStar_UInt32.shift_right w2
                            (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                         (FStar_UInt32.shift_left w2
                            (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                      (FStar_UInt32.shift_right w2
                         (FStar_UInt32.uint_to_t (Prims.of_int (3))))))));
        Vale_Def_Words_s.hi2 =
          (FStar_UInt32.v
             (FStar_UInt32.add_mod w2
                (FStar_UInt32.logxor
                   (FStar_UInt32.logor
                      (FStar_UInt32.shift_right w3
                         (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                      (FStar_UInt32.shift_left w3
                         (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
                   (FStar_UInt32.logxor
                      (FStar_UInt32.logor
                         (FStar_UInt32.shift_right w3
                            (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                         (FStar_UInt32.shift_left w3
                            (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                      (FStar_UInt32.shift_right w3
                         (FStar_UInt32.uint_to_t (Prims.of_int (3))))))));
        Vale_Def_Words_s.hi3 =
          (FStar_UInt32.v
             (FStar_UInt32.add_mod w3
                (FStar_UInt32.logxor
                   (FStar_UInt32.logor
                      (FStar_UInt32.shift_right w4
                         (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                      (FStar_UInt32.shift_left w4
                         (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
                   (FStar_UInt32.logxor
                      (FStar_UInt32.logor
                         (FStar_UInt32.shift_right w4
                            (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                         (FStar_UInt32.shift_left w4
                            (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                      (FStar_UInt32.shift_right w4
                         (FStar_UInt32.uint_to_t (Prims.of_int (3))))))))
      }
let (sha256_msg1_spec :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make sha256_msg1_spec_def

let (sha256_msg2_spec_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun src1 ->
    fun src2 ->
      let w14 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.hi2 in
      let w15 = FStar_UInt32.uint_to_t src2.Vale_Def_Words_s.hi3 in
      let w16 =
        FStar_UInt32.add_mod
          (FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo0)
          (FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right w14
                   (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                (FStar_UInt32.shift_left w14
                   (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right w14
                      (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                   (FStar_UInt32.shift_left w14
                      (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                (FStar_UInt32.shift_right w14
                   (FStar_UInt32.uint_to_t (Prims.of_int (10)))))) in
      let w17 =
        FStar_UInt32.add_mod
          (FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.lo1)
          (FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right w15
                   (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                (FStar_UInt32.shift_left w15
                   (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right w15
                      (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                   (FStar_UInt32.shift_left w15
                      (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                (FStar_UInt32.shift_right w15
                   (FStar_UInt32.uint_to_t (Prims.of_int (10)))))) in
      let w18 =
        FStar_UInt32.add_mod
          (FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi2)
          (FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right w16
                   (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                (FStar_UInt32.shift_left w16
                   (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right w16
                      (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                   (FStar_UInt32.shift_left w16
                      (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                (FStar_UInt32.shift_right w16
                   (FStar_UInt32.uint_to_t (Prims.of_int (10)))))) in
      let w19 =
        FStar_UInt32.add_mod
          (FStar_UInt32.uint_to_t src1.Vale_Def_Words_s.hi3)
          (FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right w17
                   (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                (FStar_UInt32.shift_left w17
                   (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right w17
                      (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                   (FStar_UInt32.shift_left w17
                      (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                (FStar_UInt32.shift_right w17
                   (FStar_UInt32.uint_to_t (Prims.of_int (10)))))) in
      {
        Vale_Def_Words_s.lo0 = (FStar_UInt32.v w16);
        Vale_Def_Words_s.lo1 = (FStar_UInt32.v w17);
        Vale_Def_Words_s.hi2 = (FStar_UInt32.v w18);
        Vale_Def_Words_s.hi3 = (FStar_UInt32.v w19)
      }
let (sha256_msg2_spec :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make sha256_msg2_spec_def
