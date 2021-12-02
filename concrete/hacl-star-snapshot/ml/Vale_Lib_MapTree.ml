open Prims
type ('a, 'isule) is_cmp = unit
type ('a, 'b) tree =
  | Empty 
  | Node of 'a * 'b * Prims.nat * ('a, 'b) tree * ('a, 'b) tree 
let uu___is_Empty : 'a 'b . ('a, 'b) tree -> Prims.bool =
  fun projectee -> match projectee with | Empty -> true | uu___ -> false
let uu___is_Node : 'a 'b . ('a, 'b) tree -> Prims.bool =
  fun projectee ->
    match projectee with | Node (_0, _1, _2, _3, _4) -> true | uu___ -> false
let __proj__Node__item___0 : 'a 'b . ('a, 'b) tree -> 'a =
  fun projectee -> match projectee with | Node (_0, _1, _2, _3, _4) -> _0
let __proj__Node__item___1 : 'a 'b . ('a, 'b) tree -> 'b =
  fun projectee -> match projectee with | Node (_0, _1, _2, _3, _4) -> _1
let __proj__Node__item___2 : 'a 'b . ('a, 'b) tree -> Prims.nat =
  fun projectee -> match projectee with | Node (_0, _1, _2, _3, _4) -> _2
let __proj__Node__item___3 : 'a 'b . ('a, 'b) tree -> ('a, 'b) tree =
  fun projectee -> match projectee with | Node (_0, _1, _2, _3, _4) -> _3
let __proj__Node__item___4 : 'a 'b . ('a, 'b) tree -> ('a, 'b) tree =
  fun projectee -> match projectee with | Node (_0, _1, _2, _3, _4) -> _4
let height : 'a 'b . ('a, 'b) tree -> Prims.nat =
  fun t ->
    match t with
    | Empty -> Prims.int_zero
    | Node (uu___, uu___1, h, uu___2, uu___3) -> h
let mkNode :
  'a 'b . 'a -> 'b -> ('a, 'b) tree -> ('a, 'b) tree -> ('a, 'b) tree =
  fun key ->
    fun value ->
      fun l ->
        fun r ->
          let hl = height l in
          let hr = height r in
          let h = if hl > hr then hl else hr in
          Node (key, value, (h + Prims.int_one), l, r)
let rotate_l : 'a 'b . ('a, 'b) tree -> ('a, 'b) tree =
  fun t ->
    match t with
    | Node (kl, vl, uu___, l, Node (kr, vr, uu___1, lr, rr)) ->
        mkNode kr vr (mkNode kl vl l lr) rr
    | uu___ -> t
let rotate_r : 'a 'b . ('a, 'b) tree -> ('a, 'b) tree =
  fun t ->
    match t with
    | Node (kr, vr, uu___, Node (kl, vl, uu___1, ll, rl), r) ->
        mkNode kl vl ll (mkNode kr vr rl r)
    | uu___ -> t
let balance : 'a 'b . ('a, 'b) tree -> ('a, 'b) tree =
  fun t ->
    match t with
    | Node (uu___, uu___1, uu___2, l, r) ->
        let hl = height l in
        let hr = height r in
        if hl >= (hr + (Prims.of_int (2)))
        then rotate_r t
        else if hr >= (hl + (Prims.of_int (2))) then rotate_l t else t
    | uu___ -> t
let rec get :
  'a 'b .
    ('a -> 'a -> Prims.bool) ->
      ('a, 'b) tree -> 'a -> 'b FStar_Pervasives_Native.option
  =
  fun is_le ->
    fun t ->
      fun key ->
        match t with
        | Empty -> FStar_Pervasives_Native.None
        | Node (k, v, h, l, r) ->
            if key = k
            then FStar_Pervasives_Native.Some v
            else if is_le key k then get is_le l key else get is_le r key
let rec put :
  'a 'b .
    ('a -> 'a -> Prims.bool) -> ('a, 'b) tree -> 'a -> 'b -> ('a, 'b) tree
  =
  fun is_le ->
    fun t ->
      fun key ->
        fun value ->
          match t with
          | Empty -> mkNode key value Empty Empty
          | Node (k, v, uu___, l, r) ->
              if key = k
              then mkNode k value l r
              else
                if is_le key k
                then balance (mkNode k v (put is_le l key value) r)
                else balance (mkNode k v l (put is_le r key value))
let is_lt_option :
  'a .
    ('a -> 'a -> Prims.bool) ->
      'a FStar_Pervasives_Native.option ->
        'a FStar_Pervasives_Native.option -> Prims.bool
  =
  fun is_le ->
    fun x ->
      fun y ->
        match (x, y) with
        | (FStar_Pervasives_Native.Some x1, FStar_Pervasives_Native.Some y1)
            -> (is_le x1 y1) && (x1 <> y1)
        | uu___ -> true
type ('a, 'b, 'isule, 't, 'lo, 'hi) inv = Obj.t



type ('a, 'b) map' =
  | Map of ('a -> 'a -> Prims.bool) * ('a, 'b) tree * 'b * unit 
let uu___is_Map : 'a 'b . ('a, 'b) map' -> Prims.bool = fun projectee -> true
let __proj__Map__item__is_le :
  'a 'b . ('a, 'b) map' -> 'a -> 'a -> Prims.bool =
  fun projectee ->
    match projectee with | Map (is_le, t, default_v, invs) -> is_le
let __proj__Map__item__t : 'a 'b . ('a, 'b) map' -> ('a, 'b) tree =
  fun projectee ->
    match projectee with | Map (is_le, t, default_v, invs) -> t
let __proj__Map__item__default_v : 'a 'b . ('a, 'b) map' -> 'b =
  fun projectee ->
    match projectee with | Map (is_le, t, default_v, invs) -> default_v

type ('a, 'b) map = ('a, 'b) map'
let const : 'a 'b . ('a -> 'a -> Prims.bool) -> 'b -> ('a, 'b) map =
  fun is_le -> fun d -> Map (is_le, Empty, d, ())
let sel : 'a 'b . ('a, 'b) map -> 'a -> 'b =
  fun uu___ ->
    fun key ->
      match uu___ with
      | Map (is_le, t, d, uu___1) ->
          (match get is_le t key with
           | FStar_Pervasives_Native.Some v -> v
           | FStar_Pervasives_Native.None -> d)
let upd : 'a 'b . ('a, 'b) map -> 'a -> 'b -> ('a, 'b) map =
  fun uu___ ->
    fun key ->
      fun value ->
        match uu___ with
        | Map (is_le, t, d, uu___1) ->
            let t' = put is_le t key value in Map (is_le, t', d, ())


