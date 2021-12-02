open Prims
let op_String_Access :
  'uuuuu . unit -> 'uuuuu FStar_Seq_Base.seq -> Prims.nat -> 'uuuuu =
  fun uu___ -> FStar_Seq_Base.index
let (size_k_w_256 : Prims.int) = (Prims.of_int (64))
let (vv : FStar_UInt32.t -> Vale_Def_Words_s.nat32) =
  fun u -> Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.SEC (Obj.magic u)
let (to_uint32 : Vale_Def_Words_s.nat32 -> FStar_UInt32.t) =
  fun n -> FStar_UInt32.uint_to_t n
type word = FStar_UInt32.t
let (size_block_w_256 : Prims.int) = (Prims.of_int (16))
let (block_length : Prims.int) = (Prims.of_int (4)) * size_block_w_256
type block_w = word FStar_Seq_Base.seq
type counter = Prims.nat
let (k : word FStar_Seq_Base.seq) =
  Obj.magic (Spec_SHA2.k0 Spec_Hash_Definitions.SHA2_256)
type hash256 = word FStar_Seq_Base.seq

type byte = FStar_UInt8.t
type bytes = byte FStar_Seq_Base.seq
type bytes_blocks = bytes

let (ws_opaque_aux :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w -> Spec_SHA2.counter -> Obj.t)
  = Spec_SHA2_Lemmas.ws
let (ws_opaque : block_w -> counter -> Vale_Def_Words_s.nat32) =
  fun b ->
    fun t ->
      vv
        (Obj.magic
           (Spec_SHA2_Lemmas.ws Spec_Hash_Definitions.SHA2_256 (Obj.magic b)
              t))
let (shuffle_core_opaque_aux :
  Spec_Hash_Definitions.sha2_alg ->
    unit Spec_SHA2.block_w ->
      Obj.t FStar_Seq_Base.seq ->
        Spec_SHA2.counter -> Obj.t FStar_Seq_Base.seq)
  = Spec_SHA2_Lemmas.shuffle_core
let (shuffle_core_opaque : block_w -> hash256 -> counter -> hash256) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun block ->
           fun hash ->
             fun t ->
               Obj.magic
                 (Spec_SHA2_Lemmas.shuffle_core
                    Spec_Hash_Definitions.SHA2_256 (Obj.magic block)
                    (Obj.magic hash) t)) uu___2 uu___1 uu___
let (update_multi_opaque_aux :
  Spec_Hash_Definitions.hash_alg ->
    unit Spec_Hash_Definitions.words_state ->
      unit Spec_Hash_Definitions.bytes_blocks ->
        unit Spec_Hash_Definitions.words_state)
  = Vale_Def_Opaque_s.opaque_make Spec_Agile_Hash.update_multi

let (update_multi_opaque : hash256 -> bytes_blocks -> hash256) =
  fun hash ->
    fun blocks ->
      FStar_Pervasives_Native.fst
        (Obj.magic
           (update_multi_opaque_aux Spec_Hash_Definitions.SHA2_256
              (Obj.magic (hash, ())) blocks))
let (update_multi_transparent : hash256 -> bytes_blocks -> hash256) =
  fun hash ->
    fun blocks ->
      FStar_Pervasives_Native.fst
        (Obj.magic
           (Spec_Agile_Hash.update_multi Spec_Hash_Definitions.SHA2_256
              (Obj.magic (hash, ())) blocks))
let (add_mod32 : word -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32) =
  fun x -> fun y -> vv (FStar_UInt32.add_mod x (to_uint32 y))
let (word_to_nat32 : word -> Vale_Def_Words_s.nat32) = vv
let (nat32_to_word : Vale_Def_Words_s.nat32 -> word) = to_uint32
let (byte_to_nat8 : byte -> Vale_Def_Words_s.nat8) = FStar_UInt8.v
let (nat8_to_byte : Vale_Def_Words_s.nat8 -> byte) = FStar_UInt8.uint_to_t
let (repeat_range_vale : Prims.nat -> block_w -> hash256 -> hash256) =
  fun max ->
    fun block ->
      fun hash ->
        Spec_Loops.repeat_range Prims.int_zero max
          (shuffle_core_opaque block) hash

