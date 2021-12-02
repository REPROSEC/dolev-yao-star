open Prims
type algorithm =
  | DH_Curve25519 
  | DH_P256 
let (uu___is_DH_Curve25519 : algorithm -> Prims.bool) =
  fun projectee ->
    match projectee with | DH_Curve25519 -> true | uu___ -> false
let (uu___is_DH_P256 : algorithm -> Prims.bool) =
  fun projectee -> match projectee with | DH_P256 -> true | uu___ -> false
let (size_key : algorithm -> Prims.nat) =
  fun a ->
    match a with
    | DH_Curve25519 -> (Prims.of_int (32))
    | DH_P256 -> (Prims.of_int (32))
let (size_public : algorithm -> Prims.nat) =
  fun a ->
    match a with
    | DH_Curve25519 -> (Prims.of_int (32))
    | DH_P256 -> (Prims.of_int (64))
let (prime : algorithm -> Prims.pos) =
  fun a ->
    match a with
    | DH_Curve25519 -> Spec_Curve25519.prime
    | DH_P256 -> Spec_P256.prime
type 'a scalar = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'a serialized_point = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (clamp : algorithm -> unit scalar -> unit scalar) =
  fun a ->
    fun k -> match a with | DH_Curve25519 -> Spec_Curve25519.decodeScalar k
let (dh :
  algorithm ->
    unit scalar ->
      unit serialized_point ->
        unit serialized_point FStar_Pervasives_Native.option)
  =
  fun a ->
    fun s ->
      fun p ->
        let uu___ =
          match a with
          | DH_Curve25519 ->
              let output = Spec_Curve25519.scalarmult s p in
              ((Prims.op_Negation
                  (let res =
                     Obj.magic
                       (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8
                          (match a with
                           | DH_Curve25519 -> (Prims.of_int (32))
                           | DH_P256 -> (Prims.of_int (64)))
                          (match a with
                           | DH_Curve25519 -> (Prims.of_int (32))
                           | DH_P256 -> (Prims.of_int (64)))
                          (Obj.magic
                             (Lib_Sequence.create
                                (match a with
                                 | DH_Curve25519 -> (Prims.of_int (32))
                                 | DH_P256 -> (Prims.of_int (64)))
                                (FStar_UInt8.uint_to_t Prims.int_zero)))
                          (Obj.magic output)
                          (match a with
                           | DH_Curve25519 -> (Prims.of_int (32))
                           | DH_P256 -> (Prims.of_int (64)))) in
                   res = (FStar_UInt8.uint_to_t (Prims.of_int (255))))),
                output)
          | DH_P256 ->
              let uu___1 =
                Spec_DH.ecp256_dh_r
                  (Lib_Sequence.sub
                     (match a with
                      | DH_Curve25519 -> (Prims.of_int (32))
                      | DH_P256 -> (Prims.of_int (64))) p Prims.int_zero
                     (Prims.of_int (32)))
                  (Lib_Sequence.sub
                     (match a with
                      | DH_Curve25519 -> (Prims.of_int (32))
                      | DH_P256 -> (Prims.of_int (64))) p (Prims.of_int (32))
                     (Prims.of_int (32))) s in
              (match uu___1 with
               | (xN, yN, res) ->
                   (res,
                     (Lib_Sequence.op_At_Bar (Prims.of_int (32))
                        (Prims.of_int (32)) xN yN))) in
        match uu___ with
        | (result, output) ->
            let uu___1 = uu___ in
            if result
            then FStar_Pervasives_Native.Some output
            else FStar_Pervasives_Native.None
let (secret_to_public :
  algorithm ->
    unit scalar -> unit serialized_point FStar_Pervasives_Native.option)
  =
  fun a ->
    fun kpriv ->
      match a with
      | DH_Curve25519 ->
          FStar_Pervasives_Native.Some
            (Spec_Curve25519.secret_to_public kpriv)
      | DH_P256 ->
          let uu___ = Spec_DH.ecp256_dh_i kpriv in
          (match uu___ with
           | (xN, yN, res) ->
               if res
               then
                 FStar_Pervasives_Native.Some
                   (Lib_Sequence.op_At_Bar (Prims.of_int (32))
                      (Prims.of_int (32)) xN yN)
               else FStar_Pervasives_Native.None)