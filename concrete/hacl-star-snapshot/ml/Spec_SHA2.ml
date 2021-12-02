open Prims
let (size_k_w : Spec_Hash_Definitions.sha2_alg -> Prims.nat) =
  fun uu___ ->
    match uu___ with
    | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (64))
    | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (64))
    | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (80))
    | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (80))
let (word_n : Spec_Hash_Definitions.sha2_alg -> Prims.nat) =
  fun uu___ ->
    match uu___ with
    | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (32))
    | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (32))
    | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (64))
    | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (64))
let (to_word : Spec_Hash_Definitions.sha2_alg -> Prims.nat -> Obj.t) =
  fun a ->
    fun n ->
      match a with
      | Spec_Hash_Definitions.SHA2_224 -> Obj.repr (FStar_UInt32.uint_to_t n)
      | Spec_Hash_Definitions.SHA2_256 -> Obj.repr (FStar_UInt32.uint_to_t n)
      | Spec_Hash_Definitions.SHA2_384 -> Obj.repr (FStar_UInt64.uint_to_t n)
      | Spec_Hash_Definitions.SHA2_512 -> Obj.repr (FStar_UInt64.uint_to_t n)
let (v' : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Prims.int) =
  fun a ->
    fun x ->
      match a with
      | Spec_Hash_Definitions.SHA2_224 ->
          Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC x
      | Spec_Hash_Definitions.SHA2_256 ->
          Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC x
      | Spec_Hash_Definitions.SHA2_384 ->
          Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC x
      | Spec_Hash_Definitions.SHA2_512 ->
          Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC x
type 'a k_w = Obj.t FStar_Seq_Base.seq
type 'a block_w = Obj.t FStar_Seq_Base.seq
type counter = Prims.nat
type ops =
  {
  c0: FStar_UInt32.t ;
  c1: FStar_UInt32.t ;
  c2: FStar_UInt32.t ;
  c3: FStar_UInt32.t ;
  c4: FStar_UInt32.t ;
  c5: FStar_UInt32.t ;
  e0: FStar_UInt32.t ;
  e1: FStar_UInt32.t ;
  e2: FStar_UInt32.t ;
  e3: FStar_UInt32.t ;
  e4: FStar_UInt32.t ;
  e5: FStar_UInt32.t }
let (__proj__Mkops__item__c0 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c0
let (__proj__Mkops__item__c1 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c1
let (__proj__Mkops__item__c2 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c2
let (__proj__Mkops__item__c3 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c3
let (__proj__Mkops__item__c4 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c4
let (__proj__Mkops__item__c5 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> c5
let (__proj__Mkops__item__e0 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e0
let (__proj__Mkops__item__e1 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e1
let (__proj__Mkops__item__e2 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e2
let (__proj__Mkops__item__e3 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e3
let (__proj__Mkops__item__e4 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e4
let (__proj__Mkops__item__e5 : ops -> FStar_UInt32.t) =
  fun projectee ->
    match projectee with
    | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} -> e5
let (op224_256 : ops) =
  {
    c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
    c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
    c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
    c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
    c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
    c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
    e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
    e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
    e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
    e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
    e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
    e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
  }
let (op384_512 : ops) =
  {
    c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
    c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
    c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
    c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
    c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
    c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
    e0 = (FStar_UInt32.uint_to_t Prims.int_one);
    e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
    e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
    e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
    e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
    e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
  }
let (op0 : Spec_Hash_Definitions.sha2_alg -> ops) =
  fun uu___ ->
    match uu___ with
    | Spec_Hash_Definitions.SHA2_224 ->
        {
          c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
          c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
          c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
          c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
          c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
          c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
          e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
          e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
          e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
          e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
          e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
          e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
        }
    | Spec_Hash_Definitions.SHA2_256 ->
        {
          c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
          c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
          c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
          c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
          c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
          c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
          e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
          e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
          e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
          e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
          e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
          e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
        }
    | Spec_Hash_Definitions.SHA2_384 ->
        {
          c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
          c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
          c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
          c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
          c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
          c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
          e0 = (FStar_UInt32.uint_to_t Prims.int_one);
          e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
          e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
          e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
          e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
          e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
        }
    | Spec_Hash_Definitions.SHA2_512 ->
        {
          c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
          c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
          c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
          c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
          c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
          c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
          e0 = (FStar_UInt32.uint_to_t Prims.int_one);
          e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
          e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
          e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
          e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
          e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
        }
let (op_Plus_Dot : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a ->
           match a with
           | Spec_Hash_Definitions.SHA2_224 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b))
           | Spec_Hash_Definitions.SHA2_256 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.add_mod a1 b))
           | Spec_Hash_Definitions.SHA2_384 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b))
           | Spec_Hash_Definitions.SHA2_512 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.add_mod a1 b)))
          uu___2 uu___1 uu___
let (op_Hat_Dot : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a ->
           match a with
           | Spec_Hash_Definitions.SHA2_224 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b))
           | Spec_Hash_Definitions.SHA2_256 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b))
           | Spec_Hash_Definitions.SHA2_384 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b))
           | Spec_Hash_Definitions.SHA2_512 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)))
          uu___2 uu___1 uu___
