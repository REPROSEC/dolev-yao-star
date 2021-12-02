open Prims
let (prime : Prims.pos) =
  let p = (Prims.pow2 (Prims.of_int (130))) - (Prims.of_int (5)) in p
type felem = Prims.nat
let (fadd : felem -> felem -> felem) = fun x -> fun y -> (x + y) mod prime
let (fmul : felem -> felem -> felem) = fun x -> fun y -> (x * y) mod prime
let (to_felem : Prims.nat -> felem) = fun x -> x
let (from_felem : felem -> Prims.nat) = fun x -> x
let (zero : felem) = to_felem Prims.int_zero
let (size_block : Prims.nat) = (Prims.of_int (16))
let (size_key : Prims.nat) = (Prims.of_int (32))
type block = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type tag = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type key = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (poly1305_encode_r : block -> felem) =
  fun rb ->
    let lo =
      let n =
        Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
          (Obj.magic
             (Lib_Sequence.sub size_block rb Prims.int_zero
                (Prims.of_int (8)))) in
      FStar_UInt64.uint_to_t n in
    let hi =
      let n =
        Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8 Lib_IntTypes.SEC
          (Obj.magic
             (Lib_Sequence.sub size_block rb (Prims.of_int (8))
                (Prims.of_int (8)))) in
      FStar_UInt64.uint_to_t n in
    let mask0 = FStar_UInt64.uint_to_t (Prims.parse_int "0x0ffffffc0fffffff") in
    let mask1 = FStar_UInt64.uint_to_t (Prims.parse_int "0x0ffffffc0ffffffc") in
    let lo1 = FStar_UInt64.logand lo mask0 in
    let hi1 = FStar_UInt64.logand hi mask1 in
    to_felem
      (((Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic hi1)) *
          (Prims.pow2 (Prims.of_int (64))))
         + (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC (Obj.magic lo1)))
let (poly1305_init : key -> (felem * felem)) =
  fun k ->
    let r =
      poly1305_encode_r
        (Lib_Sequence.slice size_key k Prims.int_zero (Prims.of_int (16))) in
    (zero, r)
let (encode : Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> felem)
  =
  fun len ->
    fun b ->
      fadd (Prims.pow2 ((Prims.of_int (8)) * len))
        (Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
           Lib_IntTypes.SEC (Obj.magic b))
let (poly1305_update1 :
  felem ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> felem -> felem)
  = fun r -> fun len -> fun b -> fun acc -> fmul (fadd (encode len b) acc) r
let (poly1305_finish : key -> felem -> tag) =
  fun uu___1 ->
    fun uu___ ->
      (fun k ->
         fun acc ->
           let s =
             Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
               Lib_IntTypes.SEC
               (Obj.magic
                  (Lib_Sequence.slice size_key k (Prims.of_int (16))
                     (Prims.of_int (32)))) in
           let n =
             ((from_felem acc) + s) mod (Prims.pow2 (Prims.of_int (128))) in
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Prims.of_int (16)) n)) uu___1 uu___
let (poly1305_update_last :
  felem ->
    Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> felem -> felem)
  =
  fun r ->
    fun l ->
      fun b ->
        fun acc ->
          if l = Prims.int_zero then acc else poly1305_update1 r l b acc
let (poly1305_update :
  FStar_UInt8.t Lib_Sequence.seq -> felem -> felem -> felem) =
  fun text ->
    fun acc ->
      fun r ->
        Lib_Sequence.repeat_blocks size_block text
          (poly1305_update1 r size_block) (poly1305_update_last r) acc
let (poly1305_mac : FStar_UInt8.t Lib_Sequence.seq -> key -> tag) =
  fun msg ->
    fun k ->
      let uu___ = poly1305_init k in
      match uu___ with
      | (acc, r) ->
          let acc1 = poly1305_update msg acc r in poly1305_finish k acc1