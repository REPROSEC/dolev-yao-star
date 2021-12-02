open Prims
type ('n, 'a) seqn = 'a FStar_Seq_Base.seq
type 'a seq2 = (unit, 'a) seqn
type 'a seq4 = (unit, 'a) seqn
type 'a seq8 = (unit, 'a) seqn
type 'a seq16 = (unit, 'a) seqn
let seq_to_two_LE : 'a . 'a seq2 -> 'a Vale_Def_Words_s.two =
  fun s ->
    {
      Vale_Def_Words_s.lo = (FStar_Seq_Base.index s Prims.int_zero);
      Vale_Def_Words_s.hi = (FStar_Seq_Base.index s Prims.int_one)
    }
let seq_to_two_BE : 'a . 'a seq2 -> 'a Vale_Def_Words_s.two =
  fun s ->
    {
      Vale_Def_Words_s.lo = (FStar_Seq_Base.index s Prims.int_one);
      Vale_Def_Words_s.hi = (FStar_Seq_Base.index s Prims.int_zero)
    }
let seq_to_four_LE : 'a . 'a seq4 -> 'a Vale_Def_Words_s.four =
  fun s ->
    {
      Vale_Def_Words_s.lo0 = (FStar_Seq_Base.index s Prims.int_zero);
      Vale_Def_Words_s.lo1 = (FStar_Seq_Base.index s Prims.int_one);
      Vale_Def_Words_s.hi2 = (FStar_Seq_Base.index s (Prims.of_int (2)));
      Vale_Def_Words_s.hi3 = (FStar_Seq_Base.index s (Prims.of_int (3)))
    }
let seq_to_four_BE : 'a . 'a seq4 -> 'a Vale_Def_Words_s.four =
  fun s ->
    {
      Vale_Def_Words_s.lo0 = (FStar_Seq_Base.index s (Prims.of_int (3)));
      Vale_Def_Words_s.lo1 = (FStar_Seq_Base.index s (Prims.of_int (2)));
      Vale_Def_Words_s.hi2 = (FStar_Seq_Base.index s Prims.int_one);
      Vale_Def_Words_s.hi3 = (FStar_Seq_Base.index s Prims.int_zero)
    }
let two_to_seq_LE : 'a . 'a Vale_Def_Words_s.two -> 'a seq2 =
  fun x ->
    let l = [x.Vale_Def_Words_s.lo; x.Vale_Def_Words_s.hi] in
    let s = FStar_Seq_Properties.seq_of_list l in
    FStar_Seq_Properties.seq_of_list l
let two_to_seq_BE : 'a . 'a Vale_Def_Words_s.two -> 'a seq2 =
  fun x ->
    let l = [x.Vale_Def_Words_s.hi; x.Vale_Def_Words_s.lo] in
    let s = FStar_Seq_Properties.seq_of_list l in
    FStar_Seq_Properties.seq_of_list l
let four_to_seq_LE : 'a . 'a Vale_Def_Words_s.four -> 'a seq4 =
  fun x ->
    let l =
      [x.Vale_Def_Words_s.lo0;
      x.Vale_Def_Words_s.lo1;
      x.Vale_Def_Words_s.hi2;
      x.Vale_Def_Words_s.hi3] in
    let s = FStar_Seq_Properties.seq_of_list l in
    FStar_Seq_Properties.seq_of_list l
let four_to_seq_BE : 'a . 'a Vale_Def_Words_s.four -> 'a seq4 =
  fun x ->
    let l =
      [x.Vale_Def_Words_s.hi3;
      x.Vale_Def_Words_s.hi2;
      x.Vale_Def_Words_s.lo1;
      x.Vale_Def_Words_s.lo0] in
    let s = FStar_Seq_Properties.seq_of_list l in
    FStar_Seq_Properties.seq_of_list l
let seq_two_to_seq_LE :
  'a . 'a Vale_Def_Words_s.two FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun x ->
    let f n =
      Vale_Def_Words_Two_s.two_select
        (FStar_Seq_Base.index x (n / (Prims.of_int (2))))
        (n mod (Prims.of_int (2))) in
    if ((FStar_Seq_Base.length x) * (Prims.of_int (2))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) * (Prims.of_int (2))) Prims.int_zero f
let seq_two_to_seq_BE :
  'a . 'a Vale_Def_Words_s.two FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun x ->
    let f n =
      Vale_Def_Words_Two_s.two_select
        (FStar_Seq_Base.index x (n / (Prims.of_int (2))))
        (Prims.int_one - (n mod (Prims.of_int (2)))) in
    if ((FStar_Seq_Base.length x) * (Prims.of_int (2))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) * (Prims.of_int (2))) Prims.int_zero f
let seq_four_to_seq_LE :
  'a . 'a Vale_Def_Words_s.four FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun x ->
    let f n =
      Vale_Def_Words_Four_s.four_select
        (FStar_Seq_Base.index x (n / (Prims.of_int (4))))
        (n mod (Prims.of_int (4))) in
    if ((FStar_Seq_Base.length x) * (Prims.of_int (4))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) * (Prims.of_int (4))) Prims.int_zero f
