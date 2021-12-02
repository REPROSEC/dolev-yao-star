open Prims
let (irred : FStar_UInt8.t) = FStar_UInt8.uint_to_t (Prims.of_int (0x1b))
let (gf8 : Spec_GaloisField.field) =
  Spec_GaloisField.gf Lib_IntTypes.U8 (Obj.magic irred)
type elem = Obj.t
let (to_elem : Prims.nat -> Obj.t) = Spec_GaloisField.to_felem gf8
let (zero : Obj.t) = to_elem Prims.int_zero
let (two : Obj.t) = to_elem (Prims.of_int (2))
let (three : Obj.t) = to_elem (Prims.of_int (3))
let (op_Less_Less_Less_Dot :
  FStar_UInt8.t -> FStar_UInt32.t -> FStar_UInt8.t) =
  fun x ->
    fun y ->
      FStar_UInt8.logor (FStar_UInt8.shift_left x y)
        (FStar_UInt8.shift_right x
           (FStar_UInt32.sub (FStar_UInt32.uint_to_t (Prims.of_int (8))) y))
let (op_Hat_Dot : FStar_UInt8.t -> FStar_UInt8.t -> FStar_UInt8.t) =
  fun x -> fun y -> FStar_UInt8.logxor x y
type word = (Obj.t, unit) Lib_Sequence.lseq
type block = (Obj.t, unit) Lib_Sequence.lseq
type variant =
  | AES128 
  | AES256 
let (uu___is_AES128 : variant -> Prims.bool) =
  fun projectee -> match projectee with | AES128 -> true | uu___ -> false
let (uu___is_AES256 : variant -> Prims.bool) =
  fun projectee -> match projectee with | AES256 -> true | uu___ -> false
let (num_rounds : variant -> Prims.int) =
  fun v ->
    match v with
    | AES128 -> (Prims.of_int (10))
    | AES256 -> (Prims.of_int (14))
let (key_size : variant -> Prims.int) =
  fun v ->
    match v with
    | AES128 -> (Prims.of_int (16))
    | AES256 -> (Prims.of_int (32))
type 'v aes_key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'v aes_xkey = (Obj.t, unit) Lib_Sequence.lseq
type 'v aes_ikey = (Obj.t, unit) Lib_Sequence.lseq
let (sub_byte : Obj.t -> FStar_UInt8.t) =
  fun input ->
    let s = Spec_GaloisField.finv gf8 input in
    op_Hat_Dot (Obj.magic s)
      (op_Hat_Dot
         (op_Less_Less_Less_Dot (Obj.magic s)
            (FStar_UInt32.uint_to_t Prims.int_one))
         (op_Hat_Dot
            (op_Less_Less_Less_Dot (Obj.magic s)
               (FStar_UInt32.uint_to_t (Prims.of_int (2))))
            (op_Hat_Dot
               (op_Less_Less_Less_Dot (Obj.magic s)
                  (FStar_UInt32.uint_to_t (Prims.of_int (3))))
               (op_Hat_Dot
                  (op_Less_Less_Less_Dot (Obj.magic s)
                     (FStar_UInt32.uint_to_t (Prims.of_int (4))))
                  (Obj.magic (to_elem (Prims.of_int (99))))))))
let (inv_sub_byte : Obj.t -> Obj.t) =
  fun input ->
    let s = input in
    let s1 =
      Obj.magic
        (op_Hat_Dot
           (op_Less_Less_Less_Dot (Obj.magic s)
              (FStar_UInt32.uint_to_t Prims.int_one))
           (op_Hat_Dot
              (op_Less_Less_Less_Dot (Obj.magic s)
                 (FStar_UInt32.uint_to_t (Prims.of_int (3))))
              (op_Hat_Dot
                 (op_Less_Less_Less_Dot (Obj.magic s)
                    (FStar_UInt32.uint_to_t (Prims.of_int (6))))
                 (FStar_UInt8.uint_to_t (Prims.of_int (5)))))) in
    Spec_GaloisField.finv gf8 s1
let (subBytes : block -> block) =
  fun state ->
    Lib_Sequence.map (Prims.of_int (16))
      (fun uu___ -> (Obj.magic sub_byte) uu___) state
