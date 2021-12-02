open Prims
let (size_publickey : Prims.int) = (Prims.of_int (32))
let (size_secretkey : Prims.int) = (Prims.of_int (32))
type publickey = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type secretkey = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (ecdh :
  publickey -> secretkey -> secretkey FStar_Pervasives_Native.option) =
  fun pk ->
    fun sk ->
      let shared = Spec_Curve25519.scalarmult sk pk in
      if
        Prims.op_Negation
          (let res =
             Obj.magic
               (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8
                  (Prims.of_int (32)) (Prims.of_int (32)) (Obj.magic shared)
                  (Obj.magic
                     (Lib_Sequence.create (Prims.of_int (32))
                        (FStar_UInt8.uint_to_t Prims.int_zero)))
                  (Prims.of_int (32))) in
           res = (FStar_UInt8.uint_to_t (Prims.of_int (255))))
      then FStar_Pervasives_Native.Some shared
      else FStar_Pervasives_Native.None
let (box_beforenm :
  publickey -> secretkey -> Spec_SecretBox.key FStar_Pervasives_Native.option)
  =
  fun pk ->
    fun sk ->
      let shared = ecdh pk sk in
      match shared with
      | FStar_Pervasives_Native.Some shared1 ->
          FStar_Pervasives_Native.Some
            (Spec_Salsa20.hsalsa20 shared1
               (Lib_Sequence.create (Prims.of_int (16))
                  (FStar_UInt8.uint_to_t Prims.int_zero)))
      | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (box_detached_afternm :
  Spec_SecretBox.key ->
    Spec_SecretBox.nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        (Spec_SecretBox.tag * FStar_UInt8.t Lib_Sequence.seq))
  = fun k -> fun n -> fun m -> Spec_SecretBox.secretbox_detached k n m
let (box_detached :
  secretkey ->
    publickey ->
      Spec_SecretBox.nonce ->
        FStar_UInt8.t Lib_Sequence.seq ->
          (Spec_SecretBox.tag * FStar_UInt8.t Lib_Sequence.seq)
            FStar_Pervasives_Native.option)
  =
  fun sk ->
    fun pk ->
      fun n ->
        fun m ->
          let k = box_beforenm pk sk in
          match k with
          | FStar_Pervasives_Native.Some k1 ->
              FStar_Pervasives_Native.Some (box_detached_afternm k1 n m)
          | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (box_open_detached_afternm :
  Spec_SecretBox.key ->
    Spec_SecretBox.nonce ->
      Spec_SecretBox.tag ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n -> fun t -> fun c -> Spec_SecretBox.secretbox_open_detached k n t c
let (box_open_detached :
  publickey ->
    secretkey ->
      Spec_SecretBox.nonce ->
        Spec_SecretBox.tag ->
          FStar_UInt8.t Lib_Sequence.seq ->
            FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun pk ->
    fun sk ->
      fun n ->
        fun t ->
          fun c ->
            let k = box_beforenm pk sk in
            match k with
            | FStar_Pervasives_Native.Some k1 ->
                box_open_detached_afternm k1 n t c
            | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (box_easy_afternm :
  Spec_SecretBox.key ->
    Spec_SecretBox.nonce ->
      FStar_UInt8.t Lib_Sequence.seq -> FStar_UInt8.t Lib_Sequence.seq)
  =
  fun k ->
    fun n ->
      fun m ->
        let uu___ = box_detached_afternm k n m in
        match uu___ with | (tg, c) -> FStar_Seq_Base.append tg c
let (box_easy :
  secretkey ->
    publickey ->
      Spec_SecretBox.nonce ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun sk ->
    fun pk ->
      fun n ->
        fun m ->
          let r = box_detached sk pk n m in
          match r with
          | FStar_Pervasives_Native.Some (tg, c) ->
              FStar_Pervasives_Native.Some (FStar_Seq_Base.append tg c)
          | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (box_open_easy_afternm :
  Spec_SecretBox.key ->
    Spec_SecretBox.nonce ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun k ->
    fun n ->
      fun c ->
        let tg =
          FStar_Seq_Base.slice c Prims.int_zero Spec_SecretBox.size_tag in
        let e =
          FStar_Seq_Base.slice c Spec_SecretBox.size_tag
            (Lib_Sequence.length c) in
        box_open_detached_afternm k n tg e
let (box_open_easy :
  secretkey ->
    publickey ->
      Spec_SecretBox.nonce ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun pk ->
    fun sk ->
      fun n ->
        fun c ->
          let tg =
            FStar_Seq_Base.slice c Prims.int_zero Spec_SecretBox.size_tag in
          let e =
            FStar_Seq_Base.slice c Spec_SecretBox.size_tag
              (Lib_Sequence.length c) in
          box_open_detached pk sk n tg e