let (op_Amp_Dot : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t -> Obj.t)
  =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a ->
           match a with
           | Spec_Hash_Definitions.SHA2_224 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.logand a1 b))
           | Spec_Hash_Definitions.SHA2_256 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.logand a1 b))
           | Spec_Hash_Definitions.SHA2_384 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.logand a1 b))
           | Spec_Hash_Definitions.SHA2_512 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.logand a1 b)))
          uu___2 uu___1 uu___
let (op_Tilde_Dot : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t) =
  fun uu___1 ->
    fun uu___ ->
      (fun a ->
         match a with
         | Spec_Hash_Definitions.SHA2_224 ->
             Obj.magic (Obj.repr (fun a1 -> FStar_UInt32.lognot a1))
         | Spec_Hash_Definitions.SHA2_256 ->
             Obj.magic (Obj.repr (fun a1 -> FStar_UInt32.lognot a1))
         | Spec_Hash_Definitions.SHA2_384 ->
             Obj.magic (Obj.repr (fun a1 -> FStar_UInt64.lognot a1))
         | Spec_Hash_Definitions.SHA2_512 ->
             Obj.magic (Obj.repr (fun a1 -> FStar_UInt64.lognot a1))) uu___1
        uu___
let (op_Greater_Greater_Greater_Dot :
  Spec_Hash_Definitions.sha2_alg -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a ->
           match a with
           | Spec_Hash_Definitions.SHA2_224 ->
               Obj.magic
                 (Obj.repr
                    (fun a1 ->
                       fun b ->
                         FStar_UInt32.logor (FStar_UInt32.shift_right a1 b)
                           (FStar_UInt32.shift_left a1
                              (FStar_UInt32.sub
                                 (FStar_UInt32.uint_to_t (Prims.of_int (32)))
                                 b))))
           | Spec_Hash_Definitions.SHA2_256 ->
               Obj.magic
                 (Obj.repr
                    (fun a1 ->
                       fun b ->
                         FStar_UInt32.logor (FStar_UInt32.shift_right a1 b)
                           (FStar_UInt32.shift_left a1
                              (FStar_UInt32.sub
                                 (FStar_UInt32.uint_to_t (Prims.of_int (32)))
                                 b))))
           | Spec_Hash_Definitions.SHA2_384 ->
               Obj.magic
                 (Obj.repr
                    (fun a1 ->
                       fun b ->
                         FStar_UInt64.logor (FStar_UInt64.shift_right a1 b)
                           (FStar_UInt64.shift_left a1
                              (FStar_UInt32.sub
                                 (FStar_UInt32.uint_to_t (Prims.of_int (64)))
                                 b))))
           | Spec_Hash_Definitions.SHA2_512 ->
               Obj.magic
                 (Obj.repr
                    (fun a1 ->
                       fun b ->
                         FStar_UInt64.logor (FStar_UInt64.shift_right a1 b)
                           (FStar_UInt64.shift_left a1
                              (FStar_UInt32.sub
                                 (FStar_UInt32.uint_to_t (Prims.of_int (64)))
                                 b))))) uu___2 uu___1 uu___
