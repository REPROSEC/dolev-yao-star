open Prims
let (size_key : Prims.int) = (Prims.of_int (32))
let (size_block : Prims.int) = (Prims.of_int (64))
let (size_nonce : Prims.int) = (Prims.of_int (8))
let (size_xnonce : Prims.int) = (Prims.of_int (16))
type key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type block = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type nonce = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type xnonce = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type counter = Prims.nat
type state = (FStar_UInt32.t, unit) Lib_Sequence.lseq
type idx = Prims.nat
type shuffle = state -> state
let op_At :
  'uuuuu 'uuuuu1 'uuuuu2 .
    ('uuuuu -> 'uuuuu1) -> ('uuuuu1 -> 'uuuuu2) -> 'uuuuu -> 'uuuuu2
  = fun f -> fun g -> fun x -> g (f x)
let (line : idx -> idx -> idx -> FStar_UInt32.t -> state -> state) =
  fun a ->
    fun b ->
      fun d ->
        fun s ->
          fun m ->
            let m1 =
              Lib_Sequence.upd (Prims.of_int (16)) m a
                (FStar_UInt32.logxor
                   (Lib_Sequence.index (Prims.of_int (16)) m a)
                   (FStar_UInt32.logor
                      (FStar_UInt32.shift_left
                         (FStar_UInt32.add_mod
                            (Lib_Sequence.index (Prims.of_int (16)) m b)
                            (Lib_Sequence.index (Prims.of_int (16)) m d)) s)
                      (FStar_UInt32.shift_right
                         (FStar_UInt32.add_mod
                            (Lib_Sequence.index (Prims.of_int (16)) m b)
                            (Lib_Sequence.index (Prims.of_int (16)) m d))
                         (FStar_UInt32.sub
                            (FStar_UInt32.uint_to_t (Prims.of_int (32))) s)))) in
            m1
let (quarter_round : idx -> idx -> idx -> idx -> shuffle) =
  fun a ->
    fun b ->
      fun c ->
        fun d ->
          op_At (line b a d (FStar_UInt32.uint_to_t (Prims.of_int (7))))
            (op_At (line c b a (FStar_UInt32.uint_to_t (Prims.of_int (9))))
               (op_At
                  (line d c b (FStar_UInt32.uint_to_t (Prims.of_int (13))))
                  (line a d c (FStar_UInt32.uint_to_t (Prims.of_int (18))))))
let (column_round : shuffle) =
  op_At
    (quarter_round Prims.int_zero (Prims.of_int (4)) (Prims.of_int (8))
       (Prims.of_int (12)))
    (op_At
       (quarter_round (Prims.of_int (5)) (Prims.of_int (9))
          (Prims.of_int (13)) Prims.int_one)
       (op_At
          (quarter_round (Prims.of_int (10)) (Prims.of_int (14))
             (Prims.of_int (2)) (Prims.of_int (6)))
          (quarter_round (Prims.of_int (15)) (Prims.of_int (3))
             (Prims.of_int (7)) (Prims.of_int (11)))))
let (row_round : shuffle) =
  op_At
    (quarter_round Prims.int_zero Prims.int_one (Prims.of_int (2))
       (Prims.of_int (3)))
    (op_At
       (quarter_round (Prims.of_int (5)) (Prims.of_int (6))
          (Prims.of_int (7)) (Prims.of_int (4)))
       (op_At
          (quarter_round (Prims.of_int (10)) (Prims.of_int (11))
             (Prims.of_int (8)) (Prims.of_int (9)))
          (quarter_round (Prims.of_int (15)) (Prims.of_int (12))
             (Prims.of_int (13)) (Prims.of_int (14)))))
let (double_round : shuffle) = op_At column_round row_round
let (rounds : shuffle) =
  Lib_LoopCombinators.repeat (Prims.of_int (10)) double_round
