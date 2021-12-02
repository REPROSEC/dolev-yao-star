open Prims
let (is_ciphersuite :
  (Spec_Agile_DH.algorithm * Spec_Agile_AEAD.alg *
    Spec_Hash_Definitions.hash_alg) -> Prims.bool)
  =
  fun uu___ ->
    match uu___ with
    | (Spec_Agile_DH.DH_Curve25519, Spec_Agile_AEAD.AES128_GCM,
       Spec_Hash_Definitions.SHA2_256) -> true
    | (Spec_Agile_DH.DH_Curve25519, Spec_Agile_AEAD.CHACHA20_POLY1305,
       Spec_Hash_Definitions.SHA2_256) -> true
    | (Spec_Agile_DH.DH_P256, Spec_Agile_AEAD.AES128_GCM,
       Spec_Hash_Definitions.SHA2_256) -> true
    | (Spec_Agile_DH.DH_P256, Spec_Agile_AEAD.CHACHA20_POLY1305,
       Spec_Hash_Definitions.SHA2_256) -> true
    | (Spec_Agile_DH.DH_Curve25519, Spec_Agile_AEAD.CHACHA20_POLY1305,
       Spec_Hash_Definitions.SHA2_512) -> true
    | (uu___1, uu___2, uu___3) -> false
type ciphersuite =
  (Spec_Agile_DH.algorithm * Spec_Agile_AEAD.alg *
    Spec_Hash_Definitions.algorithm)
let (curve_of_cs : ciphersuite -> Spec_Agile_DH.algorithm) =
  fun cs -> let uu___ = cs in match uu___ with | (c, a, h) -> c
let (aead_of_cs : ciphersuite -> Spec_Agile_AEAD.alg) =
  fun cs -> let uu___ = cs in match uu___ with | (c, a, h) -> a
let (hash_of_cs : ciphersuite -> Spec_Hash_Definitions.algorithm) =
  fun cs -> let uu___ = cs in match uu___ with | (c, a, h) -> h
let (size_aead_nonce : ciphersuite -> Prims.nat) =
  fun cs -> (Prims.of_int (12))
let (size_aead_key : ciphersuite -> Prims.nat) =
  fun cs -> Spec_Agile_AEAD.key_length (aead_of_cs cs)
let (size_aead_tag : ciphersuite -> Prims.nat) =
  fun cs -> Spec_Agile_AEAD.tag_length (aead_of_cs cs)
let (size_dh_key : ciphersuite -> Prims.nat) =
  fun cs ->
    match curve_of_cs cs with
    | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
    | Spec_Agile_DH.DH_P256 -> (Prims.of_int (32))
let (size_dh_public : ciphersuite -> Prims.nat) =
  fun cs ->
    match curve_of_cs cs with
    | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
    | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))
let (size_kdf : ciphersuite -> Prims.nat) =
  fun cs -> Spec_Hash_Definitions.size_hash (hash_of_cs cs)
let (size_psk : ciphersuite -> Prims.nat) =
  fun cs -> Spec_Hash_Definitions.size_hash (hash_of_cs cs)
let (max_length : ciphersuite -> Prims.nat) =
  fun cs -> Spec_Agile_AEAD.max_length (aead_of_cs cs)
let (max_pskID : Prims.nat) =
  (Prims.pow2 (Prims.of_int (16))) - Prims.int_one
let (max_info : Prims.nat) = (Prims.pow2 (Prims.of_int (16))) - Prims.int_one
type 'cs key_dh_public_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'cs key_dh_secret_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'cs key_aead_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'cs nonce_aead_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq
type 'cs psk_s = (FStar_UInt8.t, unit) Lib_Sequence.lseq



let (size_label_nonce : Prims.nat) = (Prims.of_int (10))
let (size_label_key : Prims.nat) = (Prims.of_int (8))
let (label_nonce_list : FStar_UInt8.t Prims.list) =
  [FStar_UInt8.uint_to_t (Prims.of_int (0x68));
  FStar_UInt8.uint_to_t (Prims.of_int (0x70));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
  FStar_UInt8.uint_to_t (Prims.of_int (0x65));
  FStar_UInt8.uint_to_t (Prims.of_int (0x20));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
  FStar_UInt8.uint_to_t (Prims.of_int (0x63));
  FStar_UInt8.uint_to_t (Prims.of_int (0x65))]