let (inv_subBytes : block -> block) =
  fun state -> Lib_Sequence.map (Prims.of_int (16)) inv_sub_byte state
let (shiftRow : Prims.nat -> Prims.nat -> block -> block) =
  fun i ->
    fun shift ->
      fun state ->
        let tmp0 =
          Lib_Sequence.index (Prims.of_int (16)) state
            (i + ((Prims.of_int (4)) * (shift mod (Prims.of_int (4))))) in
        let tmp1 =
          Lib_Sequence.index (Prims.of_int (16)) state
            (i +
               ((Prims.of_int (4)) *
                  ((shift + Prims.int_one) mod (Prims.of_int (4))))) in
        let tmp2 =
          Lib_Sequence.index (Prims.of_int (16)) state
            (i +
               ((Prims.of_int (4)) *
                  ((shift + (Prims.of_int (2))) mod (Prims.of_int (4))))) in
        let tmp3 =
          Lib_Sequence.index (Prims.of_int (16)) state
            (i +
               ((Prims.of_int (4)) *
                  ((shift + (Prims.of_int (3))) mod (Prims.of_int (4))))) in
        let state1 = Lib_Sequence.upd (Prims.of_int (16)) state i tmp0 in
        let state2 =
          Lib_Sequence.upd (Prims.of_int (16)) state1
            (i + (Prims.of_int (4))) tmp1 in
        let state3 =
          Lib_Sequence.upd (Prims.of_int (16)) state2
            (i + (Prims.of_int (8))) tmp2 in
        let state4 =
          Lib_Sequence.upd (Prims.of_int (16)) state3
            (i + (Prims.of_int (12))) tmp3 in
        state4
let (shiftRows : block -> block) =
  fun state ->
    let state1 = shiftRow Prims.int_one Prims.int_one state in
    let state2 = shiftRow (Prims.of_int (2)) (Prims.of_int (2)) state1 in
    let state3 = shiftRow (Prims.of_int (3)) (Prims.of_int (3)) state2 in
    state3
let (inv_shiftRows : block -> block) =
  fun state ->
    let state1 = shiftRow Prims.int_one (Prims.of_int (3)) state in
    let state2 = shiftRow (Prims.of_int (2)) (Prims.of_int (2)) state1 in
    let state3 = shiftRow (Prims.of_int (3)) Prims.int_one state2 in state3
let (mix4 : Obj.t -> Obj.t -> Obj.t -> Obj.t -> Obj.t) =
  fun s0 ->
    fun s1 ->
      fun s2 ->
        fun s3 ->
          Spec_GaloisField.fadd gf8
            (Spec_GaloisField.fadd gf8
               (Spec_GaloisField.fadd gf8 (Spec_GaloisField.fmul gf8 s0 two)
                  (Spec_GaloisField.fmul gf8 s1 three)) s2) s3
let (inv_mix4 : Obj.t -> Obj.t -> Obj.t -> Obj.t -> Obj.t) =
  fun s0 ->
    fun s1 ->
      fun s2 ->
        fun s3 ->
          Spec_GaloisField.fadd gf8
            (Spec_GaloisField.fadd gf8
               (Spec_GaloisField.fadd gf8
                  (Spec_GaloisField.fmul gf8 s0 (to_elem (Prims.of_int (14))))
                  (Spec_GaloisField.fmul gf8 s1 (to_elem (Prims.of_int (11)))))
               (Spec_GaloisField.fmul gf8 s2 (to_elem (Prims.of_int (13)))))
            (Spec_GaloisField.fmul gf8 s3 (to_elem (Prims.of_int (9))))
