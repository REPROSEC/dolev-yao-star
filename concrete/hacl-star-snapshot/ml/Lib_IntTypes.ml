open Prims




type inttype =
  | U1 
  | U8 
  | U16 
  | U32 
  | U64 
  | U128 
  | S8 
  | S16 
  | S32 
  | S64 
  | S128 
let (uu___is_U1 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U1 -> true | uu___ -> false
let (uu___is_U8 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U8 -> true | uu___ -> false
let (uu___is_U16 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U16 -> true | uu___ -> false
let (uu___is_U32 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U32 -> true | uu___ -> false
let (uu___is_U64 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U64 -> true | uu___ -> false
let (uu___is_U128 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | U128 -> true | uu___ -> false
let (uu___is_S8 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | S8 -> true | uu___ -> false
let (uu___is_S16 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | S16 -> true | uu___ -> false
let (uu___is_S32 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | S32 -> true | uu___ -> false
let (uu___is_S64 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | S64 -> true | uu___ -> false
let (uu___is_S128 : inttype -> Prims.bool) =
  fun projectee -> match projectee with | S128 -> true | uu___ -> false
let (unsigned : inttype -> Prims.bool) =
  fun uu___ ->
    match uu___ with
    | U1 -> true
    | U8 -> true
    | U16 -> true
    | U32 -> true
    | U64 -> true
    | U128 -> true
    | uu___1 -> false
let (signed : inttype -> Prims.bool) =
  fun uu___ ->
    match uu___ with
    | S8 -> true
    | S16 -> true
    | S32 -> true
    | S64 -> true
    | S128 -> true
    | uu___1 -> false
let (numbytes : inttype -> Prims.int) =
  fun uu___ ->
    match uu___ with
    | U1 -> Prims.int_one
    | U8 -> Prims.int_one
    | S8 -> Prims.int_one
    | U16 -> (Prims.of_int (2))
    | S16 -> (Prims.of_int (2))
    | U32 -> (Prims.of_int (4))
    | S32 -> (Prims.of_int (4))
    | U64 -> (Prims.of_int (8))
    | S64 -> (Prims.of_int (8))
    | U128 -> (Prims.of_int (16))
    | S128 -> (Prims.of_int (16))
let (bits : inttype -> Prims.int) =
  fun uu___ ->
    match uu___ with
    | U1 -> Prims.int_one
    | U8 -> (Prims.of_int (8))
    | S8 -> (Prims.of_int (8))
    | U16 -> (Prims.of_int (16))
    | S16 -> (Prims.of_int (16))
    | U32 -> (Prims.of_int (32))
    | S32 -> (Prims.of_int (32))
    | U64 -> (Prims.of_int (64))
    | S64 -> (Prims.of_int (64))
    | U128 -> (Prims.of_int (128))
    | S128 -> (Prims.of_int (128))

let (modulus : inttype -> Prims.pos) = fun t -> Prims.pow2 (bits t)
let (maxint : inttype -> Prims.int) =
  fun t ->
    if unsigned t
    then (Prims.pow2 (bits t)) - Prims.int_one
    else (Prims.pow2 ((bits t) - Prims.int_one)) - Prims.int_one
let (minint : inttype -> Prims.int) =
  fun t ->
    if unsigned t
    then Prims.int_zero
    else - (Prims.pow2 ((bits t) - Prims.int_one))
type ('n, 't) range = unit
type 't range_t = Prims.int
type 'uuuuu pub_int_t = Obj.t
let (pub_int_v : inttype -> Obj.t -> Prims.int) =
  fun t ->
    fun x ->
      match t with
      | U1 -> FStar_UInt8.v (Obj.magic x)
      | U8 -> FStar_UInt8.v (Obj.magic x)
      | U16 -> FStar_UInt16.v (Obj.magic x)
      | U32 -> FStar_UInt32.v (Obj.magic x)
      | U64 -> FStar_UInt64.v (Obj.magic x)
      | U128 -> FStar_UInt128.v (Obj.magic x)
      | S8 -> FStar_Int8.v (Obj.magic x)
      | S16 -> FStar_Int16.v (Obj.magic x)
      | S32 -> FStar_Int32.v (Obj.magic x)
      | S64 -> FStar_Int64.v (Obj.magic x)
      | S128 -> FStar_Int128.v (Obj.magic x)
type secrecy_level =
  | SEC 
  | PUB 
let (uu___is_SEC : secrecy_level -> Prims.bool) =
  fun projectee -> match projectee with | SEC -> true | uu___ -> false
let (uu___is_PUB : secrecy_level -> Prims.bool) =
  fun projectee -> match projectee with | PUB -> true | uu___ -> false
type 't sec_int_t = Obj.t
let (sec_int_v : inttype -> Obj.t -> Prims.int) =
  fun t -> fun u -> pub_int_v t u
type ('t, 'l) int_t = Obj.t
let (v : inttype -> secrecy_level -> Obj.t -> Prims.int) =
  fun t ->
    fun l ->
      fun u -> match l with | PUB -> pub_int_v t u | SEC -> sec_int_v t u
type ('t, 'l) uint_t = Obj.t
type ('t, 'l) sint_t = Obj.t
let (uint_v : inttype -> secrecy_level -> Obj.t -> Prims.int) =
  fun t -> fun l -> fun u -> v t l u
let (sint_v : inttype -> secrecy_level -> Obj.t -> Prims.int) =
  fun t -> fun l -> fun u -> v t l u
type uint1 = FStar_UInt8.t
type uint8 = FStar_UInt8.t
type int8 = FStar_Int8.t
type uint16 = FStar_UInt16.t
type int16 = FStar_Int16.t
type uint32 = FStar_UInt32.t
type int32 = FStar_Int32.t
type uint64 = FStar_UInt64.t
type int64 = FStar_Int64.t
type uint128 = FStar_UInt128.t
type int128 = FStar_Int128.t
type bit_t = FStar_UInt8.t
type byte_t = FStar_UInt8.t
type size_t = FStar_UInt32.t
type size128_t = FStar_UInt128.t
type pub_uint8 = FStar_UInt8.t
type pub_int8 = FStar_Int8.t
type pub_uint16 = FStar_UInt16.t
type pub_int16 = FStar_Int16.t
type pub_uint32 = FStar_UInt32.t
type pub_int32 = FStar_Int32.t
type pub_uint64 = FStar_UInt64.t
type pub_int64 = FStar_Int64.t
type pub_uint128 = FStar_UInt128.t
type pub_int128 = FStar_Int128.t
let (secret : inttype -> Obj.t -> Obj.t) = fun t -> fun x -> x
let (mk_int : inttype -> secrecy_level -> Prims.int -> Obj.t) =
  fun t ->
    fun l ->
      fun x ->
        match t with
        | U1 -> Obj.repr (FStar_UInt8.uint_to_t x)
        | U8 -> Obj.repr (FStar_UInt8.uint_to_t x)
        | U16 -> Obj.repr (FStar_UInt16.uint_to_t x)
        | U32 -> Obj.repr (FStar_UInt32.uint_to_t x)
        | U64 -> Obj.repr (FStar_UInt64.uint_to_t x)
        | U128 -> Obj.repr (FStar_UInt128.uint_to_t x)
        | S8 -> Obj.repr (FStar_Int8.int_to_t x)
        | S16 -> Obj.repr (FStar_Int16.int_to_t x)
        | S32 -> Obj.repr (FStar_Int32.int_to_t x)
        | S64 -> Obj.repr (FStar_Int64.int_to_t x)
        | S128 -> Obj.repr (FStar_Int128.int_to_t x)
let (uint : inttype -> secrecy_level -> Prims.int -> Obj.t) =
  fun t -> fun l -> fun n -> mk_int t l n
let (sint : inttype -> secrecy_level -> Prims.int -> Obj.t) =
  fun t -> fun l -> fun n -> mk_int t l n



let (u1 : Prims.int -> FStar_UInt8.t) = fun n -> FStar_UInt8.uint_to_t n
let (u8 : Prims.int -> FStar_UInt8.t) = fun n -> FStar_UInt8.uint_to_t n
let (i8 : Prims.int -> FStar_Int8.t) = fun n -> FStar_Int8.int_to_t n
let (u16 : Prims.int -> FStar_UInt16.t) = fun n -> FStar_UInt16.uint_to_t n
let (i16 : Prims.int -> FStar_Int16.t) = fun n -> FStar_Int16.int_to_t n
let (u32 : Prims.int -> FStar_UInt32.t) = fun n -> FStar_UInt32.uint_to_t n
let (i32 : Prims.int -> FStar_Int32.t) = fun n -> FStar_Int32.int_to_t n
let (u64 : Prims.int -> FStar_UInt64.t) = fun n -> FStar_UInt64.uint_to_t n
let (i64 : Prims.int -> FStar_Int64.t) = fun n -> FStar_Int64.int_to_t n
let (u128 : Prims.int -> FStar_UInt128.t) =
  fun n -> FStar_UInt128.uint64_to_uint128 (FStar_UInt64.uint_to_t n)
let (i128 : Prims.int -> FStar_Int128.t) = fun n -> FStar_Int128.int_to_t n
let (max_size_t : Prims.int) =
  (Prims.pow2 (Prims.of_int (32))) - Prims.int_one
type size_nat = Prims.nat
type size_pos = Prims.pos
let (size : Prims.nat -> FStar_UInt32.t) = fun n -> FStar_UInt32.uint_to_t n
let (size_v : FStar_UInt32.t -> Prims.int) = fun s -> v U32 PUB (Obj.magic s)
let (byte : Prims.nat -> FStar_UInt8.t) = fun n -> FStar_UInt8.uint_to_t n
let (byte_v : FStar_UInt8.t -> Prims.nat) = fun s -> v U8 PUB (Obj.magic s)
let (size_to_uint32 : FStar_UInt32.t -> FStar_UInt32.t) = fun x -> x
let (size_to_uint64 : FStar_UInt32.t -> FStar_UInt64.t) =
  fun x -> FStar_Int_Cast.uint32_to_uint64 x
let (byte_to_uint8 : FStar_UInt8.t -> FStar_UInt8.t) = fun x -> x
let (op_At_Percent_Dot : Prims.int -> inttype -> Prims.int) =
  fun x ->
    fun t ->
      if unsigned t
      then x mod (Prims.pow2 (bits t))
      else FStar_Int.op_At_Percent x (Prims.pow2 (bits t))
let (byte_to_int8 : FStar_UInt8.t -> FStar_Int8.t) =
  fun x -> FStar_Int_Cast.uint8_to_int8 x
let (op_At_Percent : Prims.int -> Prims.int -> Prims.int) =
  FStar_Int.op_At_Percent
let (uint128_to_int128 : FStar_UInt128.t -> FStar_Int128.t) =
  fun a -> failwith "Not yet implemented:uint128_to_int128"
let (int128_to_uint128 : FStar_Int128.t -> FStar_UInt128.t) =
  fun a -> failwith "Not yet implemented:int128_to_uint128"
let (int64_to_int128 : FStar_Int64.t -> FStar_Int128.t) =
  fun a -> failwith "Not yet implemented:int64_to_int128"
let (uint64_to_int128 : FStar_UInt64.t -> FStar_Int128.t) =
  fun a -> uint128_to_int128 (FStar_UInt128.uint64_to_uint128 a)
let (int64_to_uint128 : FStar_Int64.t -> FStar_UInt128.t) =
  fun a -> int128_to_uint128 (int64_to_int128 a)
let (int128_to_uint64 : FStar_Int128.t -> FStar_UInt64.t) =
  fun a -> FStar_UInt128.uint128_to_uint64 (int128_to_uint128 a)
let (cast :
  inttype -> secrecy_level -> inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun t' ->
        fun l' ->
          fun u ->
            match (t, t') with
            | (U1, U1) -> Obj.repr u
            | (U1, U8) -> Obj.repr u
            | (U1, U16) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint16 (Obj.magic u))
            | (U1, U32) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint32 (Obj.magic u))
            | (U1, U64) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u))
            | (U1, U128) ->
                Obj.repr
                  (FStar_UInt128.uint64_to_uint128
                     (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u)))
            | (U1, S8) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int8 (Obj.magic u))
            | (U1, S16) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int16 (Obj.magic u))
            | (U1, S32) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int32 (Obj.magic u))
            | (U1, S64) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int64 (Obj.magic u))
            | (U1, S128) ->
                Obj.repr
                  (uint64_to_int128
                     (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u)))
            | (U8, U1) ->
                Obj.repr
                  (FStar_UInt8.rem (Obj.magic u)
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (U8, U8) -> Obj.repr u
            | (U8, U16) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint16 (Obj.magic u))
            | (U8, U32) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint32 (Obj.magic u))
            | (U8, U64) ->
                Obj.repr (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u))
            | (U8, U128) ->
                Obj.repr
                  (FStar_UInt128.uint64_to_uint128
                     (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u)))
            | (U8, S8) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int8 (Obj.magic u))
            | (U8, S16) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int16 (Obj.magic u))
            | (U8, S32) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int32 (Obj.magic u))
            | (U8, S64) ->
                Obj.repr (FStar_Int_Cast.uint8_to_int64 (Obj.magic u))
            | (U8, S128) ->
                Obj.repr
                  (uint64_to_int128
                     (FStar_Int_Cast.uint8_to_uint64 (Obj.magic u)))
            | (U16, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.uint16_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (U16, U8) ->
                Obj.repr (FStar_Int_Cast.uint16_to_uint8 (Obj.magic u))
            | (U16, U16) -> Obj.repr u
            | (U16, U32) ->
                Obj.repr (FStar_Int_Cast.uint16_to_uint32 (Obj.magic u))
            | (U16, U64) ->
                Obj.repr (FStar_Int_Cast.uint16_to_uint64 (Obj.magic u))
            | (U16, U128) ->
                Obj.repr
                  (FStar_UInt128.uint64_to_uint128
                     (FStar_Int_Cast.uint16_to_uint64 (Obj.magic u)))
            | (U16, S8) ->
                Obj.repr (FStar_Int_Cast.uint16_to_int8 (Obj.magic u))
            | (U16, S16) ->
                Obj.repr (FStar_Int_Cast.uint16_to_int16 (Obj.magic u))
            | (U16, S32) ->
                Obj.repr (FStar_Int_Cast.uint16_to_int32 (Obj.magic u))
            | (U16, S64) ->
                Obj.repr (FStar_Int_Cast.uint16_to_int64 (Obj.magic u))
            | (U16, S128) ->
                Obj.repr
                  (uint64_to_int128
                     (FStar_Int_Cast.uint16_to_uint64 (Obj.magic u)))
            | (U32, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.uint32_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (U32, U8) ->
                Obj.repr (FStar_Int_Cast.uint32_to_uint8 (Obj.magic u))
            | (U32, U16) ->
                Obj.repr (FStar_Int_Cast.uint32_to_uint16 (Obj.magic u))
            | (U32, U32) -> Obj.repr u
            | (U32, U64) ->
                Obj.repr (FStar_Int_Cast.uint32_to_uint64 (Obj.magic u))
            | (U32, U128) ->
                Obj.repr
                  (FStar_UInt128.uint64_to_uint128
                     (FStar_Int_Cast.uint32_to_uint64 (Obj.magic u)))
            | (U32, S8) ->
                Obj.repr (FStar_Int_Cast.uint32_to_int8 (Obj.magic u))
            | (U32, S16) ->
                Obj.repr (FStar_Int_Cast.uint32_to_int16 (Obj.magic u))
            | (U32, S32) ->
                Obj.repr (FStar_Int_Cast.uint32_to_int32 (Obj.magic u))
            | (U32, S64) ->
                Obj.repr (FStar_Int_Cast.uint32_to_int64 (Obj.magic u))
            | (U32, S128) ->
                Obj.repr
                  (uint64_to_int128
                     (FStar_Int_Cast.uint32_to_uint64 (Obj.magic u)))
            | (U64, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.uint64_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (U64, U8) ->
                Obj.repr (FStar_Int_Cast.uint64_to_uint8 (Obj.magic u))
            | (U64, U16) ->
                Obj.repr (FStar_Int_Cast.uint64_to_uint16 (Obj.magic u))
            | (U64, U32) ->
                Obj.repr (FStar_Int_Cast.uint64_to_uint32 (Obj.magic u))
            | (U64, U64) -> Obj.repr u
            | (U64, U128) ->
                Obj.repr (FStar_UInt128.uint64_to_uint128 (Obj.magic u))
            | (U64, S8) ->
                Obj.repr (FStar_Int_Cast.uint64_to_int8 (Obj.magic u))
            | (U64, S16) ->
                Obj.repr (FStar_Int_Cast.uint64_to_int16 (Obj.magic u))
            | (U64, S32) ->
                Obj.repr (FStar_Int_Cast.uint64_to_int32 (Obj.magic u))
            | (U64, S64) ->
                Obj.repr (FStar_Int_Cast.uint64_to_int64 (Obj.magic u))
            | (U64, S128) -> Obj.repr (uint64_to_int128 (Obj.magic u))
            | (U128, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.uint64_to_uint8
                        (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (U128, U8) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint8
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, U16) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint16
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, U32) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint32
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, U64) ->
                Obj.repr (FStar_UInt128.uint128_to_uint64 (Obj.magic u))
            | (U128, U128) -> Obj.repr u
            | (U128, S8) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int8
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, S16) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int16
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, S32) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int32
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, S64) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int64
                     (FStar_UInt128.uint128_to_uint64 (Obj.magic u)))
            | (U128, S128) -> Obj.repr (uint128_to_int128 (Obj.magic u))
            | (S8, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.int8_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (S8, U8) ->
                Obj.repr (FStar_Int_Cast.int8_to_uint8 (Obj.magic u))
            | (S8, U16) ->
                Obj.repr (FStar_Int_Cast.int8_to_uint16 (Obj.magic u))
            | (S8, U32) ->
                Obj.repr (FStar_Int_Cast.int8_to_uint32 (Obj.magic u))
            | (S8, U64) ->
                Obj.repr (FStar_Int_Cast.int8_to_uint64 (Obj.magic u))
            | (S8, U128) ->
                Obj.repr
                  (int64_to_uint128
                     (FStar_Int_Cast.int8_to_int64 (Obj.magic u)))
            | (S8, S8) -> Obj.repr u
            | (S8, S16) ->
                Obj.repr (FStar_Int_Cast.int8_to_int16 (Obj.magic u))
            | (S8, S32) ->
                Obj.repr (FStar_Int_Cast.int8_to_int32 (Obj.magic u))
            | (S8, S64) ->
                Obj.repr (FStar_Int_Cast.int8_to_int64 (Obj.magic u))
            | (S8, S128) ->
                Obj.repr
                  (int64_to_int128
                     (FStar_Int_Cast.int8_to_int64 (Obj.magic u)))
            | (S16, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.int16_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (S16, U8) ->
                Obj.repr (FStar_Int_Cast.int16_to_uint8 (Obj.magic u))
            | (S16, U16) ->
                Obj.repr (FStar_Int_Cast.int16_to_uint16 (Obj.magic u))
            | (S16, U32) ->
                Obj.repr (FStar_Int_Cast.int16_to_uint32 (Obj.magic u))
            | (S16, U64) ->
                Obj.repr (FStar_Int_Cast.int16_to_uint64 (Obj.magic u))
            | (S16, U128) ->
                Obj.repr
                  (int64_to_uint128
                     (FStar_Int_Cast.int16_to_int64 (Obj.magic u)))
            | (S16, S8) ->
                Obj.repr (FStar_Int_Cast.int16_to_int8 (Obj.magic u))
            | (S16, S16) -> Obj.repr u
            | (S16, S32) ->
                Obj.repr (FStar_Int_Cast.int16_to_int32 (Obj.magic u))
            | (S16, S64) ->
                Obj.repr (FStar_Int_Cast.int16_to_int64 (Obj.magic u))
            | (S16, S128) ->
                Obj.repr
                  (int64_to_int128
                     (FStar_Int_Cast.int16_to_int64 (Obj.magic u)))
            | (S32, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.int32_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (S32, U8) ->
                Obj.repr (FStar_Int_Cast.int32_to_uint8 (Obj.magic u))
            | (S32, U16) ->
                Obj.repr (FStar_Int_Cast.int32_to_uint16 (Obj.magic u))
            | (S32, U32) ->
                Obj.repr (FStar_Int_Cast.int32_to_uint32 (Obj.magic u))
            | (S32, U64) ->
                Obj.repr (FStar_Int_Cast.int32_to_uint64 (Obj.magic u))
            | (S32, U128) ->
                Obj.repr
                  (int64_to_uint128
                     (FStar_Int_Cast.int32_to_int64 (Obj.magic u)))
            | (S32, S8) ->
                Obj.repr (FStar_Int_Cast.int32_to_int8 (Obj.magic u))
            | (S32, S16) ->
                Obj.repr (FStar_Int_Cast.int32_to_int16 (Obj.magic u))
            | (S32, S32) -> Obj.repr u
            | (S32, S64) ->
                Obj.repr (FStar_Int_Cast.int32_to_int64 (Obj.magic u))
            | (S32, S128) ->
                Obj.repr
                  (int64_to_int128
                     (FStar_Int_Cast.int32_to_int64 (Obj.magic u)))
            | (S64, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.int64_to_uint8 (Obj.magic u))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (S64, U8) ->
                Obj.repr (FStar_Int_Cast.int64_to_uint8 (Obj.magic u))
            | (S64, U16) ->
                Obj.repr (FStar_Int_Cast.int64_to_uint16 (Obj.magic u))
            | (S64, U32) ->
                Obj.repr (FStar_Int_Cast.int64_to_uint32 (Obj.magic u))
            | (S64, U64) ->
                Obj.repr (FStar_Int_Cast.int64_to_uint64 (Obj.magic u))
            | (S64, U128) -> Obj.repr (int64_to_uint128 (Obj.magic u))
            | (S64, S8) ->
                Obj.repr (FStar_Int_Cast.int64_to_int8 (Obj.magic u))
            | (S64, S16) ->
                Obj.repr (FStar_Int_Cast.int64_to_int16 (Obj.magic u))
            | (S64, S32) ->
                Obj.repr (FStar_Int_Cast.int64_to_int32 (Obj.magic u))
            | (S64, S64) -> Obj.repr u
            | (S64, S128) -> Obj.repr (int64_to_int128 (Obj.magic u))
            | (S128, U1) ->
                Obj.repr
                  (FStar_UInt8.rem
                     (FStar_Int_Cast.uint64_to_uint8
                        (int128_to_uint64 (Obj.magic u)))
                     (FStar_UInt8.uint_to_t (Prims.of_int (2))))
            | (S128, U8) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint8
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, U16) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint16
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, U32) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_uint32
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, U64) -> Obj.repr (int128_to_uint64 (Obj.magic u))
            | (S128, U128) -> Obj.repr (int128_to_uint128 (Obj.magic u))
            | (S128, S8) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int8
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, S16) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int16
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, S32) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int32
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, S64) ->
                Obj.repr
                  (FStar_Int_Cast.uint64_to_int64
                     (int128_to_uint64 (Obj.magic u)))
            | (S128, S128) -> Obj.repr u
