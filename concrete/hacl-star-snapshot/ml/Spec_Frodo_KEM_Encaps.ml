open Prims
let (frodo_mul_add_sa_plus_e :
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
        fun sp_matrix ->
          fun ep_matrix ->
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
              Spec_Matrix.add Spec_Frodo_Params.params_nbar
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                (Spec_Matrix.mul Spec_Frodo_Params.params_nbar
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
                   sp_matrix a_matrix) ep_matrix in
            b_matrix
let (crypto_kem_enc_ct_pack_c1 :
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
        fun sp_matrix ->
          fun ep_matrix ->
            let bp_matrix =
              frodo_mul_add_sa_plus_e a gen_a seed_a sp_matrix ep_matrix in
            let ct1 =
              Spec_Frodo_Pack.frodo_pack Spec_Frodo_Params.params_nbar
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16)))
                bp_matrix in
            ct1
let (frodo_mul_add_sb_plus_e :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun b ->
      fun sp_matrix ->
        fun epp_matrix ->
          let b_matrix =
            Spec_Frodo_Pack.frodo_unpack
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
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16))) b in
          let v_matrix =
            Spec_Matrix.add Spec_Frodo_Params.params_nbar
              Spec_Frodo_Params.params_nbar
              (Spec_Matrix.mul Spec_Frodo_Params.params_nbar
                 (match a with
                  | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                  | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                  | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                  | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                 Spec_Frodo_Params.params_nbar sp_matrix b_matrix) epp_matrix in
          v_matrix
let (frodo_mul_add_sb_plus_e_plus_mu :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun mu ->
      fun b ->
        fun sp_matrix ->
          fun epp_matrix ->
            let v_matrix = frodo_mul_add_sb_plus_e a b sp_matrix epp_matrix in
            let mu_encode =
              Spec_Frodo_Encode.frodo_key_encode
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16)))
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (2))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (2))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (3))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (4)))
                Spec_Frodo_Params.params_nbar mu in
            let v_matrix1 =
              Spec_Matrix.add Spec_Frodo_Params.params_nbar
                Spec_Frodo_Params.params_nbar v_matrix mu_encode in
            v_matrix1
let (crypto_kem_enc_ct_pack_c2 :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun mu ->
      fun b ->
        fun sp_matrix ->
          fun epp_matrix ->
            let v_matrix =
              frodo_mul_add_sb_plus_e_plus_mu a mu b sp_matrix epp_matrix in
            let ct2 =
              Spec_Frodo_Pack.frodo_pack Spec_Frodo_Params.params_nbar
                Spec_Frodo_Params.params_nbar
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16)))
                v_matrix in
            ct2
