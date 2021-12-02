open Prims
let (counter_mode :
  Spec_Agile_Cipher.cipher_alg ->
    Obj.t ->
      unit Spec_Agile_Cipher.nonce ->
        FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun a ->
    fun k ->
      fun n ->
        fun plain ->
          let stream =
            Spec_Agile_Cipher.ctr_stream a k n (Lib_Sequence.length plain) in
          Lib_Sequence.map2 (Lib_Sequence.length plain)
            (fun a1 -> fun b -> FStar_UInt8.logxor a1 b) plain stream