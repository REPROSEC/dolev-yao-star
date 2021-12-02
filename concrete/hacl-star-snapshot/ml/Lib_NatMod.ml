open Prims
let (mk_nat_group : Prims.int Lib_Exponentiation.exp) =
  {
    Lib_Exponentiation.one = Prims.int_one;
    Lib_Exponentiation.fmul = ( * );
    Lib_Exponentiation.lemma_one = ();
    Lib_Exponentiation.lemma_fmul_assoc = ();
    Lib_Exponentiation.lemma_fmul_comm = ()
  }
let rec (pow : Prims.int -> Prims.nat -> Prims.int) =
  fun x ->
    fun n ->
      if n = Prims.int_zero
      then Prims.int_one
      else x * (pow x (n - Prims.int_one))











type 'm nat_mod = Prims.nat
let (one_mod : Prims.pos -> unit nat_mod) = fun m -> Prims.int_one mod m
let (mul_mod : Prims.pos -> unit nat_mod -> unit nat_mod -> unit nat_mod) =
  fun m -> fun a -> fun b -> (a * b) mod m



let (mk_nat_mod_group : Prims.pos -> unit nat_mod Lib_Exponentiation.exp) =
  fun m ->
    {
      Lib_Exponentiation.one = (one_mod m);
      Lib_Exponentiation.fmul = (mul_mod m);
      Lib_Exponentiation.lemma_one = ();
      Lib_Exponentiation.lemma_fmul_assoc = ();
      Lib_Exponentiation.lemma_fmul_comm = ()
    }
let rec (pow_mod_ : Prims.pos -> unit nat_mod -> Prims.pos -> unit nat_mod) =
  fun m ->
    fun a ->
      fun b ->
        if b = Prims.int_one
        then a
        else
          if (b mod (Prims.of_int (2))) = Prims.int_zero
          then pow_mod_ m (mul_mod m a a) (b / (Prims.of_int (2)))
          else
            mul_mod m a (pow_mod_ m (mul_mod m a a) (b / (Prims.of_int (2))))
let (pow_mod : Prims.pos -> unit nat_mod -> Prims.pos -> unit nat_mod) =
  fun m -> fun a -> fun b -> pow_mod_ m a b





