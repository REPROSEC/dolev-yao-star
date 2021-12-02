open Prims
let (init_as_list : FStar_UInt32.t Prims.list) =
  [FStar_UInt32.uint_to_t (Prims.parse_int "0x67452301");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xefcdab89");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x98badcfe");
  FStar_UInt32.uint_to_t (Prims.parse_int "0x10325476");
  FStar_UInt32.uint_to_t (Prims.parse_int "0xc3d2e1f0")]
let (h0 : FStar_UInt32.t FStar_Seq_Base.seq) =
  FStar_Seq_Properties.seq_of_list
    [FStar_UInt32.uint_to_t (Prims.parse_int "0x67452301");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xefcdab89");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x98badcfe");
    FStar_UInt32.uint_to_t (Prims.parse_int "0x10325476");
    FStar_UInt32.uint_to_t (Prims.parse_int "0xc3d2e1f0")]
let (init : unit Spec_Hash_Definitions.init_t) = Obj.magic (h0, ())


type ('mi, 'n, 'res) compute_w_post = unit

let (compute_w_n' :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
    Prims.nat -> (Prims.nat -> FStar_UInt32.t) -> FStar_UInt32.t)
  =
  fun mi ->
    fun n ->
      fun w ->
        let r =
          if n < (Prims.of_int (16))
          then FStar_Seq_Base.index mi n
          else
            FStar_UInt32.logor
              (FStar_UInt32.shift_left
                 (FStar_UInt32.logxor (w (n - (Prims.of_int (3))))
                    (FStar_UInt32.logxor (w (n - (Prims.of_int (8))))
                       (FStar_UInt32.logxor (w (n - (Prims.of_int (14))))
                          (w (n - (Prims.of_int (16)))))))
                 (FStar_UInt32.uint_to_t Prims.int_one))
              (FStar_UInt32.shift_right
                 (FStar_UInt32.logxor (w (n - (Prims.of_int (3))))
                    (FStar_UInt32.logxor (w (n - (Prims.of_int (8))))
                       (FStar_UInt32.logxor (w (n - (Prims.of_int (14))))
                          (w (n - (Prims.of_int (16)))))))
                 (FStar_UInt32.uint_to_t (Prims.of_int (31)))) in
        r
let (compute_w_n :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
    Prims.nat ->
      (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq -> FStar_UInt32.t)
  =
  fun mi ->
    fun n ->
      fun accu ->
        let r =
          if n < (Prims.of_int (16))
          then FStar_Seq_Base.index mi n
          else
            FStar_UInt32.logor
              (FStar_UInt32.shift_left
                 (FStar_UInt32.logxor
                    (FStar_Seq_Base.index accu (n - (Prims.of_int (3))))
                    (FStar_UInt32.logxor
                       (FStar_Seq_Base.index accu (n - (Prims.of_int (8))))
                       (FStar_UInt32.logxor
                          (FStar_Seq_Base.index accu
                             (n - (Prims.of_int (14))))
                          (FStar_Seq_Base.index accu
                             (n - (Prims.of_int (16)))))))
                 (FStar_UInt32.uint_to_t Prims.int_one))
              (FStar_UInt32.shift_right
                 (FStar_UInt32.logxor
                    (FStar_Seq_Base.index accu (n - (Prims.of_int (3))))
                    (FStar_UInt32.logxor
                       (FStar_Seq_Base.index accu (n - (Prims.of_int (8))))
                       (FStar_UInt32.logxor
                          (FStar_Seq_Base.index accu
                             (n - (Prims.of_int (14))))
                          (FStar_Seq_Base.index accu
                             (n - (Prims.of_int (16)))))))
                 (FStar_UInt32.uint_to_t (Prims.of_int (31)))) in
        r
let (compute_w_next :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
    Prims.nat ->
      (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
        (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq)
  =
  fun mi ->
    fun n ->
      fun accu ->
        let wn =
          let r =
            if n < (Prims.of_int (16))
            then FStar_Seq_Base.index mi n
            else
              FStar_UInt32.logor
                (FStar_UInt32.shift_left
                   (FStar_UInt32.logxor
                      (FStar_Seq_Base.index accu (n - (Prims.of_int (3))))
                      (FStar_UInt32.logxor
                         (FStar_Seq_Base.index accu (n - (Prims.of_int (8))))
                         (FStar_UInt32.logxor
                            (FStar_Seq_Base.index accu
                               (n - (Prims.of_int (14))))
                            (FStar_Seq_Base.index accu
                               (n - (Prims.of_int (16)))))))
                   (FStar_UInt32.uint_to_t Prims.int_one))
                (FStar_UInt32.shift_right
                   (FStar_UInt32.logxor
                      (FStar_Seq_Base.index accu (n - (Prims.of_int (3))))
                      (FStar_UInt32.logxor
                         (FStar_Seq_Base.index accu (n - (Prims.of_int (8))))
                         (FStar_UInt32.logxor
                            (FStar_Seq_Base.index accu
                               (n - (Prims.of_int (14))))
                            (FStar_Seq_Base.index accu
                               (n - (Prims.of_int (16)))))))
                   (FStar_UInt32.uint_to_t (Prims.of_int (31)))) in
          r in
        let accu' = FStar_Seq_Properties.snoc accu wn in accu'
let rec (compute_w :
  (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
    Prims.nat ->
      (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
        (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq)
  =
  fun mi ->
    fun n ->
      fun accu ->
        if n = (Prims.of_int (80))
        then accu
        else
          compute_w mi (n + Prims.int_one)
            (let wn =
               let r =
                 if n < (Prims.of_int (16))
                 then FStar_Seq_Base.index mi n
                 else
                   FStar_UInt32.logor
                     (FStar_UInt32.shift_left
                        (FStar_UInt32.logxor
                           (FStar_Seq_Base.index accu
                              (n - (Prims.of_int (3))))
                           (FStar_UInt32.logxor
                              (FStar_Seq_Base.index accu
                                 (n - (Prims.of_int (8))))
                              (FStar_UInt32.logxor
                                 (FStar_Seq_Base.index accu
                                    (n - (Prims.of_int (14))))
                                 (FStar_Seq_Base.index accu
                                    (n - (Prims.of_int (16)))))))
                        (FStar_UInt32.uint_to_t Prims.int_one))
                     (FStar_UInt32.shift_right
                        (FStar_UInt32.logxor
                           (FStar_Seq_Base.index accu
                              (n - (Prims.of_int (3))))
                           (FStar_UInt32.logxor
                              (FStar_Seq_Base.index accu
                                 (n - (Prims.of_int (8))))
                              (FStar_UInt32.logxor
                                 (FStar_Seq_Base.index accu
                                    (n - (Prims.of_int (14))))
                                 (FStar_Seq_Base.index accu
                                    (n - (Prims.of_int (16)))))))
                        (FStar_UInt32.uint_to_t (Prims.of_int (31)))) in
               r in
             let accu' = FStar_Seq_Properties.snoc accu wn in accu')
let (f :
  FStar_UInt32.t ->
    FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t)
  =
  fun t ->
    fun x ->
      fun y ->
        fun z ->
          if FStar_UInt32.lt t (FStar_UInt32.uint_to_t (Prims.of_int (20)))
          then
            FStar_UInt32.logxor (FStar_UInt32.logand x y)
              (FStar_UInt32.logand (FStar_UInt32.lognot x) z)
          else
            if
              (FStar_UInt32.lt (FStar_UInt32.uint_to_t (Prims.of_int (39))) t)
                &&
                (FStar_UInt32.lt t
                   (FStar_UInt32.uint_to_t (Prims.of_int (60))))
            then
              FStar_UInt32.logxor (FStar_UInt32.logand x y)
                (FStar_UInt32.logxor (FStar_UInt32.logand x z)
                   (FStar_UInt32.logand y z))
            else FStar_UInt32.logxor x (FStar_UInt32.logxor y z)
let (k : FStar_UInt32.t -> FStar_UInt32.t) =
  fun t ->
    if FStar_UInt32.lt t (FStar_UInt32.uint_to_t (Prims.of_int (20)))
    then FStar_UInt32.uint_to_t (Prims.parse_int "0x5a827999")
    else
      if FStar_UInt32.lt t (FStar_UInt32.uint_to_t (Prims.of_int (40)))
      then FStar_UInt32.uint_to_t (Prims.parse_int "0x6ed9eba1")
      else
        if FStar_UInt32.lt t (FStar_UInt32.uint_to_t (Prims.of_int (60)))
        then FStar_UInt32.uint_to_t (Prims.parse_int "0x8f1bbcdc")
        else FStar_UInt32.uint_to_t (Prims.parse_int "0xca62c1d6")
type word_block = (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq
let (step3_body'_aux :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq ->
      FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun mi ->
    fun st ->
      fun t ->
        fun wt ->
          let sta = FStar_Seq_Base.index st Prims.int_zero in
          let stb = FStar_Seq_Base.index st Prims.int_one in
          let stc = FStar_Seq_Base.index st (Prims.of_int (2)) in
          let std = FStar_Seq_Base.index st (Prims.of_int (3)) in
          let ste = FStar_Seq_Base.index st (Prims.of_int (4)) in
          let _T =
            FStar_UInt32.add_mod
              (FStar_UInt32.add_mod
                 (FStar_UInt32.add_mod
                    (FStar_UInt32.add_mod
                       (FStar_UInt32.logor
                          (FStar_UInt32.shift_left sta
                             (FStar_UInt32.uint_to_t (Prims.of_int (5))))
                          (FStar_UInt32.shift_right sta
                             (FStar_UInt32.uint_to_t (Prims.of_int (27)))))
                       (if
                          FStar_UInt32.lt t
                            (FStar_UInt32.uint_to_t (Prims.of_int (20)))
                        then
                          FStar_UInt32.logxor (FStar_UInt32.logand stb stc)
                            (FStar_UInt32.logand (FStar_UInt32.lognot stb)
                               std)
                        else
                          if
                            (FStar_UInt32.lt
                               (FStar_UInt32.uint_to_t (Prims.of_int (39))) t)
                              &&
                              (FStar_UInt32.lt t
                                 (FStar_UInt32.uint_to_t (Prims.of_int (60))))
                          then
                            FStar_UInt32.logxor (FStar_UInt32.logand stb stc)
                              (FStar_UInt32.logxor
                                 (FStar_UInt32.logand stb std)
                                 (FStar_UInt32.logand stc std))
                          else
                            FStar_UInt32.logxor stb
                              (FStar_UInt32.logxor stc std))) ste)
                 (if
                    FStar_UInt32.lt t
                      (FStar_UInt32.uint_to_t (Prims.of_int (20)))
                  then FStar_UInt32.uint_to_t (Prims.parse_int "0x5a827999")
                  else
                    if
                      FStar_UInt32.lt t
                        (FStar_UInt32.uint_to_t (Prims.of_int (40)))
                    then
                      FStar_UInt32.uint_to_t (Prims.parse_int "0x6ed9eba1")
                    else
                      if
                        FStar_UInt32.lt t
                          (FStar_UInt32.uint_to_t (Prims.of_int (60)))
                      then
                        FStar_UInt32.uint_to_t (Prims.parse_int "0x8f1bbcdc")
                      else
                        FStar_UInt32.uint_to_t (Prims.parse_int "0xca62c1d6")))
              wt in
          let e = std in
          let d = stc in
          let c =
            FStar_UInt32.logor
              (FStar_UInt32.shift_left stb
                 (FStar_UInt32.uint_to_t (Prims.of_int (30))))
              (FStar_UInt32.shift_right stb
                 (FStar_UInt32.uint_to_t (Prims.of_int (2)))) in
          let b = sta in
          let a = _T in
          let l = [a; b; c; d; e] in FStar_Seq_Properties.seq_of_list l
let (step3_body' :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq ->
      FStar_UInt32.t -> FStar_UInt32.t -> FStar_UInt32.t FStar_Seq_Base.seq)
  = step3_body'_aux
type 'mi step3_body_w_t = Prims.nat -> FStar_UInt32.t
let (step3_body :
  word_block ->
    (Prims.nat -> FStar_UInt32.t) ->
      FStar_UInt32.t FStar_Seq_Base.seq ->
        Prims.nat -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun mi ->
    fun w ->
      fun st -> fun t -> step3_body' mi st (FStar_UInt32.uint_to_t t) (w t)
let (index_compute_w :
  word_block ->
    (FStar_UInt32.t, unit) FStar_Seq_Properties.lseq ->
      Prims.nat -> FStar_UInt32.t)
  = fun mi -> fun cwt -> fun t -> FStar_Seq_Base.index cwt t
let (step3_aux :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun mi ->
    fun h ->
      let cwt = compute_w mi Prims.int_zero (FStar_Seq_Base.empty ()) in
      Spec_Loops.repeat_range Prims.int_zero (Prims.of_int (80))
        (step3_body mi (fun t -> FStar_Seq_Base.index cwt t)) h
let (step3 :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq -> FStar_UInt32.t FStar_Seq_Base.seq)
  = step3_aux
let (step4_aux :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq -> FStar_UInt32.t FStar_Seq_Base.seq)
  =
  fun mi ->
    fun h ->
      let st = step3 mi h in
      let sta = FStar_Seq_Base.index st Prims.int_zero in
      let stb = FStar_Seq_Base.index st Prims.int_one in
      let stc = FStar_Seq_Base.index st (Prims.of_int (2)) in
      let std = FStar_Seq_Base.index st (Prims.of_int (3)) in
      let ste = FStar_Seq_Base.index st (Prims.of_int (4)) in
      FStar_Seq_Properties.seq_of_list
        [FStar_UInt32.add_mod sta (FStar_Seq_Base.index h Prims.int_zero);
        FStar_UInt32.add_mod stb (FStar_Seq_Base.index h Prims.int_one);
        FStar_UInt32.add_mod stc (FStar_Seq_Base.index h (Prims.of_int (2)));
        FStar_UInt32.add_mod std (FStar_Seq_Base.index h (Prims.of_int (3)));
        FStar_UInt32.add_mod ste (FStar_Seq_Base.index h (Prims.of_int (4)))]
let (step4 :
  word_block ->
    FStar_UInt32.t FStar_Seq_Base.seq -> FStar_UInt32.t FStar_Seq_Base.seq)
  = step4_aux
let (words_of_bytes_block : Spec_Hash_Definitions.bytes -> word_block) =
  fun uu___ ->
    (fun l ->
       Obj.magic
         (Spec_Hash_Definitions.words_of_bytes Spec_Hash_Definitions.SHA1
            Spec_Hash_Definitions.block_word_length l)) uu___
let (update_aux :
  unit Spec_Hash_Definitions.words_state ->
    Spec_Hash_Definitions.bytes -> unit Spec_Hash_Definitions.words_state)
  =
  fun uu___1 ->
    fun uu___ ->
      (fun h ->
         fun l ->
           let uu___ = h in
           match Obj.magic uu___ with
           | (h1, uu___1) ->
               let mi = words_of_bytes_block l in
               Obj.magic ((step4 mi h1), ())) uu___1 uu___
let (update : unit Spec_Hash_Definitions.update_t) = update_aux
let (pad : unit Spec_Hash_Definitions.pad_t) =
  Spec_Hash_PadFinish.pad Spec_Hash_Definitions.SHA1
let (finish : unit Spec_Hash_Definitions.finish_t) =
  Spec_Hash_PadFinish.finish Spec_Hash_Definitions.SHA1