let (update_multi_opaque_vale : hash256 -> bytes -> hash256) =
  fun hash ->
    fun blocks ->
      if
        ((FStar_Seq_Base.length blocks) mod (Prims.of_int (64))) =
          Prims.int_zero
      then let b = blocks in update_multi_opaque hash b
      else hash
let (make_hash_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun abef ->
    fun cdgh ->
      let a = to_uint32 abef.Vale_Def_Words_s.hi3 in
      let b = to_uint32 abef.Vale_Def_Words_s.hi2 in
      let c = to_uint32 cdgh.Vale_Def_Words_s.hi3 in
      let d = to_uint32 cdgh.Vale_Def_Words_s.hi2 in
      let e = to_uint32 abef.Vale_Def_Words_s.lo1 in
      let f = to_uint32 abef.Vale_Def_Words_s.lo0 in
      let g = to_uint32 cdgh.Vale_Def_Words_s.lo1 in
      let h = to_uint32 cdgh.Vale_Def_Words_s.lo0 in
      let l = [a; b; c; d; e; f; g; h] in
      let hash = FStar_Seq_Properties.seq_of_list l in hash
let (make_hash :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32 -> hash256) =
  Vale_Def_Opaque_s.opaque_make make_hash_def

let (make_ordered_hash_def :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun abcd ->
    fun efgh ->
      let a = to_uint32 abcd.Vale_Def_Words_s.lo0 in
      let b = to_uint32 abcd.Vale_Def_Words_s.lo1 in
      let c = to_uint32 abcd.Vale_Def_Words_s.hi2 in
      let d = to_uint32 abcd.Vale_Def_Words_s.hi3 in
      let e = to_uint32 efgh.Vale_Def_Words_s.lo0 in
      let f = to_uint32 efgh.Vale_Def_Words_s.lo1 in
      let g = to_uint32 efgh.Vale_Def_Words_s.hi2 in
      let h = to_uint32 efgh.Vale_Def_Words_s.hi3 in
      let l = [a; b; c; d; e; f; g; h] in
      let hash = FStar_Seq_Properties.seq_of_list l in hash
let (make_ordered_hash :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32 -> hash256) =
  Vale_Def_Opaque_s.opaque_make make_ordered_hash_def


let (sha256_rnds2_spec_update_quad32 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      FStar_UInt32.t -> (Vale_Def_Types_s.quad32 * Vale_Def_Types_s.quad32))
  =
  fun abef ->
    fun cdgh ->
      fun wk ->
        let hash0 = make_hash abef cdgh in
        let uu___ =
          Vale_X64_CryptoInstructions_s.sha256_rnds2_spec_update
            (FStar_Seq_Base.index hash0 Prims.int_zero)
            (FStar_Seq_Base.index hash0 Prims.int_one)
            (FStar_Seq_Base.index hash0 (Prims.of_int (2)))
            (FStar_Seq_Base.index hash0 (Prims.of_int (3)))
            (FStar_Seq_Base.index hash0 (Prims.of_int (4)))
            (FStar_Seq_Base.index hash0 (Prims.of_int (5)))
            (FStar_Seq_Base.index hash0 (Prims.of_int (6)))
            (FStar_Seq_Base.index hash0 (Prims.of_int (7))) wk in
        match uu___ with
        | (a', b', c', d', e', f', g', h') ->
            let abef' =
              {
                Vale_Def_Words_s.lo0 = (vv f');
                Vale_Def_Words_s.lo1 = (vv e');
                Vale_Def_Words_s.hi2 = (vv b');
                Vale_Def_Words_s.hi3 = (vv a')
              } in
            let cdgh' =
              {
                Vale_Def_Words_s.lo0 = (vv h');
                Vale_Def_Words_s.lo1 = (vv g');
                Vale_Def_Words_s.hi2 = (vv d');
                Vale_Def_Words_s.hi3 = (vv c')
              } in
            (abef', cdgh')
let (sha256_rnds2_spec_quad32 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun src1 ->
    fun src2 ->
      fun wk ->
        let uu___ =
          sha256_rnds2_spec_update_quad32 src2 src1
            (to_uint32 wk.Vale_Def_Words_s.lo0) in
        match uu___ with
        | (abef', cdgh') ->
            let uu___1 =
              sha256_rnds2_spec_update_quad32 abef' cdgh'
                (to_uint32 wk.Vale_Def_Words_s.lo1) in
            (match uu___1 with | (abef'', cdgh'') -> abef'')








let (sha256_rnds2_spec_update_core_quad32 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      FStar_UInt32.t ->
        block_w ->
          counter -> (Vale_Def_Types_s.quad32 * Vale_Def_Types_s.quad32))
  =
  fun abef ->
    fun cdgh ->
      fun wk ->
        fun block ->
          fun t ->
            let hash0 = make_hash abef cdgh in
            let hash1 = shuffle_core_opaque block hash0 t in
            let abef' =
              {
                Vale_Def_Words_s.lo0 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (5))));
                Vale_Def_Words_s.lo1 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (4))));
                Vale_Def_Words_s.hi2 =
                  (vv (FStar_Seq_Base.index hash1 Prims.int_one));
                Vale_Def_Words_s.hi3 =
                  (vv (FStar_Seq_Base.index hash1 Prims.int_zero))
              } in
            let cdgh' =
              {
                Vale_Def_Words_s.lo0 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (7))));
                Vale_Def_Words_s.lo1 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (6))));
                Vale_Def_Words_s.hi2 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (3))));
                Vale_Def_Words_s.hi3 =
                  (vv (FStar_Seq_Base.index hash1 (Prims.of_int (2))))
              } in
            (abef', cdgh')






