open Prims
type regs_fun =
  (Vale_X64_Machine_s.reg, Obj.t) FStar_FunctionalExtensionality.restricted_t
type regs_def =
  (Vale_Def_Words_s.nat64 Vale_Lib_Map16.map16 * Vale_Def_Types_s.quad32
    Vale_Lib_Map16.map16)
type t = regs_def
let (sel : Vale_X64_Machine_s.reg -> t -> Obj.t) =
  fun r ->
    fun m ->
      match m with
      | (m0, m1) ->
          (match r with
           | Vale_X64_Machine_s.Reg (rf, i) ->
               (match rf with
                | uu___ when uu___ = Prims.int_zero ->
                    Obj.repr (Vale_Lib_Map16.sel16 m0 i)
                | uu___ when uu___ = Prims.int_one ->
                    Obj.repr (Vale_Lib_Map16.sel16 m1 i)))
let (upd : Vale_X64_Machine_s.reg -> Obj.t -> t -> t) =
  fun r ->
    fun v ->
      fun m ->
        match m with
        | (m0, m1) ->
            (match r with
             | Vale_X64_Machine_s.Reg (rf, i) ->
                 (match rf with
                  | uu___ when uu___ = Prims.int_zero ->
                      ((Vale_Lib_Map16.upd16 m0 i (Obj.magic v)), m1)
                  | uu___ when uu___ = Prims.int_one ->
                      (m0, (Vale_Lib_Map16.upd16 m1 i (Obj.magic v)))))
let (eta_sel : Vale_X64_Machine_s.reg -> t -> Obj.t) =
  fun r -> fun m -> sel r m
let (eta : t -> t) =
  fun m ->
    let m0_3 =
      (((Obj.magic
           (eta_sel (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero))
              m)),
         (Obj.magic
            (eta_sel (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3))))
                m)))) in
    let m4_7 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))) m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))
                m)))) in
    let m8_11 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8)))) m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11))))
                m)))) in
    let m12_15 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12))))
              m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15))))
                m)))) in
    let m0 = ((m0_3, m4_7), (m8_11, m12_15)) in
    let m0_31 =
      (((Obj.magic
           (eta_sel (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero))
              m)),
         (Obj.magic
            (eta_sel (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2)))) m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3))))
                m)))) in
    let m4_71 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4)))) m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5)))) m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6)))) m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7))))
                m)))) in
    let m8_111 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8)))) m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9)))) m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (11))))
                m)))) in
    let m12_151 =
      (((Obj.magic
           (eta_sel
              (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (12)))) m)),
         (Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (13))))
               m))),
        ((Obj.magic
            (eta_sel
               (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (14))))
               m)),
          (Obj.magic
             (eta_sel
                (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (15))))
                m)))) in
    let m1 = ((m0_31, m4_71), (m8_111, m12_151)) in (m0, m1)
let (to_fun : t -> regs_fun) = fun m -> fun r -> sel r m
let (of_fun : (Vale_X64_Machine_s.reg -> Obj.t) -> t) =
  fun m ->
    let m0_3 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_zero)))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, Prims.int_one))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (2)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (3)))))))) in
    let m4_7 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (4)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (5))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (6)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))))) in
    let m8_11 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (8)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (9))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (10)))))),
          (Obj.magic
             (m
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (11)))))))) in
    let m12_15 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (12)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (13))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (14)))))),
          (Obj.magic
             (m
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (15)))))))) in
    let m0 = ((m0_3, m4_7), (m8_11, m12_15)) in
    let m0_31 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_zero)))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, Prims.int_one))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (2)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (3)))))))) in
    let m4_71 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (4)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (5))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (6)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (7)))))))) in
    let m8_111 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (8)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (9))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (10)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (11)))))))) in
    let m12_151 =
      (((Obj.magic
           (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (12)))))),
         (Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (13))))))),
        ((Obj.magic
            (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (14)))))),
          (Obj.magic
             (m (Vale_X64_Machine_s.Reg (Prims.int_one, (Prims.of_int (15)))))))) in
    let m1 = ((m0_31, m4_71), (m8_111, m12_151)) in (m0, m1)


type ('m1, 'm2) equal = unit


