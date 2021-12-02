open Prims
type 'l bytes_l = Obj.t Lib_Sequence.seq
type ('l, 'len) lbytes_l = (Obj.t, unit) Lib_Sequence.lseq
type bytes = FStar_UInt8.t Lib_Sequence.seq
type 'len lbytes = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type pub_bytes = FStar_UInt8.t Lib_Sequence.seq
type 'len pub_lbytes = (FStar_UInt8.t, unit) Lib_Sequence.lseq


let (seq_eq_mask_inner :
  Lib_IntTypes.inttype ->
    Prims.nat ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          (Obj.t, unit) Lib_Sequence.lseq ->
            Prims.nat -> Prims.nat -> Obj.t -> Obj.t)
  =
  fun t ->
    fun len1 ->
      fun len2 ->
        fun b1 ->
          fun b2 ->
            fun len ->
              fun i ->
                fun res ->
                  let z0 = res in
                  let res1 =
                    Lib_IntTypes.logand t Lib_IntTypes.SEC
                      (Lib_IntTypes.eq_mask t (Lib_Sequence.index len1 b1 i)
                         (Lib_Sequence.index len2 b2 i)) z0 in
                  res1
let (seq_eq_mask :
  Lib_IntTypes.inttype ->
    Prims.nat ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          (Obj.t, unit) Lib_Sequence.lseq -> Prims.nat -> Obj.t)
  =
  fun t ->
    fun len1 ->
      fun len2 ->
        fun b1 ->
          fun b2 ->
            fun len ->
              Lib_LoopCombinators.repeati_inductive len ()
                (seq_eq_mask_inner t len1 len2 b1 b2 len)
                (Lib_IntTypes.ones t Lib_IntTypes.SEC)
