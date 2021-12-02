open Prims
let (swap :
  Spec_P256_Definitions.point_prime ->
    Spec_P256_Definitions.point_prime ->
      (Spec_P256_Definitions.point_prime * Spec_P256_Definitions.point_prime))
  = fun p -> fun q -> (q, p)
let (conditional_swap :
  FStar_UInt64.t ->
    Spec_P256_Definitions.point_prime ->
      Spec_P256_Definitions.point_prime ->
        (Spec_P256_Definitions.point_prime *
          Spec_P256_Definitions.point_prime))
  =
  fun i ->
    fun p ->
      fun q ->
        if
          (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic i)) =
            Prims.int_zero
        then (p, q)
        else (q, p)
