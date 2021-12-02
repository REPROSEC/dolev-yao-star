open Prims
type alg =
  | Blake2S 
  | Blake2B 
let (uu___is_Blake2S : alg -> Prims.bool) =
  fun projectee -> match projectee with | Blake2S -> true | uu___ -> false
let (uu___is_Blake2B : alg -> Prims.bool) =
  fun projectee -> match projectee with | Blake2B -> true | uu___ -> false

let (wt : alg -> Lib_IntTypes.inttype) =
  fun a ->
    match a with | Blake2S -> Lib_IntTypes.U32 | Blake2B -> Lib_IntTypes.U64
let (rounds : alg -> Prims.int) =
  fun a ->
    match a with
    | Blake2S -> (Prims.of_int (10))
    | Blake2B -> (Prims.of_int (12))
let (size_hash_w : Prims.nat) = (Prims.of_int (8))
let (size_block_w : Prims.nat) = (Prims.of_int (16))
let (size_word : alg -> Prims.nat) =
  fun a ->
    Lib_IntTypes.numbytes
      (match a with
       | Blake2S -> Lib_IntTypes.U32
       | Blake2B -> Lib_IntTypes.U64)
let (size_block : alg -> Prims.nat) =
  fun a ->
    (Prims.of_int (16)) *
      (Lib_IntTypes.numbytes
         (match a with
          | Blake2S -> Lib_IntTypes.U32
          | Blake2B -> Lib_IntTypes.U64))
let (size_ivTable : Prims.nat) = (Prims.of_int (8))
let (size_sigmaTable : Prims.nat) = (Prims.of_int (160))
let (max_key : alg -> Prims.int) =
  fun a ->
    match a with
    | Blake2S -> (Prims.of_int (32))
    | Blake2B -> (Prims.of_int (64))
let (max_output : alg -> Prims.int) =
  fun a ->
    match a with
    | Blake2S -> (Prims.of_int (32))
    | Blake2B -> (Prims.of_int (64))
let (limb_inttype : alg -> Lib_IntTypes.inttype) =
  fun a ->
    match match a with
          | Blake2S -> Lib_IntTypes.U32
          | Blake2B -> Lib_IntTypes.U64
    with
    | Lib_IntTypes.U32 -> Lib_IntTypes.U64
    | Lib_IntTypes.U64 -> Lib_IntTypes.U128
type 'a word_t = Obj.t
let (zero : alg -> Obj.t) =
  fun a ->
    match a with
    | Blake2S -> Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
    | Blake2B -> Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)
type 'a row = (Obj.t, unit) Lib_Sequence.lseq
let (zero_row : alg -> (Obj.t, unit) Lib_Sequence.lseq) =
  fun a ->
    Lib_Sequence.create (Prims.of_int (4))
      (match a with
       | Blake2S -> Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
       | Blake2B -> Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero))
