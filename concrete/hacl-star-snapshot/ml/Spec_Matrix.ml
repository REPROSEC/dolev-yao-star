open Prims


type elem = FStar_UInt16.t
type ('n1, 'n2) matrix = (FStar_UInt16.t, unit) Lib_Sequence.lseq
let (create :
  Prims.nat -> Prims.nat -> (FStar_UInt16.t, unit) Lib_Sequence.lseq) =
  fun n1 ->
    fun n2 ->
      Lib_Sequence.create (n1 * n2) (FStar_UInt16.uint_to_t Prims.int_zero)
let (mget :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> Prims.nat -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun a ->
        fun i -> fun j -> Lib_Sequence.index (n1 * n2) a ((i * n2) + j)
let (op_Array_Access :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (Prims.nat * Prims.nat) -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun m -> fun uu___ -> match uu___ with | (i, j) -> mget n1 n2 m i j
let (mset :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          Prims.nat ->
            FStar_UInt16.t -> (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun a ->
        fun i ->
          fun j -> fun v -> Lib_Sequence.upd (n1 * n2) a ((i * n2) + j) v
let (op_Array_Assignment :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (Prims.nat * Prims.nat) ->
          FStar_UInt16.t -> (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun m ->
        fun uu___ -> fun x -> match uu___ with | (i, j) -> mset n1 n2 m i j x

let (map :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t -> FStar_UInt16.t) ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun f ->
        fun a ->
          let c = create n1 n2 in
          Lib_LoopCombinators.repeati_inductive n1 ()
            (fun i ->
               fun c1 ->
                 Lib_LoopCombinators.repeati_inductive n2 ()
                   (fun j ->
                      fun c' -> mset n1 n2 c' i j (f (mget n1 n2 a i j))) c1)
            c
let (mod_pow2_felem : Prims.pos -> FStar_UInt16.t -> FStar_UInt16.t) =
  fun logq ->
    fun a ->
      FStar_UInt16.logand a
        (FStar_UInt16.sub_mod
           (FStar_UInt16.shift_left (FStar_UInt16.uint_to_t Prims.int_one)
              (FStar_UInt32.uint_to_t logq))
           (FStar_UInt16.uint_to_t Prims.int_one))
let (mod_pow2 :
  Prims.nat ->
    Prims.nat ->
      Prims.pos ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun logq ->
        fun a ->
          if logq < (Prims.of_int (16))
          then map n1 n2 (mod_pow2_felem logq) a
          else a
let (map2 :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t -> FStar_UInt16.t -> FStar_UInt16.t) ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun f ->
        fun a ->
          fun b ->
            let c = create n1 n2 in
            Lib_LoopCombinators.repeati_inductive n1 ()
              (fun i ->
                 fun c1 ->
                   Lib_LoopCombinators.repeati_inductive n2 ()
                     (fun j ->
                        fun c' ->
                          mset n1 n2 c' i j
                            (f (mget n1 n2 a i j) (mget n1 n2 b i j))) c1) c
let (add :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun a ->
        fun b ->
          map2 n1 n2 (fun a1 -> fun b1 -> FStar_UInt16.add_mod a1 b1) a b
let (sub :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun a ->
        fun b ->
          map2 n1 n2 (fun a1 -> fun b1 -> FStar_UInt16.sub_mod a1 b1) a b



let (mul_inner :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            Prims.nat -> Prims.nat -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun n3 ->
        fun a ->
          fun b ->
            fun i ->
              fun k ->
                let f l =
                  FStar_UInt16.mul_mod (mget n1 n2 a i l) (mget n2 n3 b l k) in
                let res =
                  Lib_LoopCombinators.repeati_inductive n2 ()
                    (fun j ->
                       fun res1 ->
                         FStar_UInt16.add_mod res1
                           (FStar_UInt16.mul_mod (mget n1 n2 a i j)
                              (mget n2 n3 b j k)))
                    (FStar_UInt16.uint_to_t Prims.int_zero) in
                res
let (mul :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun n3 ->
        fun a ->
          fun b ->
            let c = create n1 n3 in
            Lib_LoopCombinators.repeati_inductive n1 ()
              (fun i ->
                 fun c1 ->
                   Lib_LoopCombinators.repeati_inductive n3 ()
                     (fun k ->
                        fun c0 ->
                          mset n1 n3 c0 i k (mul_inner n1 n2 n3 a b i k)) c1)
              c
let (mget_s :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> Prims.nat -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun a ->
        fun i -> fun j -> Lib_Sequence.index (n1 * n2) a ((j * n1) + i)
let (mul_inner_s :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            Prims.nat -> Prims.nat -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun n3 ->
        fun a ->
          fun b ->
            fun i ->
              fun k ->
                let f l =
                  FStar_UInt16.mul_mod (mget n1 n2 a i l)
                    (mget_s n2 n3 b l k) in
                let res =
                  Lib_LoopCombinators.repeati_inductive n2 ()
                    (fun j ->
                       fun res1 ->
                         FStar_UInt16.add_mod res1
                           (FStar_UInt16.mul_mod (mget n1 n2 a i j)
                              (mget_s n2 n3 b j k)))
                    (FStar_UInt16.uint_to_t Prims.int_zero) in
                res
let (mul_s :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun n3 ->
        fun a ->
          fun b ->
            let c = create n1 n3 in
            Lib_LoopCombinators.repeati_inductive n1 ()
              (fun i ->
                 fun c1 ->
                   Lib_LoopCombinators.repeati_inductive n3 ()
                     (fun k ->
                        fun c0 ->
                          mset n1 n3 c0 i k (mul_inner_s n1 n2 n3 a b i k))
                     c1) c
let (matrix_eq :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq -> FStar_UInt16.t)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun n1 ->
             fun n2 ->
               fun a ->
                 fun b ->
                   Obj.magic
                     (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U16 (
                        n1 * n2) (n1 * n2) (Obj.magic a) (Obj.magic b)
                        (n1 * n2))) uu___3 uu___2 uu___1 uu___
let (matrix_to_lbytes_f :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun n1 ->
             fun n2 ->
               fun m ->
                 fun i ->
                   Obj.magic
                     (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                        Lib_IntTypes.SEC (Prims.of_int (2))
                        (Lib_IntTypes.v Lib_IntTypes.U16 Lib_IntTypes.SEC
                           (Obj.magic (Lib_Sequence.index (n1 * n2) m i)))))
            uu___3 uu___2 uu___1 uu___
let (matrix_to_lbytes :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun m ->
        Lib_Sequence.generate_blocks_simple (Prims.of_int (2)) (n1 * n2)
          (n1 * n2) (matrix_to_lbytes_f n1 n2 m)
let (matrix_from_lbytes_f :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat -> FStar_UInt16.t)
  =
  fun n1 ->
    fun n2 ->
      fun b ->
        fun i ->
          let n =
            Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
              Lib_IntTypes.SEC
              (Obj.magic
                 (Lib_Sequence.sub (((Prims.of_int (2)) * n1) * n2) b
                    ((Prims.of_int (2)) * i) (Prims.of_int (2)))) in
          FStar_UInt16.uint_to_t n
let (matrix_from_lbytes :
  Prims.nat ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun n1 ->
    fun n2 ->
      fun b -> Lib_Sequence.createi (n1 * n2) (matrix_from_lbytes_f n1 n2 b)