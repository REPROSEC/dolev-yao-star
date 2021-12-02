open Prims
type 't exp =
  {
  one: 't ;
  fmul: 't -> 't -> 't ;
  lemma_one: unit ;
  lemma_fmul_assoc: unit ;
  lemma_fmul_comm: unit }
let __proj__Mkexp__item__one : 't . 't exp -> 't =
  fun projectee ->
    match projectee with
    | { one; fmul; lemma_one; lemma_fmul_assoc; lemma_fmul_comm;_} -> one
let __proj__Mkexp__item__fmul : 't . 't exp -> 't -> 't -> 't =
  fun projectee ->
    match projectee with
    | { one; fmul; lemma_one; lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul



let one : 't . 't exp -> 't =
  fun d ->
    match d with
    | { one = one1; fmul; lemma_one; lemma_fmul_assoc; lemma_fmul_comm;_} ->
        one1
let fmul : 't . 't exp -> 't -> 't -> 't =
  fun d ->
    match d with
    | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
        lemma_fmul_comm;_} -> fmul1



let fsqr : 't . 't exp -> 't -> 't =
  fun k ->
    fun a ->
      match k with
      | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
          lemma_fmul_comm;_} -> fmul1 a a
let rec pow : 't . 't exp -> 't -> Prims.nat -> 't =
  fun k ->
    fun x ->
      fun n ->
        if n = Prims.int_zero
        then
          match k with
          | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
              lemma_fmul_comm;_} -> one1
        else
          ((match k with
            | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                lemma_fmul_comm;_} -> fmul1)) x (pow k x (n - Prims.int_one))








let exp_rl_f :
  't .
    't exp -> Prims.nat -> Prims.nat -> Prims.nat -> ('t * 't) -> ('t * 't)
  =
  fun k ->
    fun bBits ->
      fun b ->
        fun i ->
          fun uu___ ->
            match uu___ with
            | (a, acc) ->
                let acc1 =
                  if
                    ((b / (Prims.pow2 i)) mod (Prims.of_int (2))) =
                      Prims.int_one
                  then
                    match k with
                    | { one = one1; fmul = fmul1; lemma_one;
                        lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul1 acc a
                  else acc in
                let a1 =
                  match k with
                  | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                      lemma_fmul_comm;_} -> fmul1 a a in
                (a1, acc1)
let exp_rl : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          let uu___ =
            Lib_LoopCombinators.repeati bBits (exp_rl_f k bBits b)
              (a,
                (match k with
                 | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                     lemma_fmul_comm;_} -> one1)) in
          match uu___ with | (a1, acc) -> acc





let exp_lr_f :
  't . 't exp -> 't -> Prims.nat -> Prims.nat -> Prims.nat -> 't -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          fun i ->
            fun acc ->
              let acc1 =
                match k with
                | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                    lemma_fmul_comm;_} -> fmul1 acc acc in
              let acc2 =
                if
                  ((b / (Prims.pow2 ((bBits - i) - Prims.int_one))) mod
                     (Prims.of_int (2)))
                    = Prims.int_zero
                then acc1
                else
                  (match k with
                   | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                       lemma_fmul_comm;_} -> fmul1 acc1 a) in
              acc2
let exp_lr : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          Lib_LoopCombinators.repeati bBits (exp_lr_f k a bBits b)
            (match k with
             | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                 lemma_fmul_comm;_} -> one1)