let (salsa20_add_counter : state -> counter -> state) =
  fun s ->
    fun ctr ->
      Lib_Sequence.upd (Prims.of_int (16)) s (Prims.of_int (8))
        (FStar_UInt32.add_mod
           (Lib_Sequence.index (Prims.of_int (16)) s (Prims.of_int (8)))
           (FStar_UInt32.uint_to_t ctr))
let (salsa20_core : counter -> state -> state) =
  fun ctr ->
    fun s ->
      let s' = salsa20_add_counter s ctr in
      let s'1 = rounds s' in
      let s'2 =
        Lib_Sequence.map2 (Prims.of_int (16))
          (fun a -> fun b -> FStar_UInt32.add_mod a b) s'1 s in
      salsa20_add_counter s'2 ctr
let (constant0 : FStar_UInt32.t) =
  FStar_UInt32.uint_to_t (Prims.parse_int "0x61707865")
let (constant1 : FStar_UInt32.t) =
  FStar_UInt32.uint_to_t (Prims.parse_int "0x3320646e")
let (constant2 : FStar_UInt32.t) =
  FStar_UInt32.uint_to_t (Prims.parse_int "0x79622d32")
let (constant3 : FStar_UInt32.t) =
  FStar_UInt32.uint_to_t (Prims.parse_int "0x6b206574")
