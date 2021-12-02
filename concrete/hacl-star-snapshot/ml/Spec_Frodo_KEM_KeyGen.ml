open Prims
let (frodo_shake_r :
  Spec_Frodo_Params.frodo_alg ->
    FStar_UInt8.t ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun c ->
      fun seed_se ->
        fun output_len ->
          let tmp = Lib_Sequence.create Prims.int_one c in
          let shake_input_seed_se =
            Lib_Sequence.concat Prims.int_one
              (match a with
               | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
               | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
               | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) tmp
              seed_se in
          (match a with
           | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
           | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
            (Prims.int_one +
               (match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
            shake_input_seed_se output_len
let (frodo_mul_add_as_plus_e :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun seed_a ->
        fun s_matrix ->
          fun e_matrix ->
            let a_matrix =
              (match gen_a with
               | Spec_Frodo_Params.SHAKE128 ->
                   Spec_Frodo_Gen.frodo_gen_matrix_shake
               | Spec_Frodo_Params.AES128 ->
                   Spec_Frodo_Gen.frodo_gen_matrix_aes)
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                seed_a in
            let b_matrix =
              Spec_Matrix.add
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                Spec_Frodo_Params.params_nbar
                (Spec_Matrix.mul_s
                   (match a with
                    | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                    | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                    | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                    | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                   (match a with
                    | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                    | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                    | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                    | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                   Spec_Frodo_Params.params_nbar a_matrix s_matrix) e_matrix in
            b_matrix
let (frodo_mul_add_as_plus_e_pack :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun seed_a ->
        fun s_matrix ->
          fun e_matrix ->
            let b_matrix =
              frodo_mul_add_as_plus_e a gen_a seed_a s_matrix e_matrix in
            Spec_Frodo_Pack.frodo_pack
              (match a with
               | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
               | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
               | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
              Spec_Frodo_Params.params_nbar
              (match a with
               | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
               | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
               | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16))) b_matrix
let (get_s_e_matrices :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      ((FStar_UInt16.t, unit) Lib_Sequence.lseq * (FStar_UInt16.t, unit)
        Lib_Sequence.lseq))
  =
  fun a ->
    fun seed_se ->
      let s_bytes_len = Spec_Frodo_Params.secretmatrixbytes_len a in
      let r =
        frodo_shake_r a (FStar_UInt8.uint_to_t (Prims.of_int (0x5f))) seed_se
          ((Prims.of_int (2)) * s_bytes_len) in
      let s_matrix =
        Spec_Frodo_Sample.frodo_sample_matrix a
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
          Spec_Frodo_Params.params_nbar
          (Lib_Sequence.sub ((Prims.of_int (2)) * s_bytes_len) r
             Prims.int_zero s_bytes_len) in
      let e_matrix =
        Spec_Frodo_Sample.frodo_sample_matrix a
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
          Spec_Frodo_Params.params_nbar
          (Lib_Sequence.sub ((Prims.of_int (2)) * s_bytes_len) r s_bytes_len
             s_bytes_len) in
      (s_matrix, e_matrix)
let (frodo_mul_add_as_plus_e_pack_shake :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, 
            unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun seed_a ->
        fun seed_se ->
          let uu___ = get_s_e_matrices a seed_se in
          match uu___ with
          | (s_matrix, e_matrix) ->
              let b_bytes =
                frodo_mul_add_as_plus_e_pack a gen_a seed_a s_matrix e_matrix in
              let s_bytes =
                Spec_Matrix.matrix_to_lbytes
                  (match a with
                   | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                   | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                   | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                   | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                  Spec_Frodo_Params.params_nbar s_matrix in
              (b_bytes, s_bytes)
let (crypto_kem_sk :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s ->
      fun pk ->
        fun s_bytes ->
          let sk =
            Lib_Sequence.concat
              ((match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) +
                 (Spec_Frodo_Params.crypto_publickeybytes a))
              (Spec_Frodo_Params.secretmatrixbytes_len a)
              (Lib_Sequence.concat
                 (match a with
                  | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                  | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))
                 (Spec_Frodo_Params.crypto_publickeybytes a) s pk) s_bytes in
          let pkh =
            (match a with
             | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
             | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
             | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
             | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
              (Spec_Frodo_Params.crypto_publickeybytes a) pk
              (Spec_Frodo_Params.bytes_pkhash a) in
          let sk_pkh =
            Lib_Sequence.concat
              (((match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) +
                  (Spec_Frodo_Params.crypto_publickeybytes a))
                 + (Spec_Frodo_Params.secretmatrixbytes_len a))
              (Spec_Frodo_Params.bytes_pkhash a) sk pkh in
          sk_pkh
let (crypto_kem_keypair_ :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
          Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun coins ->
        let s =
          Lib_Sequence.sub
            (((Prims.of_int (2)) *
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
               + Spec_Frodo_Params.bytes_seed_a) coins Prims.int_zero
            (match a with
             | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
             | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
        let seed_se =
          Lib_Sequence.sub
            (((Prims.of_int (2)) *
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
               + Spec_Frodo_Params.bytes_seed_a) coins
            (match a with
             | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
             | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))
            (match a with
             | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
             | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
        let z =
          Lib_Sequence.sub
            (((Prims.of_int (2)) *
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
               + Spec_Frodo_Params.bytes_seed_a) coins
            ((Prims.of_int (2)) *
               (match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
            Spec_Frodo_Params.bytes_seed_a in
        let seed_a =
          match a with
          | Spec_Frodo_Params.Frodo64 ->
              Spec_SHA3.shake128 Spec_Frodo_Params.bytes_seed_a z
                Spec_Frodo_Params.bytes_seed_a
          | Spec_Frodo_Params.Frodo640 ->
              Spec_SHA3.shake128 Spec_Frodo_Params.bytes_seed_a z
                Spec_Frodo_Params.bytes_seed_a
          | Spec_Frodo_Params.Frodo976 ->
              Spec_SHA3.shake256 Spec_Frodo_Params.bytes_seed_a z
                Spec_Frodo_Params.bytes_seed_a
          | Spec_Frodo_Params.Frodo1344 ->
              Spec_SHA3.shake256 Spec_Frodo_Params.bytes_seed_a z
                Spec_Frodo_Params.bytes_seed_a in
        let uu___ = frodo_mul_add_as_plus_e_pack_shake a gen_a seed_a seed_se in
        match uu___ with
        | (b_bytes, s_bytes) ->
            let pk =
              Lib_Sequence.concat Spec_Frodo_Params.bytes_seed_a
                (Spec_Frodo_Params.publicmatrixbytes_len a) seed_a b_bytes in
            let sk = crypto_kem_sk a s pk s_bytes in (pk, sk)
let (crypto_kem_keypair :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      Spec_Frodo_Random.state_t ->
        ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
          Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun state ->
        let uu___ =
          Spec_Frodo_Random.randombytes_ state
            (((Prims.of_int (2)) *
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
               + Spec_Frodo_Params.bytes_seed_a) in
        match uu___ with
        | (coins, uu___1) -> crypto_kem_keypair_ a gen_a coins