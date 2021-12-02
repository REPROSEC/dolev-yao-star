open Prims
let (safe_mov_mov_elim :
  Vale_X64_Machine_Semantics_s.ins Prims.list -> Prims.bool) =
  fun is ->
    match is with
    | (Vale_X64_Bytes_Code_s.Instr
        (i1, oprs1, Vale_X64_Machine_Semantics_s.AnnotateMov64 ()))::(Vale_X64_Bytes_Code_s.Instr
        (i2, oprs2, Vale_X64_Machine_Semantics_s.AnnotateMov64 ()))::[] ->
        let oprs11 =
          Obj.magic (Vale_Transformers_PeepHole.coerce_to_normal oprs1) in
        let oprs21 =
          Obj.magic (Vale_Transformers_PeepHole.coerce_to_normal oprs2) in
        let uu___ = oprs11 in
        (match uu___ with
         | (dst1, (src1, ())) ->
             let uu___1 = oprs21 in
             (match uu___1 with
              | (dst2, (src2, ())) ->
                  ((dst1 = dst2) && (Vale_X64_Machine_s.uu___is_OReg dst1))
                    &&
                    (let uu___2 = dst1 in
                     (match uu___2 with
                      | Vale_X64_Machine_s.OReg rd ->
                          (match src2 with
                           | Vale_X64_Machine_s.OConst uu___3 -> true
                           | Vale_X64_Machine_s.OReg rs2 ->
                               Prims.op_Negation (rs2 = rd)
                           | Vale_X64_Machine_s.OStack (m, uu___3) ->
                               (match m with
                                | Vale_X64_Machine_s.MConst uu___4 -> true
                                | uu___4 -> false)
                           | Vale_X64_Machine_s.OMem (m, uu___3) ->
                               (match m with
                                | Vale_X64_Machine_s.MConst uu___4 -> true
                                | uu___4 -> false))))))
    | uu___ -> false
let (mov_mov_elim_ph : Vale_Transformers_PeepHole.pre_peephole) =
  {
    Vale_Transformers_PeepHole.ph =
      (fun is ->
         if safe_mov_mov_elim is
         then
           let uu___ = is in
           match uu___ with | i1::i2::[] -> FStar_Pervasives_Native.Some [i2]
         else FStar_Pervasives_Native.None);
    Vale_Transformers_PeepHole.input_hint = (Prims.of_int (2))
  }