let (ws_quad32 : counter -> block_w -> Vale_Def_Types_s.quad32) =
  fun t ->
    fun block ->
      if t < (Prims.of_int (61))
      then
        {
          Vale_Def_Words_s.lo0 = (ws_opaque block t);
          Vale_Def_Words_s.lo1 = (ws_opaque block (t + Prims.int_one));
          Vale_Def_Words_s.hi2 = (ws_opaque block (t + (Prims.of_int (2))));
          Vale_Def_Words_s.hi3 = (ws_opaque block (t + (Prims.of_int (3))))
        }
      else
        {
          Vale_Def_Words_s.lo0 = Prims.int_zero;
          Vale_Def_Words_s.lo1 = Prims.int_zero;
          Vale_Def_Words_s.hi2 = Prims.int_zero;
          Vale_Def_Words_s.hi3 = Prims.int_zero
        }
let (_sigma0_quad32 : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    {
      Vale_Def_Words_s.lo0 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.lo0)
                       (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.lo0)
                       (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (3)))))));
      Vale_Def_Words_s.lo1 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.lo1)
                       (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.lo1)
                       (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (3)))))));
      Vale_Def_Words_s.hi2 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.hi2)
                       (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.hi2)
                       (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (3)))))));
      Vale_Def_Words_s.hi3 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.hi3)
                       (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.hi3)
                       (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (3)))))))
    }
