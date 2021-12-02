open Prims
let (print_nat8_hex : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint8 (FStar_UInt8.uint_to_t x)
let (print_nat8_hex_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint8_hex_pad (FStar_UInt8.uint_to_t x)
let (print_nat8_dec : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint8_dec (FStar_UInt8.uint_to_t x)
let (print_nat8_dec_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint8_dec_pad (FStar_UInt8.uint_to_t x)
let (print_nat32_hex : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint32 (FStar_UInt32.uint_to_t x)
let (print_nat32_hex_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint32_hex_pad (FStar_UInt32.uint_to_t x)
let (print_nat32_dec : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint32_dec (FStar_UInt32.uint_to_t x)
let (print_nat32_dec_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint32_dec_pad (FStar_UInt32.uint_to_t x)
let (print_nat64_hex : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint64 (FStar_UInt64.uint_to_t x)
let (print_nat64_hex_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint64_hex_pad (FStar_UInt64.uint_to_t x)
let (print_nat64_dec : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint64_dec (FStar_UInt64.uint_to_t x)
let (print_nat64_dec_pad : Prims.nat -> unit) =
  fun x -> FStar_IO.print_uint64_dec_pad (FStar_UInt64.uint_to_t x)
let (print_uint8_hex : FStar_UInt8.t -> unit) =
  fun x -> FStar_IO.print_uint8 x
let (print_uint8_hex_pad : FStar_UInt8.t -> unit) =
  fun x -> FStar_IO.print_uint8_hex_pad x
let (print_uint8_dec : FStar_UInt8.t -> unit) =
  fun x -> FStar_IO.print_uint8_dec x
let (print_uint8_dec_pad : FStar_UInt8.t -> unit) =
  fun x -> FStar_IO.print_uint8_dec_pad x
let (print_uint32_hex : FStar_UInt32.t -> unit) =
  fun x -> FStar_IO.print_uint32 x
let (print_uint32_hex_pad : FStar_UInt32.t -> unit) =
  fun x -> FStar_IO.print_uint32_hex_pad x
let (print_uint32_dec : FStar_UInt32.t -> unit) =
  fun x -> FStar_IO.print_uint32_dec x
let (print_uint32_dec_pad : FStar_UInt32.t -> unit) =
  fun x -> FStar_IO.print_uint32_dec_pad x
let (print_uint64_hex : FStar_UInt64.t -> unit) =
  fun x -> FStar_IO.print_uint64 x
let (print_uint64_hex_pad : FStar_UInt64.t -> unit) =
  fun x -> FStar_IO.print_uint64_hex_pad x
let (print_uint64_dec : FStar_UInt64.t -> unit) =
  fun x -> FStar_IO.print_uint64_dec x
let (print_uint64_dec_pad : FStar_UInt64.t -> unit) =
  fun x -> FStar_IO.print_uint64_dec_pad x
let (print_label_nat64 : Prims.bool -> Prims.string -> Prims.nat -> unit) =
  fun flag ->
    fun s ->
      fun x ->
        if Prims.op_Negation flag
        then ()
        else
          (FStar_IO.print_string s;
           FStar_IO.print_string ": ";
           print_nat64_dec x;
           FStar_IO.print_string "\n")
let (print_label_uint8 : Prims.bool -> Prims.string -> FStar_UInt8.t -> unit)
  =
  fun flag ->
    fun s ->
      fun x ->
        if Prims.op_Negation flag
        then ()
        else
          (FStar_IO.print_string s;
           FStar_IO.print_string ": ";
           print_uint8_hex_pad x;
           FStar_IO.print_string "\n")
let (print_label_uint32 :
  Prims.bool -> Prims.string -> FStar_UInt32.t -> unit) =
  fun flag ->
    fun s ->
      fun x ->
        if Prims.op_Negation flag
        then ()
        else
          (FStar_IO.print_string s;
           FStar_IO.print_string ": ";
           print_uint32_hex_pad x;
           FStar_IO.print_string "\n")
let (print_label_uint64 :
  Prims.bool -> Prims.string -> FStar_UInt64.t -> unit) =
  fun flag ->
    fun s ->
      fun x ->
        if Prims.op_Negation flag
        then ()
        else
          (FStar_IO.print_string s;
           FStar_IO.print_string ": ";
           print_uint64_hex_pad x;
           FStar_IO.print_string "\n")
let (print_list_nat64 : Prims.bool -> Prims.nat Prims.list -> unit) =
  fun flag ->
    fun l ->
      if Prims.op_Negation flag
      then ()
      else
        Lib_LoopCombinators.repeat_range_all_ml Prims.int_zero
          (FStar_List_Tot_Base.length l)
          (fun i ->
             fun uu___1 ->
               print_nat64_dec (FStar_List_Tot_Base.index l i);
               FStar_IO.print_string " ") ()
let (print_string : Prims.bool -> Prims.string -> unit) =
  fun flag -> fun s -> if flag then FStar_IO.print_string s else ()
let (print_lbytes :
  Prims.bool -> Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> unit)
  =
  fun flag ->
    fun len ->
      fun b ->
        if Prims.op_Negation flag
        then ()
        else
          (let q = (Prims.of_int (32)) in
           let n = len / q in
           let r = len mod q in
           if n = Prims.int_zero
           then
             FStar_List.iter (fun a -> print_uint8_hex_pad a)
               (Lib_Sequence.to_list b)
           else
             (Lib_LoopCombinators.repeat_range_all_ml Prims.int_zero n
                (fun i ->
                   fun uu___3 ->
                     let sb = Lib_Sequence.sub len b (i * q) q in
                     FStar_List.iter (fun a -> print_uint8_hex_pad a)
                       (Lib_Sequence.to_list sb);
                     if i < (n - Prims.int_one)
                     then FStar_IO.print_string "\n"
                     else ()) ();
              if r <> Prims.int_zero then FStar_IO.print_newline () else ();
              (let sb = Lib_Sequence.sub len b (n * q) r in
               FStar_List.iter (fun a -> print_uint8_hex_pad a)
                 (Lib_Sequence.to_list sb))))
let (print_label_lbytes :
  Prims.bool ->
    Prims.string ->
      Prims.nat -> (FStar_UInt8.t, unit) Lib_Sequence.lseq -> unit)
  =
  fun flag ->
    fun label ->
      fun len ->
        fun b ->
          if Prims.op_Negation flag
          then ()
          else
            (FStar_IO.print_string label;
             FStar_IO.print_string ": \n";
             print_lbytes flag len b;
             FStar_IO.print_newline ())
let (print_compare :
  Prims.bool ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun flag ->
    fun len ->
      fun expected ->
        fun result ->
          let r =
            Lib_Sequence.for_all2 len
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) expected result in
          if Prims.op_Negation flag
          then r
          else
            (FStar_IO.print_string "\nResult:   ";
             FStar_List.iter (fun a -> print_uint8_hex_pad a)
               (Lib_Sequence.to_list result);
             FStar_IO.print_string "\nExpected: ";
             FStar_List.iter (fun a -> print_uint8_hex_pad a)
               (Lib_Sequence.to_list expected);
             r)
let (print_compare_display :
  Prims.bool ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun flag ->
    fun len ->
      fun expected ->
        fun result ->
          let r =
            Lib_Sequence.for_all2 len
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) expected result in
          if Prims.op_Negation flag
          then r
          else
            (if r
             then FStar_IO.print_string "\nSuccess !"
             else
               (FStar_IO.print_string "\nResult:   ";
                FStar_List.iter (fun a -> print_uint8_hex_pad a)
                  (Lib_Sequence.to_list result);
                FStar_IO.print_string "\nExpected: ";
                FStar_List.iter (fun a -> print_uint8_hex_pad a)
                  (Lib_Sequence.to_list expected);
                FStar_IO.print_string "\nFailure !");
             r)
let (print_compare_display_diff :
  Prims.bool ->
    Prims.nat ->
      (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun flag ->
    fun len ->
      fun expected ->
        fun result ->
          let r =
            Lib_Sequence.for_all2 len
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) expected result in
          if Prims.op_Negation flag
          then r
          else
            (let diff =
               Lib_Sequence.map2 len
                 (fun a -> fun b -> FStar_UInt8.logxor a b) expected result in
             if r
             then FStar_IO.print_string "\nSuccess !"
             else
               (FStar_IO.print_string "\nFailure !";
                FStar_IO.print_newline ();
                FStar_IO.print_string "\nDiff: ";
                FStar_List.iter (fun a -> print_uint8_hex_pad a)
                  (Lib_Sequence.to_list diff);
                FStar_IO.print_newline ();
                FStar_IO.print_string "\nResult:   ";
                FStar_List.iter (fun a -> print_uint8_hex_pad a)
                  (Lib_Sequence.to_list result);
                FStar_IO.print_newline ();
                FStar_IO.print_string "\nExpected: ";
                FStar_List.iter (fun a -> print_uint8_hex_pad a)
                  (Lib_Sequence.to_list expected);
                FStar_IO.print_newline ());
             r)
let (print_label_compare_display :
  Prims.bool ->
    Prims.string ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun flag ->
    fun s ->
      fun len ->
        fun expected ->
          fun result ->
            let r =
              Lib_Sequence.for_all2 len
                (fun a ->
                   fun b ->
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic a))
                       =
                       (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                          (Obj.magic b))) expected result in
            if Prims.op_Negation flag
            then r
            else
              (if r
               then
                 (FStar_IO.print_string "\nSuccess ! ";
                  FStar_IO.print_string s)
               else
                 (FStar_IO.print_string "\nFailure ! ";
                  FStar_IO.print_string s;
                  FStar_IO.print_newline ();
                  FStar_IO.print_string "\nResult:   ";
                  FStar_List.iter (fun a -> print_uint8_hex_pad a)
                    (Lib_Sequence.to_list result);
                  FStar_IO.print_string "\nExpected: ";
                  FStar_List.iter (fun a -> print_uint8_hex_pad a)
                    (Lib_Sequence.to_list expected));
               r)
let (print_label_compare_display_diff :
  Prims.bool ->
    Prims.string ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun flag ->
    fun s ->
      fun len ->
        fun expected ->
          fun result ->
            let r =
              Lib_Sequence.for_all2 len
                (fun a ->
                   fun b ->
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic a))
                       =
                       (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                          (Obj.magic b))) expected result in
            if Prims.op_Negation flag
            then r
            else
              (let diff =
                 Lib_Sequence.map2 len
                   (fun a -> fun b -> FStar_UInt8.logxor a b) expected result in
               if r
               then
                 (FStar_IO.print_string "\nSuccess ! ";
                  FStar_IO.print_string s;
                  FStar_IO.print_newline ())
               else
                 (FStar_IO.print_string "\nFailure ! ";
                  FStar_IO.print_string s;
                  FStar_IO.print_newline ();
                  FStar_IO.print_string "\nDiff: ";
                  FStar_List.iter (fun a -> print_uint8_hex_pad a)
                    (Lib_Sequence.to_list diff);
                  FStar_IO.print_newline ();
                  FStar_IO.print_string "\nResult:   ";
                  FStar_List.iter (fun a -> print_uint8_hex_pad a)
                    (Lib_Sequence.to_list result);
                  FStar_IO.print_newline ();
                  FStar_IO.print_string "\nExpected: ";
                  FStar_List.iter (fun a -> print_uint8_hex_pad a)
                    (Lib_Sequence.to_list expected);
                  FStar_IO.print_newline ());
               r)