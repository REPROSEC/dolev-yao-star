open Prims
let (is_supported_alg : Spec_Hash_Definitions.hash_alg -> Prims.bool) =
  fun uu___ ->
    match uu___ with
    | Spec_Hash_Definitions.SHA1 -> true
    | Spec_Hash_Definitions.SHA2_256 -> true
    | Spec_Hash_Definitions.SHA2_384 -> true
    | Spec_Hash_Definitions.SHA2_512 -> true
    | uu___1 -> false
type supported_alg = Spec_Hash_Definitions.hash_alg
let (reseed_interval : Prims.pos) = Prims.pow2 (Prims.of_int (10))
let (max_output_length : Prims.pos) = Prims.pow2 (Prims.of_int (16))
let (max_length : Prims.pos) = Prims.pow2 (Prims.of_int (16))
let (max_personalization_string_length : Prims.pos) =
  Prims.pow2 (Prims.of_int (16))
let (max_additional_input_length : Prims.pos) =
  Prims.pow2 (Prims.of_int (16))
let (min_length : supported_alg -> Prims.int) =
  fun a ->
    match a with
    | Spec_Hash_Definitions.SHA1 -> (Prims.of_int (16))
    | Spec_Hash_Definitions.SHA2_256 -> (Prims.of_int (32))
    | Spec_Hash_Definitions.SHA2_384 -> (Prims.of_int (32))
    | Spec_Hash_Definitions.SHA2_512 -> (Prims.of_int (32))
type 'a state =
  | State of unit Spec_Agile_HMAC.lbytes * unit Spec_Agile_HMAC.lbytes *
  Prims.nat 
let (uu___is_State : supported_alg -> unit state -> Prims.bool) =
  fun a -> fun projectee -> true
let (__proj__State__item__k :
  supported_alg -> unit state -> unit Spec_Agile_HMAC.lbytes) =
  fun a ->
    fun projectee -> match projectee with | State (k, v, reseed_counter) -> k
let (__proj__State__item__v :
  supported_alg -> unit state -> unit Spec_Agile_HMAC.lbytes) =
  fun a ->
    fun projectee -> match projectee with | State (k, v, reseed_counter) -> v
let (__proj__State__item__reseed_counter :
  supported_alg -> unit state -> Prims.nat) =
  fun a ->
    fun projectee ->
      match projectee with | State (k, v, reseed_counter) -> reseed_counter

let (update :
  supported_alg ->
    Spec_Hash_Definitions.bytes ->
      unit Spec_Agile_HMAC.lbytes ->
        unit Spec_Agile_HMAC.lbytes ->
          (unit Spec_Agile_HMAC.lbytes * unit Spec_Agile_HMAC.lbytes))
  =
  fun a ->
    fun data ->
      fun k ->
        fun v ->
          let zero_data =
            FStar_Seq_Properties.cons (FStar_UInt8.uint_to_t Prims.int_zero)
              data in
          let k1 =
            Spec_Agile_HMAC.hmac a k (FStar_Seq_Base.op_At_Bar v zero_data) in
          let v1 = Spec_Agile_HMAC.hmac a k1 v in
          if (FStar_Seq_Base.length data) = Prims.int_zero
          then (k1, v1)
          else
            (let one_data =
               FStar_Seq_Properties.cons
                 (FStar_UInt8.uint_to_t Prims.int_one) data in
             let k2 =
               Spec_Agile_HMAC.hmac a k1
                 (FStar_Seq_Base.op_At_Bar v1 one_data) in
             let v2 = Spec_Agile_HMAC.hmac a k2 v1 in (k2, v2))
let (instantiate :
  supported_alg ->
    Spec_Hash_Definitions.bytes ->
      Spec_Hash_Definitions.bytes ->
        Spec_Hash_Definitions.bytes -> unit state)
  =
  fun a ->
    fun entropy_input ->
      fun nonce ->
        fun personalization_string ->
          let seed_material =
            FStar_Seq_Base.op_At_Bar entropy_input
              (FStar_Seq_Base.op_At_Bar nonce personalization_string) in
          let k =
            FStar_Seq_Base.create (Spec_Hash_Definitions.hash_length a)
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let v =
            FStar_Seq_Base.create (Spec_Hash_Definitions.hash_length a)
              (FStar_UInt8.uint_to_t Prims.int_one) in
          let uu___ = update a seed_material k v in
          match uu___ with | (k1, v1) -> State (k1, v1, Prims.int_one)
