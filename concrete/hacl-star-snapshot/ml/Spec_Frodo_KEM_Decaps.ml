open Prims
let (get_bp_c_matrices :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      ((FStar_UInt16.t, unit) Lib_Sequence.lseq * (FStar_UInt16.t, unit)
        Lib_Sequence.lseq))
  =
  fun a ->
    fun ct ->
      let c1 =
        Lib_Sequence.sub (Spec_Frodo_Params.crypto_ciphertextbytes a) ct
          Prims.int_zero (Spec_Frodo_Params.ct1bytes_len a) in
      let c2 =
        Lib_Sequence.sub (Spec_Frodo_Params.crypto_ciphertextbytes a) ct
          (Spec_Frodo_Params.ct1bytes_len a)
          (Spec_Frodo_Params.ct2bytes_len a) in
      let bp_matrix =
        Spec_Frodo_Pack.frodo_unpack Spec_Frodo_Params.params_nbar
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16))) c1 in
      let c_matrix =
        Spec_Frodo_Pack.frodo_unpack Spec_Frodo_Params.params_nbar
          Spec_Frodo_Params.params_nbar
          (match a with
           | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
           | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
           | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
           | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16))) c2 in
      (bp_matrix, c_matrix)
let (frodo_mu_decode :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun s_bytes ->
      fun bp_matrix ->
        fun c_matrix ->
          let s_matrix =
            Spec_Matrix.matrix_from_lbytes
              (match a with
               | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
               | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
               | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
               | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
              Spec_Frodo_Params.params_nbar s_bytes in
          let m_matrix =
            Spec_Matrix.sub Spec_Frodo_Params.params_nbar
              Spec_Frodo_Params.params_nbar c_matrix
              (Spec_Matrix.mul_s Spec_Frodo_Params.params_nbar
                 (match a with
                  | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                  | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                  | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                  | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                 Spec_Frodo_Params.params_nbar bp_matrix s_matrix) in
          let mu_decode =
            Spec_Frodo_Encode.frodo_key_decode
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
              Spec_Frodo_Params.params_nbar m_matrix in
          mu_decode
let (get_bpp_cp_matrices_ :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                ((FStar_UInt16.t, unit) Lib_Sequence.lseq * (FStar_UInt16.t,
                  unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun mu_decode ->
        fun sk ->
          fun sp_matrix ->
            fun ep_matrix ->
              fun epp_matrix ->
                let pk =
                  Lib_Sequence.sub
                    (Spec_Frodo_Params.crypto_secretkeybytes a) sk
                    (match a with
                     | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                     | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                     | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                     | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))
                    (Spec_Frodo_Params.crypto_publickeybytes a) in
                let seed_a =
                  Lib_Sequence.sub
                    (Spec_Frodo_Params.crypto_publickeybytes a) pk
                    Prims.int_zero Spec_Frodo_Params.bytes_seed_a in
                let b =
                  Lib_Sequence.sub
                    (Spec_Frodo_Params.crypto_publickeybytes a) pk
                    Spec_Frodo_Params.bytes_seed_a
                    ((Spec_Frodo_Params.crypto_publickeybytes a) -
                       Spec_Frodo_Params.bytes_seed_a) in
                let bpp_matrix =
                  Spec_Frodo_KEM_Encaps.frodo_mul_add_sa_plus_e a gen_a
                    seed_a sp_matrix ep_matrix in
                let cp_matrix =
                  Spec_Frodo_KEM_Encaps.frodo_mul_add_sb_plus_e_plus_mu a
                    mu_decode b sp_matrix epp_matrix in
                let bpp_matrix1 =
                  Spec_Matrix.mod_pow2 Spec_Frodo_Params.params_nbar
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
                    bpp_matrix in
                let cp_matrix1 =
                  Spec_Matrix.mod_pow2 Spec_Frodo_Params.params_nbar
                    Spec_Frodo_Params.params_nbar
                    (match a with
                     | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (15))
                     | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (15))
                     | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (16))
                     | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (16)))
                    cp_matrix in
                (bpp_matrix1, cp_matrix1)
let (get_bpp_cp_matrices :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            ((FStar_UInt16.t, unit) Lib_Sequence.lseq * (FStar_UInt16.t,
              unit) Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun mu_decode ->
        fun seed_se ->
          fun sk ->
            let uu___ =
              Spec_Frodo_KEM_Encaps.get_sp_ep_epp_matrices a seed_se in
            match uu___ with
            | (sp_matrix, ep_matrix, epp_matrix) ->
                let uu___1 =
                  get_bpp_cp_matrices_ a gen_a mu_decode sk sp_matrix
                    ep_matrix epp_matrix in
                (match uu___1 with
                 | (bpp_matrix, cp_matrix) -> (bpp_matrix, cp_matrix))
let (crypto_kem_dec_kp_s_cond :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq -> FStar_UInt16.t)
  =
  fun a ->
    fun bp_matrix ->
      fun bpp_matrix ->
        fun c_matrix ->
          fun cp_matrix ->
            let b1 =
              Spec_Matrix.matrix_eq Spec_Frodo_Params.params_nbar
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (64))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (640))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (976))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (1344)))
                bp_matrix bpp_matrix in
            let b2 =
              Spec_Matrix.matrix_eq Spec_Frodo_Params.params_nbar
                Spec_Frodo_Params.params_nbar c_matrix cp_matrix in
            FStar_UInt16.logand b1 b2