let (to_u1 : inttype -> secrecy_level -> Obj.t -> FStar_UInt8.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U1 SEC u)) uu___2
          uu___1 uu___
let (to_u8 : inttype -> secrecy_level -> Obj.t -> FStar_UInt8.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U8 SEC u)) uu___2
          uu___1 uu___
let (to_i8 : inttype -> secrecy_level -> Obj.t -> FStar_Int8.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l S8 SEC u)) uu___2
          uu___1 uu___
let (to_u16 : inttype -> secrecy_level -> Obj.t -> FStar_UInt16.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U16 SEC u)) uu___2
          uu___1 uu___
let (to_i16 : inttype -> secrecy_level -> Obj.t -> FStar_Int16.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l S16 SEC u)) uu___2
          uu___1 uu___
let (to_u32 : inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U32 SEC u)) uu___2
          uu___1 uu___
let (to_i32 : inttype -> secrecy_level -> Obj.t -> FStar_Int32.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l S32 SEC u)) uu___2
          uu___1 uu___
let (to_u64 : inttype -> secrecy_level -> Obj.t -> FStar_UInt64.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U64 SEC u)) uu___2
          uu___1 uu___
let (to_i64 : inttype -> secrecy_level -> Obj.t -> FStar_Int64.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l S64 SEC u)) uu___2
          uu___1 uu___
