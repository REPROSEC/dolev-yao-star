open Prims
let (irred : FStar_UInt128.t) =
  FStar_UInt128.uint_to_t
    (Prims.parse_int "0xE1000000000000000000000000000000")
let (gf128 : Spec_GaloisField.field) =
  Spec_GaloisField.gf Lib_IntTypes.U128 (Obj.magic irred)
type elem = Obj.t
let (load_elem : (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t) =
  fun b -> Spec_GaloisField.load_felem_be gf128 b
let (store_elem : Obj.t -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun e -> Spec_GaloisField.store_felem_be gf128 e
let (size_block : Prims.nat) = (Prims.of_int (16))
let (size_key : Prims.nat) = (Prims.of_int (16))
type block = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type tag = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (encode : (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t) =
  fun w -> load_elem w
let (encode_last :
  Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t) =
  fun len ->
    fun w ->
      let b =
        Lib_Sequence.create size_block (FStar_UInt8.uint_to_t Prims.int_zero) in
      let b1 = Lib_Sequence.update_slice size_block b Prims.int_zero len w in
      load_elem b1
let (decode : Obj.t -> block) = fun e -> store_elem e
let (gf128_init : (FStar_UInt8.t, unit) Lib_Sequence.lseq -> (Obj.t * Obj.t))
  = fun h -> let r = load_elem h in ((Spec_GaloisField.zero gf128), r)
let (gf128_update1 :
  Obj.t -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t -> Obj.t) =
  fun r ->
    fun b ->
      fun acc ->
        Spec_GaloisField.fmul_be gf128
          (Spec_GaloisField.fadd gf128 acc (encode b)) r
let (gf128_finish : key -> Obj.t -> tag) =
  fun s -> fun acc -> decode (Spec_GaloisField.fadd gf128 acc (load_elem s))
let (gf128_update_last :
  Obj.t ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Obj.t -> Obj.t)
  =
  fun r ->
    fun l ->
      fun b ->
        fun acc ->
          if l = Prims.int_zero
          then acc
          else
            Spec_GaloisField.fmul_be gf128
              (Spec_GaloisField.fadd gf128 acc (encode_last l b)) r
let (gf128_update :
  FStar_UInt8.t Lib_Sequence.seq -> Obj.t -> Obj.t -> Obj.t) =
  fun text ->
    fun acc ->
      fun r ->
        Lib_Sequence.repeat_blocks size_block text (gf128_update1 r)
          (gf128_update_last r) acc
let (gmul :
  FStar_UInt8.t Lib_Sequence.seq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq -> tag)
  =
  fun text ->
    fun h ->
      let uu___ = gf128_init h in
      match uu___ with
      | (acc, r) -> let acc1 = gf128_update text acc r in decode acc1
let (gmac :
  FStar_UInt8.t Lib_Sequence.seq ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq -> key -> tag)
  =
  fun text ->
    fun h ->
      fun k ->
        let uu___ = gf128_init h in
        match uu___ with
        | (acc, r) ->
            let acc1 = gf128_update text acc r in gf128_finish k acc1