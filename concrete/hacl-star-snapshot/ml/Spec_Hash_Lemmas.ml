open Prims










let (pad_length : Spec_Hash_Definitions.hash_alg -> Prims.nat -> Prims.nat) =
  fun a ->
    fun len ->
      if
        match a with
        | Spec_Hash_Definitions.Blake2S -> true
        | Spec_Hash_Definitions.Blake2B -> true
        | uu___ -> false
      then
        ((Spec_Hash_Definitions.block_length a) - len) mod
          (Spec_Hash_Definitions.block_length a)
      else
        ((Spec_Hash_Definitions.pad0_length a len) + Prims.int_one) +
          (Spec_Hash_Definitions.len_length a)