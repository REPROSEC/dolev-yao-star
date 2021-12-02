open Prims



type ('input, 'w, 'blocksize, 'n, 'hiuf, 'a, 'auvec, 'f, 'fuv, 'normalizeuv,
  'i, 'buv, 'accuv) repeat_gen_blocks_multi_vec_equiv_pre = unit
let get_block_v :
  'a .
    Prims.pos ->
      Prims.pos ->
        Prims.nat ->
          'a Lib_Sequence.seq -> Prims.nat -> ('a, unit) Lib_Sequence.lseq
  =
  fun w ->
    fun blocksize ->
      fun n ->
        fun s ->
          fun i ->
            let blocksize_v = w * blocksize in
            let b_v =
              FStar_Seq_Base.slice s (i * blocksize_v)
                ((i + Prims.int_one) * blocksize_v) in
            b_v




type ('input, 'c, 'w, 'blocksize, 'n, 'a, 'auvec, 'f, 'l, 'luv, 'normalizeuv,
  'rem, 'buv, 'accuv) repeat_gen_blocks_vec_equiv_pre = unit

type ('a, 'b, 'buvec, 'w, 'blocksize, 'f, 'fuv, 'normalizeuv, 'buv,
  'accuv) repeat_blocks_multi_vec_equiv_pre = unit


type ('a, 'b, 'buvec, 'c, 'w, 'blocksize, 'f, 'l, 'luv, 'normalizeuv, 
  'rem, 'buv, 'accuv) repeat_blocks_vec_equiv_pre = unit



type ('a, 'w, 'blocksize, 'n, 'hiuf, 'f, 'fuv, 'i, 'buv,
  'k) map_blocks_multi_vec_equiv_pre_k = unit
let normalize_v_map :
  'a .
    Prims.pos ->
      Prims.pos ->
        Prims.nat ->
          Prims.nat ->
            ('a, unit, unit, unit) Lib_Sequence.map_blocks_a ->
              ('a, unit, unit, unit) Lib_Sequence.map_blocks_a
  = fun w -> fun blocksize -> fun n -> fun i -> fun b -> b
type ('a, 'w, 'blocksize, 'n, 'hiuf, 'f, 'fuv, 'i, 'buv,
  'accuv) map_blocks_multi_vec_equiv_pre = unit



type ('a, 'w, 'blocksize, 'n, 'f, 'l, 'luv, 'rem, 'buv,
  'k) map_blocks_vec_equiv_pre_k = Obj.t
type ('a, 'w, 'blocksize, 'n, 'f, 'l, 'luv, 'rem, 'buv,
  'accuv) map_blocks_vec_equiv_pre = unit