let (mixColumn : Prims.nat -> block -> block) =
  fun c ->
    fun state ->
      let i0 = (Prims.of_int (4)) * c in
      let s0 = Lib_Sequence.index (Prims.of_int (16)) state i0 in
      let s1 =
        Lib_Sequence.index (Prims.of_int (16)) state (i0 + Prims.int_one) in
      let s2 =
        Lib_Sequence.index (Prims.of_int (16)) state
          (i0 + (Prims.of_int (2))) in
      let s3 =
        Lib_Sequence.index (Prims.of_int (16)) state
          (i0 + (Prims.of_int (3))) in
      let state1 =
        Lib_Sequence.upd (Prims.of_int (16)) state i0 (mix4 s0 s1 s2 s3) in
      let state2 =
        Lib_Sequence.upd (Prims.of_int (16)) state1 (i0 + Prims.int_one)
          (mix4 s1 s2 s3 s0) in
      let state3 =
        Lib_Sequence.upd (Prims.of_int (16)) state2 (i0 + (Prims.of_int (2)))
          (mix4 s2 s3 s0 s1) in
      let state4 =
        Lib_Sequence.upd (Prims.of_int (16)) state3 (i0 + (Prims.of_int (3)))
          (mix4 s3 s0 s1 s2) in
      state4
let (mixColumns : block -> block) =
  fun state ->
    let state1 = mixColumn Prims.int_zero state in
    let state2 = mixColumn Prims.int_one state1 in
    let state3 = mixColumn (Prims.of_int (2)) state2 in
    let state4 = mixColumn (Prims.of_int (3)) state3 in state4
let (inv_mixColumn : Prims.nat -> block -> block) =
  fun c ->
    fun state ->
      let i0 = (Prims.of_int (4)) * c in
      let s0 = Lib_Sequence.index (Prims.of_int (16)) state i0 in
      let s1 =
        Lib_Sequence.index (Prims.of_int (16)) state (i0 + Prims.int_one) in
      let s2 =
        Lib_Sequence.index (Prims.of_int (16)) state
          (i0 + (Prims.of_int (2))) in
      let s3 =
        Lib_Sequence.index (Prims.of_int (16)) state
          (i0 + (Prims.of_int (3))) in
      let state1 =
        Lib_Sequence.upd (Prims.of_int (16)) state i0 (inv_mix4 s0 s1 s2 s3) in
      let state2 =
        Lib_Sequence.upd (Prims.of_int (16)) state1 (i0 + Prims.int_one)
          (inv_mix4 s1 s2 s3 s0) in
      let state3 =
        Lib_Sequence.upd (Prims.of_int (16)) state2 (i0 + (Prims.of_int (2)))
          (inv_mix4 s2 s3 s0 s1) in
      let state4 =
        Lib_Sequence.upd (Prims.of_int (16)) state3 (i0 + (Prims.of_int (3)))
          (inv_mix4 s3 s0 s1 s2) in
      state4
let (inv_mixColumns : block -> block) =
  fun state ->
    let state1 = inv_mixColumn Prims.int_zero state in
    let state2 = inv_mixColumn Prims.int_one state1 in
    let state3 = inv_mixColumn (Prims.of_int (2)) state2 in
    let state4 = inv_mixColumn (Prims.of_int (3)) state3 in state4
let (xor_block : block -> block -> block) =
  fun b1 ->
    fun b2 ->
      Lib_Sequence.map2 (Prims.of_int (16))
        (fun uu___1 ->
           fun uu___ ->
             (fun a ->
                let a = Obj.magic a in
                fun b ->
                  let b = Obj.magic b in Obj.magic (FStar_UInt8.logxor a b))
               uu___1 uu___) b1 b2
let (addRoundKey : block -> block -> block) =
  fun key -> fun state -> xor_block state key
let (aes_enc : block -> block -> block) =
  fun key ->
    fun state ->
      let state1 = subBytes state in
      let state2 = shiftRows state1 in
      let state3 = mixColumns state2 in
      let state4 = addRoundKey key state3 in state4
let (aes_enc_last : block -> block -> block) =
  fun key ->
    fun state ->
      let state1 = subBytes state in
      let state2 = shiftRows state1 in
      let state3 = addRoundKey key state2 in state3
let (aes_dec : block -> block -> block) =
  fun key ->
    fun state ->
      let state1 = inv_subBytes state in
      let state2 = inv_shiftRows state1 in
      let state3 = inv_mixColumns state2 in
      let state4 = addRoundKey key state3 in state4
let (aes_dec_last : block -> block -> block) =
  fun key ->
    fun state ->
      let state1 = inv_subBytes state in
      let state2 = inv_shiftRows state1 in
      let state3 = addRoundKey key state2 in state3