let (to_u128 : inttype -> secrecy_level -> Obj.t -> FStar_UInt128.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l U128 SEC u)) uu___2
          uu___1 uu___
let (to_i128 : inttype -> secrecy_level -> Obj.t -> FStar_Int128.t) =
  fun uu___2 ->
    fun uu___1 ->
      fun uu___ ->
        (fun t -> fun l -> fun u -> Obj.magic (cast t l S128 SEC u)) uu___2
          uu___1 uu___
let (ones_v : inttype -> Prims.int) =
  fun t ->
    match t with
    | U1 -> maxint t
    | U8 -> maxint t
    | U16 -> maxint t
    | U32 -> maxint t
    | U64 -> maxint t
    | U128 -> maxint t
    | S8 -> (Prims.of_int (-1))
    | S16 -> (Prims.of_int (-1))
    | S32 -> (Prims.of_int (-1))
    | S64 -> (Prims.of_int (-1))
    | S128 -> (Prims.of_int (-1))
let (ones : inttype -> secrecy_level -> Obj.t) =
  fun t ->
    fun l ->
      match t with
      | U1 -> Obj.repr (FStar_UInt8.uint_to_t Prims.int_one)
      | U8 -> Obj.repr (FStar_UInt8.uint_to_t (Prims.of_int (0xFF)))
      | U16 -> Obj.repr (FStar_UInt16.uint_to_t (Prims.parse_int "0xFFFF"))
      | U32 ->
          Obj.repr (FStar_UInt32.uint_to_t (Prims.parse_int "0xFFFFFFFF"))
      | U64 ->
          Obj.repr
            (FStar_UInt64.uint_to_t (Prims.parse_int "0xFFFFFFFFFFFFFFFF"))
      | U128 ->
          Obj.repr
            (let x =
               FStar_UInt128.uint64_to_uint128
                 (FStar_UInt64.uint_to_t
                    (Prims.parse_int "0xFFFFFFFFFFFFFFFF")) in
             let y =
               FStar_UInt128.add
                 (FStar_UInt128.shift_left x
                    (FStar_UInt32.uint_to_t (Prims.of_int (64)))) x in
             y)
      | uu___ -> Obj.repr (mk_int t l (Prims.of_int (-1)))
