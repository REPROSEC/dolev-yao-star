open Prims
type 'a seq = 'a FStar_Seq_Base.seq
let length : 'a . 'a seq -> Prims.nat = fun s -> FStar_Seq_Base.length s
type ('a, 'len) lseq = 'a seq
let to_seq : 'a . Prims.nat -> ('a, unit) lseq -> 'a seq =
  fun len -> fun l -> l
let to_lseq : 'a . 'a seq -> ('a, unit) lseq = fun s -> s
let index : 'a . Prims.nat -> ('a, unit) lseq -> Prims.nat -> 'a =
  fun len -> fun s -> fun n -> FStar_Seq_Base.index s n
let create : 'a . Prims.nat -> 'a -> ('a, unit) lseq =
  fun len -> fun init -> FStar_Seq_Base.create len init
let concat :
  'a .
    Prims.nat ->
      Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq -> ('a, unit) lseq
  = fun len0 -> fun len1 -> fun s0 -> fun s1 -> FStar_Seq_Base.append s0 s1
let op_At_Bar :
  'a .
    Prims.nat ->
      Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq -> ('a, unit) lseq
  = fun len0 -> fun len1 -> fun s0 -> fun s1 -> concat len0 len1 s0 s1
let to_list : 'a . 'a seq -> 'a Prims.list =
  fun s -> FStar_Seq_Properties.seq_to_list s
let of_list : 'a . 'a Prims.list -> ('a, unit) lseq =
  fun l -> FStar_Seq_Properties.seq_of_list l

type ('a, 'len, 's1, 's2) equal = unit


let createL : 'a . 'a Prims.list -> ('a, unit) lseq = fun l -> of_list l
let upd :
  'a . Prims.nat -> ('a, unit) lseq -> Prims.nat -> 'a -> ('a, unit) lseq =
  fun len -> fun s -> fun n -> fun x -> FStar_Seq_Base.upd s n x
let member : 'a . Prims.nat -> 'a -> ('a, unit) lseq -> Prims.bool =
  fun len ->
    fun x -> fun l -> (FStar_Seq_Properties.count x l) > Prims.int_zero
let op_String_Access : 'a . Prims.nat -> ('a, unit) lseq -> Prims.nat -> 'a =
  fun len -> index len
let op_String_Assignment :
  'a . Prims.nat -> ('a, unit) lseq -> Prims.nat -> 'a -> ('a, unit) lseq =
  fun len -> upd len
let sub :
  'a .
    Prims.nat -> ('a, unit) lseq -> Prims.nat -> Prims.nat -> ('a, unit) lseq
  =
  fun len ->
    fun s -> fun start -> fun n -> FStar_Seq_Base.slice s start (start + n)
let slice :
  'a .
    Prims.nat -> ('a, unit) lseq -> Prims.nat -> Prims.nat -> ('a, unit) lseq
  =
  fun len -> fun s1 -> fun start -> fun fin -> sub len s1 start (fin - start)
let update_sub :
  'a .
    Prims.nat ->
      ('a, unit) lseq ->
        Prims.nat -> Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq
  =
  fun len ->
    fun s ->
      fun start ->
        fun n ->
          fun x ->
            let o =
              FStar_Seq_Base.append
                (FStar_Seq_Base.append
                   (FStar_Seq_Base.slice s Prims.int_zero start) x)
                (FStar_Seq_Base.slice s (start + n) (length s)) in
            o



let update_slice :
  'a .
    Prims.nat ->
      ('a, unit) lseq ->
        Prims.nat -> Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq
  =
  fun len ->
    fun i ->
      fun start ->
        fun fin -> fun upd1 -> update_sub len i start (fin - start) upd1
type ('a, 'len, 'init, 'k) createi_a = ('a, unit) lseq
type ('a, 'len, 'init, 'k, 's) createi_pred = unit
let createi_step :
  'a .
    Prims.nat ->
      (Prims.nat -> 'a) ->
        Prims.nat ->
          ('a, unit, unit, unit) createi_a ->
            ('a, unit, unit, unit) createi_a
  =
  fun len ->
    fun init -> fun i -> fun si -> FStar_Seq_Properties.snoc si (init i)
let createi : 'a . Prims.nat -> (Prims.nat -> 'a) -> ('a, unit) lseq =
  fun uu___1 ->
    fun uu___ ->
      (fun len ->
         fun init_f ->
           Obj.magic
             (Lib_LoopCombinators.repeat_gen_inductive len () ()
                (fun uu___1 ->
                   fun uu___ ->
                     (Obj.magic (createi_step len init_f)) uu___1 uu___)
                (Obj.magic (of_list [])))) uu___1 uu___
let mapi_inner :
  'a 'b .
    Prims.nat ->
      (Prims.nat -> 'a -> 'b) -> ('a, unit) lseq -> Prims.nat -> 'b
  = fun len -> fun f -> fun s -> fun i -> f i (index len s i)
let mapi :
  'a 'b .
    Prims.nat ->
      (Prims.nat -> 'a -> 'b) -> ('a, unit) lseq -> ('b, unit) lseq
  = fun len -> fun f -> fun s -> createi len (fun i -> f i (index len s i))
let map_inner :
  'a 'b . Prims.nat -> ('a -> 'b) -> ('a, unit) lseq -> Prims.nat -> 'b =
  fun len -> fun f -> fun s -> fun i -> f (index len s i)
let map :
  'a 'b . Prims.nat -> ('a -> 'b) -> ('a, unit) lseq -> ('b, unit) lseq =
  fun len -> fun f -> fun s -> createi len (fun i -> f (index len s i))
let map2i :
  'a 'b 'c .
    Prims.nat ->
      (Prims.nat -> 'a -> 'b -> 'c) ->
        ('a, unit) lseq -> ('b, unit) lseq -> ('c, unit) lseq
  =
  fun len ->
    fun f ->
      fun s1 ->
        fun s2 ->
          createi len (fun i -> f i (index len s1 i) (index len s2 i))
let map2_inner :
  'a 'b 'c .
    Prims.nat ->
      ('a -> 'b -> 'c) ->
        ('a, unit) lseq -> ('b, unit) lseq -> Prims.nat -> 'c
  =
  fun len ->
    fun f -> fun s1 -> fun s2 -> fun i -> f (index len s1 i) (index len s2 i)
let map2 :
  'a 'b 'c .
    Prims.nat ->
      ('a -> 'b -> 'c) ->
        ('a, unit) lseq -> ('b, unit) lseq -> ('c, unit) lseq
  =
  fun len ->
    fun f ->
      fun s1 ->
        fun s2 -> createi len (fun i -> f (index len s1 i) (index len s2 i))
let for_all :
  'a . Prims.nat -> ('a -> Prims.bool) -> ('a, unit) lseq -> Prims.bool =
  fun len -> fun f -> fun x -> FStar_Seq_Properties.for_all f x
let for_all2 :
  'a 'b .
    Prims.nat ->
      ('a -> 'b -> Prims.bool) ->
        ('a, unit) lseq -> ('b, unit) lseq -> Prims.bool
  =
  fun len ->
    fun f ->
      fun x ->
        fun y ->
          let r = map2 len (fun xi -> fun yi -> f xi yi) x y in
          FStar_Seq_Properties.for_all (fun bi -> bi = true) r
let seq_sub : 'a . 'a seq -> Prims.nat -> Prims.nat -> 'a seq =
  fun s -> fun start -> fun n -> FStar_Seq_Base.slice s start (start + n)
let seq_update_sub :
  'a . 'a seq -> Prims.nat -> Prims.nat -> 'a seq -> 'a seq =
  fun s ->
    fun start ->
      fun n ->
        fun x ->
          let o =
            FStar_Seq_Base.append
              (FStar_Seq_Base.append
                 (FStar_Seq_Base.slice s Prims.int_zero start) x)
              (FStar_Seq_Base.slice s (start + n) (length s)) in
          o
let repeati_blocks_f :
  'a 'b .
    Prims.nat ->
      'a seq ->
        (Prims.nat -> ('a, unit) lseq -> 'b -> 'b) ->
          Prims.nat -> Prims.nat -> 'b -> 'b
  =
  fun bs ->
    fun inp ->
      fun f ->
        fun nb ->
          fun i ->
            fun acc -> let block = seq_sub inp (i * bs) bs in f i block acc
let repeati_blocks :
  'a 'b .
    Prims.pos ->
      'a seq ->
        (Prims.nat -> ('a, unit) lseq -> 'b -> 'b) ->
          (Prims.nat -> Prims.nat -> ('a, unit) lseq -> 'b -> 'b) -> 'b -> 'b
  =
  fun bs ->
    fun inp ->
      fun f ->
        fun g ->
          fun init ->
            let len = length inp in
            let nb = len / bs in
            let rem = len mod bs in
            let acc =
              Lib_LoopCombinators.repeati nb (repeati_blocks_f bs inp f nb)
                init in
            let last = seq_sub inp (nb * bs) rem in g nb rem last acc
let repeat_blocks_f :
  'a 'b .
    Prims.nat ->
      'a seq ->
        (('a, unit) lseq -> 'b -> 'b) -> Prims.nat -> Prims.nat -> 'b -> 'b
  =
  fun bs ->
    fun inp ->
      fun f ->
        fun nb ->
          fun i ->
            fun acc ->
              let block = FStar_Seq_Base.slice inp (i * bs) ((i * bs) + bs) in
              f block acc
let repeat_blocks :
  'a 'b 'c .
    Prims.pos ->
      'a seq ->
        (('a, unit) lseq -> 'b -> 'b) ->
          (Prims.nat -> ('a, unit) lseq -> 'b -> 'c) -> 'b -> 'c
  =
  fun bs ->
    fun inp ->
      fun f ->
        fun l ->
          fun init ->
            let len = length inp in
            let nb = len / bs in
            let rem = len mod bs in
            let acc =
              Lib_LoopCombinators.repeati nb (repeat_blocks_f bs inp f nb)
                init in
            let last = seq_sub inp (nb * bs) rem in l rem last acc

let repeat_blocks_multi :
  'a 'b . Prims.pos -> 'a seq -> (('a, unit) lseq -> 'b -> 'b) -> 'b -> 'b =
  fun bs ->
    fun inp ->
      fun f ->
        fun init ->
          let len = length inp in
          let nb = len / bs in
          Lib_LoopCombinators.repeati nb (repeat_blocks_f bs inp f nb) init

type ('t, 'blocklen, 'max, 'a, 'i) generate_blocks_a = ('a * 't seq)
let generate_blocks_inner :
  't .
    Prims.nat ->
      Prims.nat ->
        unit ->
          (Prims.nat -> Obj.t -> (Obj.t * 't seq)) ->
            Prims.nat ->
              ('t, unit, unit, Obj.t, unit) generate_blocks_a ->
                ('t, unit, unit, Obj.t, unit) generate_blocks_a
  =
  fun blocklen ->
    fun max ->
      fun a ->
        fun f ->
          fun i ->
            fun acc ->
              let uu___ = acc in
              match uu___ with
              | (acc1, o) ->
                  let uu___1 = f i acc1 in
                  (match uu___1 with
                   | (acc', block) ->
                       let o' = FStar_Seq_Base.append o block in (acc', o'))
let generate_blocks :
  't .
    Prims.nat ->
      Prims.nat ->
        Prims.nat ->
          unit ->
            (Prims.nat -> Obj.t -> (Obj.t * 't seq)) ->
              Obj.t -> (Obj.t * 't seq)
  =
  fun uu___5 ->
    fun uu___4 ->
      fun uu___3 ->
        fun uu___2 ->
          fun uu___1 ->
            fun uu___ ->
              (fun len ->
                 fun max ->
                   fun n ->
                     fun a ->
                       fun f ->
                         fun acc0 ->
                           let a0 = (acc0, (FStar_Seq_Base.empty ())) in
                           Obj.magic
                             (Lib_LoopCombinators.repeat_gen n ()
                                (fun uu___1 ->
                                   fun uu___ ->
                                     (Obj.magic
                                        (generate_blocks_inner len max () f))
                                       uu___1 uu___) (Obj.magic a0))) uu___5
                uu___4 uu___3 uu___2 uu___1 uu___
type ('a, 'bs, 'max, 'i) generate_blocks_simple_a = 'a seq
let generate_blocks_simple_f :
  'a .
    Prims.nat ->
      Prims.nat ->
        (Prims.nat -> ('a, unit) lseq) ->
          Prims.nat ->
            ('a, unit, unit, unit) generate_blocks_simple_a ->
              ('a, unit, unit, unit) generate_blocks_simple_a
  =
  fun bs ->
    fun max -> fun f -> fun i -> fun acc -> FStar_Seq_Base.append acc (f i)
let generate_blocks_simple :
  'a .
    Prims.pos ->
      Prims.nat -> Prims.nat -> (Prims.nat -> ('a, unit) lseq) -> 'a seq
  =
  fun uu___3 ->
    fun uu___2 ->
      fun uu___1 ->
        fun uu___ ->
          (fun bs ->
             fun max ->
               fun nb ->
                 fun f ->
                   Obj.magic
                     (Lib_LoopCombinators.repeat_gen nb ()
                        (fun uu___1 ->
                           fun uu___ ->
                             (Obj.magic (generate_blocks_simple_f bs max f))
                               uu___1 uu___)
                        (Obj.magic (FStar_Seq_Base.empty ())))) uu___3 uu___2
            uu___1 uu___





type ('a, 'bs, 'max, 'i) map_blocks_a = 'a seq
let map_blocks_f :
  'a .
    Prims.nat ->
      Prims.nat ->
        'a seq ->
          (Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) ->
            Prims.nat ->
              ('a, unit, unit, unit) map_blocks_a ->
                ('a, unit, unit, unit) map_blocks_a
  =
  fun bs ->
    fun max ->
      fun inp ->
        fun f ->
          fun i ->
            fun acc ->
              let block =
                FStar_Seq_Base.slice inp (i * bs) ((i + Prims.int_one) * bs) in
              FStar_Seq_Base.append acc (f i block)
let map_blocks_multi :
  'a .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          'a seq ->
            (Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) -> 'a seq
  =
  fun uu___4 ->
    fun uu___3 ->
      fun uu___2 ->
        fun uu___1 ->
          fun uu___ ->
            (fun bs ->
               fun max ->
                 fun nb ->
                   fun inp ->
                     fun f ->
                       Obj.magic
                         (Lib_LoopCombinators.repeat_gen nb ()
                            (fun uu___1 ->
                               fun uu___ ->
                                 (Obj.magic (map_blocks_f bs max inp f))
                                   uu___1 uu___)
                            (Obj.magic (FStar_Seq_Base.empty ())))) uu___4
              uu___3 uu___2 uu___1 uu___



type ('len, 'blocksize) block = Prims.nat
type ('len, 'blocksize) last = Prims.nat
let map_blocks :
  'a .
    Prims.pos ->
      'a seq ->
        (Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) ->
          (Prims.nat -> Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) ->
            'a seq
  =
  fun blocksize ->
    fun inp ->
      fun f ->
        fun g ->
          let len = length inp in
          let nb = len / blocksize in
          let rem = len mod blocksize in
          let blocks =
            FStar_Seq_Base.slice inp Prims.int_zero (nb * blocksize) in
          let last1 = FStar_Seq_Base.slice inp (nb * blocksize) len in
          let bs = map_blocks_multi blocksize nb nb blocks f in
          if rem > Prims.int_zero
          then FStar_Seq_Base.append bs (g nb rem last1)
          else bs

let get_block :
  'a .
    Prims.nat ->
      Prims.pos ->
        'a seq ->
          (Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) ->
            Prims.nat -> ('a, unit) lseq
  =
  fun len ->
    fun blocksize ->
      fun inp ->
        fun f ->
          fun i ->
            let j = i / blocksize in
            let b =
              FStar_Seq_Base.slice inp (j * blocksize)
                ((j + Prims.int_one) * blocksize) in
            f j b
let get_last :
  'a .
    Prims.nat ->
      Prims.pos ->
        'a seq ->
          (Prims.nat -> Prims.nat -> ('a, unit) lseq -> ('a, unit) lseq) ->
            Prims.nat -> ('a, unit) lseq
  =
  fun len ->
    fun blocksize ->
      fun inp ->
        fun g ->
          fun i ->
            let rem = len mod blocksize in
            let b = FStar_Seq_Base.slice inp (len - rem) len in
            g (len / blocksize) rem b



