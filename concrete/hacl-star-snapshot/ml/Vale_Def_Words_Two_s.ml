open Prims
let two_map :
  'a 'b . ('a -> 'b) -> 'a Vale_Def_Words_s.two -> 'b Vale_Def_Words_s.two =
  fun f ->
    fun x ->
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_} ->
          { Vale_Def_Words_s.lo = (f x0); Vale_Def_Words_s.hi = (f x1) }
let two_map2 :
  'a 'b .
    ('a -> 'a -> 'b) ->
      'a Vale_Def_Words_s.two ->
        'a Vale_Def_Words_s.two -> 'b Vale_Def_Words_s.two
  =
  fun f ->
    fun x ->
      fun y ->
        let uu___ = x in
        match uu___ with
        | { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_} ->
            let uu___1 = y in
            (match uu___1 with
             | { Vale_Def_Words_s.lo = y0; Vale_Def_Words_s.hi = y1;_} ->
                 {
                   Vale_Def_Words_s.lo = (f x0 y0);
                   Vale_Def_Words_s.hi = (f x1 y1)
                 })
let (nat_to_two_unfold :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN Vale_Def_Words_s.two)
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
      {
        Vale_Def_Words_s.lo = (n mod n1);
        Vale_Def_Words_s.hi = ((n / n1) mod n1)
      }
let (nat_to_two :
  Prims.nat ->
    unit Vale_Def_Words_s.natN ->
      unit Vale_Def_Words_s.natN Vale_Def_Words_s.two)
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
      {
        Vale_Def_Words_s.lo = (n mod n1);
        Vale_Def_Words_s.hi = ((n / n1) mod n1)
      }
let (two_to_nat_unfold :
  Prims.nat ->
    unit Vale_Def_Words_s.natN Vale_Def_Words_s.two ->
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
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_} ->
          Vale_Def_Words_s.int_to_natN n2 (x0 + (x1 * n1))
let (two_to_nat :
  Prims.nat ->
    unit Vale_Def_Words_s.natN Vale_Def_Words_s.two ->
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
      let uu___ = x in
      match uu___ with
      | { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_} ->
          Vale_Def_Words_s.int_to_natN n2 (x0 + (x1 * n1))
let two_select : 'a . 'a Vale_Def_Words_s.two -> Vale_Def_Words_s.nat1 -> 'a
  =
  fun x ->
    fun selector ->
      match selector with
      | uu___ when uu___ = Prims.int_zero -> x.Vale_Def_Words_s.lo
      | uu___ when uu___ = Prims.int_one -> x.Vale_Def_Words_s.hi
let two_insert :
  'a .
    'a Vale_Def_Words_s.two ->
      'a -> Vale_Def_Words_s.nat1 -> 'a Vale_Def_Words_s.two
  =
  fun x ->
    fun y ->
      fun selector ->
        match selector with
        | uu___ when uu___ = Prims.int_zero ->
            {
              Vale_Def_Words_s.lo = y;
              Vale_Def_Words_s.hi = (x.Vale_Def_Words_s.hi)
            }
        | uu___ when uu___ = Prims.int_one ->
            {
              Vale_Def_Words_s.lo = (x.Vale_Def_Words_s.lo);
              Vale_Def_Words_s.hi = y
            }
let two_reverse : 'a . 'a Vale_Def_Words_s.two -> 'a Vale_Def_Words_s.two =
  fun x ->
    let uu___ = x in
    match uu___ with
    | { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1;_} ->
        { Vale_Def_Words_s.lo = x1; Vale_Def_Words_s.hi = x0 }