let (op_Greater_Greater_Dot :
  Spec_Hash_Definitions.sha2_alg -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun a ->
           match a with
           | Spec_Hash_Definitions.SHA2_224 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b))
           | Spec_Hash_Definitions.SHA2_256 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b))
           | Spec_Hash_Definitions.SHA2_384 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b))
           | Spec_Hash_Definitions.SHA2_512 ->
               Obj.magic
                 (Obj.repr (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b)))
          uu___2 uu___1 uu___
let (_Ch :
  Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      fun y ->
        fun z ->
          (fun uu___1 ->
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
                 Obj.repr (FStar_UInt32.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_256 ->
                 Obj.repr (FStar_UInt32.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_384 ->
                 Obj.repr (FStar_UInt64.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_512 ->
                 Obj.repr (FStar_UInt64.logand (Obj.magic x) (Obj.magic y)))
            ((fun uu___1 ->
                fun uu___ ->
                  (Obj.magic
                     ((match a with
                       | Spec_Hash_Definitions.SHA2_224 ->
                           Obj.repr
                             (fun a1 -> fun b -> FStar_UInt32.logand a1 b)
                       | Spec_Hash_Definitions.SHA2_256 ->
                           Obj.repr
                             (fun a1 -> fun b -> FStar_UInt32.logand a1 b)
                       | Spec_Hash_Definitions.SHA2_384 ->
                           Obj.repr
                             (fun a1 -> fun b -> FStar_UInt64.logand a1 b)
                       | Spec_Hash_Definitions.SHA2_512 ->
                           Obj.repr
                             (fun a1 -> fun b -> FStar_UInt64.logand a1 b)) ))
                    uu___1 uu___)
               (match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr (FStar_UInt32.lognot (Obj.magic x))
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr (FStar_UInt32.lognot (Obj.magic x))
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr (FStar_UInt64.lognot (Obj.magic x))
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr (FStar_UInt64.lognot (Obj.magic x))) z)
let (_Maj :
  Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      fun y ->
        fun z ->
          (fun uu___1 ->
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
                 Obj.repr (FStar_UInt32.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_256 ->
                 Obj.repr (FStar_UInt32.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_384 ->
                 Obj.repr (FStar_UInt64.logand (Obj.magic x) (Obj.magic y))
             | Spec_Hash_Definitions.SHA2_512 ->
                 Obj.repr (FStar_UInt64.logand (Obj.magic x) (Obj.magic y)))
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
                      (FStar_UInt32.logand (Obj.magic x) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr
                      (FStar_UInt32.logand (Obj.magic x) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr
                      (FStar_UInt64.logand (Obj.magic x) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr
                      (FStar_UInt64.logand (Obj.magic x) (Obj.magic z)))
               (match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr
                      (FStar_UInt32.logand (Obj.magic y) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr
                      (FStar_UInt32.logand (Obj.magic y) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr
                      (FStar_UInt64.logand (Obj.magic y) (Obj.magic z))
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr
                      (FStar_UInt64.logand (Obj.magic y) (Obj.magic z))))
let (_Sigma0 : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      (fun uu___1 ->
         fun uu___ ->
           (Obj.magic
              ((match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
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
                                         (Prims.of_int (64))) b)))) )) uu___1
                uu___) x
           (match match a with
                  | Spec_Hash_Definitions.SHA2_224 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_256 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_384 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
                  | Spec_Hash_Definitions.SHA2_512 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
            with
            | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                Obj.magic c0))
        ((fun uu___1 ->
            fun uu___ ->
              (Obj.magic
                 ((match a with
                   | Spec_Hash_Definitions.SHA2_224 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_256 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_384 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_512 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b))
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
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
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
                                            (Prims.of_int (64))) b)))) ))
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic c2)))
let (_Sigma1 : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      (fun uu___1 ->
         fun uu___ ->
           (Obj.magic
              ((match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
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
                                         (Prims.of_int (64))) b)))) )) uu___1
                uu___) x
           (match match a with
                  | Spec_Hash_Definitions.SHA2_224 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_256 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_384 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
                  | Spec_Hash_Definitions.SHA2_512 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
            with
            | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                Obj.magic c3))
        ((fun uu___1 ->
            fun uu___ ->
              (Obj.magic
                 ((match a with
                   | Spec_Hash_Definitions.SHA2_224 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_256 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_384 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_512 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b))
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
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic c4))
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
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic c5)))
let (_sigma0 : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      (fun uu___1 ->
         fun uu___ ->
           (Obj.magic
              ((match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
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
                                         (Prims.of_int (64))) b)))) )) uu___1
                uu___) x
           (match match a with
                  | Spec_Hash_Definitions.SHA2_224 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_256 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_384 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
                  | Spec_Hash_Definitions.SHA2_512 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
            with
            | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                Obj.magic e0))
        ((fun uu___1 ->
            fun uu___ ->
              (Obj.magic
                 ((match a with
                   | Spec_Hash_Definitions.SHA2_224 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_256 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_384 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_512 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b))
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
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic e1))
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    ((match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b))
                       )) uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic e2)))