let (rotate_word : word -> word) =
  fun w ->
    Lib_Sequence.of_list
      [Lib_Sequence.index (Prims.of_int (4)) w Prims.int_one;
      Lib_Sequence.index (Prims.of_int (4)) w (Prims.of_int (2));
      Lib_Sequence.index (Prims.of_int (4)) w (Prims.of_int (3));
      Lib_Sequence.index (Prims.of_int (4)) w Prims.int_zero]
let (sub_word : word -> word) =
  fun w ->
    Lib_Sequence.map (Prims.of_int (4))
      (fun uu___ -> (Obj.magic sub_byte) uu___) w
let rec (rcon_spec : Prims.nat -> Obj.t) =
  fun i ->
    if i = Prims.int_zero
    then to_elem (Prims.of_int (0x8d))
    else
      if i = Prims.int_one
      then to_elem Prims.int_one
      else Spec_GaloisField.fmul gf8 two (rcon_spec (i - Prims.int_one))
let (rcon_l : Obj.t Prims.list) =
  [to_elem (Prims.of_int (0x8d));
  to_elem Prims.int_one;
  to_elem (Prims.of_int (0x02));
  to_elem (Prims.of_int (0x04));
  to_elem (Prims.of_int (0x08));
  to_elem (Prims.of_int (0x10));
  to_elem (Prims.of_int (0x20));
  to_elem (Prims.of_int (0x40));
  to_elem (Prims.of_int (0x80));
  to_elem (Prims.of_int (0x1b));
  to_elem (Prims.of_int (0x36))]
let (rcon_seq : (Obj.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list rcon_l
let (aes_keygen_assist : Obj.t -> block -> block) =
  fun rcon ->
    fun s ->
      let st =
        Lib_Sequence.create (Prims.of_int (16)) (to_elem Prims.int_zero) in
      let st1 =
        Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (4))))) in
      let st2 =
        Lib_Sequence.upd (Prims.of_int (16)) st1 Prims.int_one
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (5))))) in
      let st3 =
        Lib_Sequence.upd (Prims.of_int (16)) st2 (Prims.of_int (2))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (6))))) in
      let st4 =
        Lib_Sequence.upd (Prims.of_int (16)) st3 (Prims.of_int (3))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (7))))) in
      let st5 =
        Lib_Sequence.upd (Prims.of_int (16)) st4 (Prims.of_int (4))
          (Obj.magic
             (op_Hat_Dot (Obj.magic rcon)
                (sub_byte
                   (Lib_Sequence.index (Prims.of_int (16)) s
                      (Prims.of_int (5)))))) in
      let st6 =
        Lib_Sequence.upd (Prims.of_int (16)) st5 (Prims.of_int (6))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (6))))) in
      let st7 =
        Lib_Sequence.upd (Prims.of_int (16)) st6 (Prims.of_int (6))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (7))))) in
      let st8 =
        Lib_Sequence.upd (Prims.of_int (16)) st7 (Prims.of_int (7))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (4))))) in
      let st9 =
        Lib_Sequence.upd (Prims.of_int (16)) st8 (Prims.of_int (8))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (12))))) in
      let st10 =
        Lib_Sequence.upd (Prims.of_int (16)) st9 (Prims.of_int (9))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (13))))) in
      let st11 =
        Lib_Sequence.upd (Prims.of_int (16)) st10 (Prims.of_int (10))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (14))))) in
      let st12 =
        Lib_Sequence.upd (Prims.of_int (16)) st11 (Prims.of_int (11))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (15))))) in
      let st13 =
        Lib_Sequence.upd (Prims.of_int (16)) st12 (Prims.of_int (12))
          (Obj.magic
             (op_Hat_Dot (Obj.magic rcon)
                (sub_byte
                   (Lib_Sequence.index (Prims.of_int (16)) s
                      (Prims.of_int (13)))))) in
      let st14 =
        Lib_Sequence.upd (Prims.of_int (16)) st13 (Prims.of_int (13))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (14))))) in
      let st15 =
        Lib_Sequence.upd (Prims.of_int (16)) st14 (Prims.of_int (14))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (15))))) in
      let st16 =
        Lib_Sequence.upd (Prims.of_int (16)) st15 (Prims.of_int (15))
          (Obj.magic
             (sub_byte
                (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (12))))) in
      st16
