open Prims
let rec (pow : Prims.nat -> Prims.nat -> Prims.nat) =
  fun a ->
    fun b ->
      if b = Prims.int_zero
      then Prims.int_one
      else a * (pow a (b - Prims.int_one))









type 'n elem = Prims.nat
let (fmul : Prims.pos -> unit elem -> unit elem -> unit elem) =
  fun n -> fun x -> fun y -> (x * y) mod n
let rec (exp : Prims.pos -> unit elem -> Prims.pos -> unit elem) =
  fun n ->
    fun a ->
      fun b ->
        if b = Prims.int_one
        then a
        else
          if (b mod (Prims.of_int (2))) = Prims.int_zero
          then exp n (fmul n a a) (b / (Prims.of_int (2)))
          else fmul n a (exp n (fmul n a a) (b / (Prims.of_int (2))))
let (modp_inv_prime : Prims.pos -> unit elem -> unit elem) =
  fun prime -> fun x -> (exp prime x (prime - (Prims.of_int (2)))) mod prime
let (modp_inv2_prime : Prims.int -> Prims.nat -> unit elem) =
  fun x -> fun p -> modp_inv_prime p (x mod p)
let (modp_inv2 : Prims.nat -> unit elem) =
  fun x -> modp_inv2_prime x Spec_P256_Definitions.prime256
let (modp_inv2_pow : Prims.nat -> unit elem) =
  fun x ->
    (pow x (Spec_P256_Definitions.prime256 - (Prims.of_int (2)))) mod
      Spec_P256_Definitions.prime256
let (min_one_prime : Prims.pos -> Prims.int -> unit elem) =
  fun prime ->
    fun x -> let p = x mod prime in exp prime p (prime - Prims.int_one)




