let (load_row :
  alg -> (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s ->
      Lib_Sequence.of_list
        [Lib_Sequence.index (Prims.of_int (4)) s Prims.int_zero;
        Lib_Sequence.index (Prims.of_int (4)) s Prims.int_one;
        Lib_Sequence.index (Prims.of_int (4)) s (Prims.of_int (2));
        Lib_Sequence.index (Prims.of_int (4)) s (Prims.of_int (3))]
let (create_row :
  alg -> Obj.t -> Obj.t -> Obj.t -> Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun x0 ->
      fun x1 -> fun x2 -> fun x3 -> Lib_Sequence.of_list [x0; x1; x2; x3]
type 'a state = ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq
type 'a pub_word_t = Obj.t
type 'a limb_t = Obj.t
let (max_limb : alg -> Prims.int) =
  fun a ->
    Lib_IntTypes.maxint
      (match match a with
             | Blake2S -> Lib_IntTypes.U32
             | Blake2B -> Lib_IntTypes.U64
       with
       | Lib_IntTypes.U32 -> Lib_IntTypes.U64
       | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
let (nat_to_word : alg -> Prims.nat -> Obj.t) =
  fun a ->
    fun x ->
      match match a with
            | Blake2S -> Lib_IntTypes.U32
            | Blake2B -> Lib_IntTypes.U64
      with
      | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt32.uint_to_t x)
      | Lib_IntTypes.U64 -> Obj.repr (FStar_UInt64.uint_to_t x)
let (nat_to_limb : alg -> Prims.nat -> Obj.t) =
  fun a ->
    fun x ->
      match match a with
            | Blake2S -> Lib_IntTypes.U32
            | Blake2B -> Lib_IntTypes.U64
      with
      | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt64.uint_to_t x)
      | Lib_IntTypes.U64 ->
          Obj.repr
            (let h =
               FStar_UInt64.uint_to_t (x / (Prims.pow2 (Prims.of_int (64)))) in
             let l =
               FStar_UInt64.uint_to_t
                 (x mod (Prims.pow2 (Prims.of_int (64)))) in
             FStar_UInt128.add
               (FStar_UInt128.shift_left (FStar_UInt128.uint64_to_uint128 h)
                  (FStar_UInt32.uint_to_t (Prims.of_int (64))))
               (FStar_UInt128.uint64_to_uint128 l))
let (word_to_limb : alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      match match a with
            | Blake2S -> Lib_IntTypes.U32
            | Blake2B -> Lib_IntTypes.U64
      with
      | Lib_IntTypes.U32 ->
          Obj.repr
            (Lib_IntTypes.to_u64
               (match a with
                | Blake2S -> Lib_IntTypes.U32
                | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC x)
      | Lib_IntTypes.U64 ->
          Obj.repr
            (Lib_IntTypes.to_u128
               (match a with
                | Blake2S -> Lib_IntTypes.U32
                | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC x)
let (limb_to_word : alg -> Obj.t -> Obj.t) =
  fun a ->
    fun x ->
      match match a with
            | Blake2S -> Lib_IntTypes.U32
            | Blake2B -> Lib_IntTypes.U64
      with
      | Lib_IntTypes.U32 ->
          Obj.repr
            (Lib_IntTypes.to_u32
               (match match a with
                      | Blake2S -> Lib_IntTypes.U32
                      | Blake2B -> Lib_IntTypes.U64
                with
                | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                | Lib_IntTypes.U64 -> Lib_IntTypes.U128) Lib_IntTypes.SEC x)
      | Lib_IntTypes.U64 ->
          Obj.repr
            (Lib_IntTypes.to_u64
               (match match a with
                      | Blake2S -> Lib_IntTypes.U32
                      | Blake2B -> Lib_IntTypes.U64
                with
                | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                | Lib_IntTypes.U64 -> Lib_IntTypes.U128) Lib_IntTypes.SEC x)
type 'a rtable_t = (FStar_UInt32.t, unit) Lib_Sequence.lseq
let (rTable_list_S : (FStar_UInt32.t, unit) FStar_List_Tot_Properties.llist)
  =
  [FStar_UInt32.uint_to_t (Prims.of_int (16));
  FStar_UInt32.uint_to_t (Prims.of_int (12));
  FStar_UInt32.uint_to_t (Prims.of_int (8));
  FStar_UInt32.uint_to_t (Prims.of_int (7))]
let (rTable_list_B : (FStar_UInt32.t, unit) FStar_List_Tot_Properties.llist)
  =
  [FStar_UInt32.uint_to_t (Prims.of_int (32));
  FStar_UInt32.uint_to_t (Prims.of_int (24));
  FStar_UInt32.uint_to_t (Prims.of_int (16));
  FStar_UInt32.uint_to_t (Prims.of_int (63))]
let (rTable : alg -> (FStar_UInt32.t, unit) Lib_Sequence.lseq) =
  fun a ->
    match a with
    | Blake2S ->
        Lib_Sequence.of_list
          [FStar_UInt32.uint_to_t (Prims.of_int (16));
          FStar_UInt32.uint_to_t (Prims.of_int (12));
          FStar_UInt32.uint_to_t (Prims.of_int (8));
          FStar_UInt32.uint_to_t (Prims.of_int (7))]
    | Blake2B ->
        Lib_Sequence.of_list
          [FStar_UInt32.uint_to_t (Prims.of_int (32));
          FStar_UInt32.uint_to_t (Prims.of_int (24));
          FStar_UInt32.uint_to_t (Prims.of_int (16));
          FStar_UInt32.uint_to_t (Prims.of_int (63))]
let (list_iv_S : (FStar_UInt32.t, unit) FStar_List_Tot_Properties.llist) =
  [FStar_UInt32.uint_to_t (Prims.parse_int "0x6A09E667");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xBB67AE85");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x3C6EF372");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xA54FF53A");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x510E527F");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x9B05688C");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x1F83D9AB");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x5BE0CD19")]
let (list_iv_B : (FStar_UInt64.t, unit) FStar_List_Tot_Properties.llist) =
  [FStar_UInt64.uint_to_t (Prims.parse_int "0x6A09E667F3BCC908");
  FStar_UInt64.uint_to_t (Prims.parse_int "0xBB67AE8584CAA73B");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x3C6EF372FE94F82B");
  FStar_UInt64.uint_to_t (Prims.parse_int "0xA54FF53A5F1D36F1");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x510E527FADE682D1");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x9B05688C2B3E6C1F");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x1F83D9ABFB41BD6B");
  FStar_UInt64.uint_to_t (Prims.parse_int "0x5BE0CD19137E2179")]
let (list_iv : alg -> (Obj.t, unit) FStar_List_Tot_Properties.llist) =
  fun uu___ ->
    (fun a ->
       match a with
       | Blake2S ->
           Obj.magic
             (Obj.repr
                [FStar_UInt32.uint_to_t (Prims.parse_int "0x6A09E667");
                FStar_UInt32.uint_to_t (Prims.parse_int "0xBB67AE85");
                FStar_UInt32.uint_to_t (Prims.parse_int "0x3C6EF372");
                FStar_UInt32.uint_to_t (Prims.parse_int "0xA54FF53A");
                FStar_UInt32.uint_to_t (Prims.parse_int "0x510E527F");
                FStar_UInt32.uint_to_t (Prims.parse_int "0x9B05688C");
                FStar_UInt32.uint_to_t (Prims.parse_int "0x1F83D9AB");
                FStar_UInt32.uint_to_t (Prims.parse_int "0x5BE0CD19")])
       | Blake2B ->
           Obj.magic
             (Obj.repr
                [FStar_UInt64.uint_to_t
                   (Prims.parse_int "0x6A09E667F3BCC908");
                FStar_UInt64.uint_to_t (Prims.parse_int "0xBB67AE8584CAA73B");
                FStar_UInt64.uint_to_t (Prims.parse_int "0x3C6EF372FE94F82B");
                FStar_UInt64.uint_to_t (Prims.parse_int "0xA54FF53A5F1D36F1");
                FStar_UInt64.uint_to_t (Prims.parse_int "0x510E527FADE682D1");
                FStar_UInt64.uint_to_t (Prims.parse_int "0x9B05688C2B3E6C1F");
                FStar_UInt64.uint_to_t (Prims.parse_int "0x1F83D9ABFB41BD6B");
                FStar_UInt64.uint_to_t (Prims.parse_int "0x5BE0CD19137E2179")]))
      uu___
let (ivTable : alg -> (Obj.t, unit) Lib_Sequence.lseq) =
  fun uu___ ->
    (fun a ->
       match a with
       | Blake2S ->
           Obj.magic
             (Obj.repr
                (Lib_Sequence.of_list
                   [FStar_UInt32.uint_to_t (Prims.parse_int "0x6A09E667");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0xBB67AE85");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0x3C6EF372");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0xA54FF53A");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0x510E527F");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0x9B05688C");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0x1F83D9AB");
                   FStar_UInt32.uint_to_t (Prims.parse_int "0x5BE0CD19")]))
       | Blake2B ->
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
                     (Prims.parse_int "0x5BE0CD19137E2179")]))) uu___