let (_sigma1 : Spec_Hash_Definitions.sha2_alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      (fun uu___1 ->
         fun uu___ ->
           (Obj.magic
              ((match a with
                | Spec_Hash_Definitions.SHA2_224 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_256 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_384 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                | Spec_Hash_Definitions.SHA2_512 ->
                    Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)) ))
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
                                         (Prims.of_int (64))) b)))) )) uu___1
                uu___) x
           (match match a with
                  | Spec_Hash_Definitions.SHA2_224 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_256 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                        e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                      }
                  | Spec_Hash_Definitions.SHA2_384 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
                  | Spec_Hash_Definitions.SHA2_512 ->
                      {
                        c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                        c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                        c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                        c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                        c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                        c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                        e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                        e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                        e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                        e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                        e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                        e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                      }
            with
            | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                Obj.magic e3))
        ((fun uu___1 ->
            fun uu___ ->
              (Obj.magic
                 ((match a with
                   | Spec_Hash_Definitions.SHA2_224 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_256 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt32.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_384 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b)
                   | Spec_Hash_Definitions.SHA2_512 ->
                       Obj.repr (fun a1 -> fun b -> FStar_UInt64.logxor a1 b))
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
                   uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic e4))
           ((fun uu___1 ->
               fun uu___ ->
                 (Obj.magic
                    ((match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt32.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b)
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.repr
                            (fun a1 -> fun b -> FStar_UInt64.shift_right a1 b))
                       )) uu___1 uu___) x
              (match match a with
                     | Spec_Hash_Definitions.SHA2_224 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_256 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (13)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (22)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (11)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (25)));
                           e0 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (17)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (10)))
                         }
                     | Spec_Hash_Definitions.SHA2_384 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
                     | Spec_Hash_Definitions.SHA2_512 ->
                         {
                           c0 = (FStar_UInt32.uint_to_t (Prims.of_int (28)));
                           c1 = (FStar_UInt32.uint_to_t (Prims.of_int (34)));
                           c2 = (FStar_UInt32.uint_to_t (Prims.of_int (39)));
                           c3 = (FStar_UInt32.uint_to_t (Prims.of_int (14)));
                           c4 = (FStar_UInt32.uint_to_t (Prims.of_int (18)));
                           c5 = (FStar_UInt32.uint_to_t (Prims.of_int (41)));
                           e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                           e1 = (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                           e2 = (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                           e3 = (FStar_UInt32.uint_to_t (Prims.of_int (19)));
                           e4 = (FStar_UInt32.uint_to_t (Prims.of_int (61)));
                           e5 = (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                         }
               with
               | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                   Obj.magic e5)))
let (h0 : Spec_Hash_Definitions.sha2_alg -> Obj.t FStar_Seq_Base.seq) =
  fun uu___ ->
    (fun uu___ ->
       match uu___ with
       | Spec_Hash_Definitions.SHA2_224 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.h224)
       | Spec_Hash_Definitions.SHA2_256 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.h256)
       | Spec_Hash_Definitions.SHA2_384 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.h384)
       | Spec_Hash_Definitions.SHA2_512 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.h512)) uu___
let (k0 : Spec_Hash_Definitions.sha2_alg -> Obj.t FStar_Seq_Base.seq) =
  fun uu___ ->
    (fun uu___ ->
       match uu___ with
       | Spec_Hash_Definitions.SHA2_224 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.k224_256)
       | Spec_Hash_Definitions.SHA2_256 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.k224_256)
       | Spec_Hash_Definitions.SHA2_384 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.k384_512)
       | Spec_Hash_Definitions.SHA2_512 ->
           Obj.magic (Obj.repr Spec_SHA2_Constants.k384_512)) uu___
