open Prims
type 'a map2 = ('a * 'a)
type 'a map4 = ('a map2 * 'a map2)
type 'a map8 = ('a map4 * 'a map4)
type 'a map16 = ('a map8 * 'a map8)
let sel2 : 'a . 'a map2 -> Prims.int -> 'a =
  fun m ->
    fun n -> match m with | (m0, m1) -> if n < Prims.int_one then m0 else m1
let sel4 : 'a . 'a map4 -> Prims.int -> 'a =
  fun m ->
    fun n ->
      match m with
      | (m0, m1) ->
          if n < (Prims.of_int (2))
          then sel2 m0 n
          else sel2 m1 (n - (Prims.of_int (2)))
let sel8 : 'a . 'a map8 -> Prims.int -> 'a =
  fun m ->
    fun n ->
      match m with
      | (m0, m1) ->
          if n < (Prims.of_int (4))
          then sel4 m0 n
          else sel4 m1 (n - (Prims.of_int (4)))
let sel16 : 'a . 'a map16 -> Prims.int -> 'a =
  fun m ->
    fun n ->
      match m with
      | (m0, m1) ->
          if n < (Prims.of_int (8))
          then sel8 m0 n
          else sel8 m1 (n - (Prims.of_int (8)))
let upd2 : 'a . 'a map2 -> Prims.int -> 'a -> 'a map2 =
  fun m ->
    fun n ->
      fun v ->
        match m with
        | (m0, m1) -> if n < Prims.int_one then (v, m1) else (m0, v)
let upd4 : 'a . 'a map4 -> Prims.int -> 'a -> 'a map4 =
  fun m ->
    fun n ->
      fun v ->
        match m with
        | (m0, m1) ->
            if n < (Prims.of_int (2))
            then ((upd2 m0 n v), m1)
            else (m0, (upd2 m1 (n - (Prims.of_int (2))) v))
let upd8 : 'a . 'a map8 -> Prims.int -> 'a -> 'a map8 =
  fun m ->
    fun n ->
      fun v ->
        match m with
        | (m0, m1) ->
            if n < (Prims.of_int (4))
            then ((upd4 m0 n v), m1)
            else (m0, (upd4 m1 (n - (Prims.of_int (4))) v))
let upd16 : 'a . 'a map16 -> Prims.int -> 'a -> 'a map16 =
  fun m ->
    fun n ->
      fun v ->
        match m with
        | (m0, m1) ->
            if n < (Prims.of_int (8))
            then ((upd8 m0 n v), m1)
            else (m0, (upd8 m1 (n - (Prims.of_int (8))) v))



let sel : 'a . 'a map16 -> Prims.int -> 'a = fun m -> fun n -> sel16 m n
let upd : 'a . 'a map16 -> Prims.int -> 'a -> 'a map16 =
  fun m -> fun n -> fun v -> upd16 m n v
let get : 'a . 'a map16 -> Prims.int -> 'a = fun m -> fun n -> sel m n
let eta16 : 'a . 'a map16 -> 'a map16 =
  fun m ->
    let m0_3 =
      (((get m Prims.int_zero), (get m Prims.int_one)),
        ((get m (Prims.of_int (2))), (get m (Prims.of_int (3))))) in
    let m4_7 =
      (((get m (Prims.of_int (4))), (get m (Prims.of_int (5)))),
        ((get m (Prims.of_int (6))), (get m (Prims.of_int (7))))) in
    let m8_11 =
      (((get m (Prims.of_int (8))), (get m (Prims.of_int (9)))),
        ((get m (Prims.of_int (10))), (get m (Prims.of_int (11))))) in
    let m12_15 =
      (((get m (Prims.of_int (12))), (get m (Prims.of_int (13)))),
        ((get m (Prims.of_int (14))), (get m (Prims.of_int (15))))) in
    ((m0_3, m4_7), (m8_11, m12_15))
let eta : 'a . 'a map16 -> 'a map16 = fun m -> eta16 m





type ('a, 'm1, 'm2) equal = unit


let rec init_rec : 'a . (Prims.nat -> 'a) -> Prims.nat -> 'a map16 =
  fun f ->
    fun n ->
      if n = Prims.int_zero
      then
        let m1 = f Prims.int_zero in
        let m4 = ((m1, m1), (m1, m1)) in ((m4, m4), (m4, m4))
      else
        upd (init_rec f (n - Prims.int_one)) (n - Prims.int_one)
          (f (n - Prims.int_one))
let init : 'a . (Prims.nat -> 'a) -> 'a map16 =
  fun f -> init_rec f (Prims.of_int (16))