type sigma_elt_t = FStar_UInt32.t
type list_sigma_t = sigma_elt_t Prims.list
let (list_sigma : list_sigma_t) =
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
  FStar_UInt32.uint_to_t Prims.int_zero]
let (sigmaTable : (sigma_elt_t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list list_sigma
type 'a block_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'a block_w = (Obj.t, unit) Lib_Sequence.lseq
type idx_t = Prims.nat
type row_idx = Prims.nat
let (op_Hat_Bar :
  alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun r1 ->
      fun r2 ->
        Lib_Sequence.map2 (Prims.of_int (4))
          (Lib_IntTypes.logxor
             (match a with
              | Blake2S -> Lib_IntTypes.U32
              | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC) r1 r2
let (op_Plus_Bar :
  alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun r1 ->
      fun r2 ->
        Lib_Sequence.map2 (Prims.of_int (4))
          (Lib_IntTypes.add_mod
             (match a with
              | Blake2S -> Lib_IntTypes.U32
              | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC) r1 r2
let (op_Greater_Greater_Greater_Bar :
  alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      FStar_UInt32.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun r1 ->
      fun r ->
        Lib_Sequence.map (Prims.of_int (4))
          (fun u ->
             Lib_IntTypes.rotate_right
               (match a with
                | Blake2S -> Lib_IntTypes.U32
                | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC u r) r1
let (rotr :
  alg ->
    (Obj.t, unit) Lib_Sequence.lseq ->
      row_idx -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun r1 ->
      fun r ->
        Lib_Sequence.createi (Prims.of_int (4))
          (fun i ->
             Lib_Sequence.index (Prims.of_int (4)) r1
               ((i + r) mod (Prims.of_int (4))))
let (g1 :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      row_idx ->
        row_idx ->
          FStar_UInt32.t ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          fun r ->
            Lib_Sequence.upd (Prims.of_int (4)) wv i
              (Lib_Sequence.map (Prims.of_int (4))
                 (fun u ->
                    Lib_IntTypes.rotate_right
                      (match a with
                       | Blake2S -> Lib_IntTypes.U32
                       | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC u r)
                 (Lib_Sequence.map2 (Prims.of_int (4))
                    (Lib_IntTypes.logxor
                       (match a with
                        | Blake2S -> Lib_IntTypes.U32
                        | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                    (Lib_Sequence.index (Prims.of_int (4)) wv i)
                    (Lib_Sequence.index (Prims.of_int (4)) wv j)))
let (g2 :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      row_idx ->
        row_idx ->
          (Obj.t, unit) Lib_Sequence.lseq ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          fun x ->
            Lib_Sequence.upd (Prims.of_int (4)) wv i
              (Lib_Sequence.map2 (Prims.of_int (4))
                 (Lib_IntTypes.add_mod
                    (match a with
                     | Blake2S -> Lib_IntTypes.U32
                     | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                 (Lib_Sequence.map2 (Prims.of_int (4))
                    (Lib_IntTypes.add_mod
                       (match a with
                        | Blake2S -> Lib_IntTypes.U32
                        | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                    (Lib_Sequence.index (Prims.of_int (4)) wv i)
                    (Lib_Sequence.index (Prims.of_int (4)) wv j)) x)
let (g2z :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      row_idx ->
        row_idx -> ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun i ->
        fun j ->
          Lib_Sequence.upd (Prims.of_int (4)) wv i
            (Lib_Sequence.map2 (Prims.of_int (4))
               (Lib_IntTypes.add_mod
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
               (Lib_Sequence.index (Prims.of_int (4)) wv i)
               (Lib_Sequence.index (Prims.of_int (4)) wv j))
let (blake2_mixing :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      (Obj.t, unit) Lib_Sequence.lseq ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun al ->
    fun wv ->
      fun x ->
        fun y ->
          let a = Prims.int_zero in
          let b = Prims.int_one in
          let c = (Prims.of_int (2)) in
          let d = (Prims.of_int (3)) in
          let rt =
            match al with
            | Blake2S ->
                Lib_Sequence.of_list
                  [FStar_UInt32.uint_to_t (Prims.of_int (16));
                  FStar_UInt32.uint_to_t (Prims.of_int (12));
                  FStar_UInt32.uint_to_t (Prims.of_int (8));
                  FStar_UInt32.uint_to_t (Prims.of_int (7))]
            | Blake2B ->
                Lib_Sequence.of_list
                  [FStar_UInt32.uint_to_t (Prims.of_int (32));
                  FStar_UInt32.uint_to_t (Prims.of_int (24));
                  FStar_UInt32.uint_to_t (Prims.of_int (16));
                  FStar_UInt32.uint_to_t (Prims.of_int (63))] in
          let wv1 = g2 al wv a b x in
          let wv2 =
            g1 al wv1 d a
              (Lib_Sequence.index (Prims.of_int (4)) rt Prims.int_zero) in
          let wv3 = g2z al wv2 c d in
          let wv4 =
            g1 al wv3 b c
              (Lib_Sequence.index (Prims.of_int (4)) rt Prims.int_one) in
          let wv5 = g2 al wv4 a b y in
          let wv6 =
            g1 al wv5 d a
              (Lib_Sequence.index (Prims.of_int (4)) rt (Prims.of_int (2))) in
          let wv7 = g2z al wv6 c d in
          let wv8 =
            g1 al wv7 b c
              (Lib_Sequence.index (Prims.of_int (4)) rt (Prims.of_int (3))) in
          wv8
let (diag :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      let wv1 =
        Lib_Sequence.upd (Prims.of_int (4)) wv Prims.int_one
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv Prims.int_one)
                  ((i + Prims.int_one) mod (Prims.of_int (4))))) in
      let wv2 =
        Lib_Sequence.upd (Prims.of_int (4)) wv1 (Prims.of_int (2))
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv1
                     (Prims.of_int (2)))
                  ((i + (Prims.of_int (2))) mod (Prims.of_int (4))))) in
      let wv3 =
        Lib_Sequence.upd (Prims.of_int (4)) wv2 (Prims.of_int (3))
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv2
                     (Prims.of_int (3)))
                  ((i + (Prims.of_int (3))) mod (Prims.of_int (4))))) in
      wv3
let (undiag :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      let wv1 =
        Lib_Sequence.upd (Prims.of_int (4)) wv Prims.int_one
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv Prims.int_one)
                  ((i + (Prims.of_int (3))) mod (Prims.of_int (4))))) in
      let wv2 =
        Lib_Sequence.upd (Prims.of_int (4)) wv1 (Prims.of_int (2))
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv1
                     (Prims.of_int (2)))
                  ((i + (Prims.of_int (2))) mod (Prims.of_int (4))))) in
      let wv3 =
        Lib_Sequence.upd (Prims.of_int (4)) wv2 (Prims.of_int (3))
          (Lib_Sequence.createi (Prims.of_int (4))
             (fun i ->
                Lib_Sequence.index (Prims.of_int (4))
                  (Lib_Sequence.index (Prims.of_int (4)) wv2
                     (Prims.of_int (3)))
                  ((i + Prims.int_one) mod (Prims.of_int (4))))) in
      wv3
let (gather_row :
  alg ->
    unit block_w ->
      sigma_elt_t ->
        sigma_elt_t ->
          sigma_elt_t -> sigma_elt_t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun m ->
      fun i0 ->
        fun i1 ->
          fun i2 ->
            fun i3 ->
              Lib_Sequence.of_list
                [Lib_Sequence.index (Prims.of_int (16)) m
                   (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                      (Obj.magic i0));
                Lib_Sequence.index (Prims.of_int (16)) m
                  (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                     (Obj.magic i1));
                Lib_Sequence.index (Prims.of_int (16)) m
                  (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                     (Obj.magic i2));
                Lib_Sequence.index (Prims.of_int (16)) m
                  (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                     (Obj.magic i3))]
let (gather_state :
  alg ->
    unit block_w ->
      Prims.nat -> ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun m ->
      fun start ->
        let x =
          Lib_Sequence.of_list
            [Lib_Sequence.index (Prims.of_int (16)) m
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                  (Obj.magic
                     (Lib_Sequence.index (Prims.of_int (160))
                        (Lib_Sequence.of_list list_sigma) start)));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (2))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (4))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (6))))))] in
        let y =
          Lib_Sequence.of_list
            [Lib_Sequence.index (Prims.of_int (16)) m
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                  (Obj.magic
                     (Lib_Sequence.index (Prims.of_int (160))
                        (Lib_Sequence.of_list list_sigma)
                        (start + Prims.int_one))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (3))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (5))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (7))))))] in
        let z =
          Lib_Sequence.of_list
            [Lib_Sequence.index (Prims.of_int (16)) m
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                  (Obj.magic
                     (Lib_Sequence.index (Prims.of_int (160))
                        (Lib_Sequence.of_list list_sigma)
                        (start + (Prims.of_int (8))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (10))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (12))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (14))))))] in
        let w =
          Lib_Sequence.of_list
            [Lib_Sequence.index (Prims.of_int (16)) m
               (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                  (Obj.magic
                     (Lib_Sequence.index (Prims.of_int (160))
                        (Lib_Sequence.of_list list_sigma)
                        (start + (Prims.of_int (9))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (11))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (13))))));
            Lib_Sequence.index (Prims.of_int (16)) m
              (Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
                 (Obj.magic
                    (Lib_Sequence.index (Prims.of_int (160))
                       (Lib_Sequence.of_list list_sigma)
                       (start + (Prims.of_int (15))))))] in
        let l = [x; y; z; w] in Lib_Sequence.of_list l