let op_String_Access :
  'uuuuu . unit -> 'uuuuu FStar_Seq_Base.seq -> Prims.nat -> 'uuuuu =
  fun uu___ -> FStar_Seq_Base.index
let (shuffle_core_pre_ :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t -> Obj.t -> Obj.t FStar_Seq_Base.seq -> Obj.t FStar_Seq_Base.seq)
  =
  fun a ->
    fun k_t ->
      fun ws_t ->
        fun hash ->
          let a0 = FStar_Seq_Base.index hash Prims.int_zero in
          let b0 = FStar_Seq_Base.index hash Prims.int_one in
          let c0 = FStar_Seq_Base.index hash (Prims.of_int (2)) in
          let d0 = FStar_Seq_Base.index hash (Prims.of_int (3)) in
          let e0 = FStar_Seq_Base.index hash (Prims.of_int (4)) in
          let f0 = FStar_Seq_Base.index hash (Prims.of_int (5)) in
          let g0 = FStar_Seq_Base.index hash (Prims.of_int (6)) in
          let h01 = FStar_Seq_Base.index hash (Prims.of_int (7)) in
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
                            uu___1 uu___) h01
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
                                          c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (2)));
                                          c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (13)));
                                          c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (22)));
                                          c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)));
                                          c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (11)));
                                          c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (25)));
                                          e0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (3)));
                                          e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (17)));
                                          e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (10)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_256 ->
                                        {
                                          c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (2)));
                                          c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (13)));
                                          c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (22)));
                                          c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)));
                                          c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (11)));
                                          c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (25)));
                                          e0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (3)));
                                          e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (17)));
                                          e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (10)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_384 ->
                                        {
                                          c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (28)));
                                          c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (34)));
                                          c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (39)));
                                          c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (14)));
                                          c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (41)));
                                          e0 =
                                            (FStar_UInt32.uint_to_t
                                               Prims.int_one);
                                          e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (8)));
                                          e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (61)));
                                          e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)))
                                        }
                                    | Spec_Hash_Definitions.SHA2_512 ->
                                        {
                                          c0 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (28)));
                                          c1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (34)));
                                          c2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (39)));
                                          c3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (14)));
                                          c4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (18)));
                                          c5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (41)));
                                          e0 =
                                            (FStar_UInt32.uint_to_t
                                               Prims.int_one);
                                          e1 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (8)));
                                          e2 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (7)));
                                          e3 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (19)));
                                          e4 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (61)));
                                          e5 =
                                            (FStar_UInt32.uint_to_t
                                               (Prims.of_int (6)))
                                        }
                              with
                              | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01; 
                                  e1; e2; e3; e4; e5;_} -> Obj.magic c3))
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
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_256 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_384 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_512 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                 with
                                 | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01;
                                     e1; e2; e3; e4; e5;_} -> Obj.magic c4))
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
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_256 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (2)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (13)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (22)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (11)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (25)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (3)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (17)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (10)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_384 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                       | Spec_Hash_Definitions.SHA2_512 ->
                                           {
                                             c0 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (28)));
                                             c1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (34)));
                                             c2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (39)));
                                             c3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (14)));
                                             c4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (18)));
                                             c5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (41)));
                                             e0 =
                                               (FStar_UInt32.uint_to_t
                                                  Prims.int_one);
                                             e1 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (8)));
                                             e2 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (7)));
                                             e3 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (19)));
                                             e4 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (61)));
                                             e5 =
                                               (FStar_UInt32.uint_to_t
                                                  (Prims.of_int (6)))
                                           }
                                 with
                                 | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01;
                                     e1; e2; e3; e4; e5;_} -> Obj.magic c5)))))
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
                          g0))) k_t) ws_t in
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
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_256 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_384 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                           | Spec_Hash_Definitions.SHA2_512 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                     with
                     | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01; e1; 
                         e2; e3; e4; e5;_} -> Obj.magic c01))
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
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01; e1; 
                            e2; e3; e4; e5;_} -> Obj.magic c1))
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
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0 = c01; c1; c2; c3; c4; c5; e0 = e01; e1; 
                            e2; e3; e4; e5;_} -> Obj.magic c2))))
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
let (shuffle_core_pre :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t -> Obj.t -> Obj.t FStar_Seq_Base.seq -> Obj.t FStar_Seq_Base.seq)
  = shuffle_core_pre_
