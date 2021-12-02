open Prims
type 'l lbytes = Spec_Hash_Definitions.bytes
type ('a, 'l) keysized = unit
let (wrap :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes -> unit lbytes)
  =
  fun a ->
    fun key ->
      let key0 =
        if
          (FStar_Seq_Base.length key) <=
            (Spec_Hash_Definitions.block_length a)
        then key
        else Spec_Agile_Hash.hash a key in
      let paddingLength =
        (Spec_Hash_Definitions.block_length a) - (FStar_Seq_Base.length key0) in
      FStar_Seq_Base.append key0
        (FStar_Seq_Base.create paddingLength
           (FStar_UInt8.uint_to_t Prims.int_zero))
let (xor : FStar_UInt8.t -> Spec_Hash_Definitions.bytes -> unit lbytes) =
  fun x -> fun v -> Spec_Loops.seq_map (fun b -> FStar_UInt8.logxor x b) v

let (hmac :
  Spec_Hash_Definitions.hash_alg ->
    Spec_Hash_Definitions.bytes -> Spec_Hash_Definitions.bytes -> unit lbytes)
  =
  fun a ->
    fun key ->
      fun data ->
        let k = wrap a key in
        let h1 =
          Spec_Agile_Hash.hash a
            (FStar_Seq_Base.append
               (xor (FStar_UInt8.uint_to_t (Prims.of_int (0x36))) k) data) in
        let h2 =
          Spec_Agile_Hash.hash a
            (FStar_Seq_Base.append
               (xor (FStar_UInt8.uint_to_t (Prims.of_int (0x5c))) k) h1) in
        h2