let (blake2_round :
  alg ->
    unit block_w ->
      Prims.nat ->
        ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun m ->
      fun i ->
        fun wv ->
          let start = (i mod (Prims.of_int (10))) * (Prims.of_int (16)) in
          let m_s = gather_state a m start in
          let wv1 =
            blake2_mixing a wv
              (Lib_Sequence.index (Prims.of_int (4)) m_s Prims.int_zero)
              (Lib_Sequence.index (Prims.of_int (4)) m_s Prims.int_one) in
          let wv2 = diag a wv1 in
          let wv3 =
            blake2_mixing a wv2
              (Lib_Sequence.index (Prims.of_int (4)) m_s (Prims.of_int (2)))
              (Lib_Sequence.index (Prims.of_int (4)) m_s (Prims.of_int (3))) in
          undiag a wv3
let (blake2_compress0 : alg -> unit block_s -> unit block_w) =
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
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64))) m
                     (i *
                        (Lib_IntTypes.numbytes
                           (match a with
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64)))
                     (Lib_IntTypes.numbytes
                        (match a with
                         | Blake2S -> Lib_IntTypes.U32
                         | Blake2B -> Lib_IntTypes.U64)))) in
           Lib_IntTypes.mk_int
             (match a with
              | Blake2S -> Lib_IntTypes.U32
              | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC n)