let (ws_pre_inner :
  Spec_Hash_Definitions.sha2_alg ->
    unit block_w -> Prims.nat -> unit k_w -> unit k_w)
  =
  fun a ->
    fun block ->
      fun i ->
        fun ws ->
          if i < Spec_Hash_Definitions.block_word_length
          then FStar_Seq_Base.upd ws i (FStar_Seq_Base.index block i)
          else
            (let t16 = FStar_Seq_Base.index ws (i - (Prims.of_int (16))) in
             let t15 = FStar_Seq_Base.index ws (i - (Prims.of_int (15))) in
             let t7 = FStar_Seq_Base.index ws (i - (Prims.of_int (7))) in
             let t2 = FStar_Seq_Base.index ws (i - (Prims.of_int (2))) in
             let s1 =
               (fun uu___2 ->
                  fun uu___1 ->
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
                      uu___2 uu___1)
                 ((fun uu___2 ->
                     fun uu___1 ->
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
                         uu___2 uu___1) t2
                    (match match a with
                           | Spec_Hash_Definitions.SHA2_224 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_256 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_384 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                           | Spec_Hash_Definitions.SHA2_512 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                     with
                     | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                         Obj.magic e3))
                 ((fun uu___2 ->
                     fun uu___1 ->
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
                         uu___2 uu___1)
                    ((fun uu___2 ->
                        fun uu___1 ->
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
                                )) uu___2 uu___1) t2
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_}
                            -> Obj.magic e4))
                    ((fun uu___2 ->
                        fun uu___1 ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.shift_right a1 b)) ))
                            uu___2 uu___1) t2
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_}
                            -> Obj.magic e5))) in
             let s0 =
               (fun uu___2 ->
                  fun uu___1 ->
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
                      uu___2 uu___1)
                 ((fun uu___2 ->
                     fun uu___1 ->
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
                         uu___2 uu___1) t15
                    (match match a with
                           | Spec_Hash_Definitions.SHA2_224 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_256 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (2)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (13)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (22)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (11)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (25)));
                                 e0 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (3)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (17)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (10)))
                               }
                           | Spec_Hash_Definitions.SHA2_384 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                           | Spec_Hash_Definitions.SHA2_512 ->
                               {
                                 c0 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (28)));
                                 c1 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (34)));
                                 c2 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (39)));
                                 c3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (14)));
                                 c4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (18)));
                                 c5 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (41)));
                                 e0 = (FStar_UInt32.uint_to_t Prims.int_one);
                                 e1 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (8)));
                                 e2 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (7)));
                                 e3 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (19)));
                                 e4 =
                                   (FStar_UInt32.uint_to_t
                                      (Prims.of_int (61)));
                                 e5 =
                                   (FStar_UInt32.uint_to_t (Prims.of_int (6)))
                               }
                     with
                     | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_} ->
                         Obj.magic e0))
                 ((fun uu___2 ->
                     fun uu___1 ->
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
                         uu___2 uu___1)
                    ((fun uu___2 ->
                        fun uu___1 ->
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
                                )) uu___2 uu___1) t15
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_}
                            -> Obj.magic e1))
                    ((fun uu___2 ->
                        fun uu___1 ->
                          (Obj.magic
                             ((match a with
                               | Spec_Hash_Definitions.SHA2_224 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_256 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt32.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_384 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.shift_right a1 b)
                               | Spec_Hash_Definitions.SHA2_512 ->
                                   Obj.repr
                                     (fun a1 ->
                                        fun b ->
                                          FStar_UInt64.shift_right a1 b)) ))
                            uu___2 uu___1) t15
                       (match match a with
                              | Spec_Hash_Definitions.SHA2_224 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_256 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (2)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (13)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (22)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (11)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (25)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (3)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (17)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (10)))
                                  }
                              | Spec_Hash_Definitions.SHA2_384 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                              | Spec_Hash_Definitions.SHA2_512 ->
                                  {
                                    c0 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (28)));
                                    c1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (34)));
                                    c2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (39)));
                                    c3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (14)));
                                    c4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (18)));
                                    c5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (41)));
                                    e0 =
                                      (FStar_UInt32.uint_to_t Prims.int_one);
                                    e1 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (8)));
                                    e2 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (7)));
                                    e3 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (19)));
                                    e4 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (61)));
                                    e5 =
                                      (FStar_UInt32.uint_to_t
                                         (Prims.of_int (6)))
                                  }
                        with
                        | { c0; c1; c2; c3; c4; c5; e0; e1; e2; e3; e4; e5;_}
                            -> Obj.magic e2))) in
             FStar_Seq_Base.upd ws i
               ((fun uu___2 ->
                   fun uu___1 ->
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
                           )) uu___2 uu___1)
                  ((fun uu___2 ->
                      fun uu___1 ->
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
                          uu___2 uu___1)
                     (match a with
                      | Spec_Hash_Definitions.SHA2_224 ->
                          Obj.repr
                            (FStar_UInt32.add_mod (Obj.magic s1)
                               (Obj.magic t7))
                      | Spec_Hash_Definitions.SHA2_256 ->
                          Obj.repr
                            (FStar_UInt32.add_mod (Obj.magic s1)
                               (Obj.magic t7))
                      | Spec_Hash_Definitions.SHA2_384 ->
                          Obj.repr
                            (FStar_UInt64.add_mod (Obj.magic s1)
                               (Obj.magic t7))
                      | Spec_Hash_Definitions.SHA2_512 ->
                          Obj.repr
                            (FStar_UInt64.add_mod (Obj.magic s1)
                               (Obj.magic t7))) s0) t16))
