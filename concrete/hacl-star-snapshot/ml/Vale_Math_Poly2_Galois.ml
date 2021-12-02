open Prims
let (to_poly : Spec_GaloisField.field -> Obj.t -> Vale_Math_Poly2_s.poly) =
  fun f ->
    fun e ->
      let uu___ = f in
      match uu___ with
      | Spec_GaloisField.GF (t, irred) ->
          let n = Lib_IntTypes.bits t in
          Vale_Math_Poly2_s.reverse
            (Vale_Math_Poly2_s.of_seq
               (FStar_UInt.to_vec n
                  (Lib_IntTypes.v (Spec_GaloisField.__proj__GF__item__t f)
                     Lib_IntTypes.SEC e))) (n - Prims.int_one)
let (to_felem : Spec_GaloisField.field -> Vale_Math_Poly2_s.poly -> Obj.t) =
  fun f ->
    fun p ->
      let uu___ = f in
      match uu___ with
      | Spec_GaloisField.GF (t, irred) ->
          let n = Lib_IntTypes.bits t in
          let p1 = Vale_Math_Poly2_s.reverse p (n - Prims.int_one) in
          Lib_IntTypes_Compatibility.nat_to_uint
            (Spec_GaloisField.__proj__GF__item__t f) Lib_IntTypes.SEC
            (FStar_UInt.from_vec n (Vale_Math_Poly2_s.to_seq p1 n))
let (irred_poly : Spec_GaloisField.field -> Vale_Math_Poly2_s.poly) =
  fun f ->
    let uu___ = f in
    match uu___ with
    | Spec_GaloisField.GF (t, irred) ->
        Vale_Math_Poly2_s.add
          (Vale_Math_Poly2_s.monomial (Lib_IntTypes.bits t))
          (to_poly f irred)