let (keygen_assist0 : Obj.t -> block -> block) =
  fun rcon ->
    fun s ->
      let st = aes_keygen_assist rcon s in
      let st1 =
        Lib_Sequence.update_sub (Prims.of_int (16)) st (Prims.of_int (8))
          (Prims.of_int (4))
          (Lib_Sequence.sub (Prims.of_int (16)) st (Prims.of_int (12))
             (Prims.of_int (4))) in
      let st2 =
        Lib_Sequence.update_sub (Prims.of_int (16)) st1 Prims.int_zero
          (Prims.of_int (8))
          (Lib_Sequence.sub (Prims.of_int (16)) st1 (Prims.of_int (8))
             (Prims.of_int (8))) in
      st2
let (keygen_assist1 : block -> block) =
  fun s ->
    let st = aes_keygen_assist zero s in
    let st1 =
      Lib_Sequence.update_sub (Prims.of_int (16)) st (Prims.of_int (12))
        (Prims.of_int (4))
        (Lib_Sequence.sub (Prims.of_int (16)) st (Prims.of_int (8))
           (Prims.of_int (4))) in
    let st2 =
      Lib_Sequence.update_sub (Prims.of_int (16)) st1 Prims.int_zero
        (Prims.of_int (8))
        (Lib_Sequence.sub (Prims.of_int (16)) st1 (Prims.of_int (8))
           (Prims.of_int (8))) in
    st2
let (key_expansion_step : block -> block -> block) =
  fun p ->
    fun assist ->
      let p0 =
        Lib_Sequence.create (Prims.of_int (16)) (to_elem Prims.int_zero) in
      let k = p in
      let k1 =
        xor_block k
          (Lib_Sequence.update_sub (Prims.of_int (16)) p0 (Prims.of_int (4))
             (Prims.of_int (12))
             (Lib_Sequence.sub (Prims.of_int (16)) k Prims.int_zero
                (Prims.of_int (12)))) in
      let k2 =
        xor_block k1
          (Lib_Sequence.update_sub (Prims.of_int (16)) p0 (Prims.of_int (4))
             (Prims.of_int (12))
             (Lib_Sequence.sub (Prims.of_int (16)) k1 Prims.int_zero
                (Prims.of_int (12)))) in
      let k3 =
        xor_block k2
          (Lib_Sequence.update_sub (Prims.of_int (16)) p0 (Prims.of_int (4))
             (Prims.of_int (12))
             (Lib_Sequence.sub (Prims.of_int (16)) k2 Prims.int_zero
                (Prims.of_int (12)))) in
      xor_block k3 assist