let (get_sp_ep_epp_matrices :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      ((FStar_UInt16.t, unit) Lib_Sequence.lseq * (FStar_UInt16.t, unit)
        Lib_Sequence.lseq * (FStar_UInt16.t, unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun seed_se ->
      let s_bytes_len = Spec_Frodo_Params.secretmatrixbytes_len a in
      let r =
        Spec_Frodo_KEM_KeyGen.frodo_shake_r a
          (FStar_UInt8.uint_to_t (Prims.of_int (0x96))) seed_se
          (((Prims.of_int (2)) * s_bytes_len) +
             (((Prims.of_int (2)) * Spec_Frodo_Params.params_nbar) *
                Spec_Frodo_Params.params_nbar)) in
      let sp_matrix =
        Spec_Frodo_Sample.frodo_sample_matrix a Spec_Frodo_Params.params_nbar
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
          (Lib_Sequence.sub
             (((Prims.of_int (2)) * s_bytes_len) +
                (((Prims.of_int (2)) * Spec_Frodo_Params.params_nbar) *
                   Spec_Frodo_Params.params_nbar)) r Prims.int_zero
             s_bytes_len) in
      let ep_matrix =
        Spec_Frodo_Sample.frodo_sample_matrix a Spec_Frodo_Params.params_nbar
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
          (Lib_Sequence.sub
             (((Prims.of_int (2)) * s_bytes_len) +
                (((Prims.of_int (2)) * Spec_Frodo_Params.params_nbar) *
                   Spec_Frodo_Params.params_nbar)) r s_bytes_len s_bytes_len) in
      let epp_matrix =
        Spec_Frodo_Sample.frodo_sample_matrix a Spec_Frodo_Params.params_nbar
          Spec_Frodo_Params.params_nbar
          (Lib_Sequence.sub
             (((Prims.of_int (2)) * s_bytes_len) +
                (((Prims.of_int (2)) * Spec_Frodo_Params.params_nbar) *
                   Spec_Frodo_Params.params_nbar)) r
             ((Prims.of_int (2)) * s_bytes_len)
             (((Prims.of_int (2)) * Spec_Frodo_Params.params_nbar) *
                Spec_Frodo_Params.params_nbar)) in
      (sp_matrix, ep_matrix, epp_matrix)
let (crypto_kem_enc_ct :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun mu ->
        fun pk ->
          fun seed_se ->
            let seed_a =
              Lib_Sequence.sub (Spec_Frodo_Params.crypto_publickeybytes a) pk
                Prims.int_zero Spec_Frodo_Params.bytes_seed_a in
            let b =
              Lib_Sequence.sub (Spec_Frodo_Params.crypto_publickeybytes a) pk
                Spec_Frodo_Params.bytes_seed_a
                (Spec_Frodo_Params.publicmatrixbytes_len a) in
            let uu___ = get_sp_ep_epp_matrices a seed_se in
            match uu___ with
            | (sp_matrix, ep_matrix, epp_matrix) ->
                let c1 =
                  crypto_kem_enc_ct_pack_c1 a gen_a seed_a sp_matrix
                    ep_matrix in
                let c2 =
                  crypto_kem_enc_ct_pack_c2 a mu b sp_matrix epp_matrix in
                let ct =
                  Lib_Sequence.concat (Spec_Frodo_Params.ct1bytes_len a)
                    (Spec_Frodo_Params.ct2bytes_len a) c1 c2 in
                ct
let (crypto_kem_enc_ss :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun k ->
      fun ct ->
        let shake_input_ss =
          Lib_Sequence.concat (Spec_Frodo_Params.crypto_ciphertextbytes a)
            (match a with
             | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
             | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) ct k in
        let ss =
          (match a with
           | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
           | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
            ((Spec_Frodo_Params.crypto_ciphertextbytes a) +
               (match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
            shake_input_ss
            (match a with
             | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
             | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
             | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
        ss
let (crypto_kem_enc_seed_se_k :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun mu ->
      fun pk ->
        let pkh =
          (match a with
           | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
           | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
            (Spec_Frodo_Params.crypto_publickeybytes a) pk
            (Spec_Frodo_Params.bytes_pkhash a) in
        let pkh_mu =
          Lib_Sequence.concat (Spec_Frodo_Params.bytes_pkhash a)
            (Spec_Frodo_Params.bytes_mu a) pkh mu in
        let seed_se_k =
          (match a with
           | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
           | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
            ((Spec_Frodo_Params.bytes_pkhash a) +
               (Spec_Frodo_Params.bytes_mu a)) pkh_mu
            ((Prims.of_int (2)) *
               (match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))) in
        seed_se_k
let (crypto_kem_enc_ :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, 
            unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun mu ->
        fun pk ->
          let seed_se_k = crypto_kem_enc_seed_se_k a mu pk in
          let seed_se =
            Lib_Sequence.sub
              ((Prims.of_int (2)) *
                 (match a with
                  | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                  | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
              seed_se_k Prims.int_zero
              (match a with
               | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
               | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
               | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
          let k =
            Lib_Sequence.sub
              ((Prims.of_int (2)) *
                 (match a with
                  | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                  | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                  | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))))
              seed_se_k
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
          let ct = crypto_kem_enc_ct a gen_a mu pk seed_se in
          let ss = crypto_kem_enc_ss a k ct in (ct, ss)
let (crypto_kem_enc :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      Spec_Frodo_Random.state_t ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, 
            unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun state ->
        fun pk ->
          let uu___ =
            Spec_Frodo_Random.randombytes_ state
              (Spec_Frodo_Params.bytes_mu a) in
          match uu___ with | (mu, uu___1) -> crypto_kem_enc_ a gen_a mu pk