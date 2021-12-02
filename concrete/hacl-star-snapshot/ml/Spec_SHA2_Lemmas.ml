open Prims
let rec (ws_aux :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w -> Spec_SHA2.counter -> Obj.t)
  =
  fun a ->
    fun b ->
      fun t ->
        if t < Spec_Hash_Definitions.block_word_length
        then FStar_Seq_Base.index b t
        else
          (let t16 = ws_aux a b (t - (Prims.of_int (16))) in
           let t15 = ws_aux a b (t - (Prims.of_int (15))) in
           let t7 = ws_aux a b (t - (Prims.of_int (7))) in
           let t2 = ws_aux a b (t - (Prims.of_int (2))) in
           let s1 =
             (fun uu___2 ->
                fun uu___1 ->
                  (Obj.magic
                     ((match a with
                       | Spec_Hash_Definitions.SHA2_224 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt32.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_256 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt32.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_384 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt64.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_512 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt64.logxor a1 b1)) ))
                    uu___2 uu___1)
               ((fun uu___2 ->
                   fun uu___1 ->
                     (Obj.magic
                        ((match a with
                          | Spec_Hash_Definitions.SHA2_224 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt32.logor
                                       (FStar_UInt32.shift_right a1 b1)
                                       (FStar_UInt32.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (32))) b1)))
                          | Spec_Hash_Definitions.SHA2_256 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt32.logor
                                       (FStar_UInt32.shift_right a1 b1)
                                       (FStar_UInt32.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (32))) b1)))
                          | Spec_Hash_Definitions.SHA2_384 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt64.logor
                                       (FStar_UInt64.shift_right a1 b1)
                                       (FStar_UInt64.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (64))) b1)))
                          | Spec_Hash_Definitions.SHA2_512 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt64.logor
                                       (FStar_UInt64.shift_right a1 b1)
                                       (FStar_UInt64.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (64))) b1)))) ))
                       uu___2 uu___1) t2
                  (match match a with
                         | Spec_Hash_Definitions.SHA2_224 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                             }
                         | Spec_Hash_Definitions.SHA2_256 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                             }
                         | Spec_Hash_Definitions.SHA2_384 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t Prims.int_one);
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                             }
                         | Spec_Hash_Definitions.SHA2_512 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t Prims.int_one);
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                             }
                   with
                   | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                       Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                       Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                       Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                       Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                       Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                       Obj.magic e3))
               ((fun uu___2 ->
                   fun uu___1 ->
                     (Obj.magic
                        ((match a with
                          | Spec_Hash_Definitions.SHA2_224 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt32.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_256 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt32.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_384 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt64.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_512 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt64.logxor a1 b1)) ))
                       uu___2 uu___1)
                  ((fun uu___2 ->
                      fun uu___1 ->
                        (Obj.magic
                           ((match a with
                             | Spec_Hash_Definitions.SHA2_224 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.logor
                                          (FStar_UInt32.shift_right a1 b1)
                                          (FStar_UInt32.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (32))) b1)))
                             | Spec_Hash_Definitions.SHA2_256 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.logor
                                          (FStar_UInt32.shift_right a1 b1)
                                          (FStar_UInt32.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (32))) b1)))
                             | Spec_Hash_Definitions.SHA2_384 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.logor
                                          (FStar_UInt64.shift_right a1 b1)
                                          (FStar_UInt64.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (64))) b1)))
                             | Spec_Hash_Definitions.SHA2_512 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.logor
                                          (FStar_UInt64.shift_right a1 b1)
                                          (FStar_UInt64.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (64))) b1))))
                              )) uu___2 uu___1) t2
                     (match match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_256 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_384 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                            | Spec_Hash_Definitions.SHA2_512 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                      with
                      | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                          Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                          Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                          Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                          Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                          Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                          Obj.magic e4))
                  ((fun uu___2 ->
                      fun uu___1 ->
                        (Obj.magic
                           ((match a with
                             | Spec_Hash_Definitions.SHA2_224 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_256 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_384 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_512 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.shift_right a1 b1)) ))
                          uu___2 uu___1) t2
                     (match match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_256 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_384 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                            | Spec_Hash_Definitions.SHA2_512 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                      with
                      | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                          Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                          Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                          Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                          Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                          Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                          Obj.magic e5))) in
           let s0 =
             (fun uu___2 ->
                fun uu___1 ->
                  (Obj.magic
                     ((match a with
                       | Spec_Hash_Definitions.SHA2_224 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt32.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_256 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt32.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_384 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt64.logxor a1 b1)
                       | Spec_Hash_Definitions.SHA2_512 ->
                           Obj.repr
                             (fun a1 -> fun b1 -> FStar_UInt64.logxor a1 b1)) ))
                    uu___2 uu___1)
               ((fun uu___2 ->
                   fun uu___1 ->
                     (Obj.magic
                        ((match a with
                          | Spec_Hash_Definitions.SHA2_224 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt32.logor
                                       (FStar_UInt32.shift_right a1 b1)
                                       (FStar_UInt32.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (32))) b1)))
                          | Spec_Hash_Definitions.SHA2_256 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt32.logor
                                       (FStar_UInt32.shift_right a1 b1)
                                       (FStar_UInt32.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (32))) b1)))
                          | Spec_Hash_Definitions.SHA2_384 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt64.logor
                                       (FStar_UInt64.shift_right a1 b1)
                                       (FStar_UInt64.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (64))) b1)))
                          | Spec_Hash_Definitions.SHA2_512 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 ->
                                     FStar_UInt64.logor
                                       (FStar_UInt64.shift_right a1 b1)
                                       (FStar_UInt64.shift_left a1
                                          (FStar_UInt32.sub
                                             (FStar_UInt32.uint_to_t
                                                (Prims.of_int (64))) b1)))) ))
                       uu___2 uu___1) t15
                  (match match a with
                         | Spec_Hash_Definitions.SHA2_224 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                             }
                         | Spec_Hash_Definitions.SHA2_256 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                             }
                         | Spec_Hash_Definitions.SHA2_384 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t Prims.int_one);
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                             }
                         | Spec_Hash_Definitions.SHA2_512 ->
                             {
                               Spec_SHA2.c0 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                               Spec_SHA2.c1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                               Spec_SHA2.c2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                               Spec_SHA2.c3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                               Spec_SHA2.c4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                               Spec_SHA2.c5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                               Spec_SHA2.e0 =
                                 (FStar_UInt32.uint_to_t Prims.int_one);
                               Spec_SHA2.e1 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                               Spec_SHA2.e2 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                               Spec_SHA2.e3 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                               Spec_SHA2.e4 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                               Spec_SHA2.e5 =
                                 (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                             }
                   with
                   | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                       Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                       Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                       Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                       Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                       Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                       Obj.magic e0))
               ((fun uu___2 ->
                   fun uu___1 ->
                     (Obj.magic
                        ((match a with
                          | Spec_Hash_Definitions.SHA2_224 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt32.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_256 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt32.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_384 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt64.logxor a1 b1)
                          | Spec_Hash_Definitions.SHA2_512 ->
                              Obj.repr
                                (fun a1 ->
                                   fun b1 -> FStar_UInt64.logxor a1 b1)) ))
                       uu___2 uu___1)
                  ((fun uu___2 ->
                      fun uu___1 ->
                        (Obj.magic
                           ((match a with
                             | Spec_Hash_Definitions.SHA2_224 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.logor
                                          (FStar_UInt32.shift_right a1 b1)
                                          (FStar_UInt32.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (32))) b1)))
                             | Spec_Hash_Definitions.SHA2_256 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.logor
                                          (FStar_UInt32.shift_right a1 b1)
                                          (FStar_UInt32.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (32))) b1)))
                             | Spec_Hash_Definitions.SHA2_384 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.logor
                                          (FStar_UInt64.shift_right a1 b1)
                                          (FStar_UInt64.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (64))) b1)))
                             | Spec_Hash_Definitions.SHA2_512 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.logor
                                          (FStar_UInt64.shift_right a1 b1)
                                          (FStar_UInt64.shift_left a1
                                             (FStar_UInt32.sub
                                                (FStar_UInt32.uint_to_t
                                                   (Prims.of_int (64))) b1))))
                              )) uu___2 uu___1) t15
                     (match match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_256 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_384 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                            | Spec_Hash_Definitions.SHA2_512 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                      with
                      | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                          Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                          Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                          Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                          Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                          Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                          Obj.magic e1))
                  ((fun uu___2 ->
                      fun uu___1 ->
                        (Obj.magic
                           ((match a with
                             | Spec_Hash_Definitions.SHA2_224 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_256 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt32.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_384 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.shift_right a1 b1)
                             | Spec_Hash_Definitions.SHA2_512 ->
                                 Obj.repr
                                   (fun a1 ->
                                      fun b1 ->
                                        FStar_UInt64.shift_right a1 b1)) ))
                          uu___2 uu___1) t15
                     (match match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_256 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (2)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (13)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (22)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (11)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (25)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (3)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (17)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (10)))
                                }
                            | Spec_Hash_Definitions.SHA2_384 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                            | Spec_Hash_Definitions.SHA2_512 ->
                                {
                                  Spec_SHA2.c0 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (28)));
                                  Spec_SHA2.c1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (34)));
                                  Spec_SHA2.c2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (39)));
                                  Spec_SHA2.c3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (14)));
                                  Spec_SHA2.c4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (18)));
                                  Spec_SHA2.c5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (41)));
                                  Spec_SHA2.e0 =
                                    (FStar_UInt32.uint_to_t Prims.int_one);
                                  Spec_SHA2.e1 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (8)));
                                  Spec_SHA2.e2 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (7)));
                                  Spec_SHA2.e3 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (19)));
                                  Spec_SHA2.e4 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (61)));
                                  Spec_SHA2.e5 =
                                    (FStar_UInt32.uint_to_t
                                       (Prims.of_int (6)))
                                }
                      with
                      | { Spec_SHA2.c0 = c0; Spec_SHA2.c1 = c1;
                          Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                          Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                          Spec_SHA2.e0 = e0; Spec_SHA2.e1 = e1;
                          Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                          Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                          Obj.magic e2))) in
           (fun uu___2 ->
              fun uu___1 ->
                (Obj.magic
                   ((match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         Obj.repr
                           (fun a1 -> fun b1 -> FStar_UInt32.add_mod a1 b1)
                     | Spec_Hash_Definitions.SHA2_256 ->
                         Obj.repr
                           (fun a1 -> fun b1 -> FStar_UInt32.add_mod a1 b1)
                     | Spec_Hash_Definitions.SHA2_384 ->
                         Obj.repr
                           (fun a1 -> fun b1 -> FStar_UInt64.add_mod a1 b1)
                     | Spec_Hash_Definitions.SHA2_512 ->
                         Obj.repr
                           (fun a1 -> fun b1 -> FStar_UInt64.add_mod a1 b1)) ))
                  uu___2 uu___1)
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      ((match a with
                        | Spec_Hash_Definitions.SHA2_224 ->
                            Obj.repr
                              (fun a1 -> fun b1 -> FStar_UInt32.add_mod a1 b1)
                        | Spec_Hash_Definitions.SHA2_256 ->
                            Obj.repr
                              (fun a1 -> fun b1 -> FStar_UInt32.add_mod a1 b1)
                        | Spec_Hash_Definitions.SHA2_384 ->
                            Obj.repr
                              (fun a1 -> fun b1 -> FStar_UInt64.add_mod a1 b1)
                        | Spec_Hash_Definitions.SHA2_512 ->
                            Obj.repr
                              (fun a1 -> fun b1 -> FStar_UInt64.add_mod a1 b1))
                         )) uu___2 uu___1)
                (match a with
                 | Spec_Hash_Definitions.SHA2_224 ->
                     Obj.repr
                       (FStar_UInt32.add_mod (Obj.magic s1) (Obj.magic t7))
                 | Spec_Hash_Definitions.SHA2_256 ->
                     Obj.repr
                       (FStar_UInt32.add_mod (Obj.magic s1) (Obj.magic t7))
                 | Spec_Hash_Definitions.SHA2_384 ->
                     Obj.repr
                       (FStar_UInt64.add_mod (Obj.magic s1) (Obj.magic t7))
                 | Spec_Hash_Definitions.SHA2_512 ->
                     Obj.repr
                       (FStar_UInt64.add_mod (Obj.magic s1) (Obj.magic t7)))
                s0) t16)
