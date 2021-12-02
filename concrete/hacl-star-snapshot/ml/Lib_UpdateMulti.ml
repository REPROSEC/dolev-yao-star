open Prims
type uint8 = FStar_UInt8.t

let (split_block :
  Prims.pos ->
    uint8 FStar_Seq_Base.seq ->
      Prims.nat -> (uint8 FStar_Seq_Base.seq * uint8 FStar_Seq_Base.seq))
  =
  fun block_length ->
    fun data ->
      fun n ->
        let uu___ = FStar_Seq_Properties.split data (n * block_length) in
        match uu___ with | (l, r) -> (l, r)
let (split_at_last_nb_rem :
  Prims.pos -> Prims.nat -> (Prims.nat * Prims.nat)) =
  fun block_length ->
    fun data_length ->
      let n = data_length / block_length in
      let rem = data_length mod block_length in (n, rem)
let (split_at_last :
  Prims.pos ->
    uint8 FStar_Seq_Base.seq ->
      (uint8 FStar_Seq_Base.seq * uint8 FStar_Seq_Base.seq))
  =
  fun block_length ->
    fun data ->
      let uu___ =
        split_at_last_nb_rem block_length (FStar_Seq_Base.length data) in
      match uu___ with
      | (n, rem) ->
          let uu___1 = split_block block_length data n in
          (match uu___1 with | (l, r) -> (l, r))
let (split_at_last_lazy_nb_rem :
  Prims.pos -> Prims.nat -> (Prims.nat * Prims.nat)) =
  fun l ->
    fun d ->
      let uu___ = split_at_last_nb_rem l d in
      match uu___ with
      | (n, rem) ->
          let blocks = n * l in
          if (n > Prims.int_zero) && (rem = Prims.int_zero)
          then
            let n' = n - Prims.int_one in
            let blocks' = n' * l in let rem' = d - blocks' in (n', rem')
          else (n, rem)
let (split_at_last_lazy :
  Prims.pos ->
    uint8 FStar_Seq_Base.seq ->
      (uint8 FStar_Seq_Base.seq * uint8 FStar_Seq_Base.seq))
  =
  fun l ->
    fun b ->
      let uu___ = split_at_last_lazy_nb_rem l (FStar_Seq_Base.length b) in
      match uu___ with
      | (n, rem) ->
          let uu___1 = FStar_Seq_Properties.split b (n * l) in
          (match uu___1 with | (blocks, rest) -> (blocks, rest))
type ('a, 'blockulength) update_t = 'a -> uint8 FStar_Seq_Base.seq -> 'a
let rec mk_update_multi :
  'a .
    Prims.pos -> ('a, unit) update_t -> 'a -> uint8 FStar_Seq_Base.seq -> 'a
  =
  fun block_length ->
    fun update ->
      fun acc ->
        fun blocks ->
          if (FStar_Seq_Base.length blocks) = Prims.int_zero
          then acc
          else
            (let uu___1 = split_block block_length blocks Prims.int_one in
             match uu___1 with
             | (block, rem) ->
                 let acc1 = update acc block in
                 mk_update_multi block_length update acc1 rem)
let update_full :
  'a .
    Prims.pos ->
      ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
        ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
          'a -> uint8 FStar_Seq_Base.seq -> 'a
  =
  fun block_length ->
    fun update ->
      fun update_last ->
        fun acc ->
          fun input ->
            let uu___ = split_at_last block_length input in
            match uu___ with
            | (blocks, rest) ->
                update_last (mk_update_multi block_length update acc blocks)
                  rest
let update_full_lazy :
  'a .
    Prims.pos ->
      ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
        ('a -> uint8 FStar_Seq_Base.seq -> 'a) ->
          'a -> uint8 FStar_Seq_Base.seq -> 'a
  =
  fun block_length ->
    fun update ->
      fun update_last ->
        fun acc ->
          fun input ->
            let uu___ = split_at_last_lazy block_length input in
            match uu___ with
            | (blocks, rest) ->
                update_last (mk_update_multi block_length update acc blocks)
                  rest