let (setup : key -> nonce -> counter -> state -> state) =
  fun k ->
    fun n ->
      fun ctr0 ->
        fun st ->
          let ks =
            Lib_Sequence.createi (Prims.of_int (8))
              (fun i ->
                 let n1 =
                   Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                     Lib_IntTypes.SEC
                     (Obj.magic
                        (Lib_Sequence.sub (Prims.of_int (32)) k
                           (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
                 FStar_UInt32.uint_to_t n1) in
          let ns =
            Lib_Sequence.createi (Prims.of_int (2))
              (fun i ->
                 let n1 =
                   Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                     Lib_IntTypes.SEC
                     (Obj.magic
                        (Lib_Sequence.sub (Prims.of_int (8)) n
                           (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
                 FStar_UInt32.uint_to_t n1) in
          let st1 =
            Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
              (FStar_UInt32.uint_to_t (Prims.parse_int "0x61707865")) in
          let st2 =
            Lib_Sequence.update_sub (Prims.of_int (16)) st1 Prims.int_one
              (Prims.of_int (4))
              (Lib_Sequence.slice (Prims.of_int (8)) ks Prims.int_zero
                 (Prims.of_int (4))) in
          let st3 =
            Lib_Sequence.upd (Prims.of_int (16)) st2 (Prims.of_int (5))
              (FStar_UInt32.uint_to_t (Prims.parse_int "0x3320646e")) in
          let st4 =
            Lib_Sequence.update_sub (Prims.of_int (16)) st3
              (Prims.of_int (6)) (Prims.of_int (2)) ns in
          let st5 =
            Lib_Sequence.upd (Prims.of_int (16)) st4 (Prims.of_int (8))
              (FStar_UInt32.uint_to_t ctr0) in
          let st6 =
            Lib_Sequence.upd (Prims.of_int (16)) st5 (Prims.of_int (9))
              (FStar_UInt32.uint_to_t Prims.int_zero) in
          let st7 =
            Lib_Sequence.upd (Prims.of_int (16)) st6 (Prims.of_int (10))
              (FStar_UInt32.uint_to_t (Prims.parse_int "0x79622d32")) in
          let st8 =
            Lib_Sequence.update_sub (Prims.of_int (16)) st7
              (Prims.of_int (11)) (Prims.of_int (4))
              (Lib_Sequence.slice (Prims.of_int (8)) ks (Prims.of_int (4))
                 (Prims.of_int (8))) in
          let st9 =
            Lib_Sequence.upd (Prims.of_int (16)) st8 (Prims.of_int (15))
              (FStar_UInt32.uint_to_t (Prims.parse_int "0x6b206574")) in
          st9
let (salsa20_init : key -> nonce -> counter -> state) =
  fun k ->
    fun n ->
      fun ctr0 ->
        let st =
          Lib_Sequence.create (Prims.of_int (16))
            (FStar_UInt32.uint_to_t Prims.int_zero) in
        let st1 = setup k n ctr0 st in st1
let (xsetup : key -> xnonce -> state -> state) =
  fun k ->
    fun n ->
      fun st ->
        let ks =
          Lib_Sequence.createi (Prims.of_int (8))
            (fun i ->
               let n1 =
                 Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                   Lib_IntTypes.SEC
                   (Obj.magic
                      (Lib_Sequence.sub (Prims.of_int (32)) k
                         (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
               FStar_UInt32.uint_to_t n1) in
        let ns =
          Lib_Sequence.createi (Prims.of_int (4))
            (fun i ->
               let n1 =
                 Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                   Lib_IntTypes.SEC
                   (Obj.magic
                      (Lib_Sequence.sub (Prims.of_int (16)) n
                         (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
               FStar_UInt32.uint_to_t n1) in
        let st1 =
          Lib_Sequence.upd (Prims.of_int (16)) st Prims.int_zero
            (FStar_UInt32.uint_to_t (Prims.parse_int "0x61707865")) in
        let st2 =
          Lib_Sequence.update_sub (Prims.of_int (16)) st1 Prims.int_one
            (Prims.of_int (4))
            (Lib_Sequence.slice (Prims.of_int (8)) ks Prims.int_zero
               (Prims.of_int (4))) in
        let st3 =
          Lib_Sequence.upd (Prims.of_int (16)) st2 (Prims.of_int (5))
            (FStar_UInt32.uint_to_t (Prims.parse_int "0x3320646e")) in
        let st4 =
          Lib_Sequence.update_sub (Prims.of_int (16)) st3 (Prims.of_int (6))
            (Prims.of_int (4)) ns in
        let st5 =
          Lib_Sequence.upd (Prims.of_int (16)) st4 (Prims.of_int (10))
            (FStar_UInt32.uint_to_t (Prims.parse_int "0x79622d32")) in
        let st6 =
          Lib_Sequence.update_sub (Prims.of_int (16)) st5 (Prims.of_int (11))
            (Prims.of_int (4))
            (Lib_Sequence.slice (Prims.of_int (8)) ks (Prims.of_int (4))
               (Prims.of_int (8))) in
        let st7 =
          Lib_Sequence.upd (Prims.of_int (16)) st6 (Prims.of_int (15))
            (FStar_UInt32.uint_to_t (Prims.parse_int "0x6b206574")) in
        st7
let (hsalsa20_init : key -> xnonce -> state) =
  fun k ->
    fun n ->
      let st =
        Lib_Sequence.create (Prims.of_int (16))
          (FStar_UInt32.uint_to_t Prims.int_zero) in
      let st1 = xsetup k n st in st1
let (hsalsa20 : key -> xnonce -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun k ->
    fun n ->
      let st = hsalsa20_init k n in
      let st1 = rounds st in
      let res =
        Lib_Sequence.of_list
          [Lib_Sequence.index (Prims.of_int (16)) st1 Prims.int_zero;
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (5));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (10));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (15));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (6));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (7));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (8));
          Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (9))] in
      let uu___ =
        Lib_Sequence.generate_blocks (Prims.of_int (4))
          (FStar_List_Tot_Base.length
             [Lib_Sequence.index (Prims.of_int (16)) st1 Prims.int_zero;
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (5));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (10));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (15));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (6));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (7));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (8));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (9))])
          (FStar_List_Tot_Base.length
             [Lib_Sequence.index (Prims.of_int (16)) st1 Prims.int_zero;
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (5));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (10));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (15));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (6));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (7));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (8));
             Lib_Sequence.index (Prims.of_int (16)) st1 (Prims.of_int (9))])
          ()
          (fun uu___2 ->
             fun uu___1 ->
               (Obj.magic
                  (Lib_ByteSequence.uints_to_bytes_le_inner Lib_IntTypes.U32
                     Lib_IntTypes.SEC
                     (FStar_List_Tot_Base.length
                        [Lib_Sequence.index (Prims.of_int (16)) st1
                           Prims.int_zero;
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (5));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (10));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (15));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (6));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (7));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (8));
                        Lib_Sequence.index (Prims.of_int (16)) st1
                          (Prims.of_int (9))]) (Obj.magic res))) uu___2
                 uu___1) (Obj.repr ()) in
      match uu___ with | (uu___1, o) -> o