let (zeros : inttype -> secrecy_level -> Obj.t) =
  fun t -> fun l -> mk_int t l Prims.int_zero
let (add_mod : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 ->
              Obj.repr
                (FStar_UInt8.rem
                   (FStar_UInt8.add_mod (Obj.magic a) (Obj.magic b))
                   (FStar_UInt8.uint_to_t (Prims.of_int (2))))
          | U8 -> Obj.repr (FStar_UInt8.add_mod (Obj.magic a) (Obj.magic b))
          | U16 ->
              Obj.repr (FStar_UInt16.add_mod (Obj.magic a) (Obj.magic b))
          | U32 ->
              Obj.repr (FStar_UInt32.add_mod (Obj.magic a) (Obj.magic b))
          | U64 ->
              Obj.repr (FStar_UInt64.add_mod (Obj.magic a) (Obj.magic b))
          | U128 ->
              Obj.repr (FStar_UInt128.add_mod (Obj.magic a) (Obj.magic b))

let (add : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.add (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.add (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.add (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.add (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.add (Obj.magic a) (Obj.magic b))
          | U128 -> Obj.repr (FStar_UInt128.add (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.add (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.add (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.add (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.add (Obj.magic a) (Obj.magic b))
          | S128 -> Obj.repr (FStar_Int128.add (Obj.magic a) (Obj.magic b))

let (incr : inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        match t with
        | U1 ->
            Obj.repr
              (FStar_UInt8.add (Obj.magic a)
                 (FStar_UInt8.uint_to_t Prims.int_one))
        | U8 ->
            Obj.repr
              (FStar_UInt8.add (Obj.magic a)
                 (FStar_UInt8.uint_to_t Prims.int_one))
        | U16 ->
            Obj.repr
              (FStar_UInt16.add (Obj.magic a)
                 (FStar_UInt16.uint_to_t Prims.int_one))
        | U32 ->
            Obj.repr
              (FStar_UInt32.add (Obj.magic a)
                 (FStar_UInt32.uint_to_t Prims.int_one))
        | U64 ->
            Obj.repr
              (FStar_UInt64.add (Obj.magic a)
                 (FStar_UInt64.uint_to_t Prims.int_one))
        | U128 ->
            Obj.repr
              (FStar_UInt128.add (Obj.magic a)
                 (FStar_UInt128.uint_to_t Prims.int_one))
        | S8 ->
            Obj.repr
              (FStar_Int8.add (Obj.magic a)
                 (FStar_Int8.int_to_t Prims.int_one))
        | S16 ->
            Obj.repr
              (FStar_Int16.add (Obj.magic a)
                 (FStar_Int16.int_to_t Prims.int_one))
        | S32 ->
            Obj.repr
              (FStar_Int32.add (Obj.magic a)
                 (FStar_Int32.int_to_t Prims.int_one))
        | S64 ->
            Obj.repr
              (FStar_Int64.add (Obj.magic a)
                 (FStar_Int64.int_to_t Prims.int_one))
        | S128 ->
            Obj.repr
              (FStar_Int128.add (Obj.magic a)
                 (FStar_Int128.int_to_t Prims.int_one))

let (mul_mod : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.mul_mod (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.mul_mod (Obj.magic a) (Obj.magic b))
          | U16 ->
              Obj.repr (FStar_UInt16.mul_mod (Obj.magic a) (Obj.magic b))
          | U32 ->
              Obj.repr (FStar_UInt32.mul_mod (Obj.magic a) (Obj.magic b))
          | U64 ->
              Obj.repr (FStar_UInt64.mul_mod (Obj.magic a) (Obj.magic b))

let (mul : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.mul (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.mul (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.mul (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.mul (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.mul (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.mul (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.mul (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.mul (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.mul (Obj.magic a) (Obj.magic b))

let (mul64_wide : FStar_UInt64.t -> FStar_UInt64.t -> FStar_UInt128.t) =
  fun a -> fun b -> FStar_UInt128.mul_wide a b

let (mul_s64_wide : FStar_Int64.t -> FStar_Int64.t -> FStar_Int128.t) =
  fun a -> fun b -> FStar_Int128.mul_wide a b

let (sub_mod : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 ->
              Obj.repr
                (FStar_UInt8.rem
                   (FStar_UInt8.sub_mod (Obj.magic a) (Obj.magic b))
                   (FStar_UInt8.uint_to_t (Prims.of_int (2))))
          | U8 -> Obj.repr (FStar_UInt8.sub_mod (Obj.magic a) (Obj.magic b))
          | U16 ->
              Obj.repr (FStar_UInt16.sub_mod (Obj.magic a) (Obj.magic b))
          | U32 ->
              Obj.repr (FStar_UInt32.sub_mod (Obj.magic a) (Obj.magic b))
          | U64 ->
              Obj.repr (FStar_UInt64.sub_mod (Obj.magic a) (Obj.magic b))
          | U128 ->
              Obj.repr (FStar_UInt128.sub_mod (Obj.magic a) (Obj.magic b))

let (sub : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.sub (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.sub (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.sub (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.sub (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.sub (Obj.magic a) (Obj.magic b))
          | U128 -> Obj.repr (FStar_UInt128.sub (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.sub (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.sub (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.sub (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.sub (Obj.magic a) (Obj.magic b))
          | S128 -> Obj.repr (FStar_Int128.sub (Obj.magic a) (Obj.magic b))

let (decr : inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        match t with
        | U1 ->
            Obj.repr
              (FStar_UInt8.sub (Obj.magic a)
                 (FStar_UInt8.uint_to_t Prims.int_one))
        | U8 ->
            Obj.repr
              (FStar_UInt8.sub (Obj.magic a)
                 (FStar_UInt8.uint_to_t Prims.int_one))
        | U16 ->
            Obj.repr
              (FStar_UInt16.sub (Obj.magic a)
                 (FStar_UInt16.uint_to_t Prims.int_one))
        | U32 ->
            Obj.repr
              (FStar_UInt32.sub (Obj.magic a)
                 (FStar_UInt32.uint_to_t Prims.int_one))
        | U64 ->
            Obj.repr
              (FStar_UInt64.sub (Obj.magic a)
                 (FStar_UInt64.uint_to_t Prims.int_one))
        | U128 ->
            Obj.repr
              (FStar_UInt128.sub (Obj.magic a)
                 (FStar_UInt128.uint_to_t Prims.int_one))
        | S8 ->
            Obj.repr
              (FStar_Int8.sub (Obj.magic a)
                 (FStar_Int8.int_to_t Prims.int_one))
        | S16 ->
            Obj.repr
              (FStar_Int16.sub (Obj.magic a)
                 (FStar_Int16.int_to_t Prims.int_one))
        | S32 ->
            Obj.repr
              (FStar_Int32.sub (Obj.magic a)
                 (FStar_Int32.int_to_t Prims.int_one))
        | S64 ->
            Obj.repr
              (FStar_Int64.sub (Obj.magic a)
                 (FStar_Int64.int_to_t Prims.int_one))
        | S128 ->
            Obj.repr
              (FStar_Int128.sub (Obj.magic a)
                 (FStar_Int128.int_to_t Prims.int_one))

let (logxor : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.logxor (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.logxor (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.logxor (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.logxor (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.logxor (Obj.magic a) (Obj.magic b))
          | U128 ->
              Obj.repr (FStar_UInt128.logxor (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.logxor (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.logxor (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.logxor (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.logxor (Obj.magic a) (Obj.magic b))
          | S128 ->
              Obj.repr (FStar_Int128.logxor (Obj.magic a) (Obj.magic b))



let (logxor_v : inttype -> Prims.int -> Prims.int -> Prims.int) =
  fun t ->
    fun a ->
      fun b ->
        match t with
        | S8 -> FStar_Int.logxor (bits t) a b
        | S16 -> FStar_Int.logxor (bits t) a b
        | S32 -> FStar_Int.logxor (bits t) a b
        | S64 -> FStar_Int.logxor (bits t) a b
        | S128 -> FStar_Int.logxor (bits t) a b
        | uu___ -> FStar_UInt.logxor (bits t) a b

let (logand : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.logand (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.logand (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.logand (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.logand (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.logand (Obj.magic a) (Obj.magic b))
          | U128 ->
              Obj.repr (FStar_UInt128.logand (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.logand (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.logand (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.logand (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.logand (Obj.magic a) (Obj.magic b))
          | S128 ->
              Obj.repr (FStar_Int128.logand (Obj.magic a) (Obj.magic b))



let (logand_v : inttype -> Prims.int -> Prims.int -> Prims.int) =
  fun t ->
    fun a ->
      fun b ->
        match t with
        | S8 -> FStar_Int.logand (bits t) a b
        | S16 -> FStar_Int.logand (bits t) a b
        | S32 -> FStar_Int.logand (bits t) a b
        | S64 -> FStar_Int.logand (bits t) a b
        | S128 -> FStar_Int.logand (bits t) a b
        | uu___ -> FStar_UInt.logand (bits t) a b



let (logor : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.logor (Obj.magic a) (Obj.magic b))
          | U8 -> Obj.repr (FStar_UInt8.logor (Obj.magic a) (Obj.magic b))
          | U16 -> Obj.repr (FStar_UInt16.logor (Obj.magic a) (Obj.magic b))
          | U32 -> Obj.repr (FStar_UInt32.logor (Obj.magic a) (Obj.magic b))
          | U64 -> Obj.repr (FStar_UInt64.logor (Obj.magic a) (Obj.magic b))
          | U128 ->
              Obj.repr (FStar_UInt128.logor (Obj.magic a) (Obj.magic b))
          | S8 -> Obj.repr (FStar_Int8.logor (Obj.magic a) (Obj.magic b))
          | S16 -> Obj.repr (FStar_Int16.logor (Obj.magic a) (Obj.magic b))
          | S32 -> Obj.repr (FStar_Int32.logor (Obj.magic a) (Obj.magic b))
          | S64 -> Obj.repr (FStar_Int64.logor (Obj.magic a) (Obj.magic b))
          | S128 -> Obj.repr (FStar_Int128.logor (Obj.magic a) (Obj.magic b))




let (logor_v : inttype -> Prims.int -> Prims.int -> Prims.int) =
  fun t ->
    fun a ->
      fun b ->
        match t with
        | S8 -> FStar_Int.logor (bits t) a b
        | S16 -> FStar_Int.logor (bits t) a b
        | S32 -> FStar_Int.logor (bits t) a b
        | S64 -> FStar_Int.logor (bits t) a b
        | S128 -> FStar_Int.logor (bits t) a b
        | uu___ -> FStar_UInt.logor (bits t) a b

let (lognot : inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        match t with
        | U1 ->
            Obj.repr
              (FStar_UInt8.rem (FStar_UInt8.lognot (Obj.magic a))
                 (FStar_UInt8.uint_to_t (Prims.of_int (2))))
        | U8 -> Obj.repr (FStar_UInt8.lognot (Obj.magic a))
        | U16 -> Obj.repr (FStar_UInt16.lognot (Obj.magic a))
        | U32 -> Obj.repr (FStar_UInt32.lognot (Obj.magic a))
        | U64 -> Obj.repr (FStar_UInt64.lognot (Obj.magic a))
        | U128 -> Obj.repr (FStar_UInt128.lognot (Obj.magic a))
        | S8 -> Obj.repr (FStar_Int8.lognot (Obj.magic a))
        | S16 -> Obj.repr (FStar_Int16.lognot (Obj.magic a))
        | S32 -> Obj.repr (FStar_Int32.lognot (Obj.magic a))
        | S64 -> Obj.repr (FStar_Int64.lognot (Obj.magic a))
        | S128 -> Obj.repr (FStar_Int128.lognot (Obj.magic a))

let (lognot_v : inttype -> Prims.int -> Prims.int) =
  fun t ->
    fun a ->
      match t with
      | S8 -> FStar_Int.lognot (bits t) a
      | S16 -> FStar_Int.lognot (bits t) a
      | S32 -> FStar_Int.lognot (bits t) a
      | S64 -> FStar_Int.lognot (bits t) a
      | S128 -> FStar_Int.lognot (bits t) a
      | uu___ -> FStar_UInt.lognot (bits t) a

type 't shiftval = FStar_UInt32.t
type 't rotval = FStar_UInt32.t
let (shift_right :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.shift_right (Obj.magic a) b)
          | U8 -> Obj.repr (FStar_UInt8.shift_right (Obj.magic a) b)
          | U16 -> Obj.repr (FStar_UInt16.shift_right (Obj.magic a) b)
          | U32 -> Obj.repr (FStar_UInt32.shift_right (Obj.magic a) b)
          | U64 -> Obj.repr (FStar_UInt64.shift_right (Obj.magic a) b)
          | U128 -> Obj.repr (FStar_UInt128.shift_right (Obj.magic a) b)
          | S8 ->
              Obj.repr (FStar_Int8.shift_arithmetic_right (Obj.magic a) b)
          | S16 ->
              Obj.repr (FStar_Int16.shift_arithmetic_right (Obj.magic a) b)
          | S32 ->
              Obj.repr (FStar_Int32.shift_arithmetic_right (Obj.magic a) b)
          | S64 ->
              Obj.repr (FStar_Int64.shift_arithmetic_right (Obj.magic a) b)
          | S128 ->
              Obj.repr (FStar_Int128.shift_arithmetic_right (Obj.magic a) b)




let (shift_left :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          match t with
          | U1 -> Obj.repr (FStar_UInt8.shift_left (Obj.magic a) b)
          | U8 -> Obj.repr (FStar_UInt8.shift_left (Obj.magic a) b)
          | U16 -> Obj.repr (FStar_UInt16.shift_left (Obj.magic a) b)
          | U32 -> Obj.repr (FStar_UInt32.shift_left (Obj.magic a) b)
          | U64 -> Obj.repr (FStar_UInt64.shift_left (Obj.magic a) b)
          | U128 -> Obj.repr (FStar_UInt128.shift_left (Obj.magic a) b)
          | S8 -> Obj.repr (FStar_Int8.shift_left (Obj.magic a) b)
          | S16 -> Obj.repr (FStar_Int16.shift_left (Obj.magic a) b)
          | S32 -> Obj.repr (FStar_Int32.shift_left (Obj.magic a) b)
          | S64 -> Obj.repr (FStar_Int64.shift_left (Obj.magic a) b)
          | S128 -> Obj.repr (FStar_Int128.shift_left (Obj.magic a) b)

let (rotate_right :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          logor t l (shift_right t l a b)
            (shift_left t l a
               (FStar_UInt32.sub (FStar_UInt32.uint_to_t (bits t)) b))
let (rotate_left :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        fun b ->
          logor t l (shift_left t l a b)
            (shift_right t l a
               (FStar_UInt32.sub (FStar_UInt32.uint_to_t (bits t)) b))
let (shift_right_i :
  inttype -> secrecy_level -> FStar_UInt32.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> fun s -> fun u -> shift_right t l u s
let (shift_left_i :
  inttype -> secrecy_level -> FStar_UInt32.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> fun s -> fun u -> shift_left t l u s
let (rotate_right_i :
  inttype -> secrecy_level -> FStar_UInt32.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> fun s -> fun u -> rotate_right t l u s
let (rotate_left_i :
  inttype -> secrecy_level -> FStar_UInt32.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> fun s -> fun u -> rotate_left t l u s
let (ct_abs : inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun a ->
        match t with
        | S8 ->
            Obj.repr
              (let mask =
                 FStar_Int8.shift_arithmetic_right (Obj.magic a)
                   (FStar_UInt32.uint_to_t (Prims.of_int (7))) in
               FStar_Int8.sub (FStar_Int8.logxor (Obj.magic a) mask) mask)
        | S16 ->
            Obj.repr
              (let mask =
                 FStar_Int16.shift_arithmetic_right (Obj.magic a)
                   (FStar_UInt32.uint_to_t (Prims.of_int (15))) in
               FStar_Int16.sub (FStar_Int16.logxor (Obj.magic a) mask) mask)
        | S32 ->
            Obj.repr
              (let mask =
                 FStar_Int32.shift_arithmetic_right (Obj.magic a)
                   (FStar_UInt32.uint_to_t (Prims.of_int (31))) in
               FStar_Int32.sub (FStar_Int32.logxor (Obj.magic a) mask) mask)
        | S64 ->
            Obj.repr
              (let mask =
                 FStar_Int64.shift_arithmetic_right (Obj.magic a)
                   (FStar_UInt32.uint_to_t (Prims.of_int (63))) in
               FStar_Int64.sub (FStar_Int64.logxor (Obj.magic a) mask) mask)
let (eq_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun a ->
      fun b ->
        match t with
        | U1 -> Obj.repr (lognot t SEC (logxor t SEC a b))
        | U8 -> Obj.repr (FStar_UInt8.eq_mask (Obj.magic a) (Obj.magic b))
        | U16 -> Obj.repr (FStar_UInt16.eq_mask (Obj.magic a) (Obj.magic b))
        | U32 -> Obj.repr (FStar_UInt32.eq_mask (Obj.magic a) (Obj.magic b))
        | U64 -> Obj.repr (FStar_UInt64.eq_mask (Obj.magic a) (Obj.magic b))
        | U128 ->
            Obj.repr (FStar_UInt128.eq_mask (Obj.magic a) (Obj.magic b))
        | S8 ->
            Obj.repr
              (FStar_Int_Cast.uint8_to_int8
                 (FStar_UInt8.eq_mask (to_u8 t SEC a) (to_u8 t SEC b)))
        | S16 ->
            Obj.repr
              (FStar_Int_Cast.uint16_to_int16
                 (FStar_UInt16.eq_mask (to_u16 t SEC a) (to_u16 t SEC b)))
        | S32 ->
            Obj.repr
              (FStar_Int_Cast.uint32_to_int32
                 (FStar_UInt32.eq_mask (to_u32 t SEC a) (to_u32 t SEC b)))
        | S64 ->
            Obj.repr
              (FStar_Int_Cast.uint64_to_int64
                 (FStar_UInt64.eq_mask (to_u64 t SEC a) (to_u64 t SEC b)))




let (neq_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun a -> fun b -> lognot t SEC (eq_mask t a b)

let (gte_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun a ->
      fun b ->
        match t with
        | U1 -> Obj.repr (logor t SEC a (lognot t SEC b))
        | U8 -> Obj.repr (FStar_UInt8.gte_mask (Obj.magic a) (Obj.magic b))
        | U16 -> Obj.repr (FStar_UInt16.gte_mask (Obj.magic a) (Obj.magic b))
        | U32 -> Obj.repr (FStar_UInt32.gte_mask (Obj.magic a) (Obj.magic b))
        | U64 -> Obj.repr (FStar_UInt64.gte_mask (Obj.magic a) (Obj.magic b))
        | U128 ->
            Obj.repr (FStar_UInt128.gte_mask (Obj.magic a) (Obj.magic b))


let (lt_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun a -> fun b -> lognot t SEC (gte_mask t a b)

let (gt_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun a -> fun b -> logand t SEC (gte_mask t a b) (neq_mask t a b)

let (lte_mask : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun a -> fun b -> logor t SEC (lt_mask t a b) (eq_mask t a b)

let (mod_mask : inttype -> secrecy_level -> FStar_UInt32.t -> Obj.t) =
  fun t ->
    fun l ->
      fun m ->
        sub t l (shift_left t l (mk_int t l Prims.int_one) m)
          (mk_int t l Prims.int_one)


let (conditional_subtract :
  inttype -> secrecy_level -> inttype -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun t' ->
        fun a ->
          let pow2_bits =
            shift_left t l (mk_int t l Prims.int_one)
              (FStar_UInt32.uint_to_t (bits t')) in
          let pow2_bits_minus_one =
            shift_left t l (mk_int t l Prims.int_one)
              (FStar_UInt32.uint_to_t ((bits t') - Prims.int_one)) in
          let a2 = sub t l a pow2_bits_minus_one in
          let mask =
            shift_right t l a2
              (FStar_UInt32.uint_to_t ((bits t) - Prims.int_one)) in
          let a3 = sub t l a pow2_bits in
          add t l a3 (logand t l mask pow2_bits)
let (cast_mod :
  inttype -> secrecy_level -> inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t ->
    fun l ->
      fun t' ->
        fun l' ->
          fun a ->
            if (bits t') >= (bits t)
            then cast t l t' l' a
            else
              (let m = FStar_UInt32.uint_to_t (bits t') in
               let b =
                 let pow2_bits =
                   shift_left t l (mk_int t l Prims.int_one)
                     (FStar_UInt32.uint_to_t (bits t')) in
                 let pow2_bits_minus_one =
                   shift_left t l (mk_int t l Prims.int_one)
                     (FStar_UInt32.uint_to_t ((bits t') - Prims.int_one)) in
                 let a2 =
                   sub t l (logand t l a (mod_mask t l m))
                     pow2_bits_minus_one in
                 let mask =
                   shift_right t l a2
                     (FStar_UInt32.uint_to_t ((bits t) - Prims.int_one)) in
                 let a3 = sub t l (logand t l a (mod_mask t l m)) pow2_bits in
                 add t l a3 (logand t l mask pow2_bits) in
               cast t l t' l' b)
let (op_Plus_Bang : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> add t l
let (op_Plus_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> add_mod t l
let (op_Star_Bang : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> mul t l
let (op_Star_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> mul_mod t l
let (op_Subtraction_Bang :
  inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> sub t l
let (op_Subtraction_Dot :
  inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> sub_mod t l
let (op_Greater_Greater_Dot :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t -> fun l -> shift_right t l
let (op_Less_Less_Dot :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t -> fun l -> shift_left t l
let (op_Greater_Greater_Greater_Dot :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t -> fun l -> rotate_right t l
let (op_Less_Less_Less_Dot :
  inttype -> secrecy_level -> Obj.t -> FStar_UInt32.t -> Obj.t) =
  fun t -> fun l -> rotate_left t l
let (op_Hat_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> logxor t l
let (op_Bar_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> logor t l
let (op_Amp_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t -> Obj.t) =
  fun t -> fun l -> logand t l
let (op_Tilde_Dot : inttype -> secrecy_level -> Obj.t -> Obj.t) =
  fun t -> fun l -> lognot t l
let (div : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> Obj.repr (FStar_UInt8.div (Obj.magic x) (Obj.magic y))
        | U8 -> Obj.repr (FStar_UInt8.div (Obj.magic x) (Obj.magic y))
        | U16 -> Obj.repr (FStar_UInt16.div (Obj.magic x) (Obj.magic y))
        | U32 -> Obj.repr (FStar_UInt32.div (Obj.magic x) (Obj.magic y))
        | U64 -> Obj.repr (FStar_UInt64.div (Obj.magic x) (Obj.magic y))
        | S8 -> Obj.repr (FStar_Int8.div (Obj.magic x) (Obj.magic y))
        | S16 -> Obj.repr (FStar_Int16.div (Obj.magic x) (Obj.magic y))
        | S32 -> Obj.repr (FStar_Int32.div (Obj.magic x) (Obj.magic y))
        | S64 -> Obj.repr (FStar_Int64.div (Obj.magic x) (Obj.magic y))

let (mod1 : inttype -> Obj.t -> Obj.t -> Obj.t) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> Obj.repr (FStar_UInt8.rem (Obj.magic x) (Obj.magic y))
        | U8 -> Obj.repr (FStar_UInt8.rem (Obj.magic x) (Obj.magic y))
        | U16 -> Obj.repr (FStar_UInt16.rem (Obj.magic x) (Obj.magic y))
        | U32 -> Obj.repr (FStar_UInt32.rem (Obj.magic x) (Obj.magic y))
        | U64 -> Obj.repr (FStar_UInt64.rem (Obj.magic x) (Obj.magic y))
        | S8 -> Obj.repr (FStar_Int8.rem (Obj.magic x) (Obj.magic y))
        | S16 -> Obj.repr (FStar_Int16.rem (Obj.magic x) (Obj.magic y))
        | S32 -> Obj.repr (FStar_Int32.rem (Obj.magic x) (Obj.magic y))
        | S64 -> Obj.repr (FStar_Int64.rem (Obj.magic x) (Obj.magic y))

let (eq : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> FStar_UInt8.eq (Obj.magic x) (Obj.magic y)
        | U8 -> FStar_UInt8.eq (Obj.magic x) (Obj.magic y)
        | U16 -> FStar_UInt16.eq (Obj.magic x) (Obj.magic y)
        | U32 -> FStar_UInt32.eq (Obj.magic x) (Obj.magic y)
        | U64 -> FStar_UInt64.eq (Obj.magic x) (Obj.magic y)
        | U128 -> FStar_UInt128.eq (Obj.magic x) (Obj.magic y)
        | S8 -> FStar_Int8.eq (Obj.magic x) (Obj.magic y)
        | S16 -> FStar_Int16.eq (Obj.magic x) (Obj.magic y)
        | S32 -> FStar_Int32.eq (Obj.magic x) (Obj.magic y)
        | S64 -> FStar_Int64.eq (Obj.magic x) (Obj.magic y)
        | S128 -> FStar_Int128.eq (Obj.magic x) (Obj.magic y)

let (ne : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t -> fun x -> fun y -> Prims.op_Negation (eq t x y)

let (lt : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> FStar_UInt8.lt (Obj.magic x) (Obj.magic y)
        | U8 -> FStar_UInt8.lt (Obj.magic x) (Obj.magic y)
        | U16 -> FStar_UInt16.lt (Obj.magic x) (Obj.magic y)
        | U32 -> FStar_UInt32.lt (Obj.magic x) (Obj.magic y)
        | U64 -> FStar_UInt64.lt (Obj.magic x) (Obj.magic y)
        | U128 -> FStar_UInt128.lt (Obj.magic x) (Obj.magic y)
        | S8 -> FStar_Int8.lt (Obj.magic x) (Obj.magic y)
        | S16 -> FStar_Int16.lt (Obj.magic x) (Obj.magic y)
        | S32 -> FStar_Int32.lt (Obj.magic x) (Obj.magic y)
        | S64 -> FStar_Int64.lt (Obj.magic x) (Obj.magic y)
        | S128 -> FStar_Int128.lt (Obj.magic x) (Obj.magic y)

let (lte : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> FStar_UInt8.lte (Obj.magic x) (Obj.magic y)
        | U8 -> FStar_UInt8.lte (Obj.magic x) (Obj.magic y)
        | U16 -> FStar_UInt16.lte (Obj.magic x) (Obj.magic y)
        | U32 -> FStar_UInt32.lte (Obj.magic x) (Obj.magic y)
        | U64 -> FStar_UInt64.lte (Obj.magic x) (Obj.magic y)
        | U128 -> FStar_UInt128.lte (Obj.magic x) (Obj.magic y)
        | S8 -> FStar_Int8.lte (Obj.magic x) (Obj.magic y)
        | S16 -> FStar_Int16.lte (Obj.magic x) (Obj.magic y)
        | S32 -> FStar_Int32.lte (Obj.magic x) (Obj.magic y)
        | S64 -> FStar_Int64.lte (Obj.magic x) (Obj.magic y)
        | S128 -> FStar_Int128.lte (Obj.magic x) (Obj.magic y)

let (gt : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> FStar_UInt8.gt (Obj.magic x) (Obj.magic y)
        | U8 -> FStar_UInt8.gt (Obj.magic x) (Obj.magic y)
        | U16 -> FStar_UInt16.gt (Obj.magic x) (Obj.magic y)
        | U32 -> FStar_UInt32.gt (Obj.magic x) (Obj.magic y)
        | U64 -> FStar_UInt64.gt (Obj.magic x) (Obj.magic y)
        | U128 -> FStar_UInt128.gt (Obj.magic x) (Obj.magic y)
        | S8 -> FStar_Int8.gt (Obj.magic x) (Obj.magic y)
        | S16 -> FStar_Int16.gt (Obj.magic x) (Obj.magic y)
        | S32 -> FStar_Int32.gt (Obj.magic x) (Obj.magic y)
        | S64 -> FStar_Int64.gt (Obj.magic x) (Obj.magic y)
        | S128 -> FStar_Int128.gt (Obj.magic x) (Obj.magic y)

let (gte : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t ->
    fun x ->
      fun y ->
        match t with
        | U1 -> FStar_UInt8.gte (Obj.magic x) (Obj.magic y)
        | U8 -> FStar_UInt8.gte (Obj.magic x) (Obj.magic y)
        | U16 -> FStar_UInt16.gte (Obj.magic x) (Obj.magic y)
        | U32 -> FStar_UInt32.gte (Obj.magic x) (Obj.magic y)
        | U64 -> FStar_UInt64.gte (Obj.magic x) (Obj.magic y)
        | U128 -> FStar_UInt128.gte (Obj.magic x) (Obj.magic y)
        | S8 -> FStar_Int8.gte (Obj.magic x) (Obj.magic y)
        | S16 -> FStar_Int16.gte (Obj.magic x) (Obj.magic y)
        | S32 -> FStar_Int32.gte (Obj.magic x) (Obj.magic y)
        | S64 -> FStar_Int64.gte (Obj.magic x) (Obj.magic y)
        | S128 -> FStar_Int128.gte (Obj.magic x) (Obj.magic y)

let (op_Slash_Dot : inttype -> Obj.t -> Obj.t -> Obj.t) = fun t -> div t
let (op_Percent_Dot : inttype -> Obj.t -> Obj.t -> Obj.t) = fun t -> mod1 t
let (op_Equals_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) = fun t -> eq t
let (op_Less_Greater_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t -> ne t
let (op_Less_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) = fun t -> lt t
let (op_Less_Equals_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t -> lte t
let (op_Greater_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t -> gt t
let (op_Greater_Equals_Dot : inttype -> Obj.t -> Obj.t -> Prims.bool) =
  fun t -> gte t