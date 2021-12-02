open Prims
let (make_gctr_plain_LE :
  Vale_Def_Words_s.nat8 FStar_Seq_Base.seq ->
    Vale_Def_Words_s.nat8 FStar_Seq_Base.seq)
  =
  fun p ->
    if (FStar_Seq_Base.length p) < (Prims.parse_int "0x100000000")
    then p
    else FStar_Seq_Base.empty ()
let (inc32lite :
  Vale_Def_Types_s.quad32 -> Prims.int -> Vale_Def_Types_s.quad32) =
  fun cb ->
    fun i ->
      if (Prims.int_zero <= i) && (i < (Prims.parse_int "0x100000000"))
      then
        let sum = cb.Vale_Def_Words_s.lo0 + i in
        let lo0 =
          if sum >= (Prims.parse_int "0x100000000")
          then sum - (Prims.parse_int "0x100000000")
          else sum in
        {
          Vale_Def_Words_s.lo0 = lo0;
          Vale_Def_Words_s.lo1 = (cb.Vale_Def_Words_s.lo1);
          Vale_Def_Words_s.hi2 = (cb.Vale_Def_Words_s.hi2);
          Vale_Def_Words_s.hi3 = (cb.Vale_Def_Words_s.hi3)
        }
      else
        {
          Vale_Def_Words_s.lo0 = (Prims.of_int (42));
          Vale_Def_Words_s.lo1 = (Prims.of_int (42));
          Vale_Def_Words_s.hi2 = (Prims.of_int (42));
          Vale_Def_Words_s.hi3 = (Prims.of_int (42))
        }
let (empty_seq_quad32 : Vale_Def_Types_s.quad32 FStar_Seq_Base.seq) =
  FStar_Seq_Base.empty ()

type ('x, 'y, 'lo, 'hi) partial_seq_agreement = unit


let (aes_encrypt_BE :
  Vale_AES_AES_s.algorithm ->
    Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
      Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  =
  fun alg ->
    fun key ->
      fun p_BE ->
        let p_LE = Vale_Def_Types_s.reverse_bytes_quad32 p_BE in
        Vale_AES_AES_s.aes_encrypt_LE alg key p_LE
type ('r0, 'r1, 'r2, 'r3, 'r4, 'r5, 's, 'alg, 'key, 'ctruBE,
  'i) gctr_registers_def = unit
type ('uuuuu, 'uuuuu1, 'uuuuu2, 'uuuuu3, 'uuuuu4, 'uuuuu5, 'uuuuu6, 'uuuuu7,
  'uuuuu8, 'uuuuu9, 'uuuuu10) gctr_registers = Obj.t

type ('alg, 'bound, 'plain, 'cipher, 'key, 'icb) gctr_partial_def = unit
type ('uuuuu, 'uuuuu1, 'uuuuu2, 'uuuuu3, 'uuuuu4, 'uuuuu5) gctr_partial =
  Obj.t
















let (pow2_24 : Prims.int) = (Prims.parse_int "0x1000000")
type nat24 = unit Vale_Def_Words_s.natN





