let (reseed :
  supported_alg ->
    unit state ->
      Spec_Hash_Definitions.bytes ->
        Spec_Hash_Definitions.bytes -> unit state)
  =
  fun a ->
    fun st ->
      fun entropy_input ->
        fun additional_input ->
          let seed_material =
            FStar_Seq_Base.op_At_Bar entropy_input additional_input in
          let uu___ =
            update a seed_material (__proj__State__item__k a st)
              (__proj__State__item__v a st) in
          match uu___ with | (k, v) -> State (k, v, Prims.int_one)
type ('a, 'i) a_spec = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (generate_loop :
  supported_alg ->
    unit Spec_Agile_HMAC.lbytes ->
      Prims.nat ->
        Prims.nat ->
          (unit, unit) a_spec ->
            ((unit, unit) a_spec * (FStar_UInt8.t, unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun k ->
      fun max ->
        fun i -> fun vi -> let v = Spec_Agile_HMAC.hmac a k vi in (v, v)
let (generate :
  supported_alg ->
    unit state ->
      Prims.nat ->
        Spec_Hash_Definitions.bytes ->
          (unit Spec_Agile_HMAC.lbytes * unit state)
            FStar_Pervasives_Native.option)
  =
  fun a ->
    fun st ->
      fun n ->
        fun additional_input ->
          if (__proj__State__item__reseed_counter a st) > reseed_interval
          then FStar_Pervasives_Native.None
          else
            (let uu___1 =
               if (FStar_Seq_Base.length additional_input) > Prims.int_zero
               then
                 update a additional_input (__proj__State__item__k a st)
                   (__proj__State__item__v a st)
               else
                 ((__proj__State__item__k a st),
                   (__proj__State__item__v a st)) in
             match uu___1 with
             | (k, v) ->
                 let max = n / (Spec_Hash_Definitions.hash_length a) in
                 let uu___2 =
                   Obj.magic
                     (Lib_Sequence.generate_blocks
                        (Spec_Hash_Definitions.hash_length a) max max ()
                        (fun uu___4 ->
                           fun uu___3 ->
                             (Obj.magic (generate_loop a k max)) uu___4
                               uu___3) (Obj.magic v)) in
                 (match uu___2 with
                  | (v1, output) ->
                      let uu___3 =
                        if (max * (Spec_Hash_Definitions.hash_length a)) < n
                        then
                          let v2 = Spec_Agile_HMAC.hmac a k v1 in
                          (v2,
                            (FStar_Seq_Base.op_At_Bar output
                               (Lib_Sequence.sub
                                  (Spec_Hash_Definitions.hash_length a) v2
                                  Prims.int_zero
                                  (n -
                                     (max *
                                        (Spec_Hash_Definitions.hash_length a))))))
                        else (v1, output) in
                      (match uu___3 with
                       | (v2, output1) ->
                           let uu___4 = update a additional_input k v2 in
                           (match uu___4 with
                            | (k1, v3) ->
                                FStar_Pervasives_Native.Some
                                  (output1,
                                    (State
                                       (k1, v3,
                                         ((__proj__State__item__reseed_counter
                                             a st)
                                            + Prims.int_one))))))))
let (generate' :
  supported_alg ->
    unit state ->
      Prims.nat ->
        Spec_Hash_Definitions.bytes ->
          (unit Spec_Agile_HMAC.lbytes * unit state)
            FStar_Pervasives_Native.option)
  =
  fun a ->
    fun st ->
      fun n ->
        fun additional_input ->
          if (__proj__State__item__reseed_counter a st) > reseed_interval
          then FStar_Pervasives_Native.None
          else
            (let uu___1 =
               if (FStar_Seq_Base.length additional_input) > Prims.int_zero
               then
                 update a additional_input (__proj__State__item__k a st)
                   (__proj__State__item__v a st)
               else
                 ((__proj__State__item__k a st),
                   (__proj__State__item__v a st)) in
             match uu___1 with
             | (k, v) ->
                 let max =
                   ((n + (Spec_Hash_Definitions.hash_length a)) -
                      Prims.int_one)
                     / (Spec_Hash_Definitions.hash_length a) in
                 let uu___2 =
                   Obj.magic
                     (Lib_Sequence.generate_blocks
                        (Spec_Hash_Definitions.hash_length a) max max ()
                        (fun uu___4 ->
                           fun uu___3 ->
                             (Obj.magic (generate_loop a k max)) uu___4
                               uu___3) (Obj.magic v)) in
                 (match uu___2 with
                  | (v1, output) ->
                      let uu___3 = update a additional_input k v1 in
                      (match uu___3 with
                       | (k1, v2) ->
                           FStar_Pervasives_Native.Some
                             ((FStar_Seq_Base.slice output Prims.int_zero n),
                               (State
                                  (k1, v2,
                                    ((__proj__State__item__reseed_counter a
                                        st)
                                       + Prims.int_one)))))))