open Prims
let four_map :
  'a 'b . ('a -> 'b) -> 'a Vale_Def_Words_s.four -> 'b Vale_Def_Words_s.four
  =
  fun f ->
    fun x ->
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          {
            Vale_Def_Words_s.lo0 = (f x0);
            Vale_Def_Words_s.lo1 = (f x1);
            Vale_Def_Words_s.hi2 = (f x2);
            Vale_Def_Words_s.hi3 = (f x3)
          }
let four_map2 :
  'a 'b .
    ('a -> 'a -> 'b) ->
      'a Vale_Def_Words_s.four ->
        'a Vale_Def_Words_s.four -> 'b Vale_Def_Words_s.four
  =
  fun f ->
    fun x ->
      fun y ->
        let uu___ = x in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
            Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
            let uu___1 = y in
            (match uu___1 with
             | { Vale_Def_Words_s.lo0 = y0; Vale_Def_Words_s.lo1 = y1;
                 Vale_Def_Words_s.hi2 = y2; Vale_Def_Words_s.hi3 = y3;_} ->
                 {
                   Vale_Def_Words_s.lo0 = (f x0 y0);
                   Vale_Def_Words_s.lo1 = (f x1 y1);
                   Vale_Def_Words_s.hi2 = (f x2 y2);
                   Vale_Def_Words_s.hi3 = (f x3 y3)
                 })
let two_two_to_four :
  'a .
    'a Vale_Def_Words_s.two Vale_Def_Words_s.two -> 'a Vale_Def_Words_s.four
  =
  fun x ->
    let uu___ = x in
    match uu___ with
    | {
        Vale_Def_Words_s.lo =
          { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_};
        Vale_Def_Words_s.hi =
          { Vale_Def_Words_s.lo = x2; Vale_Def_Words_s.hi = x3;_};_}
        ->
        {
          Vale_Def_Words_s.lo0 = x0;
          Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2;
          Vale_Def_Words_s.hi3 = x3
        }
let four_to_two_two :
  'a .
    'a Vale_Def_Words_s.four -> 'a Vale_Def_Words_s.two Vale_Def_Words_s.two
  =
  fun x ->
    let uu___ = x in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
        Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
        {
          Vale_Def_Words_s.lo =
            { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1 };
          Vale_Def_Words_s.hi =
            { Vale_Def_Words_s.lo = x2; Vale_Def_Words_s.hi = x3 }
        }
let (nat_to_four_unfold :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN Vale_Def_Words_s.four)
  =
  fun size ->
    fun n ->
      let n1 =
        match size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (size - Prims.int_one)) in
      let n2 =
        match (Prims.of_int (2)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (2)) * size) - Prims.int_one)) in
      let n3 =
        match (Prims.of_int (3)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (3)) * size) - Prims.int_one)) in
      let n4 =
        match (Prims.of_int (4)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (4)) * size) - Prims.int_one)) in
      {
        Vale_Def_Words_s.lo0 = (n mod n1);
        Vale_Def_Words_s.lo1 = ((n / n1) mod n1);
        Vale_Def_Words_s.hi2 = ((n / n2) mod n1);
        Vale_Def_Words_s.hi3 = ((n / n3) mod n1)
      }
let (nat_to_four :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN Vale_Def_Words_s.four)
  =
  fun size ->
    fun n ->
      let n1 =
        match size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (size - Prims.int_one)) in
      let n2 =
        match (Prims.of_int (2)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (2)) * size) - Prims.int_one)) in
      let n3 =
        match (Prims.of_int (3)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (3)) * size) - Prims.int_one)) in
      let n4 =
        match (Prims.of_int (4)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (4)) * size) - Prims.int_one)) in
      {
        Vale_Def_Words_s.lo0 = (n mod n1);
        Vale_Def_Words_s.lo1 = ((n / n1) mod n1);
        Vale_Def_Words_s.hi2 = ((n / n2) mod n1);
        Vale_Def_Words_s.hi3 = ((n / n3) mod n1)
      }
