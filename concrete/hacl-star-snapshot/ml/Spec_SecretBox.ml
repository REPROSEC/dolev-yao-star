open Prims
let (size_key : Prims.int) = (Prims.of_int (32))
let (size_nonce : Prims.int) = (Prims.of_int (24))
let (size_block : Prims.int) = (Prims.of_int (64))
let (size_tag : Prims.int) = (Prims.of_int (16))
type key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type aekey = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type nonce = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type tag = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (secretbox_init : key -> nonce -> (key * aekey)) =
  fun k ->
    fun n ->
      let n0 =
        Lib_Sequence.sub size_nonce n Prims.int_zero (Prims.of_int (16)) in
      let n1 =
        Lib_Sequence.sub size_nonce n (Prims.of_int (16)) (Prims.of_int (8)) in
      let subkey = Spec_Salsa20.hsalsa20 k n0 in
      let aekey1 = Spec_Salsa20.salsa20_key_block0 subkey n1 in
      (subkey, aekey1)
let (get_len0 : Prims.nat -> Prims.nat) =
  fun len -> if len <= (Prims.of_int (32)) then len else (Prims.of_int (32))
let (secretbox_detached :
  key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        (tag * FStar_UInt8.t Lib_Sequence.seq))
  =
  fun k ->
    fun n ->
      fun m ->
        let uu___ = secretbox_init k n in
        match uu___ with
        | (subkey, aekey1) ->
            let n1 =
              Lib_Sequence.sub size_nonce n (Prims.of_int (16))
                (Prims.of_int (8)) in
            let mkey =
              Lib_Sequence.sub (size_key + size_key) aekey1 Prims.int_zero
                (Prims.of_int (32)) in
            let ekey0 =
              Lib_Sequence.sub (size_key + size_key) aekey1
                (Prims.of_int (32)) (Prims.of_int (32)) in
            let mlen0 = get_len0 (Lib_Sequence.length m) in
            let m0 = FStar_Seq_Base.slice m Prims.int_zero mlen0 in
            let m1 = FStar_Seq_Base.slice m mlen0 (Lib_Sequence.length m) in
            let block0 =
              Lib_Sequence.create (Prims.of_int (32))
                (FStar_UInt8.uint_to_t Prims.int_zero) in
            let block01 =
              Lib_Sequence.update_sub (Prims.of_int (32)) block0
                Prims.int_zero mlen0 m0 in
            let block02 =
              Lib_Sequence.map2 (Prims.of_int (32))
                (fun a -> fun b -> FStar_UInt8.logxor a b) block01 ekey0 in
            let c0 =
              Lib_Sequence.sub (Prims.of_int (32)) block02 Prims.int_zero
                mlen0 in
            let c1 =
              Spec_Salsa20.salsa20_encrypt_bytes subkey n1 Prims.int_one m1 in
            let c = FStar_Seq_Base.append c0 c1 in
            let tg = Spec_Poly1305.poly1305_mac c mkey in (tg, c)
let (secretbox_open_detached :
  key ->
    nonce ->
      tag ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun tg ->
        fun c ->
          let uu___ = secretbox_init k n in
          match uu___ with
          | (subkey, aekey1) ->
              let n1 =
                Lib_Sequence.sub size_nonce n (Prims.of_int (16))
                  (Prims.of_int (8)) in
              let mkey =
                Lib_Sequence.sub (size_key + size_key) aekey1 Prims.int_zero
                  (Prims.of_int (32)) in
              let ekey0 =
                Lib_Sequence.sub (size_key + size_key) aekey1
                  (Prims.of_int (32)) (Prims.of_int (32)) in
              let tg' = Spec_Poly1305.poly1305_mac c mkey in
              if
                let res =
                  Obj.magic
                    (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8 size_tag
                       size_tag (Obj.magic tg) (Obj.magic tg') size_tag) in
                res = (FStar_UInt8.uint_to_t (Prims.of_int (255)))
              then
                let clen0 = get_len0 (Lib_Sequence.length c) in
                let c0 = FStar_Seq_Base.slice c Prims.int_zero clen0 in
                let c1 = FStar_Seq_Base.slice c clen0 (Lib_Sequence.length c) in
                let block0 =
                  Lib_Sequence.create (Prims.of_int (32))
                    (FStar_UInt8.uint_to_t Prims.int_zero) in
                let block01 =
                  Lib_Sequence.update_sub (Prims.of_int (32)) block0
                    Prims.int_zero clen0 c0 in
                let block02 =
                  Lib_Sequence.map2 (Prims.of_int (32))
                    (fun a -> fun b -> FStar_UInt8.logxor a b) block01 ekey0 in
                let m0 =
                  Lib_Sequence.sub (Prims.of_int (32)) block02 Prims.int_zero
                    clen0 in
                let m1 =
                  Spec_Salsa20.salsa20_decrypt_bytes subkey n1 Prims.int_one
                    c1 in
                let m = FStar_Seq_Base.append m0 m1 in
                FStar_Pervasives_Native.Some m
              else FStar_Pervasives_Native.None
let (secretbox_easy :
  key ->
    nonce -> FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun k ->
    fun n ->
      fun m ->
        let uu___ = secretbox_detached k n m in
        match uu___ with | (tg, c) -> FStar_Seq_Base.append tg c
let (secretbox_open_easy :
  key ->
    nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun c ->
        let tg = FStar_Seq_Base.slice c Prims.int_zero size_tag in
        let e = FStar_Seq_Base.slice c size_tag (Lib_Sequence.length c) in
        secretbox_open_detached k n tg e