let (salsa20_key_block : state -> block) =
  fun st ->
    let st' = salsa20_core Prims.int_zero st in
    let uu___ =
      Lib_Sequence.generate_blocks (Prims.of_int (4)) (Prims.of_int (16))
        (Prims.of_int (16)) ()
        (fun uu___2 ->
           fun uu___1 ->
             (Obj.magic
                (Lib_ByteSequence.uints_to_bytes_le_inner Lib_IntTypes.U32
                   Lib_IntTypes.SEC (Prims.of_int (16)) (Obj.magic st')))
               uu___2 uu___1) (Obj.repr ()) in
    match uu___ with | (uu___1, o) -> o
let (salsa20_key_block0 : key -> nonce -> block) =
  fun k ->
    fun n -> let st = salsa20_init k n Prims.int_zero in salsa20_key_block st
let (xor_block : state -> block -> block) =
  fun k ->
    fun b ->
      let ib =
        Lib_Sequence.createi (Prims.of_int (16))
          (fun i ->
             let n =
               Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC
                 (Obj.magic
                    (Lib_Sequence.sub (Prims.of_int (64)) b
                       (i * (Prims.of_int (4))) (Prims.of_int (4)))) in
             FStar_UInt32.uint_to_t n) in
      let ob =
        Lib_Sequence.map2 (Prims.of_int (16))
          (fun a -> fun b1 -> FStar_UInt32.logxor a b1) ib k in
      let uu___ =
        Lib_Sequence.generate_blocks (Prims.of_int (4)) (Prims.of_int (16))
          (Prims.of_int (16)) ()
          (fun uu___2 ->
             fun uu___1 ->
               (Obj.magic
                  (Lib_ByteSequence.uints_to_bytes_le_inner Lib_IntTypes.U32
                     Lib_IntTypes.SEC (Prims.of_int (16)) (Obj.magic ob)))
                 uu___2 uu___1) (Obj.repr ()) in
      match uu___ with | (uu___1, o) -> o
let (salsa20_encrypt_block : state -> counter -> block -> block) =
  fun st0 ->
    fun incr -> fun b -> let k = salsa20_core incr st0 in xor_block k b
let (salsa20_encrypt_last :
  state ->
    counter ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun st0 ->
    fun incr ->
      fun len ->
        fun b ->
          let plain =
            Lib_Sequence.create size_block
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let plain1 =
            Lib_Sequence.update_sub size_block plain Prims.int_zero
              (Lib_Sequence.length b) b in
          let cipher = salsa20_encrypt_block st0 incr plain1 in
          Lib_Sequence.sub size_block cipher Prims.int_zero len
let (salsa20_update :
  state -> FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun ctx ->
    fun msg ->
      let cipher = msg in
      Lib_Sequence.map_blocks size_block cipher (salsa20_encrypt_block ctx)
        (salsa20_encrypt_last ctx)
let (salsa20_encrypt_bytes :
  key ->
    nonce ->
      counter ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun key1 ->
    fun nonce1 ->
      fun ctr0 ->
        fun msg ->
          let st0 = salsa20_init key1 nonce1 ctr0 in salsa20_update st0 msg
let (salsa20_decrypt_bytes :
  key ->
    nonce ->
      counter ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun key1 ->
    fun nonce1 ->
      fun ctr0 ->
        fun cipher ->
          let st0 = salsa20_init key1 nonce1 ctr0 in
          salsa20_update st0 cipher