let (aes128_key_expansion :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun key ->
    let key_ex =
      Lib_Sequence.create (Prims.of_int (176))
        (Obj.magic (to_elem Prims.int_zero)) in
    let key_ex1 =
      Lib_Sequence.update_sub (Prims.of_int (176)) key_ex Prims.int_zero
        (Prims.of_int (16)) key in
    let key_ex2 =
      Lib_LoopCombinators.repeati (Prims.of_int (10))
        (fun i ->
           fun kex ->
             let p =
               Lib_Sequence.sub (Prims.of_int (176)) kex
                 (i * (Prims.of_int (16))) (Prims.of_int (16)) in
             let a = keygen_assist0 (rcon_spec (i + Prims.int_one)) p in
             let n = key_expansion_step p a in
             Lib_Sequence.update_sub (Prims.of_int (176)) kex
               ((i + Prims.int_one) * (Prims.of_int (16)))
               (Prims.of_int (16)) n) (Obj.magic key_ex1) in
    key_ex2
let (aes256_key_expansion :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun key ->
    let key_ex =
      Lib_Sequence.create (Prims.of_int (240))
        (Obj.magic (to_elem Prims.int_zero)) in
    let key_ex1 =
      Lib_Sequence.update_sub (Prims.of_int (240)) key_ex Prims.int_zero
        (Prims.of_int (32)) key in
    let key_ex2 =
      Lib_LoopCombinators.repeati (Prims.of_int (6))
        (fun i ->
           fun key_ex3 ->
             let p0 =
               Lib_Sequence.sub (Prims.of_int (240)) key_ex3
                 (((Prims.of_int (2)) * i) * (Prims.of_int (16)))
                 (Prims.of_int (16)) in
             let p1 =
               Lib_Sequence.sub (Prims.of_int (240)) key_ex3
                 ((((Prims.of_int (2)) * i) + Prims.int_one) *
                    (Prims.of_int (16))) (Prims.of_int (16)) in
             let a0 = keygen_assist0 (rcon_spec (i + Prims.int_one)) p1 in
             let n0 = key_expansion_step p0 a0 in
             let a1 = keygen_assist1 n0 in
             let n1 = key_expansion_step p1 a1 in
             let key_ex4 =
               Lib_Sequence.update_sub (Prims.of_int (240)) key_ex3
                 ((((Prims.of_int (2)) * i) + (Prims.of_int (2))) *
                    (Prims.of_int (16))) (Prims.of_int (16)) n0 in
             Lib_Sequence.update_sub (Prims.of_int (240)) key_ex4
               ((((Prims.of_int (2)) * i) + (Prims.of_int (3))) *
                  (Prims.of_int (16))) (Prims.of_int (16)) n1)
        (Obj.magic key_ex1) in
    let p0 =
      Lib_Sequence.sub (Prims.of_int (240)) key_ex2 (Prims.of_int (192))
        (Prims.of_int (16)) in
    let p1 =
      Lib_Sequence.sub (Prims.of_int (240)) key_ex2 (Prims.of_int (208))
        (Prims.of_int (16)) in
    let a14 = keygen_assist0 (rcon_spec (Prims.of_int (7))) p1 in
    let n14 = key_expansion_step p0 a14 in
    Lib_Sequence.update_sub (Prims.of_int (240)) key_ex2 (Prims.of_int (224))
      (Prims.of_int (16)) n14
let (aes_key_expansion : variant -> unit aes_key -> unit aes_xkey) =
  fun v ->
    fun key ->
      match v with
      | AES128 -> aes128_key_expansion key
      | AES256 -> aes256_key_expansion key
let (aes_dec_key_expansion : variant -> unit aes_key -> unit aes_xkey) =
  fun v ->
    fun key ->
      let ekey_ex = aes_key_expansion v key in
      let k0 =
        Lib_Sequence.sub
          (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) ekey_ex
          Prims.int_zero (Prims.of_int (16)) in
      let kn =
        Lib_Sequence.sub
          (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) ekey_ex
          ((num_rounds v) * (Prims.of_int (16))) (Prims.of_int (16)) in
      let uu___ =
        Obj.magic
          (Lib_Sequence.generate_blocks (Prims.of_int (16))
             ((num_rounds v) + Prims.int_one)
             ((num_rounds v) + Prims.int_one) ()
             (fun uu___2 ->
                fun uu___1 ->
                  (fun i ->
                     fun a ->
                       let a = Obj.magic a in
                       let b =
                         Lib_Sequence.sub
                           (((num_rounds v) + Prims.int_one) *
                              (Prims.of_int (16))) ekey_ex
                           (((num_rounds v) - i) * (Prims.of_int (16)))
                           (Prims.of_int (16)) in
                       if i = Prims.int_zero
                       then Obj.magic ((), b)
                       else
                         if i < (num_rounds v)
                         then Obj.magic ((), (inv_mixColumns b))
                         else Obj.magic ((), b)) uu___2 uu___1) (Obj.repr ())) in
      match uu___ with | (uu___1, key_ex) -> key_ex
let (aes_enc_rounds : variant -> unit aes_ikey -> block -> block) =
  fun v ->
    fun key ->
      fun state ->
        Lib_LoopCombinators.repeati ((num_rounds v) - Prims.int_one)
          (fun i ->
             aes_enc
               (Lib_Sequence.sub
                  (((num_rounds v) - Prims.int_one) * (Prims.of_int (16)))
                  key ((Prims.of_int (16)) * i) (Prims.of_int (16)))) state
let (aes_encrypt_block : variant -> unit aes_xkey -> block -> block) =
  fun v ->
    fun key ->
      fun input ->
        let state = input in
        let k0 =
          Lib_Sequence.slice
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            Prims.int_zero (Prims.of_int (16)) in
        let k =
          Lib_Sequence.sub
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            (Prims.of_int (16))
            (((num_rounds v) - Prims.int_one) * (Prims.of_int (16))) in
        let kn =
          Lib_Sequence.sub
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            ((num_rounds v) * (Prims.of_int (16))) (Prims.of_int (16)) in
        let state1 = addRoundKey k0 state in
        let state2 = aes_enc_rounds v k state1 in
        let state3 = aes_enc_last kn state2 in state3
let (aes_dec_rounds : variant -> unit aes_ikey -> block -> block) =
  fun v ->
    fun key ->
      fun state ->
        Lib_LoopCombinators.repeati ((num_rounds v) - Prims.int_one)
          (fun i ->
             aes_dec
               (Lib_Sequence.sub
                  (((num_rounds v) - Prims.int_one) * (Prims.of_int (16)))
                  key ((Prims.of_int (16)) * i) (Prims.of_int (16)))) state
let (aes_decrypt_block : variant -> unit aes_xkey -> block -> block) =
  fun v ->
    fun key ->
      fun input ->
        let state = input in
        let k0 =
          Lib_Sequence.slice
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            Prims.int_zero (Prims.of_int (16)) in
        let k =
          Lib_Sequence.sub
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            (Prims.of_int (16))
            (((num_rounds v) - Prims.int_one) * (Prims.of_int (16))) in
        let kn =
          Lib_Sequence.sub
            (((num_rounds v) + Prims.int_one) * (Prims.of_int (16))) key
            ((num_rounds v) * (Prims.of_int (16))) (Prims.of_int (16)) in
        let state1 = addRoundKey k0 state in
        let state2 = aes_dec_rounds v k state1 in
        let state3 = aes_dec_last kn state2 in state3
let (aes_ctr_key_block :
  variant ->
    unit aes_xkey ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat -> block)
  =
  fun v ->
    fun k ->
      fun n ->
        fun c ->
          let ctrby =
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (4)) c) in
          let input =
            Lib_Sequence.create (Prims.of_int (16))
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let input1 =
            Lib_LoopCombinators.repeati (Prims.of_int (12))
              (fun i ->
                 fun b ->
                   Lib_Sequence.upd (Prims.of_int (16)) b i
                     (Lib_Sequence.index (Prims.of_int (12)) n i)) input in
          let input2 =
            Lib_LoopCombinators.repeati (Prims.of_int (4))
              (fun i ->
                 fun b ->
                   Lib_Sequence.upd (Prims.of_int (16)) b
                     ((Prims.of_int (12)) + i) (FStar_Seq_Base.index ctrby i))
              input1 in
          aes_encrypt_block v k (Obj.magic input2)
