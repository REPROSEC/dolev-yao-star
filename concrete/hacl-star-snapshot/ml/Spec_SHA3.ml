open Prims
type state = (FStar_UInt64.t, unit) Lib_Sequence.lseq
type index = Prims.nat
let (readLane :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> Prims.nat -> FStar_UInt64.t)
  =
  fun s ->
    fun x ->
      fun y ->
        Lib_Sequence.index (Prims.of_int (25)) s
          (x + ((Prims.of_int (5)) * y))
let (writeLane :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      Prims.nat -> FStar_UInt64.t -> (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun x ->
      fun y ->
        fun v ->
          Lib_Sequence.upd (Prims.of_int (25)) s
            (x + ((Prims.of_int (5)) * y)) v
let (rotl : FStar_UInt64.t -> FStar_UInt32.t -> FStar_UInt64.t) =
  fun a ->
    fun b ->
      FStar_UInt64.logor (FStar_UInt64.shift_left a b)
        (FStar_UInt64.shift_right a
           (FStar_UInt32.sub (FStar_UInt32.uint_to_t (Prims.of_int (64))) b))
let (state_theta_inner_C :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun i ->
      fun _C ->
        Lib_Sequence.upd (Prims.of_int (5)) _C i
          (FStar_UInt64.logxor (readLane s i Prims.int_zero)
             (FStar_UInt64.logxor (readLane s i Prims.int_one)
                (FStar_UInt64.logxor (readLane s i (Prims.of_int (2)))
                   (FStar_UInt64.logxor (readLane s i (Prims.of_int (3)))
                      (readLane s i (Prims.of_int (4)))))))
let (state_theta0 :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun _C ->
      Lib_LoopCombinators.repeati (Prims.of_int (5)) (state_theta_inner_C s)
        _C
let (state_theta_inner_s_inner :
  Prims.nat ->
    FStar_UInt64.t ->
      Prims.nat ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun x ->
    fun _D ->
      fun y ->
        fun s -> writeLane s x y (FStar_UInt64.logxor (readLane s x y) _D)
let (state_theta_inner_s :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun _C ->
    fun x ->
      fun s ->
        let _D =
          FStar_UInt64.logxor
            (Lib_Sequence.index (Prims.of_int (5)) _C
               ((x + (Prims.of_int (4))) mod (Prims.of_int (5))))
            (rotl
               (Lib_Sequence.index (Prims.of_int (5)) _C
                  ((x + Prims.int_one) mod (Prims.of_int (5))))
               (FStar_UInt32.uint_to_t Prims.int_one)) in
        Lib_LoopCombinators.repeati (Prims.of_int (5))
          (state_theta_inner_s_inner x _D) s
let (state_theta1 :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun _C ->
      Lib_LoopCombinators.repeati (Prims.of_int (5)) (state_theta_inner_s _C)
        s
let (state_theta :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    let _C =
      Lib_Sequence.create (Prims.of_int (5))
        (FStar_UInt64.uint_to_t Prims.int_zero) in
    let _C1 = state_theta0 s _C in state_theta1 s _C1
let (state_pi_rho_inner :
  Prims.nat ->
    (FStar_UInt64.t * (FStar_UInt64.t, unit) Lib_Sequence.lseq) ->
      (FStar_UInt64.t * (FStar_UInt64.t, unit) Lib_Sequence.lseq))
  =
  fun i ->
    fun uu___ ->
      match uu___ with
      | (current, s) ->
          let r =
            Lib_Sequence.index (Prims.of_int (24))
              Spec_SHA3_Constants.keccak_rotc i in
          let _Y =
            Lib_IntTypes.v Lib_IntTypes.U32 Lib_IntTypes.PUB
              (Obj.magic
                 (Lib_Sequence.index (Prims.of_int (24))
                    Spec_SHA3_Constants.keccak_piln i)) in
          let temp = Lib_Sequence.index (Prims.of_int (25)) s _Y in
          let s1 = Lib_Sequence.upd (Prims.of_int (25)) s _Y (rotl current r) in
          let current1 = temp in (current1, s1)
type 'i state_pi_rho_s =
  (FStar_UInt64.t * (FStar_UInt64.t, unit) Lib_Sequence.lseq)
let (state_pi_rho :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s_theta ->
    let current = readLane s_theta Prims.int_one Prims.int_zero in
    let uu___ =
      Obj.magic
        (Lib_LoopCombinators.repeat_gen (Prims.of_int (24)) ()
           (fun uu___2 ->
              fun uu___1 -> (Obj.magic state_pi_rho_inner) uu___2 uu___1)
           (Obj.magic (current, s_theta))) in
    match uu___ with | (uu___1, s_pi_rho) -> s_pi_rho
let (state_chi_inner :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s_pi_rho ->
    fun y ->
      fun x ->
        fun s ->
          writeLane s x y
            (FStar_UInt64.logxor (readLane s_pi_rho x y)
               (FStar_UInt64.logand
                  (FStar_UInt64.lognot
                     (readLane s_pi_rho
                        ((x + Prims.int_one) mod (Prims.of_int (5))) y))
                  (readLane s_pi_rho
                     ((x + (Prims.of_int (2))) mod (Prims.of_int (5))) y)))
let (state_chi_inner1 :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s_pi_rho ->
    fun y ->
      fun s ->
        Lib_LoopCombinators.repeati (Prims.of_int (5))
          (state_chi_inner s_pi_rho y) s
let (state_chi :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s_pi_rho ->
    Lib_LoopCombinators.repeati (Prims.of_int (5))
      (state_chi_inner1 s_pi_rho) s_pi_rho
let (state_iota :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun round ->
      writeLane s Prims.int_zero Prims.int_zero
        (FStar_UInt64.logxor (readLane s Prims.int_zero Prims.int_zero)
           (Lib_Sequence.index (Prims.of_int (24))
              Spec_SHA3_Constants.keccak_rndc round))
let (state_permute1 :
  Prims.nat ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun round ->
    fun s ->
      let s_theta = state_theta s in
      let s_pi_rho = state_pi_rho s_theta in
      let s_chi = state_chi s_pi_rho in
      let s_iota = state_iota s_chi round in s_iota
let (state_permute :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  = fun s -> Lib_LoopCombinators.repeati (Prims.of_int (24)) state_permute1 s
let (loadState_inner :
  (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun block ->
    fun j ->
      fun s ->
        Lib_Sequence.upd (Prims.of_int (25)) s j
          (FStar_UInt64.logxor (Lib_Sequence.index (Prims.of_int (25)) s j)
             (let n =
                Lib_ByteSequence.nat_from_intseq_le_ Lib_IntTypes.U8
                  Lib_IntTypes.SEC
                  (Obj.magic
                     (Lib_Sequence.sub (Prims.of_int (200)) block
                        (j * (Prims.of_int (8))) (Prims.of_int (8)))) in
              FStar_UInt64.uint_to_t n))
let (loadState :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun rateInBytes ->
    fun input ->
      fun s ->
        let block =
          Lib_Sequence.create (Prims.of_int (200))
            (FStar_UInt8.uint_to_t Prims.int_zero) in
        let block1 =
          Lib_Sequence.update_sub (Prims.of_int (200)) block Prims.int_zero
            rateInBytes input in
        Lib_LoopCombinators.repeati (Prims.of_int (25))
          (loadState_inner block1) s
let (storeState_inner :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun j ->
      fun block ->
        Lib_Sequence.update_sub (Prims.of_int (200)) block
          (j * (Prims.of_int (8))) (Prims.of_int (8))
          (Obj.magic
             (Lib_ByteSequence.nat_to_intseq_le_ Lib_IntTypes.U8
                Lib_IntTypes.SEC (Prims.of_int (8))
                (Lib_IntTypes.v Lib_IntTypes.U64 Lib_IntTypes.SEC
                   (Obj.magic (Lib_Sequence.index (Prims.of_int (25)) s j)))))
let (storeState :
  Prims.nat ->
    (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun rateInBytes ->
    fun s ->
      let block =
        Lib_Sequence.create (Prims.of_int (200))
          (FStar_UInt8.uint_to_t Prims.int_zero) in
      let block1 =
        Lib_LoopCombinators.repeati (Prims.of_int (25)) (storeState_inner s)
          block in
      Lib_Sequence.sub (Prims.of_int (200)) block1 Prims.int_zero rateInBytes
let (absorb_next :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun rateInBytes ->
      let nextBlock =
        Lib_Sequence.create rateInBytes
          (FStar_UInt8.uint_to_t Prims.int_zero) in
      let nextBlock1 =
        Lib_Sequence.upd rateInBytes nextBlock (rateInBytes - Prims.int_one)
          (FStar_UInt8.uint_to_t (Prims.of_int (0x80))) in
      let s1 = loadState rateInBytes nextBlock1 s in state_permute s1
let (absorb_last :
  FStar_UInt8.t ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
            (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun delimitedSuffix ->
    fun rateInBytes ->
      fun rem ->
        fun input ->
          fun s ->
            let lastBlock =
              Lib_Sequence.create rateInBytes
                (FStar_UInt8.uint_to_t Prims.int_zero) in
            let lastBlock1 =
              Lib_Sequence.update_sub rateInBytes lastBlock Prims.int_zero
                rem input in
            let lastBlock2 =
              Lib_Sequence.upd rateInBytes lastBlock1 rem delimitedSuffix in
            let s1 = loadState rateInBytes lastBlock2 s in
            let s2 =
              if
                (Prims.op_Negation
                   (FStar_UInt8.eq
                      (FStar_UInt8.logand delimitedSuffix
                         (FStar_UInt8.uint_to_t (Prims.of_int (0x80))))
                      (FStar_UInt8.uint_to_t Prims.int_zero)))
                  && (rem = (rateInBytes - Prims.int_one))
              then state_permute s1
              else s1 in
            absorb_next s2 rateInBytes
let (absorb_inner :
  Prims.nat ->
    (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
      (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun rateInBytes ->
    fun block ->
      fun s -> let s1 = loadState rateInBytes block s in state_permute s1
let (absorb :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t -> (FStar_UInt64.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun rateInBytes ->
      fun inputByteLen ->
        fun input ->
          fun delimitedSuffix ->
            Lib_Sequence.repeat_blocks rateInBytes input
              (absorb_inner rateInBytes)
              (absorb_last delimitedSuffix rateInBytes) s
let (squeeze_inner :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
          ((FStar_UInt64.t, unit) Lib_Sequence.lseq * (FStar_UInt8.t, 
            unit) Lib_Sequence.lseq))
  =
  fun rateInBytes ->
    fun outputByteLen ->
      fun i ->
        fun s ->
          let block = storeState rateInBytes s in
          let s1 = state_permute s in (s1, block)
let (squeeze :
  (FStar_UInt64.t, unit) Lib_Sequence.lseq ->
    Prims.nat -> Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun s ->
    fun rateInBytes ->
      fun outputByteLen ->
        let outBlocks = outputByteLen / rateInBytes in
        let uu___ =
          Lib_Sequence.generate_blocks rateInBytes outBlocks outBlocks ()
            (fun uu___2 ->
               fun uu___1 ->
                 (Obj.magic (squeeze_inner rateInBytes outputByteLen)) uu___2
                   uu___1) (Obj.magic s) in
        match uu___ with
        | (s1, output) ->
            let remOut = outputByteLen mod rateInBytes in
            let block = storeState remOut (Obj.magic s1) in
            Lib_Sequence.op_At_Bar (Lib_Sequence.length output) remOut
              (Lib_Sequence.to_lseq output) block
let (keccak :
  Prims.nat ->
    Prims.nat ->
      Prims.nat ->
        FStar_UInt8.t Lib_Sequence.seq ->
          FStar_UInt8.t ->
            Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun rate ->
    fun capacity ->
      fun inputByteLen ->
        fun input ->
          fun delimitedSuffix ->
            fun outputByteLen ->
              let rateInBytes = rate / (Prims.of_int (8)) in
              let s =
                Lib_Sequence.create (Prims.of_int (25))
                  (FStar_UInt64.uint_to_t Prims.int_zero) in
              let s1 =
                absorb s rateInBytes inputByteLen input delimitedSuffix in
              squeeze s1 rateInBytes outputByteLen
let (shake128 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      fun outputByteLen ->
        keccak (Prims.of_int (1344)) (Prims.of_int (256)) inputByteLen input
          (FStar_UInt8.uint_to_t (Prims.of_int (0x1F))) outputByteLen
let (shake256 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      fun outputByteLen ->
        keccak (Prims.of_int (1088)) (Prims.of_int (512)) inputByteLen input
          (FStar_UInt8.uint_to_t (Prims.of_int (0x1F))) outputByteLen
let (sha3_224 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      keccak (Prims.of_int (1152)) (Prims.of_int (448)) inputByteLen input
        (FStar_UInt8.uint_to_t (Prims.of_int (0x06))) (Prims.of_int (28))
let (sha3_256 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      keccak (Prims.of_int (1088)) (Prims.of_int (512)) inputByteLen input
        (FStar_UInt8.uint_to_t (Prims.of_int (0x06))) (Prims.of_int (32))
let (sha3_384 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      keccak (Prims.of_int (832)) (Prims.of_int (768)) inputByteLen input
        (FStar_UInt8.uint_to_t (Prims.of_int (0x06))) (Prims.of_int (48))
let (sha3_512 :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun inputByteLen ->
    fun input ->
      keccak (Prims.of_int (576)) (Prims.of_int (1024)) inputByteLen input
        (FStar_UInt8.uint_to_t (Prims.of_int (0x06))) (Prims.of_int (64))
let (cshake128_frodo :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq ->
      FStar_UInt16.t -> Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun input_len ->
    fun input ->
      fun cstm ->
        fun output_len ->
          let s =
            Lib_Sequence.create (Prims.of_int (25))
              (FStar_UInt64.uint_to_t Prims.int_zero) in
          let s1 =
            Lib_Sequence.upd (Prims.of_int (25)) s Prims.int_zero
              (FStar_UInt64.logor
                 (FStar_UInt64.uint_to_t (Prims.parse_int "0x10010001a801"))
                 (FStar_UInt64.shift_left
                    (FStar_Int_Cast.uint16_to_uint64 cstm)
                    (FStar_UInt32.uint_to_t (Prims.of_int (48))))) in
          let s2 = state_permute s1 in
          let s3 =
            absorb s2 (Prims.of_int (168)) input_len input
              (FStar_UInt8.uint_to_t (Prims.of_int (0x04))) in
          squeeze s3 (Prims.of_int (168)) output_len
let (cshake256_frodo :
  Prims.nat ->
    FStar_UInt8.t Lib_Sequence.seq ->
      FStar_UInt16.t -> Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq)
  =
  fun input_len ->
    fun input ->
      fun cstm ->
        fun output_len ->
          let s =
            Lib_Sequence.create (Prims.of_int (25))
              (FStar_UInt64.uint_to_t Prims.int_zero) in
          let s1 =
            Lib_Sequence.upd (Prims.of_int (25)) s Prims.int_zero
              (FStar_UInt64.logor
                 (FStar_UInt64.uint_to_t (Prims.parse_int "0x100100018801"))
                 (FStar_UInt64.shift_left
                    (FStar_Int_Cast.uint16_to_uint64 cstm)
                    (FStar_UInt32.uint_to_t (Prims.of_int (48))))) in
          let s2 = state_permute s1 in
          let s3 =
            absorb s2 (Prims.of_int (136)) input_len input
              (FStar_UInt8.uint_to_t (Prims.of_int (0x04))) in
          squeeze s3 (Prims.of_int (136)) output_len