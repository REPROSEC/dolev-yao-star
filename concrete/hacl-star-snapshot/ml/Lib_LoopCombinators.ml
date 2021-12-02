open Prims
let rec (repeat_left :
  Prims.nat ->
    Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t)
  =
  fun lo ->
    fun hi ->
      fun a ->
        fun f ->
          fun acc ->
            if lo = hi
            then acc
            else repeat_left (lo + Prims.int_one) hi () f (f lo acc)
let rec (repeat_left_all_ml :
  Prims.nat ->
    Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t)
  =
  fun lo ->
    fun hi ->
      fun a ->
        fun f ->
          fun acc ->
            if lo = hi
            then acc
            else
              (let uu___1 = f lo acc in
               repeat_left_all_ml (lo + Prims.int_one) hi () f uu___1)
let rec (repeat_right :
  Prims.nat ->
    Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t)
  =
  fun lo ->
    fun hi ->
      fun a ->
        fun f ->
          fun acc ->
            if lo = hi
            then acc
            else
              f (hi - Prims.int_one)
                (repeat_right lo (hi - Prims.int_one) () f acc)
let rec (repeat_right_all_ml :
  Prims.nat ->
    Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t)
  =
  fun lo ->
    fun hi ->
      fun a ->
        fun f ->
          fun acc ->
            if lo = hi
            then acc
            else
              (let uu___1 =
                 repeat_right_all_ml lo (hi - Prims.int_one) () f acc in
               f (hi - Prims.int_one) uu___1)




let (repeat_gen :
  Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t) =
  fun n ->
    fun a -> fun f -> fun acc0 -> repeat_right Prims.int_zero n () f acc0
let (repeat_gen_all_ml :
  Prims.nat -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t) =
  fun n ->
    fun a ->
      fun f -> fun acc0 -> repeat_right_all_ml Prims.int_zero n () f acc0



type ('a, 'i) fixed_a = 'a
let fixed_i : 'uuuuu . 'uuuuu -> Prims.nat -> 'uuuuu = fun f -> fun i -> f
let repeati : 'a . Prims.nat -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun n ->
           fun f ->
             fun acc0 ->
               Obj.magic
                 (repeat_gen n ()
                    (fun uu___1 -> fun uu___ -> (Obj.magic f) uu___1 uu___)
                    (Obj.magic acc0))) uu___2 uu___1 uu___
let repeati_all_ml : 'a . Prims.nat -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun n ->
           fun f ->
             fun acc0 ->
               Obj.magic
                 (repeat_gen_all_ml n ()
                    (fun uu___1 -> fun uu___ -> (Obj.magic f) uu___1 uu___)
                    (Obj.magic acc0))) uu___2 uu___1 uu___



let repeat : 'a . Prims.nat -> ('a -> 'a) -> 'a -> 'a =
  fun n -> fun f -> fun acc0 -> repeati n (fixed_i f) acc0


let repeat_range :
  'a . Prims.nat -> Prims.nat -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun min ->
             fun max ->
               fun f ->
                 fun x ->
                   Obj.magic
                     (repeat_left min max ()
                        (fun uu___1 ->
                           fun uu___ -> (Obj.magic f) uu___1 uu___)
                        (Obj.magic x))) uu___3 uu___2 uu___1 uu___
let repeat_range_all_ml :
  'a . Prims.nat -> Prims.nat -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun min ->
             fun max ->
               fun f ->
                 fun x ->
                   Obj.magic
                     (repeat_left_all_ml min max ()
                        (fun uu___1 ->
                           fun uu___ -> (Obj.magic f) uu___1 uu___)
                        (Obj.magic x))) uu___3 uu___2 uu___1 uu___
type ('a, 'n, 'pred) repeatable = Prims.nat -> 'a -> 'a
let repeat_range_inductive :
  'a . Prims.nat -> Prims.nat -> unit -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (fun min ->
               fun max ->
                 fun pred ->
                   fun f ->
                     fun x ->
                       Obj.magic
                         (repeat_left min max ()
                            (fun uu___1 ->
                               fun uu___ -> (Obj.magic f) uu___1 uu___)
                            (Obj.magic x))) uu___4 uu___3 uu___2 uu___1 uu___
let repeati_inductive :
  'a . Prims.nat -> unit -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun n ->
    fun pred ->
      fun f -> fun x0 -> repeat_range_inductive Prims.int_zero n () f x0

type ('n, 'a, 'f, 'pred) preserves_predicate = unit
let (repeat_gen_inductive :
  Prims.nat ->
    unit -> unit -> (Prims.nat -> Obj.t -> Obj.t) -> Obj.t -> Obj.t)
  =
  fun n ->
    fun a ->
      fun pred ->
        fun f -> fun x0 -> let f' i x = f i x in repeat_gen n () f' x0
type ('a, 'n, 'f, 'pred) preserves = unit
let repeati_inductive' :
  'a . Prims.nat -> unit -> (Prims.nat -> 'a -> 'a) -> 'a -> 'a =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun n ->
             fun pred ->
               fun f ->
                 fun x0 ->
                   let f' i x = f i x in
                   Obj.magic
                     (repeat_gen n ()
                        (fun uu___1 ->
                           fun uu___ -> (Obj.magic f') uu___1 uu___)
                        (Obj.magic x0))) uu___3 uu___2 uu___1 uu___