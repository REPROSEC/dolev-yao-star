open Prims

type cipher_alg =
  | AES128 
  | AES256 
  | CHACHA20 
let (uu___is_AES128 : cipher_alg -> Prims.bool) =
  fun projectee -> match projectee with | AES128 -> true | uu___ -> false
let (uu___is_AES256 : cipher_alg -> Prims.bool) =
  fun projectee -> match projectee with | AES256 -> true | uu___ -> false
let (uu___is_CHACHA20 : cipher_alg -> Prims.bool) =
  fun projectee -> match projectee with | CHACHA20 -> true | uu___ -> false
let (aes_alg_of_alg : cipher_alg -> Spec_AES.variant) =
  fun a ->
    match a with | AES128 -> Spec_AES.AES128 | AES256 -> Spec_AES.AES256
let (key_length : cipher_alg -> Prims.nat) =
  fun a ->
    match a with
    | AES128 -> Spec_AES.key_size (aes_alg_of_alg a)
    | AES256 -> Spec_AES.key_size (aes_alg_of_alg a)
    | CHACHA20 -> Spec_Chacha20.size_key
type 'a key = Obj.t
let (block_length : cipher_alg -> Prims.int) =
  fun a ->
    match a with
    | AES128 -> (Prims.of_int (16))
    | AES256 -> (Prims.of_int (16))
    | CHACHA20 -> (Prims.of_int (64))
type 'a block = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type ('a, 'nulen) nonce_bound = Obj.t
type 'a nonce = FStar_UInt8.t Lib_Sequence.seq
type ctr = Prims.nat
let (aes_ctr_block_add_counter :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun block1 ->
         fun incr ->
           let n =
             Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8
               Lib_IntTypes.SEC (Obj.magic block1) in
           let n' = (n + incr) mod (Prims.pow2 (Prims.of_int (128))) in
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Prims.of_int (16)) n')) uu___1 uu___
type 'a xkey = Obj.t
let (expand : cipher_alg -> Obj.t -> Obj.t) =
  fun a ->
    fun k ->
      match a with
      | AES128 ->
          Obj.repr
            (Spec_AES.aes_key_expansion (aes_alg_of_alg a) (Obj.magic k))
      | AES256 ->
          Obj.repr
            (Spec_AES.aes_key_expansion (aes_alg_of_alg a) (Obj.magic k))
      | CHACHA20 -> Obj.repr k
let (ctr_block : cipher_alg -> Obj.t -> unit nonce -> ctr -> unit block) =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun a ->
             fun k ->
               fun iv ->
                 fun c ->
                   let k1 = expand a k in
                   match a with
                   | AES128 ->
                       Obj.magic
                         (Obj.repr
                            (let block1 =
                               Lib_Sequence.create (Prims.of_int (16))
                                 (FStar_UInt8.uint_to_t Prims.int_zero) in
                             let block2 =
                               Lib_LoopCombinators.repeati
                                 (Lib_Sequence.length iv)
                                 (fun i ->
                                    fun b ->
                                      Lib_Sequence.upd (Prims.of_int (16)) b
                                        i (FStar_Seq_Base.index iv i)) block1 in
                             let block3 = aes_ctr_block_add_counter block2 c in
                             Spec_AES.aes_encrypt_block (aes_alg_of_alg a)
                               (Obj.magic k1) (Obj.magic block3)))
                   | AES256 ->
                       Obj.magic
                         (Obj.repr
                            (let block1 =
                               Lib_Sequence.create (Prims.of_int (16))
                                 (FStar_UInt8.uint_to_t Prims.int_zero) in
                             let block2 =
                               Lib_LoopCombinators.repeati
                                 (Lib_Sequence.length iv)
                                 (fun i ->
                                    fun b ->
                                      Lib_Sequence.upd (Prims.of_int (16)) b
                                        i (FStar_Seq_Base.index iv i)) block1 in
                             let block3 = aes_ctr_block_add_counter block2 c in
                             Spec_AES.aes_encrypt_block (aes_alg_of_alg a)
                               (Obj.magic k1) (Obj.magic block3)))
                   | CHACHA20 ->
                       Obj.magic
                         (Obj.repr
                            (let block1 =
                               Spec_Chacha20.chacha20_init (Obj.magic k1) iv
                                 c in
                             let block' = Spec_Chacha20.rounds block1 in
                             let uu___ =
                               Lib_Sequence.generate_blocks
                                 (Prims.of_int (4)) (Prims.of_int (16))
                                 (Prims.of_int (16)) ()
                                 (fun uu___2 ->
                                    fun uu___1 ->
                                      (Obj.magic
                                         (Lib_ByteSequence.uints_to_bytes_le_inner
                                            Lib_IntTypes.U32 Lib_IntTypes.SEC
                                            (Prims.of_int (16))
                                            (Obj.magic
                                               (Spec_Chacha20.sum_state
                                                  block1 block')))) uu___2
                                        uu___1) (Obj.repr ()) in
                             match uu___ with | (uu___1, o) -> o))) uu___3
            uu___2 uu___1 uu___
let (ctr_stream :
  cipher_alg ->
    Obj.t -> unit nonce -> Prims.nat -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun a ->
    fun k ->
      fun iv ->
        fun len ->
          let n_blocks =
            if (len mod (block_length a)) = Prims.int_zero
            then len / (block_length a)
            else (len / (block_length a)) + Prims.int_one in
          let uu___ =
            Obj.magic
              (Lib_Sequence.generate_blocks (block_length a)
                 ((Prims.pow2 (Prims.of_int (32))) - Prims.int_one) n_blocks
                 ()
                 (fun uu___2 ->
                    fun uu___1 ->
                      (fun i ->
                         fun uu___1 ->
                           let uu___1 = Obj.magic uu___1 in
                           Obj.magic ((), (ctr_block a k iv i))) uu___2
                        uu___1) (Obj.repr ())) in
          match uu___ with
          | ((), blocks) -> FStar_Seq_Base.slice blocks Prims.int_zero len