let (_sigma1_quad32 : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    {
      Vale_Def_Words_s.lo0 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.lo0)
                       (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.lo0)
                       (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo0)
                    (FStar_UInt32.uint_to_t (Prims.of_int (10)))))));
      Vale_Def_Words_s.lo1 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.lo1)
                       (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.lo1)
                       (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.lo1)
                    (FStar_UInt32.uint_to_t (Prims.of_int (10)))))));
      Vale_Def_Words_s.hi2 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.hi2)
                       (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.hi2)
                       (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi2)
                    (FStar_UInt32.uint_to_t (Prims.of_int (10)))))));
      Vale_Def_Words_s.hi3 =
        (vv
           (FStar_UInt32.logxor
              (FStar_UInt32.logor
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                 (FStar_UInt32.shift_left (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
              (FStar_UInt32.logxor
                 (FStar_UInt32.logor
                    (FStar_UInt32.shift_right
                       (to_uint32 q.Vale_Def_Words_s.hi3)
                       (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                    (FStar_UInt32.shift_left
                       (to_uint32 q.Vale_Def_Words_s.hi3)
                       (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                 (FStar_UInt32.shift_right (to_uint32 q.Vale_Def_Words_s.hi3)
                    (FStar_UInt32.uint_to_t (Prims.of_int (10)))))))
    }
let (ws_partial_def : counter -> block_w -> Vale_Def_Types_s.quad32) =
  fun t ->
    fun block ->
      if ((Prims.of_int (16)) <= t) && (t < (Prims.of_int (64)))
      then
        let init = ws_quad32 (t - (Prims.of_int (16))) block in
        let sigma0_in = ws_quad32 (t - (Prims.of_int (15))) block in
        let sigma0_out = _sigma0_quad32 sigma0_in in
        Vale_Arch_Types.add_wrap_quad32 init sigma0_out
      else
        {
          Vale_Def_Words_s.lo0 = Prims.int_zero;
          Vale_Def_Words_s.lo1 = Prims.int_zero;
          Vale_Def_Words_s.hi2 = Prims.int_zero;
          Vale_Def_Words_s.hi3 = Prims.int_zero
        }
let (ws_partial : counter -> block_w -> Vale_Def_Types_s.quad32) =
  Vale_Def_Opaque_s.opaque_make ws_partial_def

let (add_mod_quad32 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun q0 ->
    fun q1 ->
      {
        Vale_Def_Words_s.lo0 =
          (vv
             (FStar_UInt32.add_mod (to_uint32 q0.Vale_Def_Words_s.lo0)
                (to_uint32 q1.Vale_Def_Words_s.lo0)));
        Vale_Def_Words_s.lo1 =
          (vv
             (FStar_UInt32.add_mod (to_uint32 q0.Vale_Def_Words_s.lo1)
                (to_uint32 q1.Vale_Def_Words_s.lo1)));
        Vale_Def_Words_s.hi2 =
          (vv
             (FStar_UInt32.add_mod (to_uint32 q0.Vale_Def_Words_s.hi2)
                (to_uint32 q1.Vale_Def_Words_s.hi2)));
        Vale_Def_Words_s.hi3 =
          (vv
             (FStar_UInt32.add_mod (to_uint32 q0.Vale_Def_Words_s.hi3)
                (to_uint32 q1.Vale_Def_Words_s.hi3)))
      }



let (ws_computed : block_w -> counter -> FStar_UInt32.t) =
  fun b ->
    fun t ->
      if t < Spec_Hash_Definitions.block_word_length
      then to_uint32 (ws_opaque b t)
      else
        (let t16 = to_uint32 (ws_opaque b (t - (Prims.of_int (16)))) in
         let t15 = to_uint32 (ws_opaque b (t - (Prims.of_int (15)))) in
         let t7 = to_uint32 (ws_opaque b (t - (Prims.of_int (7)))) in
         let t2 = to_uint32 (ws_opaque b (t - (Prims.of_int (2)))) in
         let s1 =
           FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right t2
                   (FStar_UInt32.uint_to_t (Prims.of_int (17))))
                (FStar_UInt32.shift_left t2
                   (FStar_UInt32.uint_to_t (Prims.of_int (15)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right t2
                      (FStar_UInt32.uint_to_t (Prims.of_int (19))))
                   (FStar_UInt32.shift_left t2
                      (FStar_UInt32.uint_to_t (Prims.of_int (13)))))
                (FStar_UInt32.shift_right t2
                   (FStar_UInt32.uint_to_t (Prims.of_int (10))))) in
         let s0 =
           FStar_UInt32.logxor
             (FStar_UInt32.logor
                (FStar_UInt32.shift_right t15
                   (FStar_UInt32.uint_to_t (Prims.of_int (7))))
                (FStar_UInt32.shift_left t15
                   (FStar_UInt32.uint_to_t (Prims.of_int (25)))))
             (FStar_UInt32.logxor
                (FStar_UInt32.logor
                   (FStar_UInt32.shift_right t15
                      (FStar_UInt32.uint_to_t (Prims.of_int (18))))
                   (FStar_UInt32.shift_left t15
                      (FStar_UInt32.uint_to_t (Prims.of_int (14)))))
                (FStar_UInt32.shift_right t15
                   (FStar_UInt32.uint_to_t (Prims.of_int (3))))) in
         FStar_UInt32.add_mod
           (FStar_UInt32.add_mod (FStar_UInt32.add_mod t16 s0) t7) s1)


let (ws_computed_quad32 : counter -> block_w -> Vale_Def_Types_s.quad32) =
  fun t ->
    fun block ->
      {
        Vale_Def_Words_s.lo0 = (vv (ws_computed block t));
        Vale_Def_Words_s.lo1 = (vv (ws_computed block (t + Prims.int_one)));
        Vale_Def_Words_s.hi2 =
          (vv (ws_computed block (t + (Prims.of_int (2)))));
        Vale_Def_Words_s.hi3 =
          (vv (ws_computed block (t + (Prims.of_int (3)))))
      }


let (sha256_msg1_spec_t : counter -> block_w -> Vale_Def_Types_s.quad32) =
  fun t ->
    fun block ->
      let init = ws_quad32 t block in
      let next = ws_quad32 (t + Prims.int_one) block in
      let msg1 = add_mod_quad32 init (_sigma0_quad32 next) in msg1




type 'kuseq k_reqs = unit
let (quads_to_block : Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> block_w)
  =
  fun qs ->
    let nat32_seq = Vale_Def_Words_Seq_s.seq_four_to_seq_LE qs in
    let f n =
      nat32_to_word
        (if n < (FStar_Seq_Base.length nat32_seq)
         then FStar_Seq_Base.index nat32_seq n
         else Prims.int_zero) in
    FStar_Seq_Base.init_aux (Prims.of_int (16)) Prims.int_zero f


let (shuffle_opaque :
  Spec_Hash_Definitions.sha2_alg ->
    Obj.t FStar_Seq_Base.seq ->
      unit Spec_SHA2.block_w -> Obj.t FStar_Seq_Base.seq)
  = Spec_SHA2.shuffle
let (update_block : hash256 -> block_w -> hash256) =
  fun hash ->
    fun block ->
      let hash_1 =
        Obj.magic
          (Spec_SHA2.shuffle Spec_Hash_Definitions.SHA2_256 (Obj.magic hash)
             (Obj.magic block)) in
      Spec_Loops.seq_map2 (fun a -> fun b -> FStar_UInt32.add_mod a b) hash
        hash_1


let rec (update_multi_quads :
  Vale_Def_Types_s.quad32 FStar_Seq_Base.seq -> hash256 -> hash256) =
  fun s ->
    fun hash_orig ->
      if (FStar_Seq_Base.length s) < (Prims.of_int (4))
      then hash_orig
      else
        (let uu___1 =
           FStar_Seq_Properties.split s
             ((FStar_Seq_Base.length s) - (Prims.of_int (4))) in
         match uu___1 with
         | (prefix, qs) ->
             let h_prefix = update_multi_quads prefix hash_orig in
             let hash = update_block h_prefix (quads_to_block qs) in hash)











let (le_bytes_to_hash : Vale_Def_Words_s.nat8 FStar_Seq_Base.seq -> hash256)
  =
  fun b ->
    if (FStar_Seq_Base.length b) <> (Prims.of_int (32))
    then
      let f n = nat32_to_word Prims.int_zero in
      FStar_Seq_Base.init_aux (Prims.of_int (8)) Prims.int_zero f
    else
      Vale_Lib_Seqs_s.seq_map nat32_to_word
        (Vale_Def_Words_Seq_s.seq_nat8_to_seq_nat32_LE b)



