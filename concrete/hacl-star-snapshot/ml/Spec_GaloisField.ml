open Prims
type field =
  | GF of Lib_IntTypes.inttype * Obj.t 
let (uu___is_GF : field -> Prims.bool) = fun projectee -> true
let (__proj__GF__item__t : field -> Lib_IntTypes.inttype) =
  fun projectee -> match projectee with | GF (t, irred) -> t
let (__proj__GF__item__irred : field -> Obj.t) =
  fun projectee -> match projectee with | GF (t, irred) -> irred
let (gf : Lib_IntTypes.inttype -> Obj.t -> field) =
  fun t -> fun irred -> GF (t, irred)
type 'f felem = Obj.t
let (to_felem : field -> Prims.nat -> Obj.t) =
  fun f ->
    fun n -> Lib_IntTypes.mk_int (__proj__GF__item__t f) Lib_IntTypes.SEC n
let (from_felem : field -> Obj.t -> Prims.nat) =
  fun f -> fun e -> Lib_IntTypes.v (__proj__GF__item__t f) Lib_IntTypes.SEC e
let (zero : field -> Obj.t) = fun f -> to_felem f Prims.int_zero
let (one : field -> Obj.t) = fun f -> to_felem f Prims.int_one
let (load_felem_be :
  field -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t) =
  fun f ->
    fun b ->
      let n =
        Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8 Lib_IntTypes.SEC
          (Obj.magic b) in
      Lib_IntTypes.mk_int (__proj__GF__item__t f) Lib_IntTypes.SEC n
let (store_felem_be :
  field -> Obj.t -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun uu___1 ->
    fun uu___ ->
      (fun f ->
         fun e ->
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                Lib_IntTypes.SEC
                (Lib_IntTypes.numbytes (__proj__GF__item__t f))
                (Lib_IntTypes.v (__proj__GF__item__t f) Lib_IntTypes.SEC e)))
        uu___1 uu___
let (reverse : Lib_IntTypes.inttype -> Obj.t -> Obj.t) =
  fun t ->
    fun a ->
      Lib_LoopCombinators.repeati (Lib_IntTypes.bits t)
        (fun i ->
           fun u ->
             Lib_IntTypes.logor t Lib_IntTypes.SEC u
               (Lib_IntTypes.shift_left t Lib_IntTypes.SEC
                  (Lib_IntTypes.logand t Lib_IntTypes.SEC
                     (Lib_IntTypes.shift_right t Lib_IntTypes.SEC a
                        (FStar_UInt32.uint_to_t i))
                     (Lib_IntTypes.mk_int t Lib_IntTypes.SEC Prims.int_one))
                  (FStar_UInt32.uint_to_t
                     (((Lib_IntTypes.bits t) - Prims.int_one) - i))))
        (Lib_IntTypes.mk_int t Lib_IntTypes.SEC Prims.int_zero)
let (load_felem_le :
  field -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t) =
  fun f -> fun b -> reverse (__proj__GF__item__t f) (load_felem_be f b)
