open Prims
let (movbe_elim_ph : Vale_Transformers_PeepHole.pre_peephole) =
  {
    Vale_Transformers_PeepHole.ph =
      (fun uu___ ->
         match uu___ with
         | (Vale_X64_Bytes_Code_s.Instr
             (i, oprs, Vale_X64_Machine_Semantics_s.AnnotateMovbe64
              proof_of_movbe))::[]
             ->
             let oprs1 =
               Obj.magic (Vale_Transformers_PeepHole.coerce_to_normal oprs) in
             let uu___1 = oprs1 in
             (match uu___1 with
              | (dst, (src, ())) ->
                  if Vale_X64_Machine_s.uu___is_OReg dst
                  then
                    let mov =
                      (fun uu___3 ->
                         fun uu___2 ->
                           (Obj.magic
                              (Vale_X64_InsLemmas.make_instr
                                 [(Vale_X64_Instruction_s.Out,
                                    (Vale_X64_Instruction_s.IOpEx
                                       Vale_X64_Instruction_s.IOp64))]
                                 [Vale_X64_Instruction_s.IOpEx
                                    Vale_X64_Instruction_s.IOp64]
                                 Vale_X64_Instruction_s.PreserveFlags
                                 Vale_X64_Instructions_s.ins_Mov64)) uu___3
                             uu___2) (Obj.magic dst) (Obj.magic src) in
                    let bswap =
                      (fun uu___2 ->
                         (Obj.magic
                            (Vale_X64_InsLemmas.make_instr
                               [(Vale_X64_Instruction_s.InOut,
                                  (Vale_X64_Instruction_s.IOpEx
                                     Vale_X64_Instruction_s.IOp64))] []
                               Vale_X64_Instruction_s.PreserveFlags
                               Vale_X64_Instructions_s.ins_Bswap64)) uu___2)
                        (Obj.magic dst) in
                    FStar_Pervasives_Native.Some
                      [Obj.magic mov; Obj.magic bswap]
                  else FStar_Pervasives_Native.None)
         | uu___1 -> FStar_Pervasives_Native.None);
    Vale_Transformers_PeepHole.input_hint = Prims.int_one
  }

