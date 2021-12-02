open Prims
let (max : Prims.int -> Prims.int -> Prims.int) = FStar_Math_Lib.max
let (valid : Prims.bool FStar_Seq_Base.seq -> Prims.bool) =
  fun s ->
    ((FStar_Seq_Base.length s) = Prims.int_zero) ||
      (FStar_Seq_Base.index s ((FStar_Seq_Base.length s) - Prims.int_one))
type poly = Prims.bool FStar_Seq_Base.seq
let (degree : poly -> Prims.int) =
  fun p -> (FStar_Seq_Base.length p) - Prims.int_one
let (zero : Prims.bool FStar_Seq_Base.seq) =
  FStar_Seq_Base.create Prims.int_zero false
let (one : Prims.bool FStar_Seq_Base.seq) =
  FStar_Seq_Base.create Prims.int_one true
let (monomial : Prims.nat -> poly) =
  fun n -> FStar_Seq_Base.append (FStar_Seq_Base.create n false) one
let (lshift : poly -> Prims.nat -> poly) =
  fun p ->
    fun n ->
      if (FStar_Seq_Base.length p) = Prims.int_zero
      then p
      else FStar_Seq_Base.append (FStar_Seq_Base.create n false) p
let (rshift : poly -> Prims.nat -> poly) =
  fun p ->
    fun n ->
      if (FStar_Seq_Base.length p) <= n
      then zero
      else FStar_Seq_Base.slice p n (FStar_Seq_Base.length p)
let (shift : poly -> Prims.int -> poly) =
  fun p ->
    fun n -> if n >= Prims.int_zero then lshift p n else rshift p (- n)
let (poly_index : poly -> Prims.int -> Prims.bool) =
  fun p ->
    fun n ->
      if (Prims.int_zero <= n) && (n < (FStar_Seq_Base.length p))
      then FStar_Seq_Base.index p n
      else false
let (op_String_Access : poly -> Prims.int -> Prims.bool) = poly_index
let (to_seq : poly -> Prims.nat -> Prims.bool FStar_Seq_Base.seq) =
  fun p ->
    fun n ->
      if n = Prims.int_zero
      then FStar_Seq_Base.MkSeq []
      else FStar_Seq_Base.init_aux n Prims.int_zero (poly_index p)
let rec (of_seq : Prims.bool FStar_Seq_Base.seq -> poly) =
  fun s ->
    if valid s
    then s
    else
      of_seq
        (FStar_Seq_Base.slice s Prims.int_zero
           ((FStar_Seq_Base.length s) - Prims.int_one))
let (of_fun : Prims.nat -> (Prims.nat -> Prims.bool) -> poly) =
  fun len ->
    fun f ->
      of_seq
        (if len = Prims.int_zero
         then FStar_Seq_Base.MkSeq []
         else FStar_Seq_Base.init_aux len Prims.int_zero f)
let (reverse : poly -> Prims.nat -> poly) =
  fun a ->
    fun n -> of_fun (n + Prims.int_one) (fun i -> poly_index a (n - i))
let (add : poly -> poly -> poly) =
  fun a ->
    fun b ->
      let len =
        FStar_Math_Lib.max (FStar_Seq_Base.length a)
          (FStar_Seq_Base.length b) in
      of_fun len (fun i -> (poly_index a i) <> (poly_index b i))
let rec (sum_of_bools :
  Prims.int -> Prims.int -> (Prims.int -> Prims.bool) -> Prims.bool) =
  fun j ->
    fun k ->
      fun f ->
        if j >= k
        then false
        else
          (sum_of_bools j (k - Prims.int_one) f) <> (f (k - Prims.int_one))
let (mul_element_fun : poly -> poly -> Prims.int -> Prims.int -> Prims.bool)
  =
  fun a ->
    fun b -> fun k -> fun i -> (poly_index a i) && (poly_index b (k - i))
let (mul_element : poly -> poly -> Prims.int -> Prims.bool) =
  fun a ->
    fun b ->
      fun k ->
        sum_of_bools Prims.int_zero (k + Prims.int_one)
          (mul_element_fun a b k)
let (mul : poly -> poly -> poly) =
  fun a ->
    fun b ->
      let len = (FStar_Seq_Base.length a) + (FStar_Seq_Base.length b) in
      of_fun len (fun i -> mul_element a b i)
let rec (divmod : poly -> poly -> (poly * poly)) =
  fun a ->
    fun b ->
      if (FStar_Seq_Base.length a) < (FStar_Seq_Base.length b)
      then (zero, a)
      else
        (let a' =
           add a
             (shift b ((FStar_Seq_Base.length a) - (FStar_Seq_Base.length b))) in
         let uu___1 = divmod a' b in
         match uu___1 with
         | (d, m) ->
             ((add d
                 (monomial
                    ((FStar_Seq_Base.length a) - (FStar_Seq_Base.length b)))),
               m))
let (div : poly -> poly -> poly) =
  fun a -> fun b -> FStar_Pervasives_Native.fst (divmod a b)
let (mod1 : poly -> poly -> poly) =
  fun a -> fun b -> FStar_Pervasives_Native.snd (divmod a b)