let (lbytes_eq :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun len ->
    fun b1 ->
      fun b2 ->
        let res =
          Obj.magic
            (seq_eq_mask Lib_IntTypes.U8 len len (Obj.magic b1)
               (Obj.magic b2) len) in
        res = (FStar_UInt8.uint_to_t (Prims.of_int (255)))
let (mask_select : Lib_IntTypes.inttype -> Obj.t -> Obj.t -> Obj.t -> Obj.t)
  =
  fun t ->
    fun mask ->
      fun a ->
        fun b ->
          Lib_IntTypes.logxor t Lib_IntTypes.SEC b
            (Lib_IntTypes.logand t Lib_IntTypes.SEC mask
               (Lib_IntTypes.logxor t Lib_IntTypes.SEC a b))

let (seq_mask_select :
  Lib_IntTypes.inttype ->
    Prims.nat ->
      (Obj.t, unit) Lib_Sequence.lseq ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun len ->
      fun a ->
        fun b ->
          fun mask ->
            let res =
              Lib_Sequence.map2 len
                (fun a1 ->
                   fun b1 ->
                     Lib_IntTypes.logxor t Lib_IntTypes.SEC b1
                       (Lib_IntTypes.logand t Lib_IntTypes.SEC mask
                          (Lib_IntTypes.logxor t Lib_IntTypes.SEC a1 b1))) a
                b in
            res
let (bytes_empty : FStar_UInt8.t Lib_Sequence.seq) = FStar_Seq_Base.empty ()
let (lbytes_empty : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.create Prims.int_zero (FStar_UInt8.uint_to_t Prims.int_zero)
let rec (nat_from_intseq_be_ :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat)
  =
  fun t ->
    fun l ->
      fun b ->
        let len = Lib_Sequence.length b in
        if len = Prims.int_zero
        then Prims.int_zero
        else
          (let l1 =
             Lib_IntTypes.v t l
               (FStar_Seq_Base.index b (len - Prims.int_one)) in
           let pre =
             FStar_Seq_Base.slice b Prims.int_zero (len - Prims.int_one) in
           let shift = Prims.pow2 (Lib_IntTypes.bits t) in
           let n' = nat_from_intseq_be_ t l pre in l1 + (shift * n'))
let (nat_from_intseq_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat)
  = nat_from_intseq_be_
let rec (nat_from_intseq_le_ :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat)
  =
  fun t ->
    fun l ->
      fun b ->
        let len = Lib_Sequence.length b in
        if len = Prims.int_zero
        then Prims.int_zero
        else
          (let shift = Prims.pow2 (Lib_IntTypes.bits t) in
           let tt = FStar_Seq_Base.slice b Prims.int_one len in
           let n' = nat_from_intseq_le_ t l tt in
           let l1 =
             Lib_IntTypes.v t l (FStar_Seq_Base.index b Prims.int_zero) in
           let n = l1 + (shift * n') in n)
let (nat_from_intseq_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat)
  = nat_from_intseq_le_
let (nat_from_bytes_be :
  Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat) =
  fun l -> fun b -> nat_from_intseq_be_ Lib_IntTypes.U8 l b
let (nat_from_bytes_le :
  Lib_IntTypes.secrecy_level -> Obj.t Lib_Sequence.seq -> Prims.nat) =
  fun l -> fun b -> nat_from_intseq_le_ Lib_IntTypes.U8 l b
let rec (nat_to_intseq_be_ :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun n ->
          if len = Prims.int_zero
          then FStar_Seq_Base.empty ()
          else
            (let len' = len - Prims.int_one in
             let tt =
               Lib_IntTypes.mk_int t l
                 (n mod (Prims.pow2 (Lib_IntTypes.bits t))) in
             let n' = n / (Prims.pow2 (Lib_IntTypes.bits t)) in
             let b' = nat_to_intseq_be_ t l len' n' in
             let b =
               FStar_Seq_Base.append b'
                 (Lib_Sequence.create Prims.int_one tt) in
             b)
let (nat_to_intseq_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  = nat_to_intseq_be_
let rec (nat_to_intseq_le_ :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun n ->
          if len = Prims.int_zero
          then FStar_Seq_Base.empty ()
          else
            (let len' = len - Prims.int_one in
             let tt =
               Lib_IntTypes.mk_int t l
                 (n mod (Prims.pow2 (Lib_IntTypes.bits t))) in
             let n' = n / (Prims.pow2 (Lib_IntTypes.bits t)) in
             let b' = nat_to_intseq_le_ t l len' n' in
             let b =
               FStar_Seq_Base.append (Lib_Sequence.create Prims.int_one tt)
                 b' in
             b)
let (nat_to_intseq_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  = nat_to_intseq_le_






let (nat_to_bytes_be :
  Lib_IntTypes.secrecy_level ->
    Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  = fun l -> fun len -> fun n -> nat_to_intseq_be_ Lib_IntTypes.U8 l len n
let (nat_to_bytes_le :
  Lib_IntTypes.secrecy_level ->
    Prims.nat -> Prims.nat -> Obj.t Lib_Sequence.seq)
  = fun l -> fun len -> fun n -> nat_to_intseq_le_ Lib_IntTypes.U8 l len n
let (uint_to_bytes_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun n ->
        nat_to_intseq_le_ Lib_IntTypes.U8 l (Lib_IntTypes.numbytes t)
          (Lib_IntTypes.v t l n)

let (uint_to_bytes_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> Obj.t -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun n ->
        nat_to_intseq_be_ Lib_IntTypes.U8 l (Lib_IntTypes.numbytes t)
          (Lib_IntTypes.v t l n)

let (uint_from_bytes_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> (Obj.t, unit) Lib_Sequence.lseq -> Obj.t)
  =
  fun t ->
    fun l ->
      fun b ->
        let n = nat_from_intseq_le_ Lib_IntTypes.U8 l b in
        Lib_IntTypes.mk_int t l n
let (uint_from_bytes_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level -> (Obj.t, unit) Lib_Sequence.lseq -> Obj.t)
  =
  fun t ->
    fun l ->
      fun b ->
        let n = nat_from_intseq_be_ Lib_IntTypes.U8 l b in
        Lib_IntTypes.mk_int t l n
let (uints_to_bytes_le_inner :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> unit -> (unit * (Obj.t, unit) Lib_Sequence.lseq))
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          fun i ->
            fun uu___ ->
              ((),
                (nat_to_intseq_le_ Lib_IntTypes.U8 l
                   (Lib_IntTypes.numbytes t)
                   (Lib_IntTypes.v t l (Lib_Sequence.index len b i))))
let (uints_to_bytes_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun ul ->
          let uu___ =
            Lib_Sequence.generate_blocks (Lib_IntTypes.numbytes t) len len ()
              (fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic (uints_to_bytes_le_inner t l len ul)) uu___2
                     uu___1) (Obj.repr ()) in
          match uu___ with | (uu___1, o) -> o

let (uints_to_bytes_be_inner :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq ->
          Prims.nat -> unit -> (unit * (Obj.t, unit) Lib_Sequence.lseq))
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          fun i ->
            fun uu___ ->
              ((),
                (nat_to_intseq_be_ Lib_IntTypes.U8 l
                   (Lib_IntTypes.numbytes t)
                   (Lib_IntTypes.v t l (Lib_Sequence.index len b i))))
let (uints_to_bytes_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun ul ->
          let uu___ =
            Lib_Sequence.generate_blocks (Lib_IntTypes.numbytes t) len len ()
              (fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic (uints_to_bytes_be_inner t l len ul)) uu___2
                     uu___1) (Obj.repr ()) in
          match uu___ with | (uu___1, o) -> o

let (uints_from_bytes_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          Lib_Sequence.createi len
            (fun i ->
               let n =
                 nat_from_intseq_le_ Lib_IntTypes.U8 l
                   (Lib_Sequence.sub (len * (Lib_IntTypes.numbytes t)) b
                      (i * (Lib_IntTypes.numbytes t))
                      (Lib_IntTypes.numbytes t)) in
               Lib_IntTypes.mk_int t l n)

let (uints_from_bytes_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat ->
        (Obj.t, unit) Lib_Sequence.lseq -> (Obj.t, unit) Lib_Sequence.lseq)
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          Lib_Sequence.createi len
            (fun i ->
               let n =
                 nat_from_intseq_be_ Lib_IntTypes.U8 l
                   (Lib_Sequence.sub (len * (Lib_IntTypes.numbytes t)) b
                      (i * (Lib_IntTypes.numbytes t))
                      (Lib_IntTypes.numbytes t)) in
               Lib_IntTypes.mk_int t l n)

let (uint_at_index_le :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> (Obj.t, unit) Lib_Sequence.lseq -> Prims.nat -> Obj.t)
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          fun i ->
            let n =
              nat_from_intseq_le_ Lib_IntTypes.U8 l
                (Lib_Sequence.sub (len * (Lib_IntTypes.numbytes t)) b
                   (i * (Lib_IntTypes.numbytes t)) (Lib_IntTypes.numbytes t)) in
            Lib_IntTypes.mk_int t l n
let (uint_at_index_be :
  Lib_IntTypes.inttype ->
    Lib_IntTypes.secrecy_level ->
      Prims.nat -> (Obj.t, unit) Lib_Sequence.lseq -> Prims.nat -> Obj.t)
  =
  fun t ->
    fun l ->
      fun len ->
        fun b ->
          fun i ->
            let n =
              nat_from_intseq_be_ Lib_IntTypes.U8 l
                (Lib_Sequence.sub (len * (Lib_IntTypes.numbytes t)) b
                   (i * (Lib_IntTypes.numbytes t)) (Lib_IntTypes.numbytes t)) in
            Lib_IntTypes.mk_int t l n














































