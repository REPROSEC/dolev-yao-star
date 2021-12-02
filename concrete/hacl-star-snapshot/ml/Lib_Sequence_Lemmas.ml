open Prims
let get_block_s :
  'a .
    Prims.nat ->
      Prims.pos ->
        'a Lib_Sequence.seq -> Prims.nat -> ('a, unit) Lib_Sequence.lseq
  =
  fun len ->
    fun blocksize ->
      fun inp ->
        fun i ->
          let j = i / blocksize in
          let b =
            FStar_Seq_Base.slice inp (j * blocksize)
              ((j + Prims.int_one) * blocksize) in
          b
let get_last_s :
  'a .
    Prims.nat ->
      Prims.pos -> 'a Lib_Sequence.seq -> ('a, unit) Lib_Sequence.lseq
  =
  fun len ->
    fun blocksize ->
      fun inp ->
        let rem = len mod blocksize in
        let b = FStar_Seq_Base.slice inp (len - rem) len in b




let repeat_gen_blocks_f :
  'input .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat ->
            'input Lib_Sequence.seq ->
              unit ->
                (Prims.nat ->
                   ('input, unit) Lib_Sequence.lseq -> Obj.t -> Obj.t)
                  -> Prims.nat -> Obj.t -> Obj.t
  =
  fun blocksize ->
    fun mi ->
      fun hi ->
        fun n ->
          fun inp ->
            fun a ->
              fun f ->
                fun i ->
                  fun acc ->
                    let i_b = i - mi in
                    let block =
                      FStar_Seq_Base.slice inp (i_b * blocksize)
                        ((i_b * blocksize) + blocksize) in
                    f i block acc
let repeat_gen_blocks_multi :
  'input .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat ->
            'input Lib_Sequence.seq ->
              unit ->
                (Prims.nat ->
                   ('input, unit) Lib_Sequence.lseq -> Obj.t -> Obj.t)
                  -> Obj.t -> Obj.t
  =
  fun blocksize ->
    fun mi ->
      fun hi ->
        fun n ->
          fun inp ->
            fun a ->
              fun f ->
                fun acc0 ->
                  Lib_LoopCombinators.repeat_right mi (mi + n) ()
                    (repeat_gen_blocks_f blocksize mi hi n inp () f) acc0

let repeat_gen_blocks :
  'input 'c .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          'input Lib_Sequence.seq ->
            unit ->
              (Prims.nat ->
                 ('input, unit) Lib_Sequence.lseq -> Obj.t -> Obj.t)
                ->
                (Prims.nat ->
                   Prims.nat ->
                     ('input, unit) Lib_Sequence.lseq -> Obj.t -> 'c)
                  -> Obj.t -> 'c
  =
  fun blocksize ->
    fun mi ->
      fun hi ->
        fun inp ->
          fun a ->
            fun f ->
              fun l ->
                fun acc0 ->
                  let len = Lib_Sequence.length inp in
                  let nb = len / blocksize in
                  let rem = len mod blocksize in
                  let blocks =
                    FStar_Seq_Base.slice inp Prims.int_zero (nb * blocksize) in
                  let last = FStar_Seq_Base.slice inp (nb * blocksize) len in
                  let acc =
                    repeat_gen_blocks_multi blocksize mi hi nb blocks () f
                      acc0 in
                  l (mi + nb) rem last acc





















let repeat_gen_blocks_map_f :
  'a .
    Prims.pos ->
      Prims.nat ->
        (Prims.nat ->
           ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
          ->
          Prims.nat ->
            ('a, unit) Lib_Sequence.lseq ->
              ('a, unit, unit, unit) Lib_Sequence.map_blocks_a ->
                ('a, unit, unit, unit) Lib_Sequence.map_blocks_a
  =
  fun blocksize ->
    fun hi ->
      fun f ->
        fun i ->
          fun block -> fun acc -> FStar_Seq_Base.append acc (f i block)
let repeat_gen_blocks_map_l :
  'a .
    Prims.pos ->
      Prims.nat ->
        (Prims.nat ->
           Prims.nat ->
             ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
          ->
          Prims.nat ->
            Prims.nat ->
              ('a, unit) Lib_Sequence.lseq ->
                ('a, unit, unit, unit) Lib_Sequence.map_blocks_a ->
                  'a Lib_Sequence.seq
  =
  fun blocksize ->
    fun hi ->
      fun l ->
        fun i ->
          fun rem ->
            fun block_l ->
              fun acc ->
                if rem > Prims.int_zero
                then FStar_Seq_Base.append acc (l i rem block_l)
                else acc

let map_blocks_multi_acc :
  'a .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat ->
            'a Lib_Sequence.seq ->
              (Prims.nat ->
                 ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
                ->
                ('a, unit, unit, unit) Lib_Sequence.map_blocks_a ->
                  'a Lib_Sequence.seq
  =
  fun uu___6 ->
    fun uu___5 ->
      fun uu___4 ->
        fun uu___3 ->
          fun uu___2 ->
            fun uu___1 ->
              fun uu___ ->
                (fun blocksize ->
                   fun mi ->
                     fun hi ->
                       fun n ->
                         fun inp ->
                           fun f ->
                             fun acc0 ->
                               Obj.magic
                                 (repeat_gen_blocks_multi blocksize mi hi n
                                    inp ()
                                    (fun uu___2 ->
                                       fun uu___1 ->
                                         fun uu___ ->
                                           (Obj.magic
                                              (repeat_gen_blocks_map_f
                                                 blocksize hi f)) uu___2
                                             uu___1 uu___) (Obj.magic acc0)))
                  uu___6 uu___5 uu___4 uu___3 uu___2 uu___1 uu___
let map_blocks_acc :
  'a .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          'a Lib_Sequence.seq ->
            (Prims.nat ->
               ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
              ->
              (Prims.nat ->
                 Prims.nat ->
                   ('a, unit) Lib_Sequence.lseq ->
                     ('a, unit) Lib_Sequence.lseq)
                ->
                ('a, unit, unit, unit) Lib_Sequence.map_blocks_a ->
                  'a Lib_Sequence.seq
  =
  fun blocksize ->
    fun mi ->
      fun hi ->
        fun inp ->
          fun f ->
            fun l ->
              fun acc0 ->
                repeat_gen_blocks blocksize mi hi inp ()
                  (fun uu___2 ->
                     fun uu___1 ->
                       fun uu___ ->
                         (Obj.magic (repeat_gen_blocks_map_f blocksize hi f))
                           uu___2 uu___1 uu___)
                  (fun uu___3 ->
                     fun uu___2 ->
                       fun uu___1 ->
                         fun uu___ ->
                           (Obj.magic
                              (repeat_gen_blocks_map_l blocksize hi l))
                             uu___3 uu___2 uu___1 uu___) (Obj.magic acc0)



let f_shift :
  'a .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat ->
            (Prims.nat ->
               ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
              ->
              Prims.nat ->
                ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq
  =
  fun blocksize -> fun mi -> fun hi -> fun n -> fun f -> fun i -> f (mi + i)
let l_shift :
  'a .
    Prims.pos ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat ->
            (Prims.nat ->
               Prims.nat ->
                 ('a, unit) Lib_Sequence.lseq -> ('a, unit) Lib_Sequence.lseq)
              ->
              Prims.nat ->
                Prims.nat ->
                  ('a, unit) Lib_Sequence.lseq ->
                    ('a, unit) Lib_Sequence.lseq
  =
  fun blocksize -> fun mi -> fun hi -> fun n -> fun l -> fun i -> l (mi + i)





