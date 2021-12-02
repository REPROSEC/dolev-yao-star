open Prims
let (prefetch_elim_ph : Vale_Transformers_PeepHole.pre_peephole) =
  {
    Vale_Transformers_PeepHole.ph =
      (fun uu___ ->
         match uu___ with
         | (Vale_X64_Bytes_Code_s.Instr
             (i, oprs, Vale_X64_Machine_Semantics_s.AnnotatePrefetchnta ()))::[]
             -> FStar_Pervasives_Native.Some []
         | uu___1 -> FStar_Pervasives_Native.None);
    Vale_Transformers_PeepHole.input_hint = Prims.int_one
  }