let seq_four_to_seq_BE :
  'a . 'a Vale_Def_Words_s.four FStar_Seq_Base.seq -> 'a FStar_Seq_Base.seq =
  fun x ->
    let f n =
      Vale_Def_Words_Four_s.four_select
        (FStar_Seq_Base.index x (n / (Prims.of_int (4))))
        ((Prims.of_int (3)) - (n mod (Prims.of_int (4)))) in
    if ((FStar_Seq_Base.length x) * (Prims.of_int (4))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) * (Prims.of_int (4))) Prims.int_zero f
let seq_to_seq_two_LE :
  'a . 'a FStar_Seq_Base.seq -> 'a Vale_Def_Words_s.two FStar_Seq_Base.seq =
  fun x ->
    let f n =
      {
        Vale_Def_Words_s.lo =
          (FStar_Seq_Base.index x (n * (Prims.of_int (2))));
        Vale_Def_Words_s.hi =
          (FStar_Seq_Base.index x ((n * (Prims.of_int (2))) + Prims.int_one))
      } in
    if ((FStar_Seq_Base.length x) / (Prims.of_int (2))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) / (Prims.of_int (2))) Prims.int_zero f
let seq_to_seq_two_BE :
  'a . 'a FStar_Seq_Base.seq -> 'a Vale_Def_Words_s.two FStar_Seq_Base.seq =
  fun x ->
    let f n =
      {
        Vale_Def_Words_s.lo =
          (FStar_Seq_Base.index x ((n * (Prims.of_int (2))) + Prims.int_one));
        Vale_Def_Words_s.hi =
          (FStar_Seq_Base.index x (n * (Prims.of_int (2))))
      } in
    if ((FStar_Seq_Base.length x) / (Prims.of_int (2))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) / (Prims.of_int (2))) Prims.int_zero f
let seq_to_seq_four_LE :
  'a . 'a FStar_Seq_Base.seq -> 'a Vale_Def_Words_s.four FStar_Seq_Base.seq =
  fun x ->
    let f n =
      {
        Vale_Def_Words_s.lo0 =
          (FStar_Seq_Base.index x (n * (Prims.of_int (4))));
        Vale_Def_Words_s.lo1 =
          (FStar_Seq_Base.index x ((n * (Prims.of_int (4))) + Prims.int_one));
        Vale_Def_Words_s.hi2 =
          (FStar_Seq_Base.index x
             ((n * (Prims.of_int (4))) + (Prims.of_int (2))));
        Vale_Def_Words_s.hi3 =
          (FStar_Seq_Base.index x
             ((n * (Prims.of_int (4))) + (Prims.of_int (3))))
      } in
    if ((FStar_Seq_Base.length x) / (Prims.of_int (4))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) / (Prims.of_int (4))) Prims.int_zero f
let seq_to_seq_four_BE :
  'a . 'a FStar_Seq_Base.seq -> 'a Vale_Def_Words_s.four FStar_Seq_Base.seq =
  fun x ->
    let f n =
      {
        Vale_Def_Words_s.lo0 =
          (FStar_Seq_Base.index x
             ((n * (Prims.of_int (4))) + (Prims.of_int (3))));
        Vale_Def_Words_s.lo1 =
          (FStar_Seq_Base.index x
             ((n * (Prims.of_int (4))) + (Prims.of_int (2))));
        Vale_Def_Words_s.hi2 =
          (FStar_Seq_Base.index x ((n * (Prims.of_int (4))) + Prims.int_one));
        Vale_Def_Words_s.hi3 =
          (FStar_Seq_Base.index x (n * (Prims.of_int (4))))
      } in
    if ((FStar_Seq_Base.length x) / (Prims.of_int (4))) = Prims.int_zero
    then FStar_Seq_Base.MkSeq []
    else
      FStar_Seq_Base.init_aux
        ((FStar_Seq_Base.length x) / (Prims.of_int (4))) Prims.int_zero f
let (seq_nat8_to_seq_nat32_LE :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq)
  =
  fun x ->
    Vale_Lib_Seqs_s.seq_map
      (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8)))
      (seq_to_seq_four_LE x)
let (seq_nat8_to_seq_nat32_BE :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq)
  =
  fun x ->
    Vale_Lib_Seqs_s.seq_map
      (Vale_Def_Words_Four_s.four_to_nat (Prims.of_int (8)))
      (seq_to_seq_four_BE x)
let (seq_nat32_to_seq_nat8_LE :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun x ->
    seq_four_to_seq_LE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))) x)
let (seq_nat32_to_seq_nat8_BE :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun x ->
    seq_four_to_seq_BE
      (Vale_Lib_Seqs_s.seq_map
         (Vale_Def_Words_Four_s.nat_to_four (Prims.of_int (8))) x)
let (seq_nat8_to_seq_uint8 :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
    FStar_UInt8.t FStar_Seq_Base.seq)
  = fun x -> Vale_Lib_Seqs_s.seq_map FStar_UInt8.uint_to_t x
let (seq_uint8_to_seq_nat8 :
  FStar_UInt8.t FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  = fun x -> Vale_Lib_Seqs_s.seq_map FStar_UInt8.v x