let (ws_pre_ : Spec_Hash_Definitions.sha2_alg -> unit block_w -> unit k_w) =
  fun a ->
    fun block ->
      Lib_LoopCombinators.repeati
        (match a with
         | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (64))
         | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (64))
         | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (80))
         | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (80)))
        (ws_pre_inner a block)
        (FStar_Seq_Base.create
           (match a with
            | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (64))
            | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (64))
            | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (80))
            | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (80)))
           (match a with
            | Spec_Hash_Definitions.SHA2_224 ->
                Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
            | Spec_Hash_Definitions.SHA2_256 ->
                Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
            | Spec_Hash_Definitions.SHA2_384 ->
                Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)
            | Spec_Hash_Definitions.SHA2_512 ->
                Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)))
let (ws_pre : Spec_Hash_Definitions.sha2_alg -> unit block_w -> unit k_w) =
  ws_pre_
let (shuffle_pre :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t FStar_Seq_Base.seq -> unit block_w -> Obj.t FStar_Seq_Base.seq)
  =
  fun a ->
    fun hash ->
      fun block ->
        let ws = ws_pre a block in
        let k = k0 a in
        Lib_LoopCombinators.repeati
          (match a with
           | Spec_Hash_Definitions.SHA2_224 -> (Prims.of_int (64))
           | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (64))
           | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (80))
           | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (80)))
          (fun i ->
             fun h ->
               shuffle_core_pre a (FStar_Seq_Base.index k i)
                 (FStar_Seq_Base.index ws i) h) hash
let (shuffle :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t FStar_Seq_Base.seq -> unit block_w -> Obj.t FStar_Seq_Base.seq)
  = shuffle_pre
let (init :
  Spec_Hash_Definitions.sha2_alg -> unit Spec_Hash_Definitions.init_t) =
  fun a -> ((h0 a), (Obj.repr ()))
let (update_pre :
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
            let block_w1 =
              Spec_Hash_Definitions.words_of_bytes a
                Spec_Hash_Definitions.block_word_length block in
            let hash_1 = shuffle a hash1 block_w1 in
            ((Spec_Loops.seq_map2
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
let (update :
  Spec_Hash_Definitions.sha2_alg -> unit Spec_Hash_Definitions.update_t) =
  update_pre
let (pad :
  Spec_Hash_Definitions.sha2_alg -> unit Spec_Hash_Definitions.pad_t) =
  Spec_Hash_PadFinish.pad
let (finish :
  Spec_Hash_Definitions.sha2_alg -> unit Spec_Hash_Definitions.finish_t) =
  Spec_Hash_PadFinish.finish