let exp_mont_ladder_f :
  't .
    't exp -> Prims.nat -> Prims.nat -> Prims.nat -> ('t * 't) -> ('t * 't)
  =
  fun k ->
    fun bBits ->
      fun b ->
        fun i ->
          fun uu___ ->
            match uu___ with
            | (r0, r1) ->
                if
                  ((b / (Prims.pow2 ((bBits - i) - Prims.int_one))) mod
                     (Prims.of_int (2)))
                    = Prims.int_zero
                then
                  (((match k with
                     | { one = one1; fmul = fmul1; lemma_one;
                         lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul1 r0 r0)),
                    ((match k with
                      | { one = one1; fmul = fmul1; lemma_one;
                          lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul1 r1 r0)))
                else
                  (((match k with
                     | { one = one1; fmul = fmul1; lemma_one;
                         lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul1 r0 r1)),
                    ((match k with
                      | { one = one1; fmul = fmul1; lemma_one;
                          lemma_fmul_assoc; lemma_fmul_comm;_} -> fmul1 r1 r1)))
let exp_mont_ladder : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          let uu___ =
            Lib_LoopCombinators.repeati bBits (exp_mont_ladder_f k bBits b)
              ((match k with
                | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                    lemma_fmul_comm;_} -> one1), a) in
          match uu___ with | (r0, r1) -> r0



let cswap : 't . Prims.nat -> 't -> 't -> ('t * 't) =
  fun sw ->
    fun r0 -> fun r1 -> if sw = Prims.int_one then (r1, r0) else (r0, r1)
let exp_mont_ladder_swap2_f :
  't .
    't exp -> Prims.nat -> Prims.nat -> Prims.nat -> ('t * 't) -> ('t * 't)
  =
  fun k ->
    fun bBits ->
      fun b ->
        fun i ->
          fun uu___ ->
            match uu___ with
            | (r0, r1) ->
                let bit =
                  (b / (Prims.pow2 ((bBits - i) - Prims.int_one))) mod
                    (Prims.of_int (2)) in
                let uu___1 = cswap bit r0 r1 in
                (match uu___1 with
                 | (r01, r11) ->
                     let uu___2 =
                       ((match k with
                         | { one = one1; fmul = fmul1; lemma_one;
                             lemma_fmul_assoc; lemma_fmul_comm;_} ->
                             fmul1 r01 r01),
                         (match k with
                          | { one = one1; fmul = fmul1; lemma_one;
                              lemma_fmul_assoc; lemma_fmul_comm;_} ->
                              fmul1 r11 r01)) in
                     (match uu___2 with
                      | (r02, r12) ->
                          let uu___3 = cswap bit r02 r12 in
                          (match uu___3 with | (r03, r13) -> (r03, r13))))
let exp_mont_ladder_swap2 : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> 't
  =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          let uu___ =
            Lib_LoopCombinators.repeati bBits
              (exp_mont_ladder_swap2_f k bBits b)
              ((match k with
                | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                    lemma_fmul_comm;_} -> one1), a) in
          match uu___ with | (r0, r1) -> r0


let exp_mont_ladder_swap_f :
  't .
    't exp ->
      Prims.nat ->
        Prims.nat ->
          Prims.nat -> ('t * 't * Prims.nat) -> ('t * 't * Prims.nat)
  =
  fun k ->
    fun bBits ->
      fun b ->
        fun i ->
          fun uu___ ->
            match uu___ with
            | (r0, r1, privbit) ->
                let bit =
                  (b / (Prims.pow2 ((bBits - i) - Prims.int_one))) mod
                    (Prims.of_int (2)) in
                let sw = (bit + privbit) mod (Prims.of_int (2)) in
                let uu___1 = cswap sw r0 r1 in
                (match uu___1 with
                 | (r01, r11) ->
                     let uu___2 =
                       ((match k with
                         | { one = one1; fmul = fmul1; lemma_one;
                             lemma_fmul_assoc; lemma_fmul_comm;_} ->
                             fmul1 r01 r01),
                         (match k with
                          | { one = one1; fmul = fmul1; lemma_one;
                              lemma_fmul_assoc; lemma_fmul_comm;_} ->
                              fmul1 r11 r01)) in
                     (match uu___2 with | (r02, r12) -> (r02, r12, bit)))
let exp_mont_ladder_swap : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> 't
  =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          let r0 =
            match k with
            | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                lemma_fmul_comm;_} -> one1 in
          let r1 = a in
          let sw = Prims.int_zero in
          let uu___ =
            Lib_LoopCombinators.repeati bBits
              (exp_mont_ladder_swap_f k bBits b) (r0, r1, sw) in
          match uu___ with
          | (r0', r1', sw') ->
              let uu___1 = cswap sw' r0' r1' in
              (match uu___1 with | (r0'1, r1'1) -> r0'1)


let exp_pow2 : 't . 't exp -> 't -> Prims.nat -> 't =
  fun k -> fun a -> fun b -> Lib_LoopCombinators.repeat b (fsqr k) a


let (get_bits_l :
  Prims.nat -> Prims.nat -> Prims.pos -> Prims.nat -> Prims.nat) =
  fun bBits ->
    fun b ->
      fun l ->
        fun i ->
          (b / (Prims.pow2 ((bBits - (l * i)) - l))) mod (Prims.pow2 l)
let exp_fw_f :
  't .
    't exp ->
      't -> Prims.nat -> Prims.nat -> Prims.pos -> Prims.nat -> 't -> 't
  =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          fun l ->
            fun i ->
              fun acc ->
                let bits_l = get_bits_l bBits b l i in
                (match k with
                 | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                     lemma_fmul_comm;_} -> fmul1) (exp_pow2 k acc l)
                  (pow k a bits_l)
let (get_bits_c : Prims.nat -> Prims.nat -> Prims.pos -> Prims.nat) =
  fun bBits ->
    fun b ->
      fun l ->
        let c = bBits mod l in let bits_c = b mod (Prims.pow2 c) in bits_c
let exp_fw_rem :
  't . 't exp -> 't -> Prims.nat -> Prims.nat -> Prims.pos -> 't -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          fun l ->
            fun acc ->
              let c = bBits mod l in
              let bits_c = get_bits_c bBits b l in
              (match k with
               | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                   lemma_fmul_comm;_} -> fmul1) (exp_pow2 k acc c)
                (pow k a bits_c)
let exp_fw : 't . 't exp -> 't -> Prims.nat -> Prims.nat -> Prims.pos -> 't =
  fun k ->
    fun a ->
      fun bBits ->
        fun b ->
          fun l ->
            let acc =
              Lib_LoopCombinators.repeati (bBits / l)
                (exp_fw_f k a bBits b l)
                (match k with
                 | { one = one1; fmul = fmul1; lemma_one; lemma_fmul_assoc;
                     lemma_fmul_comm;_} -> one1) in
            let res =
              if (bBits mod l) = Prims.int_zero
              then acc
              else exp_fw_rem k a bBits b l acc in
            res