let (min : Prims.int -> Prims.int -> Prims.int) = FStar_Math_Lib.min
let (max : Prims.int -> Prims.int -> Prims.int) = FStar_Math_Lib.max
let (op_Amp_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2.poly_and
let (op_Bar_Dot :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = Vale_Math_Poly2.poly_or











let (poly_length : Vale_Math_Poly2_s.poly -> Prims.nat) =
  fun p -> Prims.int_one + (Vale_Math_Poly2_s.degree p)
let (sum_of_bools :
  Prims.int -> Prims.int -> (Prims.int -> Prims.bool) -> Prims.bool) =
  Vale_Math_Poly2_Defs_s.sum_of_bools
let (mul_element_fun :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> Prims.int -> Prims.int -> Prims.bool)
  =
  fun a ->
    fun b ->
      fun k ->
        fun i ->
          (Vale_Math_Poly2_s.poly_index a i) &&
            (Vale_Math_Poly2_s.poly_index b (k - i))
let (mul_element :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Prims.int -> Prims.bool)
  =
  fun a ->
    fun b ->
      fun k ->
        Vale_Math_Poly2_Defs_s.sum_of_bools Prims.int_zero
          (k + Prims.int_one) (mul_element_fun a b k)
let (mul_def :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      let len = (poly_length a) + (poly_length b) in
      Vale_Math_Poly2_s.of_fun len (fun i -> mul_element a b i)
let rec (pmul_rec :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      fun n ->
        if n = Prims.int_zero
        then Vale_Math_Poly2_s.zero
        else
          (let n' = n - Prims.int_one in
           let p = pmul_rec a b n' in
           if Vale_Math_Poly2_s.poly_index b n'
           then Vale_Math_Poly2_s.add p (Vale_Math_Poly2_s.shift a n')
           else p)
let (pmul :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = fun a -> fun b -> pmul_rec a b (poly_length b)
let rec (mmul :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      fun m ->
        fun n ->
          if n = Prims.int_zero
          then Vale_Math_Poly2_s.zero
          else
            (let n' = n - Prims.int_one in
             let p = mmul a b m n' in
             if Vale_Math_Poly2_s.poly_index b n'
             then
               Vale_Math_Poly2_s.add p
                 (Vale_Math_Poly2_s.mod1 (Vale_Math_Poly2_s.shift a n') m)
             else p)
let (mod_bit1 :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun m ->
      if Vale_Math_Poly2_s.poly_index a (Vale_Math_Poly2_s.degree m)
      then Vale_Math_Poly2_s.add a m
      else a
let rec (smul_rec :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly ->
        Prims.nat ->
          (Vale_Math_Poly2_s.poly * Vale_Math_Poly2_s.poly *
            Vale_Math_Poly2_s.poly))
  =
  fun a ->
    fun b ->
      fun m ->
        fun n ->
          if n = Prims.int_zero
          then (Vale_Math_Poly2_s.zero, a, b)
          else
            (let uu___1 = smul_rec a b m (n - Prims.int_one) in
             match uu___1 with
             | (p, a1, b1) ->
                 let p1 =
                   Vale_Math_Poly2_s.add p
                     (if Vale_Math_Poly2_s.poly_index b1 Prims.int_zero
                      then a1
                      else Vale_Math_Poly2_s.zero) in
                 let a2 =
                   mod_bit1 (Vale_Math_Poly2_s.shift a1 Prims.int_one) m in
                 let b2 = Vale_Math_Poly2_s.shift b1 (Prims.of_int (-1)) in
                 (p1, a2, b2))
let (smul :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      fun m ->
        fun n ->
          let uu___ = smul_rec a b m n in
          match uu___ with | (p, uu___1, uu___2) -> p
let (mod_shift1 :
  Vale_Math_Poly2_s.poly ->
    Vale_Math_Poly2_s.poly -> Prims.nat -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun irred ->
      fun k ->
        let s =
          Vale_Math_Poly2_s.mod1 (Vale_Math_Poly2_s.shift a Prims.int_one)
            (Vale_Math_Poly2_s.monomial k) in
        Vale_Math_Poly2_s.add s
          (if Vale_Math_Poly2_s.poly_index a (k - Prims.int_one)
           then irred
           else Vale_Math_Poly2_s.zero)
type 'f fmul_t = (Obj.t * Obj.t * Obj.t)
let (fmul_iter :
  Spec_GaloisField.field -> Prims.nat -> unit fmul_t -> unit fmul_t) =
  fun f ->
    fun i ->
      fun uu___ ->
        match uu___ with
        | (p, a, b) ->
            let b0 =
              Lib_IntTypes.eq_mask (Spec_GaloisField.__proj__GF__item__t f)
                (Lib_IntTypes.logand (Spec_GaloisField.__proj__GF__item__t f)
                   Lib_IntTypes.SEC b (Spec_GaloisField.one f))
                (Spec_GaloisField.one f) in
            let p1 =
              Lib_IntTypes.logxor (Spec_GaloisField.__proj__GF__item__t f)
                Lib_IntTypes.SEC p
                (Lib_IntTypes.logand (Spec_GaloisField.__proj__GF__item__t f)
                   Lib_IntTypes.SEC b0 a) in
            let carry_mask =
              Lib_IntTypes.eq_mask (Spec_GaloisField.__proj__GF__item__t f)
                (Lib_IntTypes.shift_right
                   (Spec_GaloisField.__proj__GF__item__t f) Lib_IntTypes.SEC
                   a
                   (FStar_UInt32.uint_to_t
                      ((Lib_IntTypes.bits
                          (Spec_GaloisField.__proj__GF__item__t f))
                         - Prims.int_one))) (Spec_GaloisField.one f) in
            let a1 =
              Lib_IntTypes.shift_left
                (Spec_GaloisField.__proj__GF__item__t f) Lib_IntTypes.SEC a
                (FStar_UInt32.uint_to_t Prims.int_one) in
            let a2 =
              Lib_IntTypes.logxor (Spec_GaloisField.__proj__GF__item__t f)
                Lib_IntTypes.SEC a1
                (Lib_IntTypes.logand (Spec_GaloisField.__proj__GF__item__t f)
                   Lib_IntTypes.SEC carry_mask
                   (Spec_GaloisField.__proj__GF__item__irred f)) in
            let b1 =
              Lib_IntTypes.shift_right
                (Spec_GaloisField.__proj__GF__item__t f) Lib_IntTypes.SEC b
                (FStar_UInt32.uint_to_t Prims.int_one) in
            (p1, a2, b1)
let rec (gmul_rec :
  Spec_GaloisField.field -> Obj.t -> Obj.t -> Prims.nat -> unit fmul_t) =
  fun f ->
    fun a ->
      fun b ->
        fun n ->
          if n = Prims.int_zero
          then ((Spec_GaloisField.zero f), a, b)
          else
            (let uu___1 = gmul_rec f a b (n - Prims.int_one) in
             match uu___1 with
             | (p, a1, b1) -> fmul_iter f Prims.int_zero (p, a1, b1))
let (gmul : Spec_GaloisField.field -> Obj.t -> Obj.t -> Obj.t) =
  fun f ->
    fun a ->
      fun b ->
        let uu___ =
          gmul_rec f a b
            (Lib_IntTypes.bits (Spec_GaloisField.__proj__GF__item__t f)) in
        match uu___ with | (p, uu___1, uu___2) -> p
let (fmul : Spec_GaloisField.field -> Obj.t -> Obj.t -> Obj.t) =
  fun f ->
    fun a ->
      fun b ->
        let one = Spec_GaloisField.one f in
        let zero = Spec_GaloisField.zero f in
        let uu___ =
          Lib_LoopCombinators.repeati
            ((Lib_IntTypes.bits (Spec_GaloisField.__proj__GF__item__t f)) -
               Prims.int_one) (fmul_iter f) (zero, a, b) in
        match uu___ with
        | (p, a1, b1) ->
            let b0 =
              Lib_IntTypes.eq_mask (Spec_GaloisField.__proj__GF__item__t f)
                (Lib_IntTypes.logand (Spec_GaloisField.__proj__GF__item__t f)
                   Lib_IntTypes.SEC b1 (Spec_GaloisField.one f))
                (Spec_GaloisField.one f) in
            let p1 =
              Lib_IntTypes.logxor (Spec_GaloisField.__proj__GF__item__t f)
                Lib_IntTypes.SEC p
                (Lib_IntTypes.logand (Spec_GaloisField.__proj__GF__item__t f)
                   Lib_IntTypes.SEC b0 a1) in
            p1
let (d : Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_Defs_s.poly) =
  fun uu___ -> (fun a -> Obj.magic a) uu___




