let (blake2_compress1 :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      Obj.t ->
        Prims.bool ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s_iv ->
      fun offset ->
        fun flag ->
          let wv = s_iv in
          let low_offset =
            match match a with
                  | Blake2S -> Lib_IntTypes.U32
                  | Blake2B -> Lib_IntTypes.U64
            with
            | Lib_IntTypes.U32 ->
                Obj.repr
                  (Lib_IntTypes.to_u32
                     (match match a with
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC offset)
            | Lib_IntTypes.U64 ->
                Obj.repr
                  (Lib_IntTypes.to_u64
                     (match match a with
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC offset) in
          let high_offset =
            match match a with
                  | Blake2S -> Lib_IntTypes.U32
                  | Blake2B -> Lib_IntTypes.U64
            with
            | Lib_IntTypes.U32 ->
                Obj.repr
                  (Lib_IntTypes.to_u32
                     (match match a with
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC
                     (Lib_IntTypes.shift_right
                        (match match a with
                               | Blake2S -> Lib_IntTypes.U32
                               | Blake2B -> Lib_IntTypes.U64
                         with
                         | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                         | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                        Lib_IntTypes.SEC offset
                        (FStar_UInt32.uint_to_t
                           (Lib_IntTypes.bits
                              (match a with
                               | Blake2S -> Lib_IntTypes.U32
                               | Blake2B -> Lib_IntTypes.U64)))))
            | Lib_IntTypes.U64 ->
                Obj.repr
                  (Lib_IntTypes.to_u64
                     (match match a with
                            | Blake2S -> Lib_IntTypes.U32
                            | Blake2B -> Lib_IntTypes.U64
                      with
                      | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                      | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                     Lib_IntTypes.SEC
                     (Lib_IntTypes.shift_right
                        (match match a with
                               | Blake2S -> Lib_IntTypes.U32
                               | Blake2B -> Lib_IntTypes.U64
                         with
                         | Lib_IntTypes.U32 -> Lib_IntTypes.U64
                         | Lib_IntTypes.U64 -> Lib_IntTypes.U128)
                        Lib_IntTypes.SEC offset
                        (FStar_UInt32.uint_to_t
                           (Lib_IntTypes.bits
                              (match a with
                               | Blake2S -> Lib_IntTypes.U32
                               | Blake2B -> Lib_IntTypes.U64))))) in
          let m_12 = low_offset in
          let m_13 = high_offset in
          let m_14 =
            if flag
            then
              Lib_IntTypes.ones
                (match a with
                 | Blake2S -> Lib_IntTypes.U32
                 | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
            else
              (match a with
               | Blake2S -> Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
               | Blake2B -> Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero)) in
          let m_15 =
            match a with
            | Blake2S -> Obj.repr (FStar_UInt32.uint_to_t Prims.int_zero)
            | Blake2B -> Obj.repr (FStar_UInt64.uint_to_t Prims.int_zero) in
          let mask = Lib_Sequence.of_list [m_12; m_13; m_14; m_15] in
          let wv1 =
            Lib_Sequence.upd (Prims.of_int (4)) wv (Prims.of_int (3))
              (Lib_Sequence.map2 (Prims.of_int (4))
                 (Lib_IntTypes.logxor
                    (match a with
                     | Blake2S -> Lib_IntTypes.U32
                     | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                 (Lib_Sequence.index (Prims.of_int (4)) wv (Prims.of_int (3)))
                 mask) in
          wv1
let (blake2_compress2 :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      unit block_w ->
        ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun m ->
        Lib_LoopCombinators.repeati
          (match a with
           | Blake2S -> (Prims.of_int (10))
           | Blake2B -> (Prims.of_int (12))) (blake2_round a m) wv
let (blake2_compress3 :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
        ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun wv ->
      fun s ->
        let s1 =
          Lib_Sequence.upd (Prims.of_int (4)) s Prims.int_zero
            (Lib_Sequence.map2 (Prims.of_int (4))
               (Lib_IntTypes.logxor
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
               (Lib_Sequence.map2 (Prims.of_int (4))
                  (Lib_IntTypes.logxor
                     (match a with
                      | Blake2S -> Lib_IntTypes.U32
                      | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                  (Lib_Sequence.index (Prims.of_int (4)) s Prims.int_zero)
                  (Lib_Sequence.index (Prims.of_int (4)) wv Prims.int_zero))
               (Lib_Sequence.index (Prims.of_int (4)) wv (Prims.of_int (2)))) in
        let s2 =
          Lib_Sequence.upd (Prims.of_int (4)) s1 Prims.int_one
            (Lib_Sequence.map2 (Prims.of_int (4))
               (Lib_IntTypes.logxor
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
               (Lib_Sequence.map2 (Prims.of_int (4))
                  (Lib_IntTypes.logxor
                     (match a with
                      | Blake2S -> Lib_IntTypes.U32
                      | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC)
                  (Lib_Sequence.index (Prims.of_int (4)) s1 Prims.int_one)
                  (Lib_Sequence.index (Prims.of_int (4)) wv Prims.int_one))
               (Lib_Sequence.index (Prims.of_int (4)) wv (Prims.of_int (3)))) in
        s2
let (blake2_compress :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      unit block_s ->
        Obj.t ->
          Prims.bool ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
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
  alg ->
    Prims.bool ->
      Prims.nat ->
        unit block_s ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun flag ->
      fun totlen ->
        fun d ->
          fun s ->
            let offset =
              match match a with
                    | Blake2S -> Lib_IntTypes.U32
                    | Blake2B -> Lib_IntTypes.U64
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
  alg -> FStar_UInt8.t Lib_Sequence.seq -> Prims.nat -> unit block_s) =
  fun a ->
    fun m ->
      fun i ->
        FStar_Seq_Base.slice m
          (i *
             ((Prims.of_int (16)) *
                (Lib_IntTypes.numbytes
                   (match a with
                    | Blake2S -> Lib_IntTypes.U32
                    | Blake2B -> Lib_IntTypes.U64))))
          ((i + Prims.int_one) *
             ((Prims.of_int (16)) *
                (Lib_IntTypes.numbytes
                   (match a with
                    | Blake2S -> Lib_IntTypes.U32
                    | Blake2B -> Lib_IntTypes.U64))))
let (blake2_update1 :
  alg ->
    Prims.nat ->
      FStar_UInt8.t Lib_Sequence.seq ->
        Prims.nat ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
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
                          | Blake2S -> Lib_IntTypes.U32
                          | Blake2B -> Lib_IntTypes.U64)))) in
            let d = get_blocki a m i in
            blake2_update_block a false totlen d s
let (get_last_padded_block :
  alg -> FStar_UInt8.t Lib_Sequence.seq -> Prims.nat -> unit block_s) =
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
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64)))
            (FStar_UInt8.uint_to_t Prims.int_zero) in
        let last_block1 =
          Lib_Sequence.update_sub
            ((Prims.of_int (16)) *
               (Lib_IntTypes.numbytes
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64))) last_block Prims.int_zero
            rem last in
        last_block1
let (blake2_update_last :
  alg ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
            ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
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
let (split : alg -> Prims.nat -> (Prims.nat * Prims.nat)) =
  fun a ->
    fun len ->
      Lib_UpdateMulti.split_at_last_lazy_nb_rem
        ((Prims.of_int (16)) *
           (Lib_IntTypes.numbytes
              (match a with
               | Blake2S -> Lib_IntTypes.U32
               | Blake2B -> Lib_IntTypes.U64))) len
let (blake2_update_blocks :
  alg ->
    Prims.nat ->
      FStar_UInt8.t Lib_Sequence.seq ->
        ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun prev ->
      fun m ->
        fun s ->
          let uu___ = split a (Lib_Sequence.length m) in
          match uu___ with
          | (nb, rem) ->
              let s1 =
                Lib_LoopCombinators.repeati nb (blake2_update1 a prev m) s in
              blake2_update_last a prev rem m s1
let (blake2_init_hash :
  alg ->
    Prims.nat ->
      Prims.nat -> ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun kk ->
      fun nn ->
        let iv0 =
          Lib_Sequence.index (Prims.of_int (8))
            (match a with
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S ->
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
             | Blake2B ->
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
             | Blake2S -> Lib_IntTypes.U32
             | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
            (match match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64
             with
             | Lib_IntTypes.U32 ->
                 Obj.repr
                   (FStar_UInt32.uint_to_t (Prims.parse_int "0x01010000"))
             | Lib_IntTypes.U64 ->
                 Obj.repr
                   (FStar_UInt64.uint_to_t (Prims.parse_int "0x01010000")))
            (Lib_IntTypes.logxor
               (match a with
                | Blake2S -> Lib_IntTypes.U32
                | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
               (Lib_IntTypes.shift_left
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                  (match match a with
                         | Blake2S -> Lib_IntTypes.U32
                         | Blake2B -> Lib_IntTypes.U64
                   with
                   | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt32.uint_to_t kk)
                   | Lib_IntTypes.U64 -> Obj.repr (FStar_UInt64.uint_to_t kk))
                  (FStar_UInt32.uint_to_t (Prims.of_int (8))))
               (match match a with
                      | Blake2S -> Lib_IntTypes.U32
                      | Blake2B -> Lib_IntTypes.U64
                with
                | Lib_IntTypes.U32 -> Obj.repr (FStar_UInt32.uint_to_t nn)
                | Lib_IntTypes.U64 -> Obj.repr (FStar_UInt64.uint_to_t nn))) in
        let iv0' =
          Lib_IntTypes.logxor
            (match a with
             | Blake2S -> Lib_IntTypes.U32
             | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC iv0 s0' in
        let r0' = Lib_Sequence.of_list [iv0'; iv1; iv2; iv3] in
        let s_iv = Lib_Sequence.of_list [r0'; r1; r0; r1] in s_iv
let (blake2_init :
  alg ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq)
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
                     | Blake2S -> Lib_IntTypes.U32
                     | Blake2B -> Lib_IntTypes.U64)))
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
                        | Blake2S -> Lib_IntTypes.U32
                        | Blake2B -> Lib_IntTypes.U64))) key_block
                 Prims.int_zero kk k in
             blake2_update1 a Prims.int_zero key_block1 Prims.int_zero s)
let (blake2_finish :
  alg ->
    ((Obj.t, unit) Lib_Sequence.lseq, unit) Lib_Sequence.lseq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s ->
      fun nn ->
        let full =
          Lib_Sequence.op_At_Bar
            ((Prims.of_int (4)) *
               (Lib_IntTypes.numbytes
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64)))
            ((Prims.of_int (4)) *
               (Lib_IntTypes.numbytes
                  (match a with
                   | Blake2S -> Lib_IntTypes.U32
                   | Blake2B -> Lib_IntTypes.U64)))
            (let uu___ =
               Lib_Sequence.generate_blocks
                 (Lib_IntTypes.numbytes
                    (match a with
                     | Blake2S -> Lib_IntTypes.U32
                     | Blake2B -> Lib_IntTypes.U64)) (Prims.of_int (4))
                 (Prims.of_int (4)) ()
                 (fun uu___2 ->
                    fun uu___1 ->
                      (Obj.magic
                         (Lib_ByteSequence.uints_to_bytes_le_inner
                            (match a with
                             | Blake2S -> Lib_IntTypes.U32
                             | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                            (Prims.of_int (4))
                            (Lib_Sequence.index (Prims.of_int (4)) s
                               Prims.int_zero))) uu___2 uu___1) (Obj.repr ()) in
             match uu___ with | (uu___1, o) -> o)
            (let uu___ =
               Lib_Sequence.generate_blocks
                 (Lib_IntTypes.numbytes
                    (match a with
                     | Blake2S -> Lib_IntTypes.U32
                     | Blake2B -> Lib_IntTypes.U64)) (Prims.of_int (4))
                 (Prims.of_int (4)) ()
                 (fun uu___2 ->
                    fun uu___1 ->
                      (Obj.magic
                         (Lib_ByteSequence.uints_to_bytes_le_inner
                            (match a with
                             | Blake2S -> Lib_IntTypes.U32
                             | Blake2B -> Lib_IntTypes.U64) Lib_IntTypes.SEC
                            (Prims.of_int (4))
                            (Lib_Sequence.index (Prims.of_int (4)) s
                               Prims.int_one))) uu___2 uu___1) (Obj.repr ()) in
             match uu___ with | (uu___1, o) -> o) in
        Lib_Sequence.sub
          (((Prims.of_int (4)) *
              (Lib_IntTypes.numbytes
                 (match a with
                  | Blake2S -> Lib_IntTypes.U32
                  | Blake2B -> Lib_IntTypes.U64)))
             +
             ((Prims.of_int (4)) *
                (Lib_IntTypes.numbytes
                   (match a with
                    | Blake2S -> Lib_IntTypes.U32
                    | Blake2B -> Lib_IntTypes.U64)))) full Prims.int_zero nn
let (compute_prev0 : alg -> Prims.int -> Prims.int) =
  fun a ->
    fun kk ->
      let kn = if kk = Prims.int_zero then Prims.int_zero else Prims.int_one in
      let prev0 =
        kn *
          ((Prims.of_int (16)) *
             (Lib_IntTypes.numbytes
                (match a with
                 | Blake2S -> Lib_IntTypes.U32
                 | Blake2B -> Lib_IntTypes.U64))) in
      prev0
let (blake2 :
  alg ->
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
  = fun d -> fun kk -> fun k -> fun n -> blake2 Blake2S d kk k n
let (blake2b :
  FStar_UInt8.t Lib_Sequence.seq ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  = fun d -> fun kk -> fun k -> fun n -> blake2 Blake2B d kk k n