let (label_key_list : FStar_UInt8.t Prims.list) =
  [FStar_UInt8.uint_to_t (Prims.of_int (0x68));
  FStar_UInt8.uint_to_t (Prims.of_int (0x70));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
  FStar_UInt8.uint_to_t (Prims.of_int (0x65));
  FStar_UInt8.uint_to_t (Prims.of_int (0x20));
  FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
  FStar_UInt8.uint_to_t (Prims.of_int (0x65));
  FStar_UInt8.uint_to_t (Prims.of_int (0x79))]
let (label_nonce : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list label_nonce_list
let (label_key : (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  Lib_Sequence.of_list label_key_list
let (size_cs_identifier : Prims.nat) = (Prims.of_int (6))
let (size_mode_identifier : Prims.nat) = Prims.int_one
let (id_kem : ciphersuite -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun cs ->
    let uu___ = cs in
    match uu___ with
    | (dh, uu___1, uu___2) ->
        (match dh with
         | Spec_Agile_DH.DH_P256 ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_one))
         | Spec_Agile_DH.DH_Curve25519 ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t (Prims.of_int (2)))))
let (id_kdf : ciphersuite -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun cs ->
    let uu___ = cs in
    match uu___ with
    | (uu___1, uu___2, h) ->
        (match h with
         | Spec_Hash_Definitions.SHA2_256 ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_one))
         | Spec_Hash_Definitions.SHA2_512 ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t (Prims.of_int (2)))))
let (id_aead : ciphersuite -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun cs ->
    let uu___ = cs in
    match uu___ with
    | (uu___1, a, uu___2) ->
        (match a with
         | Spec_Agile_AEAD.AES128_GCM ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_one))
         | Spec_Agile_AEAD.AES256_GCM ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t (Prims.of_int (2))))
         | Spec_Agile_AEAD.CHACHA20_POLY1305 ->
             Lib_Sequence.op_At_Bar Prims.int_one Prims.int_one
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t Prims.int_zero))
               (Lib_Sequence.create Prims.int_one
                  (FStar_UInt8.uint_to_t (Prims.of_int (3)))))
