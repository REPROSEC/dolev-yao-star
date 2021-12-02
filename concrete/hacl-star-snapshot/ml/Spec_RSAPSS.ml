open Prims
let (blocks : Prims.pos -> Prims.pos -> Prims.pos) =
  fun x -> fun m -> ((x - Prims.int_one) / m) + Prims.int_one
let (xor_bytes :
  Prims.pos ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun len ->
    fun b1 ->
      fun b2 ->
        Lib_Sequence.map2 len (fun x -> fun y -> FStar_UInt8.logxor x y) b1
          b2
let (hash_is_supported : Spec_Hash_Definitions.algorithm -> Prims.bool) =
  fun a ->
    match a with
    | Spec_Hash_Definitions.SHA2_256 -> true
    | Spec_Hash_Definitions.SHA2_384 -> true
    | Spec_Hash_Definitions.SHA2_512 -> true
    | uu___ -> false
let (mgf_hash_f :
  Spec_Hash_Definitions.algorithm ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, 
            unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun len ->
      fun i ->
        fun mgfseed_counter ->
          let counter =
            Obj.magic
              (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                 Lib_IntTypes.SEC (Prims.of_int (4)) i) in
          let mgfseed_counter1 =
            Lib_Sequence.update_sub (len + (Prims.of_int (4)))
              mgfseed_counter len (Prims.of_int (4)) counter in
          let block = Spec_Agile_Hash.hash a mgfseed_counter1 in
          (mgfseed_counter1, block)
type ('len, 'n, 'i) mgf_hash_a = (FStar_UInt8.t, unit) Lib_Sequence.lseq
let (mgf_hash :
  Spec_Hash_Definitions.algorithm ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.pos -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun len ->
      fun mgfseed ->
        fun maskLen ->
          let mgfseed_counter =
            Lib_Sequence.create (len + (Prims.of_int (4)))
              (FStar_UInt8.uint_to_t Prims.int_zero) in
          let mgfseed_counter1 =
            Lib_Sequence.update_sub (len + (Prims.of_int (4)))
              mgfseed_counter Prims.int_zero len mgfseed in
          let hLen = Spec_Hash_Definitions.hash_length a in
          let n = blocks maskLen hLen in
          let uu___ =
            Obj.magic
              (Lib_Sequence.generate_blocks hLen n n ()
                 (fun uu___2 ->
                    fun uu___1 ->
                      (Obj.magic (mgf_hash_f a len)) uu___2 uu___1)
                 (Obj.magic mgfseed_counter1)) in
          match uu___ with
          | (uu___1, acc) ->
              Lib_Sequence.sub (n * hLen) acc Prims.int_zero maskLen
let (os2ip :
  Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.nat) =
  fun len ->
    fun b ->
      Lib_ByteSequence.nat_from_intseq_be_ Lib_IntTypes.U8 Lib_IntTypes.SEC
        (Obj.magic b)
let (i2osp :
  Prims.nat -> Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun uu___1 ->
    fun uu___ ->
      (fun len ->
         fun n ->
           Obj.magic
             (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                Lib_IntTypes.SEC len n)) uu___1 uu___
type modBits_t = Prims.nat
type 'modBits rsapss_pkey =
  | Mk_rsapss_pkey of Prims.pos * Prims.pos 
let (uu___is_Mk_rsapss_pkey : modBits_t -> unit rsapss_pkey -> Prims.bool) =
  fun modBits -> fun projectee -> true
let (__proj__Mk_rsapss_pkey__item__n :
  modBits_t -> unit rsapss_pkey -> Prims.pos) =
  fun modBits ->
    fun projectee -> match projectee with | Mk_rsapss_pkey (n, e) -> n
let (__proj__Mk_rsapss_pkey__item__e :
  modBits_t -> unit rsapss_pkey -> Prims.pos) =
  fun modBits ->
    fun projectee -> match projectee with | Mk_rsapss_pkey (n, e) -> e
type 'modBits rsapss_skey =
  | Mk_rsapss_skey of unit rsapss_pkey * Prims.pos 
let (uu___is_Mk_rsapss_skey : modBits_t -> unit rsapss_skey -> Prims.bool) =
  fun modBits -> fun projectee -> true
let (__proj__Mk_rsapss_skey__item__pkey :
  modBits_t -> unit rsapss_skey -> unit rsapss_pkey) =
  fun modBits ->
    fun projectee -> match projectee with | Mk_rsapss_skey (pkey, d) -> pkey
let (__proj__Mk_rsapss_skey__item__d :
  modBits_t -> unit rsapss_skey -> Prims.pos) =
  fun modBits ->
    fun projectee -> match projectee with | Mk_rsapss_skey (pkey, d) -> d
let (db_zero :
  Prims.pos ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun len ->
    fun db ->
      fun emBits ->
        let msBits = emBits mod (Prims.of_int (8)) in
        if msBits > Prims.int_zero
        then
          let r =
            Lib_Sequence.upd len db Prims.int_zero
              (FStar_UInt8.logand (Lib_Sequence.index len db Prims.int_zero)
                 (FStar_UInt8.shift_right
                    (FStar_UInt8.uint_to_t (Prims.of_int (0xff)))
                    (FStar_UInt32.uint_to_t ((Prims.of_int (8)) - msBits)))) in
          r
        else db
let (pss_encode :
  Spec_Hash_Definitions.algorithm ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat ->
          FStar_UInt8.t Lib_Sequence.seq ->
            Prims.pos -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun sLen ->
      fun salt ->
        fun msgLen ->
          fun msg ->
            fun emBits ->
              let mHash = Spec_Agile_Hash.hash a msg in
              let hLen = Spec_Hash_Definitions.hash_length a in
              let m1Len = ((Prims.of_int (8)) + hLen) + sLen in
              let m1 =
                Lib_Sequence.create m1Len
                  (FStar_UInt8.uint_to_t Prims.int_zero) in
              let m11 =
                Lib_Sequence.update_sub m1Len m1 (Prims.of_int (8)) hLen
                  mHash in
              let m12 =
                Lib_Sequence.update_sub m1Len m11 ((Prims.of_int (8)) + hLen)
                  sLen salt in
              let m1Hash = Spec_Agile_Hash.hash a m12 in
              let emLen = blocks emBits (Prims.of_int (8)) in
              let dbLen = (emLen - hLen) - Prims.int_one in
              let db =
                Lib_Sequence.create dbLen
                  (FStar_UInt8.uint_to_t Prims.int_zero) in
              let last_before_salt = (dbLen - sLen) - Prims.int_one in
              let db1 =
                Lib_Sequence.upd dbLen db last_before_salt
                  (FStar_UInt8.uint_to_t Prims.int_one) in
              let db2 =
                Lib_Sequence.update_sub dbLen db1
                  (last_before_salt + Prims.int_one) sLen salt in
              let dbMask = mgf_hash a hLen m1Hash dbLen in
              let maskedDB = xor_bytes dbLen db2 dbMask in
              let maskedDB1 = db_zero dbLen maskedDB emBits in
              let em =
                Lib_Sequence.create emLen
                  (FStar_UInt8.uint_to_t Prims.int_zero) in
              let em1 =
                Lib_Sequence.update_sub emLen em Prims.int_zero dbLen
                  maskedDB1 in
              let em2 = Lib_Sequence.update_sub emLen em1 dbLen hLen m1Hash in
              Lib_Sequence.upd emLen em2 (emLen - Prims.int_one)
                (FStar_UInt8.uint_to_t (Prims.of_int (0xbc)))
let (pss_verify_ :
  Spec_Hash_Definitions.algorithm ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          Prims.pos -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun a ->
    fun sLen ->
      fun msgLen ->
        fun msg ->
          fun emBits ->
            fun em ->
              let hLen = Spec_Hash_Definitions.hash_length a in
              let emLen = blocks emBits (Prims.of_int (8)) in
              let dbLen = (emLen - hLen) - Prims.int_one in
              let maskedDB =
                Lib_Sequence.sub (blocks emBits (Prims.of_int (8))) em
                  Prims.int_zero dbLen in
              let m1Hash =
                Lib_Sequence.sub (blocks emBits (Prims.of_int (8))) em dbLen
                  hLen in
              let dbMask = mgf_hash a hLen m1Hash dbLen in
              let db = xor_bytes dbLen dbMask maskedDB in
              let db1 = db_zero dbLen db emBits in
              let padLen = ((emLen - sLen) - hLen) - Prims.int_one in
              let pad2 =
                Lib_Sequence.create padLen
                  (FStar_UInt8.uint_to_t Prims.int_zero) in
              let pad21 =
                Lib_Sequence.upd padLen pad2 (padLen - Prims.int_one)
                  (FStar_UInt8.uint_to_t Prims.int_one) in
              let pad = Lib_Sequence.sub dbLen db1 Prims.int_zero padLen in
              let salt = Lib_Sequence.sub dbLen db1 padLen sLen in
              if
                Prims.op_Negation
                  (let res =
                     Obj.magic
                       (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8 padLen
                          padLen (Obj.magic pad) (Obj.magic pad21) padLen) in
                   res = (FStar_UInt8.uint_to_t (Prims.of_int (255))))
              then false
              else
                (let mHash = Spec_Agile_Hash.hash a msg in
                 let m1Len = ((Prims.of_int (8)) + hLen) + sLen in
                 let m1 =
                   Lib_Sequence.create m1Len
                     (FStar_UInt8.uint_to_t Prims.int_zero) in
                 let m11 =
                   Lib_Sequence.update_sub m1Len m1 (Prims.of_int (8)) hLen
                     mHash in
                 let m12 =
                   Lib_Sequence.update_sub m1Len m11
                     ((Prims.of_int (8)) + hLen) sLen salt in
                 let m1Hash0 = Spec_Agile_Hash.hash a m12 in
                 let res =
                   Obj.magic
                     (Lib_ByteSequence.seq_eq_mask Lib_IntTypes.U8
                        (Spec_Hash_Definitions.hash_length a)
                        (Spec_Hash_Definitions.hash_length a)
                        (Obj.magic m1Hash0) (Obj.magic m1Hash)
                        (Spec_Hash_Definitions.hash_length a)) in
                 res = (FStar_UInt8.uint_to_t (Prims.of_int (255))))
let (pss_verify :
  Spec_Hash_Definitions.algorithm ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          Prims.pos -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun a ->
    fun sLen ->
      fun msgLen ->
        fun msg ->
          fun emBits ->
            fun em ->
              let emLen = blocks emBits (Prims.of_int (8)) in
              let msBits = emBits mod (Prims.of_int (8)) in
              let em_0 =
                if msBits > Prims.int_zero
                then
                  FStar_UInt8.logand
                    (Lib_Sequence.index (blocks emBits (Prims.of_int (8))) em
                       Prims.int_zero)
                    (FStar_UInt8.shift_left
                       (FStar_UInt8.uint_to_t (Prims.of_int (0xff)))
                       (FStar_UInt32.uint_to_t msBits))
                else FStar_UInt8.uint_to_t Prims.int_zero in
              let em_last =
                Lib_Sequence.index (blocks emBits (Prims.of_int (8))) em
                  (emLen - Prims.int_one) in
              if
                emLen <
                  ((sLen + (Spec_Hash_Definitions.hash_length a)) +
                     (Prims.of_int (2)))
              then false
              else
                if
                  Prims.op_Negation
                    ((FStar_UInt8.eq em_last
                        (FStar_UInt8.uint_to_t (Prims.of_int (0xbc))))
                       &&
                       (FStar_UInt8.eq em_0
                          (FStar_UInt8.uint_to_t Prims.int_zero)))
                then false
                else pss_verify_ a sLen msgLen msg emBits em

let (rsapss_sign_ :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      unit rsapss_skey ->
        Prims.nat ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            Prims.nat ->
              FStar_UInt8.t Lib_Sequence.seq ->
                (Prims.bool * (FStar_UInt8.t, unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun modBits ->
      fun skey ->
        fun sLen ->
          fun salt ->
            fun msgLen ->
              fun msg ->
                let pkey = __proj__Mk_rsapss_skey__item__pkey modBits skey in
                let n = __proj__Mk_rsapss_pkey__item__n modBits pkey in
                let e = __proj__Mk_rsapss_pkey__item__e modBits pkey in
                let d = __proj__Mk_rsapss_skey__item__d modBits skey in
                let k = blocks modBits (Prims.of_int (8)) in
                let emBits = modBits - Prims.int_one in
                let emLen = blocks emBits (Prims.of_int (8)) in
                let em = pss_encode a sLen salt msgLen msg emBits in
                let m = os2ip emLen em in
                let s = Lib_NatMod.pow_mod n m d in
                let m' = Lib_NatMod.pow_mod n s e in
                let eq_m = m = m' in
                let s1 = if eq_m then s else Prims.int_zero in
                (eq_m, (i2osp k s1))
let (rsapss_sign :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      unit rsapss_skey ->
        Prims.nat ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            Prims.nat ->
              FStar_UInt8.t Lib_Sequence.seq ->
                (FStar_UInt8.t, unit) Lib_Sequence.lseq
                  FStar_Pervasives_Native.option)
  =
  fun a ->
    fun modBits ->
      fun skey ->
        fun sLen ->
          fun salt ->
            fun msgLen ->
              fun msg ->
                let b =
                  (((((sLen + (Spec_Hash_Definitions.hash_length a)) +
                        (Prims.of_int (8)))
                       <= ((Prims.pow2 (Prims.of_int (32))) - Prims.int_one))
                      &&
                      (((sLen + (Spec_Hash_Definitions.hash_length a)) +
                          (Prims.of_int (8)))
                         <=
                         (match a with
                          | Spec_Hash_Definitions.MD5 ->
                              (Prims.pow2 (Prims.of_int (61))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.SHA1 ->
                              (Prims.pow2 (Prims.of_int (61))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.SHA2_224 ->
                              (Prims.pow2 (Prims.of_int (61))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.SHA2_256 ->
                              (Prims.pow2 (Prims.of_int (61))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.SHA2_384 ->
                              (Prims.pow2 (Prims.of_int (125))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.SHA2_512 ->
                              (Prims.pow2 (Prims.of_int (125))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.Blake2S ->
                              (Prims.pow2 (Prims.of_int (64))) -
                                Prims.int_one
                          | Spec_Hash_Definitions.Blake2B ->
                              (Prims.pow2 (Prims.of_int (128))) -
                                Prims.int_one)))
                     &&
                     (msgLen <=
                        (match a with
                         | Spec_Hash_Definitions.MD5 ->
                             (Prims.pow2 (Prims.of_int (61))) - Prims.int_one
                         | Spec_Hash_Definitions.SHA1 ->
                             (Prims.pow2 (Prims.of_int (61))) - Prims.int_one
                         | Spec_Hash_Definitions.SHA2_224 ->
                             (Prims.pow2 (Prims.of_int (61))) - Prims.int_one
                         | Spec_Hash_Definitions.SHA2_256 ->
                             (Prims.pow2 (Prims.of_int (61))) - Prims.int_one
                         | Spec_Hash_Definitions.SHA2_384 ->
                             (Prims.pow2 (Prims.of_int (125))) -
                               Prims.int_one
                         | Spec_Hash_Definitions.SHA2_512 ->
                             (Prims.pow2 (Prims.of_int (125))) -
                               Prims.int_one
                         | Spec_Hash_Definitions.Blake2S ->
                             (Prims.pow2 (Prims.of_int (64))) - Prims.int_one
                         | Spec_Hash_Definitions.Blake2B ->
                             (Prims.pow2 (Prims.of_int (128))) -
                               Prims.int_one)))
                    &&
                    (((sLen + (Spec_Hash_Definitions.hash_length a)) +
                        (Prims.of_int (2)))
                       <=
                       (blocks (modBits - Prims.int_one) (Prims.of_int (8)))) in
                if b
                then
                  let uu___ =
                    rsapss_sign_ a modBits skey sLen salt msgLen msg in
                  match uu___ with
                  | (eq_m, sgnt) ->
                      (if eq_m
                       then FStar_Pervasives_Native.Some sgnt
                       else FStar_Pervasives_Native.None)
                else FStar_Pervasives_Native.None
let (rsapss_verify_ :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      unit rsapss_pkey ->
        Prims.nat ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            Prims.nat -> FStar_UInt8.t Lib_Sequence.seq -> Prims.bool)
  =
  fun a ->
    fun modBits ->
      fun pkey ->
        fun sLen ->
          fun sgnt ->
            fun msgLen ->
              fun msg ->
                let n = __proj__Mk_rsapss_pkey__item__n modBits pkey in
                let e = __proj__Mk_rsapss_pkey__item__e modBits pkey in
                let k = blocks modBits (Prims.of_int (8)) in
                let emBits = modBits - Prims.int_one in
                let emLen = blocks emBits (Prims.of_int (8)) in
                let s = os2ip k sgnt in
                if s < n
                then
                  let m = Lib_NatMod.pow_mod n s e in
                  (if m < (Prims.pow2 (emLen * (Prims.of_int (8))))
                   then
                     let em = i2osp emLen m in
                     pss_verify a sLen msgLen msg emBits em
                   else false)
                else false
let (rsapss_verify :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      unit rsapss_pkey ->
        Prims.nat ->
          Prims.nat ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              Prims.nat -> FStar_UInt8.t Lib_Sequence.seq -> Prims.bool)
  =
  fun a ->
    fun modBits ->
      fun pkey ->
        fun sLen ->
          fun k ->
            fun sgnt ->
              fun msgLen ->
                fun msg ->
                  let b =
                    (((((sLen + (Spec_Hash_Definitions.hash_length a)) +
                          (Prims.of_int (8)))
                         <=
                         ((Prims.pow2 (Prims.of_int (32))) - Prims.int_one))
                        &&
                        (((sLen + (Spec_Hash_Definitions.hash_length a)) +
                            (Prims.of_int (8)))
                           <=
                           (match a with
                            | Spec_Hash_Definitions.MD5 ->
                                (Prims.pow2 (Prims.of_int (61))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.SHA1 ->
                                (Prims.pow2 (Prims.of_int (61))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.SHA2_224 ->
                                (Prims.pow2 (Prims.of_int (61))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.SHA2_256 ->
                                (Prims.pow2 (Prims.of_int (61))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.SHA2_384 ->
                                (Prims.pow2 (Prims.of_int (125))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.SHA2_512 ->
                                (Prims.pow2 (Prims.of_int (125))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.Blake2S ->
                                (Prims.pow2 (Prims.of_int (64))) -
                                  Prims.int_one
                            | Spec_Hash_Definitions.Blake2B ->
                                (Prims.pow2 (Prims.of_int (128))) -
                                  Prims.int_one)))
                       &&
                       (msgLen <=
                          (match a with
                           | Spec_Hash_Definitions.MD5 ->
                               (Prims.pow2 (Prims.of_int (61))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.SHA1 ->
                               (Prims.pow2 (Prims.of_int (61))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.SHA2_224 ->
                               (Prims.pow2 (Prims.of_int (61))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.SHA2_256 ->
                               (Prims.pow2 (Prims.of_int (61))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.SHA2_384 ->
                               (Prims.pow2 (Prims.of_int (125))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.SHA2_512 ->
                               (Prims.pow2 (Prims.of_int (125))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.Blake2S ->
                               (Prims.pow2 (Prims.of_int (64))) -
                                 Prims.int_one
                           | Spec_Hash_Definitions.Blake2B ->
                               (Prims.pow2 (Prims.of_int (128))) -
                                 Prims.int_one)))
                      && (k = (blocks modBits (Prims.of_int (8)))) in
                  if b
                  then rsapss_verify_ a modBits pkey sLen sgnt msgLen msg
                  else false
let (rsapss_load_pkey :
  modBits_t ->
    Prims.pos ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          unit rsapss_pkey FStar_Pervasives_Native.option)
  =
  fun modBits ->
    fun eBits ->
      fun nb ->
        fun eb ->
          let n = os2ip (blocks modBits (Prims.of_int (8))) nb in
          let e = os2ip (blocks eBits (Prims.of_int (8))) eb in
          if
            (((((n mod (Prims.of_int (2))) = Prims.int_one) &&
                 ((Prims.pow2 (modBits - Prims.int_one)) < n))
                && (n < (Prims.pow2 modBits)))
               && (Prims.int_zero < e))
              && (e < (Prims.pow2 eBits))
          then FStar_Pervasives_Native.Some (Mk_rsapss_pkey (n, e))
          else FStar_Pervasives_Native.None
let (rsapss_load_skey :
  modBits_t ->
    Prims.pos ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              unit rsapss_skey FStar_Pervasives_Native.option)
  =
  fun modBits ->
    fun eBits ->
      fun dBits ->
        fun nb ->
          fun eb ->
            fun db ->
              let pkey = rsapss_load_pkey modBits eBits nb eb in
              let d = os2ip (blocks dBits (Prims.of_int (8))) db in
              if
                ((FStar_Pervasives_Native.uu___is_Some pkey) &&
                   (Prims.int_zero < d))
                  && (d < (Prims.pow2 dBits))
              then
                FStar_Pervasives_Native.Some
                  (Mk_rsapss_skey
                     ((FStar_Pervasives_Native.__proj__Some__item__v pkey),
                       d))
              else FStar_Pervasives_Native.None
let (rsapss_skey_sign :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      Prims.pos ->
        Prims.pos ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                Prims.nat ->
                  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                    Prims.nat ->
                      FStar_UInt8.t Lib_Sequence.seq ->
                        (FStar_UInt8.t, unit) Lib_Sequence.lseq
                          FStar_Pervasives_Native.option)
  =
  fun a ->
    fun modBits ->
      fun eBits ->
        fun dBits ->
          fun nb ->
            fun eb ->
              fun db ->
                fun sLen ->
                  fun salt ->
                    fun msgLen ->
                      fun msg ->
                        let skey =
                          rsapss_load_skey modBits eBits dBits nb eb db in
                        match skey with
                        | FStar_Pervasives_Native.Some vskey ->
                            rsapss_sign a modBits vskey sLen salt msgLen msg
                        | FStar_Pervasives_Native.None ->
                            FStar_Pervasives_Native.None
let (rsapss_pkey_verify :
  Spec_Hash_Definitions.algorithm ->
    modBits_t ->
      Prims.pos ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            Prims.nat ->
              Prims.nat ->
                (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
                  Prims.nat -> FStar_UInt8.t Lib_Sequence.seq -> Prims.bool)
  =
  fun a ->
    fun modBits ->
      fun eBits ->
        fun nb ->
          fun eb ->
            fun sLen ->
              fun k ->
                fun sgnt ->
                  fun msgLen ->
                    fun msg ->
                      let pkey = rsapss_load_pkey modBits eBits nb eb in
                      match pkey with
                      | FStar_Pervasives_Native.Some vpkey ->
                          rsapss_verify a modBits vpkey sLen k sgnt msgLen
                            msg
                      | FStar_Pervasives_Native.None -> false