let (crypto_kem_dec_kp_s :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq -> FStar_UInt16.t)
  =
  fun a ->
    fun gen_a ->
      fun mu_decode ->
        fun seed_se ->
          fun sk ->
            fun bp_matrix ->
              fun c_matrix ->
                let uu___ = get_bpp_cp_matrices a gen_a mu_decode seed_se sk in
                match uu___ with
                | (bpp_matrix, cp_matrix) ->
                    let mask =
                      crypto_kem_dec_kp_s_cond a bp_matrix bpp_matrix
                        c_matrix cp_matrix in
                    mask
let (crypto_kem_dec_ss0 :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      FStar_UInt16.t ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun ct ->
      fun mask ->
        fun kp ->
          fun s ->
            let kp_s =
              Obj.magic
                (Lib_ByteSequence.seq_mask_select Lib_IntTypes.U8
                   (match a with
                    | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                    | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                    | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                    | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))
                   (Obj.magic kp) (Obj.magic s)
                   (Obj.magic (FStar_Int_Cast.uint16_to_uint8 mask))) in
            let shake_input_ss =
              Lib_Sequence.concat
                (Spec_Frodo_Params.crypto_ciphertextbytes a)
                (match a with
                 | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                 | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                 | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) ct
                kp_s in
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
let (crypto_kem_dec_seed_se_k :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun mu_decode ->
      fun sk ->
        let pkh =
          Lib_Sequence.sub (Spec_Frodo_Params.crypto_secretkeybytes a) sk
            ((Spec_Frodo_Params.crypto_secretkeybytes a) -
               (Spec_Frodo_Params.bytes_pkhash a))
            (Spec_Frodo_Params.bytes_pkhash a) in
        let pkh_mu_decode =
          Lib_Sequence.concat (Spec_Frodo_Params.bytes_pkhash a)
            (Spec_Frodo_Params.bytes_mu a) pkh mu_decode in
        let seed_se_k =
          (match a with
           | Spec_Frodo_Params.Frodo64 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo640 -> Spec_SHA3.shake128
           | Spec_Frodo_Params.Frodo976 -> Spec_SHA3.shake256
           | Spec_Frodo_Params.Frodo1344 -> Spec_SHA3.shake256)
            ((Spec_Frodo_Params.bytes_pkhash a) +
               (Spec_Frodo_Params.bytes_mu a)) pkh_mu_decode
            ((Prims.of_int (2)) *
               (match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32)))) in
        seed_se_k
let (crypto_kem_dec_ss1 :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                  (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun ct ->
        fun sk ->
          fun mu_decode ->
            fun seed_se_k ->
              fun bp_matrix ->
                fun c_matrix ->
                  let seed_se =
                    Lib_Sequence.sub
                      ((Prims.of_int (2)) *
                         (match a with
                          | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                          | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                          | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                          | Spec_Frodo_Params.Frodo1344 ->
                              (Prims.of_int (32)))) seed_se_k Prims.int_zero
                      (match a with
                       | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                       | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                       | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                       | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
                  let kp =
                    Lib_Sequence.sub
                      ((Prims.of_int (2)) *
                         (match a with
                          | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                          | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                          | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                          | Spec_Frodo_Params.Frodo1344 ->
                              (Prims.of_int (32)))) seed_se_k
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
                  let s =
                    Lib_Sequence.sub
                      (Spec_Frodo_Params.crypto_secretkeybytes a) sk
                      Prims.int_zero
                      (match a with
                       | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                       | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                       | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                       | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) in
                  let mask =
                    crypto_kem_dec_kp_s a gen_a mu_decode seed_se sk
                      bp_matrix c_matrix in
                  let ss = crypto_kem_dec_ss0 a ct mask kp s in ss
let (crypto_kem_dec_ss2 :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
                (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun ct ->
        fun sk ->
          fun mu_decode ->
            fun bp_matrix ->
              fun c_matrix ->
                let seed_se_k = crypto_kem_dec_seed_se_k a mu_decode sk in
                let ss =
                  crypto_kem_dec_ss1 a gen_a ct sk mu_decode seed_se_k
                    bp_matrix c_matrix in
                ss
let (crypto_kem_dec_mu :
  Spec_Frodo_Params.frodo_alg ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun sk ->
      fun bp_matrix ->
        fun c_matrix ->
          let s_bytes =
            Lib_Sequence.sub (Spec_Frodo_Params.crypto_secretkeybytes a) sk
              ((match a with
                | Spec_Frodo_Params.Frodo64 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo640 -> (Prims.of_int (16))
                | Spec_Frodo_Params.Frodo976 -> (Prims.of_int (24))
                | Spec_Frodo_Params.Frodo1344 -> (Prims.of_int (32))) +
                 (Spec_Frodo_Params.crypto_publickeybytes a))
              (Spec_Frodo_Params.secretmatrixbytes_len a) in
          let mu_decode = frodo_mu_decode a s_bytes bp_matrix c_matrix in
          mu_decode
let (crypto_kem_dec_ :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt16.t, unit) Lib_Sequence.lseq ->
              (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun ct ->
        fun sk ->
          fun bp_matrix ->
            fun c_matrix ->
              let mu_decode = crypto_kem_dec_mu a sk bp_matrix c_matrix in
              let ss =
                crypto_kem_dec_ss2 a gen_a ct sk mu_decode bp_matrix c_matrix in
              ss
let (crypto_kem_dec :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun ct ->
        fun sk ->
          let uu___ = get_bp_c_matrices a ct in
          match uu___ with
          | (bp_matrix, c_matrix) ->
              let ss = crypto_kem_dec_ a gen_a ct sk bp_matrix c_matrix in ss