let (ws :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w -> Spec_SHA2.counter -> Obj.t)
  = ws_aux
let (shuffle_core_ :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w ->
      Obj.t FStar_Seq_Base.seq ->
        Spec_SHA2.counter -> Obj.t FStar_Seq_Base.seq)
  =
  fun a ->
    fun block ->
      fun hash ->
        fun t ->
          let a0 = FStar_Seq_Base.index hash Prims.int_zero in
          let b0 = FStar_Seq_Base.index hash Prims.int_one in
          let c0 = FStar_Seq_Base.index hash (Prims.of_int (2)) in
          let d0 = FStar_Seq_Base.index hash (Prims.of_int (3)) in
          let e0 = FStar_Seq_Base.index hash (Prims.of_int (4)) in
          let f0 = FStar_Seq_Base.index hash (Prims.of_int (5)) in
          let g0 = FStar_Seq_Base.index hash (Prims.of_int (6)) in
          let h0 = FStar_Seq_Base.index hash (Prims.of_int (7)) in
          let t1 =
            (fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    ((match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)) ))
                   uu___1 uu___)
              ((fun uu___1 ->
                  fun uu___ ->
                    (Obj.magic
                       ((match a with
                         | Spec_Hash_Definitions.SHA2_224 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                         | Spec_Hash_Definitions.SHA2_256 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                         | Spec_Hash_Definitions.SHA2_384 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)
                         | Spec_Hash_Definitions.SHA2_512 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b))
                          )) uu___1 uu___)
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          ((match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.add_mod a1 b)
                            | Spec_Hash_Definitions.SHA2_256 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.add_mod a1 b)
                            | Spec_Hash_Definitions.SHA2_384 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.add_mod a1 b)
                            | Spec_Hash_Definitions.SHA2_512 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.add_mod a1 b)) ))
                         uu___1 uu___)
                    ((fun uu___1 ->
                        fun uu___ ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt32.add_mod a1 b)
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt32.add_mod a1 b)
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt64.add_mod a1 b)
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt64.add_mod a1 b)) ))
                            uu___1 uu___) h0
                       ((fun uu___1 ->
                           fun uu___ ->
                             (Obj.magic
                                ((match a with
                                  | Spec_Hash_Definitions.SHA2_224 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt32.logxor a1 b)
                                  | Spec_Hash_Definitions.SHA2_256 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt32.logxor a1 b)
                                  | Spec_Hash_Definitions.SHA2_384 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt64.logxor a1 b)
                                  | Spec_Hash_Definitions.SHA2_512 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt64.logxor a1 b))
                                   )) uu___1 uu___)
                          ((fun uu___1 ->
                              fun uu___ ->
                                (Obj.magic
                                   ((match a with
                                     | Spec_Hash_Definitions.SHA2_224 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt32.logor
                                                  (FStar_UInt32.shift_right
                                                     a1 b)
                                                  (FStar_UInt32.shift_left a1
                                                     (FStar_UInt32.sub
                                                        (FStar_UInt32.uint_to_t
                                                           (Prims.of_int (32)))
                                                        b)))
                                     | Spec_Hash_Definitions.SHA2_256 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt32.logor
                                                  (FStar_UInt32.shift_right
                                                     a1 b)
                                                  (FStar_UInt32.shift_left a1
                                                     (FStar_UInt32.sub
                                                        (FStar_UInt32.uint_to_t
                                                           (Prims.of_int (32)))
                                                        b)))
                                     | Spec_Hash_Definitions.SHA2_384 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt64.logor
                                                  (FStar_UInt64.shift_right
                                                     a1 b)
                                                  (FStar_UInt64.shift_left a1
                                                     (FStar_UInt32.sub
                                                        (FStar_UInt32.uint_to_t
                                                           (Prims.of_int (64)))
                                                        b)))
                                     | Spec_Hash_Definitions.SHA2_512 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt64.logor
                                                  (FStar_UInt64.shift_right
                                                     a1 b)
                                                  (FStar_UInt64.shift_left a1
                                                     (FStar_UInt32.sub
                                                        (FStar_UInt32.uint_to_t
                                                           (Prims.of_int (64)))
                                                        b)))) )) uu___1 uu___)
                             e0
                             (match match a with
                                    | Spec_Hash_Definitions.SHA2_224 ->
                                        {
                                          Spec_SHA2.c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (2)));
                                          Spec_SHA2.c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (13)));
                                          Spec_SHA2.c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (22)));
                                          Spec_SHA2.c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)));
                                          Spec_SHA2.c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (11)));
                                          Spec_SHA2.c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (25)));
                                          Spec_SHA2.e0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          Spec_SHA2.e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          Spec_SHA2.e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (3)));
                                          Spec_SHA2.e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (17)));
                                          Spec_SHA2.e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          Spec_SHA2.e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (10)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_256 ->
                                        {
                                          Spec_SHA2.c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (2)));
                                          Spec_SHA2.c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (13)));
                                          Spec_SHA2.c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (22)));
                                          Spec_SHA2.c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)));
                                          Spec_SHA2.c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (11)));
                                          Spec_SHA2.c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (25)));
                                          Spec_SHA2.e0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          Spec_SHA2.e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          Spec_SHA2.e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (3)));
                                          Spec_SHA2.e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (17)));
                                          Spec_SHA2.e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          Spec_SHA2.e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (10)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_384 ->
                                        {
                                          Spec_SHA2.c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (28)));
                                          Spec_SHA2.c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (34)));
                                          Spec_SHA2.c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (39)));
                                          Spec_SHA2.c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (14)));
                                          Spec_SHA2.c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          Spec_SHA2.c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (41)));
                                          Spec_SHA2.e0 =
                                            (FStar_UInt32.uint_to_t
                                               Prims.int_one);
                                          Spec_SHA2.e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (8)));
                                          Spec_SHA2.e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          Spec_SHA2.e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          Spec_SHA2.e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (61)));
                                          Spec_SHA2.e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_512 ->
                                        {
                                          Spec_SHA2.c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (28)));
                                          Spec_SHA2.c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (34)));
                                          Spec_SHA2.c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (39)));
                                          Spec_SHA2.c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (14)));
                                          Spec_SHA2.c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          Spec_SHA2.c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (41)));
                                          Spec_SHA2.e0 =
                                            (FStar_UInt32.uint_to_t
                                               Prims.int_one);
                                          Spec_SHA2.e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (8)));
                                          Spec_SHA2.e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          Spec_SHA2.e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          Spec_SHA2.e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (61)));
                                          Spec_SHA2.e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)))
                                        }
                              with
                              | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                                  Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                                  Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                                  Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                                  Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                                  Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                                  Obj.magic c3))
                          ((fun uu___1 ->
                              fun uu___ ->
                                (Obj.magic
                                   ((match a with
                                     | Spec_Hash_Definitions.SHA2_224 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt32.logxor a1 b)
                                     | Spec_Hash_Definitions.SHA2_256 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt32.logxor a1 b)
                                     | Spec_Hash_Definitions.SHA2_384 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt64.logxor a1 b)
                                     | Spec_Hash_Definitions.SHA2_512 ->
                                         Obj.repr
                                           (fun a1 ->
                                              fun b ->
                                                FStar_UInt64.logxor a1 b)) ))
                                  uu___1 uu___)
                             ((fun uu___1 ->
                                 fun uu___ ->
                                   (Obj.magic
                                      ((match a with
                                        | Spec_Hash_Definitions.SHA2_224 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt32.logor
                                                     (FStar_UInt32.shift_right
                                                        a1 b)
                                                     (FStar_UInt32.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (32)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_256 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt32.logor
                                                     (FStar_UInt32.shift_right
                                                        a1 b)
                                                     (FStar_UInt32.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (32)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_384 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt64.logor
                                                     (FStar_UInt64.shift_right
                                                        a1 b)
                                                     (FStar_UInt64.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (64)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_512 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt64.logor
                                                     (FStar_UInt64.shift_right
                                                        a1 b)
                                                     (FStar_UInt64.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (64)))
                                                           b)))) )) uu___1
                                     uu___) e0
                                (match match a with
                                       | Spec_Hash_Definitions.SHA2_224 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_256 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_384 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_512 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                 with
                                 | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                                     Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                                     Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                                     Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                                     Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                                     Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_}
                                     -> Obj.magic c4))
                             ((fun uu___1 ->
                                 fun uu___ ->
                                   (Obj.magic
                                      ((match a with
                                        | Spec_Hash_Definitions.SHA2_224 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt32.logor
                                                     (FStar_UInt32.shift_right
                                                        a1 b)
                                                     (FStar_UInt32.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (32)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_256 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt32.logor
                                                     (FStar_UInt32.shift_right
                                                        a1 b)
                                                     (FStar_UInt32.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (32)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_384 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt64.logor
                                                     (FStar_UInt64.shift_right
                                                        a1 b)
                                                     (FStar_UInt64.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (64)))
                                                           b)))
                                        | Spec_Hash_Definitions.SHA2_512 ->
                                            Obj.repr
                                              (fun a1 ->
                                                 fun b ->
                                                   FStar_UInt64.logor
                                                     (FStar_UInt64.shift_right
                                                        a1 b)
                                                     (FStar_UInt64.shift_left
                                                        a1
                                                        (FStar_UInt32.sub
                                                           (FStar_UInt32.uint_to_t
                                                              (Prims.of_int (64)))
                                                           b)))) )) uu___1
                                     uu___) e0
                                (match match a with
                                       | Spec_Hash_Definitions.SHA2_224 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_256 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_384 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_512 ->
                                           {
                                             Spec_SHA2.c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             Spec_SHA2.c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             Spec_SHA2.c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             Spec_SHA2.c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             Spec_SHA2.c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             Spec_SHA2.c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             Spec_SHA2.e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             Spec_SHA2.e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             Spec_SHA2.e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             Spec_SHA2.e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             Spec_SHA2.e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             Spec_SHA2.e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                 with
                                 | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                                     Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                                     Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                                     Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                                     Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                                     Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_}
                                     -> Obj.magic c5)))))
                    ((fun uu___1 ->
                        fun uu___ ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt32.logxor a1 b)
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt32.logxor a1 b)
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt64.logxor a1 b)
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b -> FStar_UInt64.logxor a1 b)) ))
                            uu___1 uu___)
                       (match a with
                        | Spec_Hash_Definitions.SHA2_224 ->
                            Obj.repr
                              (FStar_UInt32.logand (Obj.magic e0)
                                 (Obj.magic f0))
                        | Spec_Hash_Definitions.SHA2_256 ->
                            Obj.repr
                              (FStar_UInt32.logand (Obj.magic e0)
                                 (Obj.magic f0))
                        | Spec_Hash_Definitions.SHA2_384 ->
                            Obj.repr
                              (FStar_UInt64.logand (Obj.magic e0)
                                 (Obj.magic f0))
                        | Spec_Hash_Definitions.SHA2_512 ->
                            Obj.repr
                              (FStar_UInt64.logand (Obj.magic e0)
                                 (Obj.magic f0)))
                       ((fun uu___1 ->
                           fun uu___ ->
                             (Obj.magic
                                ((match a with
                                  | Spec_Hash_Definitions.SHA2_224 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt32.logand a1 b)
                                  | Spec_Hash_Definitions.SHA2_256 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt32.logand a1 b)
                                  | Spec_Hash_Definitions.SHA2_384 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt64.logand a1 b)
                                  | Spec_Hash_Definitions.SHA2_512 ->
                                      Obj.repr
                                        (fun a1 ->
                                           fun b -> FStar_UInt64.logand a1 b))
                                   )) uu___1 uu___)
                          (match a with
                           | Spec_Hash_Definitions.SHA2_224 ->
                               Obj.repr (FStar_UInt32.lognot (Obj.magic e0))
                           | Spec_Hash_Definitions.SHA2_256 ->
                               Obj.repr (FStar_UInt32.lognot (Obj.magic e0))
                           | Spec_Hash_Definitions.SHA2_384 ->
                               Obj.repr (FStar_UInt64.lognot (Obj.magic e0))
                           | Spec_Hash_Definitions.SHA2_512 ->
                               Obj.repr (FStar_UInt64.lognot (Obj.magic e0)))
                          g0))) (FStar_Seq_Base.index (Spec_SHA2.k0 a) t))
              (ws a block t) in
          let t2 =
            (fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    ((match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)) ))
                   uu___1 uu___)
              ((fun uu___1 ->
                  fun uu___ ->
                    (Obj.magic
                       ((match a with
                         | Spec_Hash_Definitions.SHA2_224 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_256 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_384 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_512 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
                      uu___1 uu___)
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          ((match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b ->
                                       FStar_UInt32.logor
                                         (FStar_UInt32.shift_right a1 b)
                                         (FStar_UInt32.shift_left a1
                                            (FStar_UInt32.sub
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (32))) b)))
                            | Spec_Hash_Definitions.SHA2_256 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b ->
                                       FStar_UInt32.logor
                                         (FStar_UInt32.shift_right a1 b)
                                         (FStar_UInt32.shift_left a1
                                            (FStar_UInt32.sub
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (32))) b)))
                            | Spec_Hash_Definitions.SHA2_384 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b ->
                                       FStar_UInt64.logor
                                         (FStar_UInt64.shift_right a1 b)
                                         (FStar_UInt64.shift_left a1
                                            (FStar_UInt32.sub
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (64))) b)))
                            | Spec_Hash_Definitions.SHA2_512 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b ->
                                       FStar_UInt64.logor
                                         (FStar_UInt64.shift_right a1 b)
                                         (FStar_UInt64.shift_left a1
                                            (FStar_UInt32.sub
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (64))) b)))) ))
                         uu___1 uu___) a0
                    (match match a with
                           | Spec_Hash_Definitions.SHA2_224 ->
                               {
                                 Spec_SHA2.c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 Spec_SHA2.c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 Spec_SHA2.c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 Spec_SHA2.c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 Spec_SHA2.c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 Spec_SHA2.c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 Spec_SHA2.e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 Spec_SHA2.e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 Spec_SHA2.e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 Spec_SHA2.e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 Spec_SHA2.e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 Spec_SHA2.e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_256 ->
                               {
                                 Spec_SHA2.c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 Spec_SHA2.c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 Spec_SHA2.c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 Spec_SHA2.c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 Spec_SHA2.c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 Spec_SHA2.c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 Spec_SHA2.e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 Spec_SHA2.e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 Spec_SHA2.e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 Spec_SHA2.e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 Spec_SHA2.e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 Spec_SHA2.e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_384 ->
                               {
                                 Spec_SHA2.c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 Spec_SHA2.c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 Spec_SHA2.c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 Spec_SHA2.c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 Spec_SHA2.c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 Spec_SHA2.c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 Spec_SHA2.e0 =
                                   (FStar_UInt32.uint_to_t Prims.int_one);
                                 Spec_SHA2.e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 Spec_SHA2.e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 Spec_SHA2.e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 Spec_SHA2.e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 Spec_SHA2.e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                           | Spec_Hash_Definitions.SHA2_512 ->
                               {
                                 Spec_SHA2.c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 Spec_SHA2.c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 Spec_SHA2.c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 Spec_SHA2.c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 Spec_SHA2.c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 Spec_SHA2.c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 Spec_SHA2.e0 =
                                   (FStar_UInt32.uint_to_t Prims.int_one);
                                 Spec_SHA2.e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 Spec_SHA2.e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 Spec_SHA2.e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 Spec_SHA2.e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 Spec_SHA2.e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                     with
                     | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                         Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                         Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                         Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                         Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                         Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                         Obj.magic c01))
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          ((match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_256 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_384 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_512 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.logxor a1 b)) ))
                         uu___1 uu___)
                    ((fun uu___1 ->
                        fun uu___ ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.logor
                                            (FStar_UInt32.shift_right a1 b)
                                            (FStar_UInt32.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (32))) b)))
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.logor
                                            (FStar_UInt32.shift_right a1 b)
                                            (FStar_UInt32.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (32))) b)))
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.logor
                                            (FStar_UInt64.shift_right a1 b)
                                            (FStar_UInt64.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (64))) b)))
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.logor
                                            (FStar_UInt64.shift_right a1 b)
                                            (FStar_UInt64.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (64))) b))))
                                )) uu___1 uu___) a0
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                            Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                            Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                            Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                            Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                            Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                            Obj.magic c1))
                    ((fun uu___1 ->
                        fun uu___ ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.logor
                                            (FStar_UInt32.shift_right a1 b)
                                            (FStar_UInt32.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (32))) b)))
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.logor
                                            (FStar_UInt32.shift_right a1 b)
                                            (FStar_UInt32.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (32))) b)))
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.logor
                                            (FStar_UInt64.shift_right a1 b)
                                            (FStar_UInt64.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (64))) b)))
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.logor
                                            (FStar_UInt64.shift_right a1 b)
                                            (FStar_UInt64.shift_left a1
                                               (FStar_UInt32.sub
                                                  (FStar_UInt32.uint_to_t
                                                     (Prims.of_int (64))) b))))
                                )) uu___1 uu___) a0
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    Spec_SHA2.c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    Spec_SHA2.c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    Spec_SHA2.c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    Spec_SHA2.c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    Spec_SHA2.c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    Spec_SHA2.c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    Spec_SHA2.e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    Spec_SHA2.e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    Spec_SHA2.e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    Spec_SHA2.e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    Spec_SHA2.e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    Spec_SHA2.e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { Spec_SHA2.c0 = c01; Spec_SHA2.c1 = c1;
                            Spec_SHA2.c2 = c2; Spec_SHA2.c3 = c3;
                            Spec_SHA2.c4 = c4; Spec_SHA2.c5 = c5;
                            Spec_SHA2.e0 = e01; Spec_SHA2.e1 = e1;
                            Spec_SHA2.e2 = e2; Spec_SHA2.e3 = e3;
                            Spec_SHA2.e4 = e4; Spec_SHA2.e5 = e5;_} ->
                            Obj.magic c2))))
              ((fun uu___1 ->
                  fun uu___ ->
                    (Obj.magic
                       ((match a with
                         | Spec_Hash_Definitions.SHA2_224 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_256 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_384 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                         | Spec_Hash_Definitions.SHA2_512 ->
                             Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
                      uu___1 uu___)
                 (match a with
                  | Spec_Hash_Definitions.SHA2_224 ->
                      Obj.repr
                        (FStar_UInt32.logand (Obj.magic a0) (Obj.magic b0))
                  | Spec_Hash_Definitions.SHA2_256 ->
                      Obj.repr
                        (FStar_UInt32.logand (Obj.magic a0) (Obj.magic b0))
                  | Spec_Hash_Definitions.SHA2_384 ->
                      Obj.repr
                        (FStar_UInt64.logand (Obj.magic a0) (Obj.magic b0))
                  | Spec_Hash_Definitions.SHA2_512 ->
                      Obj.repr
                        (FStar_UInt64.logand (Obj.magic a0) (Obj.magic b0)))
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          ((match a with
                            | Spec_Hash_Definitions.SHA2_224 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_256 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt32.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_384 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.logxor a1 b)
                            | Spec_Hash_Definitions.SHA2_512 ->
                                Obj.repr
                                  (fun a1 ->
                                     fun b -> FStar_UInt64.logxor a1 b)) ))
                         uu___1 uu___)
                    (match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         Obj.repr
                           (FStar_UInt32.logand (Obj.magic a0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_256 ->
                         Obj.repr
                           (FStar_UInt32.logand (Obj.magic a0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_384 ->
                         Obj.repr
                           (FStar_UInt64.logand (Obj.magic a0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_512 ->
                         Obj.repr
                           (FStar_UInt64.logand (Obj.magic a0) (Obj.magic c0)))
                    (match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         Obj.repr
                           (FStar_UInt32.logand (Obj.magic b0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_256 ->
                         Obj.repr
                           (FStar_UInt32.logand (Obj.magic b0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_384 ->
                         Obj.repr
                           (FStar_UInt64.logand (Obj.magic b0) (Obj.magic c0))
                     | Spec_Hash_Definitions.SHA2_512 ->
                         Obj.repr
                           (FStar_UInt64.logand (Obj.magic b0) (Obj.magic c0))))) in
          let l =
            [(match a with
              | Spec_Hash_Definitions.SHA2_224 ->
                  Obj.repr
                    (FStar_UInt32.add_mod (Obj.magic t1) (Obj.magic t2))
              | Spec_Hash_Definitions.SHA2_256 ->
                  Obj.repr
                    (FStar_UInt32.add_mod (Obj.magic t1) (Obj.magic t2))
              | Spec_Hash_Definitions.SHA2_384 ->
                  Obj.repr
                    (FStar_UInt64.add_mod (Obj.magic t1) (Obj.magic t2))
              | Spec_Hash_Definitions.SHA2_512 ->
                  Obj.repr
                    (FStar_UInt64.add_mod (Obj.magic t1) (Obj.magic t2)));
            a0;
            b0;
            c0;
            (match a with
             | Spec_Hash_Definitions.SHA2_224 ->
                 Obj.repr
                   (FStar_UInt32.add_mod (Obj.magic d0) (Obj.magic t1))
             | Spec_Hash_Definitions.SHA2_256 ->
                 Obj.repr
                   (FStar_UInt32.add_mod (Obj.magic d0) (Obj.magic t1))
             | Spec_Hash_Definitions.SHA2_384 ->
                 Obj.repr
                   (FStar_UInt64.add_mod (Obj.magic d0) (Obj.magic t1))
             | Spec_Hash_Definitions.SHA2_512 ->
                 Obj.repr
                   (FStar_UInt64.add_mod (Obj.magic d0) (Obj.magic t1)));
            e0;
            f0;
            g0] in
          FStar_Seq_Properties.seq_of_list l
let (shuffle_core :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w ->
      Obj.t FStar_Seq_Base.seq ->
        Spec_SHA2.counter -> Obj.t FStar_Seq_Base.seq)
  = shuffle_core_
let (shuffle_aux :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t FStar_Seq_Base.seq ->
      unit Spec_SHA2.block_w -> Obj.t FStar_Seq_Base.seq)
  =
  fun a ->
    fun hash ->
      fun block ->
        Spec_Loops.repeat_range Prims.int_zero
          (match a with
           | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (64))
           | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (64))
           | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (80))
           | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (80)))
          (shuffle_core a block) hash

let (update_aux :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_Hash_Definitions.words_state ->
      Spec_Hash_Definitions.bytes -> unit Spec_Hash_Definitions.words_state)
  =
  fun a ->
    fun hash ->
      fun block ->
        let uu___ = hash in
        match uu___ with
        | (hash1, uu___1) ->
            let block_w =
              Spec_Hash_Definitions.words_of_bytes a
                Spec_Hash_Definitions.block_word_length block in
            let hash_1 = shuffle_aux a hash1 block_w in
            ((Lib_Sequence.map2
                (match a with
                 | Spec_Hash_Definitions.MD5 -> (Prims.of_int (4))
                 | Spec_Hash_Definitions.SHA1 -> (Prims.of_int (5))
                 | Spec_Hash_Definitions.Blake2S -> (Prims.of_int (4))
                 | Spec_Hash_Definitions.Blake2B -> (Prims.of_int (4))
                 | uu___2 -> (Prims.of_int (8)))
                (fun uu___3 ->
                   fun uu___2 ->
                     (match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.magic
                            (Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b))
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.magic
                            (Obj.repr
                               (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b))
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.magic
                            (Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b))
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.magic
                            (Obj.repr
                               (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)))
                       uu___3 uu___2) hash1 hash_1), (Obj.repr ()))


