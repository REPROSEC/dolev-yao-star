open Prims
let (bytes_to_quad_size : Prims.nat -> Prims.int) =
  fun num_bytes -> (num_bytes + (Prims.of_int (15))) / (Prims.of_int (16))