type 'v aes_ctr_state =
  {
  key_ex: (FStar_UInt8.t, unit) Lib_Sequence.lseq ;
  block: (FStar_UInt8.t, unit) Lib_Sequence.lseq }
let (__proj__Mkaes_ctr_state__item__key_ex :
  variant -> unit aes_ctr_state -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun v ->
    fun projectee ->
      match projectee with | { key_ex; block = block1;_} -> key_ex
let (__proj__Mkaes_ctr_state__item__block :
  variant -> unit aes_ctr_state -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun v ->
    fun projectee ->
      match projectee with | { key_ex; block = block1;_} -> block1
let (aes_ctr_add_counter :
  variant -> unit aes_ctr_state -> Prims.nat -> unit aes_ctr_state) =
  fun v ->
    fun st ->
      fun incr ->
        let n =
          Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
            Lib_IntTypes.SEC (Obj.magic st.block) in
        let n' = (n + incr) mod (Prims.pow2 (Prims.of_int (128))) in
        let nblock' =
          Obj.magic
            (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Prims.of_int (16)) n') in
        let uu___ = st in { key_ex = (uu___.key_ex); block = nblock' }
let (aes_ctr_init :
  variant ->
    unit aes_key ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> unit aes_ctr_state)
  =
  fun v ->
    fun k ->
      fun n_len ->
        fun n ->
          fun c0 ->
            let input =
              Lib_Sequence.create (Prims.of_int (16))
                (FStar_UInt8.uint_to_t Prims.int_zero) in
            let input1 =
              Lib_LoopCombinators.repeati n_len
                (fun i ->
                   fun b ->
                     Lib_Sequence.upd (Prims.of_int (16)) b i
                       (Lib_Sequence.index n_len n i)) input in
            let key_ex = aes_key_expansion v k in
            let st0 = { key_ex = (Obj.magic key_ex); block = input1 } in
            aes_ctr_add_counter v st0 c0
let (aes_ctr_current_key_block : variant -> unit aes_ctr_state -> block) =
  fun v ->
    fun st -> aes_encrypt_block v (Obj.magic st.key_ex) (Obj.magic st.block)
let (aes_ctr_key_block0 :
  variant ->
    unit aes_key ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> block)
  =
  fun v ->
    fun k ->
      fun n_len ->
        fun n ->
          let st = aes_ctr_init v k n_len n Prims.int_zero in
          aes_ctr_current_key_block v st
let (aes_ctr_key_block1 :
  variant ->
    unit aes_key ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> block)
  =
  fun v ->
    fun k ->
      fun n_len ->
        fun n ->
          let st = aes_ctr_init v k n_len n Prims.int_one in
          aes_ctr_current_key_block v st
let (aes_ctr_encrypt_block :
  variant -> unit aes_ctr_state -> Prims.nat -> block -> block) =
  fun v ->
    fun st0 ->
      fun incr ->
        fun b ->
          let st = aes_ctr_add_counter v st0 incr in
          let kb = aes_ctr_current_key_block v st in
          Lib_Sequence.map2 (Prims.of_int (16))
            (fun uu___1 -> fun uu___ -> (Obj.magic op_Hat_Dot) uu___1 uu___)
            b kb
let (aes_ctr_encrypt_last :
  variant ->
    unit aes_ctr_state ->
      Prims.nat ->
        Prims.nat ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (fun v ->
               fun st0 ->
                 fun incr ->
                   fun len ->
                     fun b ->
                       let plain =
                         Lib_Sequence.create (Prims.of_int (16))
                           (FStar_UInt8.uint_to_t Prims.int_zero) in
                       let plain1 =
                         Lib_Sequence.update_sub (Prims.of_int (16)) plain
                           Prims.int_zero (Lib_Sequence.length b) b in
                       let cipher =
                         aes_ctr_encrypt_block v st0 incr (Obj.magic plain1) in
                       Obj.magic
                         (Lib_Sequence.sub (Prims.of_int (16)) cipher
                            Prims.int_zero (Lib_Sequence.length b))) uu___4
              uu___3 uu___2 uu___1 uu___
let (aes_ctr_encrypt_stream :
  variant ->
    unit aes_ctr_state ->
      FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun v ->
    fun st ->
      fun msg ->
        Lib_Sequence.map_blocks (Prims.of_int (16)) msg
          (fun uu___1 ->
             fun uu___ ->
               (Obj.magic (aes_ctr_encrypt_block v st)) uu___1 uu___)
          (aes_ctr_encrypt_last v st)
let (aes_ctr_encrypt_bytes :
  variant ->
    unit aes_key ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          Prims.nat ->
            FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun v ->
    fun key ->
      fun n_len ->
        fun nonce ->
          fun ctr0 ->
            fun msg ->
              let st0 = aes_ctr_init v key n_len nonce ctr0 in
              aes_ctr_encrypt_stream v st0 msg
let (aes128_ctr_encrypt_bytes :
  unit aes_key ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun key ->
    fun n_len ->
      fun nonce ->
        fun ctr0 ->
          fun msg -> aes_ctr_encrypt_bytes AES128 key n_len nonce ctr0 msg
let (aes128_ctr_key_block0 :
  unit aes_key ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> block)
  = fun key -> fun n_len -> fun n -> aes_ctr_key_block0 AES128 key n_len n
let (aes128_ctr_key_block1 :
  unit aes_key ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> block)
  = fun key -> fun n_len -> fun n -> aes_ctr_key_block0 AES128 key n_len n
let (aes256_ctr_encrypt_bytes :
  unit aes_key ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun key ->
    fun n_len ->
      fun nonce ->
        fun ctr0 ->
          fun msg -> aes_ctr_encrypt_bytes AES256 key n_len nonce ctr0 msg