let (store_felem_le :
  field -> Obj.t -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun f -> fun e -> store_felem_be f (reverse (__proj__GF__item__t f) e)
let (fadd : field -> Obj.t -> Obj.t -> Obj.t) =
  fun f ->
    fun a ->
      fun b ->
        Lib_IntTypes.logxor (__proj__GF__item__t f) Lib_IntTypes.SEC a b
let (op_Plus_At : field -> Obj.t -> Obj.t -> Obj.t) =
  fun f -> fun e1 -> fun e2 -> fadd f e1 e2
let (fmul : field -> Obj.t -> Obj.t -> Obj.t) =
  fun f ->
    fun a ->
      fun b ->
        let one1 = one f in
        let zero1 = zero f in
        let uu___ =
          Lib_LoopCombinators.repeati
            ((Lib_IntTypes.bits (__proj__GF__item__t f)) - Prims.int_one)
            (fun i ->
               fun uu___1 ->
                 match uu___1 with
                 | (p, a1, b1) ->
                     let b0 =
                       Lib_IntTypes.eq_mask (__proj__GF__item__t f)
                         (Lib_IntTypes.logand (__proj__GF__item__t f)
                            Lib_IntTypes.SEC b1 one1) one1 in
                     let p1 =
                       Lib_IntTypes.logxor (__proj__GF__item__t f)
                         Lib_IntTypes.SEC p
                         (Lib_IntTypes.logand (__proj__GF__item__t f)
                            Lib_IntTypes.SEC b0 a1) in
                     let carry_mask =
                       Lib_IntTypes.eq_mask (__proj__GF__item__t f)
                         (Lib_IntTypes.shift_right (__proj__GF__item__t f)
                            Lib_IntTypes.SEC a1
                            (FStar_UInt32.uint_to_t
                               ((Lib_IntTypes.bits (__proj__GF__item__t f)) -
                                  Prims.int_one))) one1 in
                     let a2 =
                       Lib_IntTypes.shift_left (__proj__GF__item__t f)
                         Lib_IntTypes.SEC a1
                         (FStar_UInt32.uint_to_t Prims.int_one) in
                     let a3 =
                       Lib_IntTypes.logxor (__proj__GF__item__t f)
                         Lib_IntTypes.SEC a2
                         (Lib_IntTypes.logand (__proj__GF__item__t f)
                            Lib_IntTypes.SEC carry_mask
                            (__proj__GF__item__irred f)) in
                     let b2 =
                       Lib_IntTypes.shift_right (__proj__GF__item__t f)
                         Lib_IntTypes.SEC b1
                         (FStar_UInt32.uint_to_t Prims.int_one) in
                     (p1, a3, b2)) (zero1, a, b) in
        match uu___ with
        | (p, a1, b1) ->
            let b0 =
              Lib_IntTypes.eq_mask (__proj__GF__item__t f)
                (Lib_IntTypes.logand (__proj__GF__item__t f) Lib_IntTypes.SEC
                   b1 one1) one1 in
            let p1 =
              Lib_IntTypes.logxor (__proj__GF__item__t f) Lib_IntTypes.SEC p
                (Lib_IntTypes.logand (__proj__GF__item__t f) Lib_IntTypes.SEC
                   b0 a1) in
            p1
let (op_Star_At : field -> Obj.t -> Obj.t -> Obj.t) =
  fun f -> fun e1 -> fun e2 -> fmul f e1 e2
let (get_ith_bit : field -> Obj.t -> Prims.nat -> Obj.t) =
  fun f ->
    fun x ->
      fun i ->
        Lib_IntTypes.logand (__proj__GF__item__t f) Lib_IntTypes.SEC
          (Lib_IntTypes.shift_right (__proj__GF__item__t f) Lib_IntTypes.SEC
             x
             (FStar_UInt32.uint_to_t
                (((Lib_IntTypes.bits (__proj__GF__item__t f)) - Prims.int_one)
                   - i))) (one f)
let (mask_add : field -> Obj.t -> Obj.t -> Obj.t -> Prims.nat -> Obj.t) =
  fun f ->
    fun x ->
      fun y ->
        fun res ->
          fun i ->
            fadd f res
              (Lib_IntTypes.logand (__proj__GF__item__t f) Lib_IntTypes.SEC y
                 (Lib_IntTypes.eq_mask (__proj__GF__item__t f)
                    (get_ith_bit f x i) (one f)))
let (mask_shift_right_mod : field -> Obj.t -> Obj.t) =
  fun f ->
    fun y ->
      fadd f
        (Lib_IntTypes.shift_right (__proj__GF__item__t f) Lib_IntTypes.SEC y
           (FStar_UInt32.uint_to_t Prims.int_one))
        (Lib_IntTypes.logand (__proj__GF__item__t f) Lib_IntTypes.SEC
           (__proj__GF__item__irred f)
           (Lib_IntTypes.eq_mask (__proj__GF__item__t f)
              (get_ith_bit f y
                 ((Lib_IntTypes.bits (__proj__GF__item__t f)) - Prims.int_one))
              (one f)))
let (fmul_be_f :
  field -> Obj.t -> Prims.nat -> (Obj.t * Obj.t) -> (Obj.t * Obj.t)) =
  fun f ->
    fun x ->
      fun i ->
        fun uu___ ->
          match uu___ with
          | (res, y) ->
              let res1 = mask_add f x y res i in
              let y1 = mask_shift_right_mod f y in (res1, y1)
let (fmul_be : field -> Obj.t -> Obj.t -> Obj.t) =
  fun f ->
    fun x ->
      fun y ->
        let uu___ =
          Lib_LoopCombinators.repeati
            (Lib_IntTypes.bits (__proj__GF__item__t f)) (fmul_be_f f x)
            ((zero f), y) in
        match uu___ with | (res, y1) -> res
let rec (fexp : field -> Obj.t -> Prims.nat -> Obj.t) =
  fun f ->
    fun a ->
      fun x ->
        if x = Prims.int_one
        then a
        else
          if x = (Prims.of_int (2))
          then fmul f a a
          else
            (let r = fexp f a (x / (Prims.of_int (2))) in
             let r' = fmul f r r in
             if (x mod (Prims.of_int (2))) = Prims.int_zero
             then r'
             else fmul f a r')
let (op_Star_Star_At : field -> Obj.t -> Prims.nat -> Obj.t) =
  fun f -> fun e1 -> fun e2 -> fexp f e1 e2
let (finv : field -> Obj.t -> Obj.t) =
  fun f ->
    fun a ->
      fexp f a
        ((Lib_IntTypes.maxint (__proj__GF__item__t f)) - Prims.int_one)