let (id_of_cs : ciphersuite -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun cs ->
    Lib_Sequence.op_At_Bar (Prims.of_int (2)) (Prims.of_int (4)) (id_kem cs)
      (Lib_Sequence.op_At_Bar (Prims.of_int (2)) (Prims.of_int (2))
         (id_kdf cs) (id_aead cs))
type mode =
  | Base 
  | PSK 
  | Auth 
  | PSKAuth 
let (uu___is_Base : mode -> Prims.bool) =
  fun projectee -> match projectee with | Base -> true | uu___ -> false
let (uu___is_PSK : mode -> Prims.bool) =
  fun projectee -> match projectee with | PSK -> true | uu___ -> false
let (uu___is_Auth : mode -> Prims.bool) =
  fun projectee -> match projectee with | Auth -> true | uu___ -> false
let (uu___is_PSKAuth : mode -> Prims.bool) =
  fun projectee -> match projectee with | PSKAuth -> true | uu___ -> false
let (id_of_mode : mode -> (FStar_UInt8.t, unit) Lib_Sequence.lseq) =
  fun m ->
    match m with
    | Base ->
        Lib_Sequence.create Prims.int_one
          (FStar_UInt8.uint_to_t Prims.int_zero)
    | PSK ->
        Lib_Sequence.create Prims.int_one
          (FStar_UInt8.uint_to_t Prims.int_one)
    | Auth ->
        Lib_Sequence.create Prims.int_one
          (FStar_UInt8.uint_to_t (Prims.of_int (2)))
    | PSKAuth ->
        Lib_Sequence.create Prims.int_one
          (FStar_UInt8.uint_to_t (Prims.of_int (3)))
let (point_compress :
  ciphersuite -> unit key_dh_public_s -> unit Spec_Agile_DH.serialized_point)
  =
  fun cs ->
    fun pk ->
      match curve_of_cs cs with
      | Spec_Agile_DH.DH_Curve25519 -> pk
      | Spec_Agile_DH.DH_P256 ->
          Lib_Sequence.sub
            (match curve_of_cs cs with
             | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
             | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) pk Prims.int_one
            (Prims.of_int (64))
let (point_decompress :
  ciphersuite -> unit Spec_Agile_DH.serialized_point -> unit key_dh_public_s)
  =
  fun cs ->
    fun pk ->
      match curve_of_cs cs with
      | Spec_Agile_DH.DH_Curve25519 -> pk
      | Spec_Agile_DH.DH_P256 ->
          Lib_Sequence.op_At_Bar Prims.int_one
            (match curve_of_cs cs with
             | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
             | Spec_Agile_DH.DH_P256 -> (Prims.of_int (64)))
            (Lib_Sequence.create Prims.int_one
               (FStar_UInt8.uint_to_t (Prims.of_int (4)))) pk
let (encap :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_public_s ->
        (unit key_dh_public_s * unit key_dh_public_s)
          FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun pkR ->
        let pkE = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skE in
        let zz =
          Spec_Agile_DH.dh (curve_of_cs cs) skE (point_compress cs pkR) in
        match (pkE, zz) with
        | (FStar_Pervasives_Native.Some pkE1, FStar_Pervasives_Native.Some
           zz1) ->
            FStar_Pervasives_Native.Some
              ((point_decompress cs zz1), (point_decompress cs pkE1))
        | uu___ -> FStar_Pervasives_Native.None
let (decap :
  ciphersuite ->
    unit key_dh_public_s ->
      unit key_dh_secret_s ->
        unit key_dh_public_s FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun pkE ->
      fun skR ->
        match Spec_Agile_DH.dh (curve_of_cs cs) skR (point_compress cs pkE)
        with
        | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some zz ->
            FStar_Pervasives_Native.Some (point_decompress cs zz)
let (auth_encap :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_secret_s ->
        unit key_dh_public_s ->
          ((FStar_UInt8.t, unit) Lib_Sequence.lseq * unit key_dh_public_s)
            FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun skI ->
        fun pkR ->
          let pkE = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skE in
          let er =
            Spec_Agile_DH.dh (curve_of_cs cs) skE (point_compress cs pkR) in
          let ir =
            Spec_Agile_DH.dh (curve_of_cs cs) skI (point_compress cs pkR) in
          match (pkE, er, ir) with
          | (FStar_Pervasives_Native.Some pkE1, FStar_Pervasives_Native.Some
             er1, FStar_Pervasives_Native.Some ir1) ->
              let zz =
                Lib_Sequence.concat
                  (match curve_of_cs cs with
                   | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                   | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                  (match curve_of_cs cs with
                   | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                   | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                  (point_decompress cs er1) (point_decompress cs ir1) in
              FStar_Pervasives_Native.Some (zz, (point_decompress cs pkE1))
          | uu___ -> FStar_Pervasives_Native.None
let (auth_decap :
  ciphersuite ->
    unit key_dh_public_s ->
      unit key_dh_public_s ->
        unit key_dh_secret_s ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq
            FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun pkE ->
      fun pkI ->
        fun skR ->
          let re =
            Spec_Agile_DH.dh (curve_of_cs cs) skR (point_compress cs pkE) in
          let ri =
            Spec_Agile_DH.dh (curve_of_cs cs) skR (point_compress cs pkI) in
          match (re, ri) with
          | (FStar_Pervasives_Native.Some re1, FStar_Pervasives_Native.Some
             ri1) ->
              FStar_Pervasives_Native.Some
                (Lib_Sequence.concat
                   (match curve_of_cs cs with
                    | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                    | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                   (match curve_of_cs cs with
                    | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                    | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                   (point_decompress cs re1) (point_decompress cs ri1))
          | uu___ -> FStar_Pervasives_Native.None
let (default_pkI : ciphersuite -> FStar_UInt8.t Lib_Sequence.seq) =
  fun cs ->
    Lib_Sequence.create
      (match curve_of_cs cs with
       | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
       | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
      (FStar_UInt8.uint_to_t Prims.int_zero)
let (default_psk : ciphersuite -> FStar_UInt8.t Lib_Sequence.seq) =
  fun cs ->
    Lib_Sequence.create (Spec_Hash_Definitions.size_hash (hash_of_cs cs))
      (FStar_UInt8.uint_to_t Prims.int_zero)
let (default_pskId : FStar_UInt8.t Lib_Sequence.seq) =
  Lib_ByteSequence.lbytes_empty
let (build_context :
  mode ->
    ciphersuite ->
      unit key_dh_public_s ->
        unit key_dh_public_s ->
          unit key_dh_public_s ->
            FStar_UInt8.t Lib_Sequence.seq ->
              FStar_UInt8.t Lib_Sequence.seq ->
                FStar_UInt8.t Lib_Sequence.seq)
  =
  fun m ->
    fun cs ->
      fun pkE ->
        fun pkR ->
          fun pkI ->
            fun pskID_hash ->
              fun info_hash ->
                let pskID_len =
                  Obj.magic
                    (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                       Lib_IntTypes.SEC Prims.int_one
                       (Spec_Hash_Definitions.size_hash (hash_of_cs cs))) in
                let info_len =
                  Obj.magic
                    (Lib_ByteSequence.nat_to_intseq_be_ Lib_IntTypes.U8
                       Lib_IntTypes.SEC Prims.int_one
                       (Spec_Hash_Definitions.size_hash (hash_of_cs cs))) in
                let context =
                  Lib_Sequence.op_At_Bar Prims.int_one
                    ((Prims.of_int (6)) +
                       ((match curve_of_cs cs with
                         | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                         | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                          ((match curve_of_cs cs with
                            | Spec_Agile_DH.DH_Curve25519 ->
                                (Prims.of_int (32))
                            | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                             (match curve_of_cs cs with
                              | Spec_Agile_DH.DH_Curve25519 ->
                                  (Prims.of_int (32))
                              | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))))))
                    (id_of_mode m)
                    (Lib_Sequence.op_At_Bar (Prims.of_int (6))
                       ((match curve_of_cs cs with
                         | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                         | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                          ((match curve_of_cs cs with
                            | Spec_Agile_DH.DH_Curve25519 ->
                                (Prims.of_int (32))
                            | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                             (match curve_of_cs cs with
                              | Spec_Agile_DH.DH_Curve25519 ->
                                  (Prims.of_int (32))
                              | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))))
                       (id_of_cs cs)
                       (Lib_Sequence.op_At_Bar
                          (match curve_of_cs cs with
                           | Spec_Agile_DH.DH_Curve25519 ->
                               (Prims.of_int (32))
                           | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                          ((match curve_of_cs cs with
                            | Spec_Agile_DH.DH_Curve25519 ->
                                (Prims.of_int (32))
                            | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) +
                             (match curve_of_cs cs with
                              | Spec_Agile_DH.DH_Curve25519 ->
                                  (Prims.of_int (32))
                              | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))))
                          pkE
                          (Lib_Sequence.op_At_Bar
                             (match curve_of_cs cs with
                              | Spec_Agile_DH.DH_Curve25519 ->
                                  (Prims.of_int (32))
                              | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                             (match curve_of_cs cs with
                              | Spec_Agile_DH.DH_Curve25519 ->
                                  (Prims.of_int (32))
                              | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
                             pkR pkI))) in
                let context1 = FStar_Seq_Base.append context pskID_hash in
                let context2 = FStar_Seq_Base.append context1 info_hash in
                context2
let (ks_derive :
  ciphersuite ->
    mode ->
      unit key_dh_public_s ->
        FStar_UInt8.t Lib_Sequence.seq ->
          unit key_dh_public_s ->
            FStar_UInt8.t Lib_Sequence.seq ->
              (unit psk_s * FStar_UInt8.t Lib_Sequence.seq)
                FStar_Pervasives_Native.option ->
                unit key_dh_public_s FStar_Pervasives_Native.option ->
                  (unit key_aead_s * unit nonce_aead_s))
  =
  fun cs ->
    fun m ->
      fun pkR ->
        fun zz ->
          fun pkE ->
            fun info ->
              fun opsk ->
                fun opkI ->
                  let uu___ =
                    match opsk with
                    | FStar_Pervasives_Native.None ->
                        ((default_psk cs), default_pskId)
                    | FStar_Pervasives_Native.Some (psk, pskID) ->
                        (psk, pskID) in
                  match uu___ with
                  | (psk, pskID) ->
                      let pkI =
                        match opkI with
                        | FStar_Pervasives_Native.None -> default_pkI cs
                        | FStar_Pervasives_Native.Some pki -> pki in
                      let pskID_hash =
                        Spec_Agile_Hash.hash (hash_of_cs cs) pskID in
                      let info_hash =
                        Spec_Agile_Hash.hash (hash_of_cs cs) info in
                      let context =
                        build_context m cs pkE pkR pkI pskID_hash info_hash in
                      let secret =
                        Spec_Agile_HKDF.extract (hash_of_cs cs) psk zz in
                      let info_key = FStar_Seq_Base.append label_key context in
                      let info_nonce =
                        FStar_Seq_Base.append label_nonce context in
                      let keyIR =
                        Spec_Agile_HKDF.expand (hash_of_cs cs) secret
                          info_key
                          (Spec_Agile_AEAD.key_length (aead_of_cs cs)) in
                      let nonceIR =
                        Spec_Agile_HKDF.expand (hash_of_cs cs) secret
                          info_nonce (Prims.of_int (12)) in
                      (keyIR, nonceIR)
let (setupBaseI :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_public_s ->
        FStar_UInt8.t Lib_Sequence.seq ->
          (unit key_dh_public_s * unit key_aead_s * unit nonce_aead_s)
            FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun pkR ->
        fun info ->
          let res = encap cs skE pkR in
          match res with
          | FStar_Pervasives_Native.Some (zz, pkE) ->
              let uu___ =
                ks_derive cs Base pkR zz pkE info
                  FStar_Pervasives_Native.None FStar_Pervasives_Native.None in
              (match uu___ with
               | (k, n) -> FStar_Pervasives_Native.Some (pkE, k, n))
          | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (setupBaseR :
  ciphersuite ->
    unit key_dh_public_s ->
      unit key_dh_secret_s ->
        FStar_UInt8.t Lib_Sequence.seq ->
          (unit key_aead_s * unit nonce_aead_s)
            FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun pkE ->
      fun skR ->
        fun info ->
          let pkR = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skR in
          let zz = decap cs pkE skR in
          match (pkR, zz) with
          | (FStar_Pervasives_Native.Some pkR1, FStar_Pervasives_Native.Some
             zz1) ->
              FStar_Pervasives_Native.Some
                (ks_derive cs Base (point_decompress cs pkR1) zz1 pkE info
                   FStar_Pervasives_Native.None FStar_Pervasives_Native.None)
          | uu___ -> FStar_Pervasives_Native.None
let (setupAuthI :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_secret_s ->
        unit key_dh_public_s ->
          FStar_UInt8.t Lib_Sequence.seq ->
            (unit key_dh_public_s * unit key_aead_s * unit nonce_aead_s)
              FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun skI ->
        fun pkR ->
          fun info ->
            let pkI = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skI in
            let res = auth_encap cs skE skI pkR in
            match (pkI, res) with
            | (FStar_Pervasives_Native.Some pkI1,
               FStar_Pervasives_Native.Some (zz, pkE)) ->
                let uu___ =
                  ks_derive cs Auth pkR zz pkE info
                    FStar_Pervasives_Native.None
                    (FStar_Pervasives_Native.Some (point_decompress cs pkI1)) in
                (match uu___ with
                 | (k, n) -> FStar_Pervasives_Native.Some (pkE, k, n))
            | uu___ -> FStar_Pervasives_Native.None
let (setupAuthR :
  ciphersuite ->
    unit key_dh_public_s ->
      unit key_dh_public_s ->
        unit key_dh_secret_s ->
          FStar_UInt8.t Lib_Sequence.seq ->
            (unit key_aead_s * unit nonce_aead_s)
              FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun pkE ->
      fun pkI ->
        fun skR ->
          fun info ->
            let pkR = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skR in
            let zz = auth_decap cs pkE pkI skR in
            match (pkR, zz) with
            | (FStar_Pervasives_Native.Some pkR1,
               FStar_Pervasives_Native.Some zz1) ->
                FStar_Pervasives_Native.Some
                  (ks_derive cs Auth (point_decompress cs pkR1) zz1 pkE info
                     FStar_Pervasives_Native.None
                     (FStar_Pervasives_Native.Some pkI))
            | uu___ -> FStar_Pervasives_Native.None
let (setupAuthPSKI :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_secret_s ->
        unit key_dh_public_s ->
          unit psk_s ->
            FStar_UInt8.t Lib_Sequence.seq ->
              FStar_UInt8.t Lib_Sequence.seq ->
                (unit key_dh_public_s * unit key_aead_s * unit nonce_aead_s)
                  FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun skI ->
        fun pkR ->
          fun psk ->
            fun pskID ->
              fun info ->
                let pkI = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skI in
                let res = auth_encap cs skE skI pkR in
                match (pkI, res) with
                | (FStar_Pervasives_Native.Some pkI1,
                   FStar_Pervasives_Native.Some (zz, pkE)) ->
                    let uu___ =
                      ks_derive cs PSKAuth pkR zz pkE info
                        (FStar_Pervasives_Native.Some (psk, pskID))
                        (FStar_Pervasives_Native.Some
                           (point_decompress cs pkI1)) in
                    (match uu___ with
                     | (k, n) -> FStar_Pervasives_Native.Some (pkE, k, n))
                | uu___ -> FStar_Pervasives_Native.None
let (setupPSKAuthR :
  ciphersuite ->
    unit key_dh_public_s ->
      unit key_dh_public_s ->
        unit key_dh_secret_s ->
          unit psk_s ->
            FStar_UInt8.t Lib_Sequence.seq ->
              FStar_UInt8.t Lib_Sequence.seq ->
                (unit key_aead_s * unit nonce_aead_s)
                  FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun pkE ->
      fun pkI ->
        fun skR ->
          fun psk ->
            fun pskID ->
              fun info ->
                let pkR = Spec_Agile_DH.secret_to_public (curve_of_cs cs) skR in
                let zz = auth_decap cs pkE pkI skR in
                match (pkR, zz) with
                | (FStar_Pervasives_Native.Some pkR1,
                   FStar_Pervasives_Native.Some zz1) ->
                    FStar_Pervasives_Native.Some
                      (ks_derive cs PSKAuth (point_decompress cs pkR1) zz1
                         pkE info (FStar_Pervasives_Native.Some (psk, pskID))
                         (FStar_Pervasives_Native.Some pkI))
                | uu___ -> FStar_Pervasives_Native.None
let (sealBase :
  ciphersuite ->
    unit key_dh_secret_s ->
      unit key_dh_public_s ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq ->
            FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skE ->
      fun pkR ->
        fun m ->
          fun info ->
            match setupBaseI cs skE pkR info with
            | FStar_Pervasives_Native.Some (pkE, k, n) ->
                FStar_Pervasives_Native.Some
                  (FStar_Seq_Base.append pkE
                     (Spec_Agile_AEAD.encrypt (aead_of_cs cs) k n info m))
            | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
let (openBase :
  ciphersuite ->
    unit key_dh_secret_s ->
      FStar_UInt8.t Lib_Sequence.seq ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t Lib_Sequence.seq FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun skR ->
      fun input ->
        fun info ->
          let pkE =
            Lib_Sequence.sub (FStar_Seq_Base.length input) input
              Prims.int_zero
              (match curve_of_cs cs with
               | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
               | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65))) in
          let c =
            Lib_Sequence.sub (FStar_Seq_Base.length input) input
              (match curve_of_cs cs with
               | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
               | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))
              ((Lib_Sequence.length input) -
                 (match curve_of_cs cs with
                  | Spec_Agile_DH.DH_Curve25519 -> (Prims.of_int (32))
                  | Spec_Agile_DH.DH_P256 -> (Prims.of_int (65)))) in
          match setupBaseR cs pkE skR info with
          | FStar_Pervasives_Native.Some (k, n) ->
              (match Spec_Agile_AEAD.decrypt (aead_of_cs cs) k n info c with
               | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some v ->
                   FStar_Pervasives_Native.Some v)
          | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None