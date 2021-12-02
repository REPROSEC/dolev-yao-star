open Prims
let (quad32_shift_left_1 :
  Vale_Def_Types_s.quad32 -> Vale_Def_Types_s.quad32) =
  fun q ->
    let l =
      let uu___ = q in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          {
            Vale_Def_Words_s.lo0 =
              (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x0
                 Prims.int_one);
            Vale_Def_Words_s.lo1 =
              (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x1
                 Prims.int_one);
            Vale_Def_Words_s.hi2 =
              (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x2
                 Prims.int_one);
            Vale_Def_Words_s.hi3 =
              (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x3
                 Prims.int_one)
          } in
    let r =
      let uu___ = q in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          {
            Vale_Def_Words_s.lo0 =
              (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x0
                 (Prims.of_int (31)));
            Vale_Def_Words_s.lo1 =
              (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x1
                 (Prims.of_int (31)));
            Vale_Def_Words_s.hi2 =
              (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x2
                 (Prims.of_int (31)));
            Vale_Def_Words_s.hi3 =
              (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x3
                 (Prims.of_int (31)))
          } in
    let uu___ = r in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = r0; Vale_Def_Words_s.lo1 = r1;
        Vale_Def_Words_s.hi2 = r2; Vale_Def_Words_s.hi3 = r3;_} ->
        Vale_Def_Types_s.quad32_xor l
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = r0;
            Vale_Def_Words_s.hi2 = r1;
            Vale_Def_Words_s.hi3 = r2
          }
let (quad32_shift_2_left_1 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      (Vale_Def_Types_s.quad32 * Vale_Def_Types_s.quad32))
  =
  fun qa ->
    fun qb ->
      let la =
        let uu___ = qa in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
            Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
            {
              Vale_Def_Words_s.lo0 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x0
                   Prims.int_one);
              Vale_Def_Words_s.lo1 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x1
                   Prims.int_one);
              Vale_Def_Words_s.hi2 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x2
                   Prims.int_one);
              Vale_Def_Words_s.hi3 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x3
                   Prims.int_one)
            } in
      let lb =
        let uu___ = qb in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
            Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
            {
              Vale_Def_Words_s.lo0 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x0
                   Prims.int_one);
              Vale_Def_Words_s.lo1 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x1
                   Prims.int_one);
              Vale_Def_Words_s.hi2 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x2
                   Prims.int_one);
              Vale_Def_Words_s.hi3 =
                (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000") x3
                   Prims.int_one)
            } in
      let ra =
        let uu___ = qa in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
            Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
            {
              Vale_Def_Words_s.lo0 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x0
                   (Prims.of_int (31)));
              Vale_Def_Words_s.lo1 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x1
                   (Prims.of_int (31)));
              Vale_Def_Words_s.hi2 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x2
                   (Prims.of_int (31)));
              Vale_Def_Words_s.hi3 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x3
                   (Prims.of_int (31)))
            } in
      let rb =
        let uu___ = qb in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
            Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
            {
              Vale_Def_Words_s.lo0 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x0
                   (Prims.of_int (31)));
              Vale_Def_Words_s.lo1 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x1
                   (Prims.of_int (31)));
              Vale_Def_Words_s.hi2 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x2
                   (Prims.of_int (31)));
              Vale_Def_Words_s.hi3 =
                (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000") x3
                   (Prims.of_int (31)))
            } in
      let uu___ = ra in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = ra0; Vale_Def_Words_s.lo1 = ra1;
          Vale_Def_Words_s.hi2 = ra2; Vale_Def_Words_s.hi3 = ra3;_} ->
          let uu___1 = rb in
          (match uu___1 with
           | { Vale_Def_Words_s.lo0 = rb0; Vale_Def_Words_s.lo1 = rb1;
               Vale_Def_Words_s.hi2 = rb2; Vale_Def_Words_s.hi3 = rb3;_} ->
               let qa' =
                 Vale_Def_Types_s.quad32_xor la
                   {
                     Vale_Def_Words_s.lo0 = Prims.int_zero;
                     Vale_Def_Words_s.lo1 = ra0;
                     Vale_Def_Words_s.hi2 = ra1;
                     Vale_Def_Words_s.hi3 = ra2
                   } in
               let qb' =
                 Vale_Def_Types_s.quad32_xor lb
                   (Vale_Def_Types_s.quad32_xor
                      {
                        Vale_Def_Words_s.lo0 = ra3;
                        Vale_Def_Words_s.lo1 = Prims.int_zero;
                        Vale_Def_Words_s.hi2 = Prims.int_zero;
                        Vale_Def_Words_s.hi3 = Prims.int_zero
                      }
                      {
                        Vale_Def_Words_s.lo0 = Prims.int_zero;
                        Vale_Def_Words_s.lo1 = rb0;
                        Vale_Def_Words_s.hi2 = rb1;
                        Vale_Def_Words_s.hi3 = rb2
                      }) in
               (qa', qb'))

















let (gf128_low_shift : Vale_Math_Poly2_s.poly) =
  Vale_Math_Poly2_s.shift Vale_AES_GF128_s.gf128_modulus_low_terms
    (Prims.of_int (-1))
let (gf128_rev_shift : Vale_Math_Poly2_s.poly) =
  Vale_Math_Poly2_s.reverse gf128_low_shift (Prims.of_int (127))



let (gf128_mul_rev :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun a ->
    fun b ->
      Vale_Math_Poly2_s.reverse
        (Vale_AES_GF128_s.gf128_mul
           (Vale_Math_Poly2_s.reverse a (Prims.of_int (127)))
           (Vale_Math_Poly2_s.reverse b (Prims.of_int (127))))
        (Prims.of_int (127))
let (op_Star_Tilde :
  Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  = gf128_mul_rev




let (mod_rev :
  Prims.pos ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun n ->
    fun a ->
      fun b ->
        Vale_Math_Poly2_s.reverse
          (Vale_Math_Poly2_s.mod1
             (Vale_Math_Poly2_s.reverse a ((n + n) - Prims.int_one)) b)
          (n - Prims.int_one)

let (shift_key_1 :
  Prims.pos ->
    Vale_Math_Poly2_s.poly ->
      Vale_Math_Poly2_s.poly -> Vale_Math_Poly2_s.poly)
  =
  fun n ->
    fun f ->
      fun h ->
        let g = Vale_Math_Poly2_s.add (Vale_Math_Poly2_s.monomial n) f in
        let h1 = Vale_Math_Poly2_s.shift h Prims.int_one in
        let offset =
          Vale_Math_Poly2_s.reverse
            (Vale_Math_Poly2_s.shift g (Prims.of_int (-1)))
            (n - Prims.int_one) in
        Vale_Math_Poly2_s.add (Vale_Math_Poly2.mask h1 n)
          (if Vale_Math_Poly2_s.poly_index h1 n
           then offset
           else Vale_Math_Poly2_s.zero)