let (four_to_nat_unfold :
  Prims.nat ->
    unit Vale_Def_Words_s.natN Vale_Def_Words_s.four ->
      unit Vale_Def_Words_s.natN)
  =
  fun size ->
    fun x ->
      let n1 =
        match size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (size - Prims.int_one)) in
      let n2 =
        match (Prims.of_int (2)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (2)) * size) - Prims.int_one)) in
      let n3 =
        match (Prims.of_int (3)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (3)) * size) - Prims.int_one)) in
      let n4 =
        match (Prims.of_int (4)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (4)) * size) - Prims.int_one)) in
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          Vale_Def_Words_s.int_to_natN n4
            (((x0 + (x1 * n1)) + (x2 * n2)) + (x3 * n3))
let (four_to_nat :
  Prims.nat ->
    unit Vale_Def_Words_s.natN Vale_Def_Words_s.four ->
      unit Vale_Def_Words_s.natN)
  =
  fun size ->
    fun x ->
      let n1 =
        match size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ -> (Prims.of_int (2)) * (Prims.pow2 (size - Prims.int_one)) in
      let n2 =
        match (Prims.of_int (2)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (2)) * size) - Prims.int_one)) in
      let n3 =
        match (Prims.of_int (3)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (3)) * size) - Prims.int_one)) in
      let n4 =
        match (Prims.of_int (4)) * size with
        | uu___ when uu___ = Prims.int_zero -> Prims.int_one
        | uu___ ->
            (Prims.of_int (2)) *
              (Prims.pow2 (((Prims.of_int (4)) * size) - Prims.int_one)) in
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
          Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
          Vale_Def_Words_s.int_to_natN n4
            (((x0 + (x1 * n1)) + (x2 * n2)) + (x3 * n3))
let four_select :
  'a . 'a Vale_Def_Words_s.four -> Vale_Def_Words_s.nat2 -> 'a =
  fun x ->
    fun selector ->
      match selector with
      | uu___ when uu___ = Prims.int_zero -> x.Vale_Def_Words_s.lo0
      | uu___ when uu___ = Prims.int_one -> x.Vale_Def_Words_s.lo1
      | uu___ when uu___ = (Prims.of_int (2)) -> x.Vale_Def_Words_s.hi2
      | uu___ when uu___ = (Prims.of_int (3)) -> x.Vale_Def_Words_s.hi3
let four_insert :
  'a .
    'a Vale_Def_Words_s.four ->
      'a -> Vale_Def_Words_s.nat2 -> 'a Vale_Def_Words_s.four
  =
  fun x ->
    fun y ->
      fun selector ->
        match selector with
        | uu___ when uu___ = Prims.int_zero ->
            {
              Vale_Def_Words_s.lo0 = y;
              Vale_Def_Words_s.lo1 = (x.Vale_Def_Words_s.lo1);
              Vale_Def_Words_s.hi2 = (x.Vale_Def_Words_s.hi2);
              Vale_Def_Words_s.hi3 = (x.Vale_Def_Words_s.hi3)
            }
        | uu___ when uu___ = Prims.int_one ->
            {
              Vale_Def_Words_s.lo0 = (x.Vale_Def_Words_s.lo0);
              Vale_Def_Words_s.lo1 = y;
              Vale_Def_Words_s.hi2 = (x.Vale_Def_Words_s.hi2);
              Vale_Def_Words_s.hi3 = (x.Vale_Def_Words_s.hi3)
            }
        | uu___ when uu___ = (Prims.of_int (2)) ->
            {
              Vale_Def_Words_s.lo0 = (x.Vale_Def_Words_s.lo0);
              Vale_Def_Words_s.lo1 = (x.Vale_Def_Words_s.lo1);
              Vale_Def_Words_s.hi2 = y;
              Vale_Def_Words_s.hi3 = (x.Vale_Def_Words_s.hi3)
            }
        | uu___ when uu___ = (Prims.of_int (3)) ->
            {
              Vale_Def_Words_s.lo0 = (x.Vale_Def_Words_s.lo0);
              Vale_Def_Words_s.lo1 = (x.Vale_Def_Words_s.lo1);
              Vale_Def_Words_s.hi2 = (x.Vale_Def_Words_s.hi2);
              Vale_Def_Words_s.hi3 = y
            }
let four_reverse : 'a . 'a Vale_Def_Words_s.four -> 'a Vale_Def_Words_s.four
  =
  fun x ->
    let uu___ = x in
    match uu___ with
    | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
        Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
        {
          Vale_Def_Words_s.lo0 = x3;
          Vale_Def_Words_s.lo1 = x2;
          Vale_Def_Words_s.hi2 = x1;
          Vale_Def_Words_s.hi3 = x0
        }