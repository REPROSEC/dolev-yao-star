open Prims
let op_String_Access : 'a . 'a FStar_Seq_Base.seq -> Prims.nat -> 'a =
  fun s -> fun i -> FStar_Seq_Base.index s i
let op_String_Assignment :
  'uuuuu .
    unit ->
      'uuuuu FStar_Seq_Base.seq ->
        Prims.nat -> 'uuuuu -> 'uuuuu FStar_Seq_Base.seq
  = fun uu___ -> FStar_Seq_Base.upd
let (op_Star_Hat :
  Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32 -> Vale_Def_Words_s.nat32)
  =
  fun x -> fun y -> Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") x y
let (op_Star_Hat_Hat :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32)
  = Vale_Def_Types_s.quad32_xor
let (quad32_shl32 : Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    let uu___ = q in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = v0; Vale_Def_Words_s.lo1 = v1;
        Vale_Def_Words_s.hi2 = v2; Vale_Def_Words_s.hi3 = v3;_} ->
        {
          Vale_Def_Words_s.lo0 = Prims.int_zero;
          Vale_Def_Words_s.lo1 = v0;
          Vale_Def_Words_s.hi2 = v1;
          Vale_Def_Words_s.hi3 = v2
        }
let (round_key_128_rcon :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Words_s.nat32 -> Vale_Def_Types_s.quad32)
  =
  fun prev ->
    fun rcon ->
      let uu___ = prev in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = v0; Vale_Def_Words_s.lo1 = v1;
          Vale_Def_Words_s.hi2 = v2; Vale_Def_Words_s.hi3 = v3;_} ->
          let w0 =
            Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") v0
              (Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000")
                 (Vale_AES_AES_s.sub_word (Vale_AES_AES_s.rot_word_LE v3))
                 rcon) in
          let w1 =
            Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") v1 w0 in
          let w2 =
            Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") v2 w1 in
          let w3 =
            Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000") v3 w2 in
          {
            Vale_Def_Words_s.lo0 = w0;
            Vale_Def_Words_s.lo1 = w1;
            Vale_Def_Words_s.hi2 = w2;
            Vale_Def_Words_s.hi3 = w3
          }
let (round_key_128 :
  Vale_Def_Types_s.quad32 -> Prims.nat -> Vale_Def_Types_s.quad32) =
  fun prev ->
    fun round ->
      round_key_128_rcon prev
        (Vale_AES_AES_s.aes_rcon (round - Prims.int_one))
let rec (expand_key_128_def :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Prims.nat -> Vale_Def_Types_s.quad32)
  =
  fun key ->
    fun round ->
      if round = Prims.int_zero
      then
        {
          Vale_Def_Words_s.lo0 = (FStar_Seq_Base.index key Prims.int_zero);
          Vale_Def_Words_s.lo1 = (FStar_Seq_Base.index key Prims.int_one);
          Vale_Def_Words_s.hi2 =
            (FStar_Seq_Base.index key (Prims.of_int (2)));
          Vale_Def_Words_s.hi3 =
            (FStar_Seq_Base.index key (Prims.of_int (3)))
        }
      else
        round_key_128 (expand_key_128_def key (round - Prims.int_one)) round
let (expand_key_128 :
  Vale_Def_Words_s.nat32 FStar_Seq_Base.seq ->
    Prims.nat -> Vale_Def_Types_s.quad32)
  = Vale_Def_Opaque_s.opaque_make expand_key_128_def





let (simd_round_key_128 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Words_s.nat32 -> Vale_Def_Types_s.quad32)
  =
  fun prev ->
    fun rcon ->
      let r =
        Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000")
          (Vale_AES_AES_s.rot_word_LE
             (Vale_AES_AES_s.sub_word prev.Vale_Def_Words_s.hi3)) rcon in
      let q = prev in
      let q1 = Vale_Def_Types_s.quad32_xor q (quad32_shl32 q) in
      let q2 = Vale_Def_Types_s.quad32_xor q1 (quad32_shl32 q1) in
      let q3 = Vale_Def_Types_s.quad32_xor q2 (quad32_shl32 q2) in
      Vale_Def_Types_s.quad32_xor q3
        {
          Vale_Def_Words_s.lo0 = r;
          Vale_Def_Words_s.lo1 = r;
          Vale_Def_Words_s.hi2 = r;
          Vale_Def_Words_s.hi3 = r
        }







