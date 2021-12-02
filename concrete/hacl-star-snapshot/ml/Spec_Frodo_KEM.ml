open Prims
let (crypto_kem_keypair :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      Spec_Frodo_Random.state_t ->
        ((FStar_UInt8.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, unit)
          Lib_Sequence.lseq))
  =
  fun a ->
    fun gen_a ->
      fun state -> Spec_Frodo_KEM_KeyGen.crypto_kem_keypair a gen_a state
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
        fun pk -> Spec_Frodo_KEM_Encaps.crypto_kem_enc a gen_a state pk
let (crypto_kem_dec :
  Spec_Frodo_Params.frodo_alg ->
    Spec_Frodo_Params.frodo_gen_a ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun a ->
    fun gen_a ->
      fun ct -> fun sk -> Spec_Frodo_KEM_Decaps.crypto_kem_dec a gen_a ct sk