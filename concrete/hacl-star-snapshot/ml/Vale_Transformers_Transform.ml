open Prims
type ('s1, 's2) equiv_states = unit
let (transformation_result_of_possibly_codes :
  Vale_X64_Machine_Semantics_s.codes Vale_Def_PossiblyMonad.possibly ->
    Vale_X64_Machine_Semantics_s.code ->
      Vale_X64_Decls.va_transformation_result)
  =
  fun c ->
    fun if_fail ->
      match c with
      | Vale_Def_PossiblyMonad.Ok c1 ->
          {
            Vale_X64_Decls.success = (Vale_Def_PossiblyMonad.Ok ());
            Vale_X64_Decls.result = (Vale_X64_Machine_s.Block c1)
          }
      | Vale_Def_PossiblyMonad.Err reason ->
          {
            Vale_X64_Decls.success = (Vale_Def_PossiblyMonad.Err reason);
            Vale_X64_Decls.result = if_fail
          }
let (prints_to_same_code :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Machine_Semantics_s.code -> unit Vale_Def_PossiblyMonad.possibly)
  =
  fun c1 ->
    fun c2 ->
      if
        (Vale_X64_Print_s.print_code c1 Prims.int_zero Vale_X64_Print_s.gcc)
          =
          (Vale_X64_Print_s.print_code c2 Prims.int_zero Vale_X64_Print_s.gcc)
      then Vale_Def_PossiblyMonad.Ok ()
      else
        Vale_Def_PossiblyMonad.Err
          (Prims.strcat "Not matching codes: \n"
             (Prims.strcat "\tCode:\n"
                (Prims.strcat
                   (FStar_Pervasives_Native.fst
                      (Vale_X64_Print_s.print_code c1 Prims.int_zero
                         Vale_X64_Print_s.gcc))
                   (Prims.strcat "\tExpected code:\n"
                      (Prims.strcat
                         (FStar_Pervasives_Native.fst
                            (Vale_X64_Print_s.print_code c2 Prims.int_zero
                               Vale_X64_Print_s.gcc)) "\n")))))
let (reorder :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      Vale_X64_Decls.va_transformation_result)
  =
  fun orig ->
    fun hint ->
      match if Vale_X64_Lemmas.code_modifies_ghost orig
            then
              Vale_Def_PossiblyMonad.Err
                "code directly modifies ghost state (via ins_Ghost instruction)"
            else
              (let orig' =
                 Vale_Transformers_InstructionReorder.purge_empty_codes
                   [orig] in
               match Vale_Transformers_InstructionReorder.find_transformation_hints
                       orig' [hint]
               with
               | Vale_Def_PossiblyMonad.Err s -> Vale_Def_PossiblyMonad.Err s
               | Vale_Def_PossiblyMonad.Ok x' ->
                   (match Vale_Transformers_InstructionReorder.perform_reordering_with_hints
                            x' orig'
                    with
                    | Vale_Def_PossiblyMonad.Err s ->
                        Vale_Def_PossiblyMonad.Err s
                    | Vale_Def_PossiblyMonad.Ok x'1 ->
                        (match prints_to_same_code
                                 (Vale_X64_Machine_s.Block x'1) hint
                         with
                         | Vale_Def_PossiblyMonad.Err s ->
                             Vale_Def_PossiblyMonad.Err s
                         | Vale_Def_PossiblyMonad.Ok x'2 ->
                             Vale_Def_PossiblyMonad.Ok x'1)))
      with
      | Vale_Def_PossiblyMonad.Ok c ->
          {
            Vale_X64_Decls.success = (Vale_Def_PossiblyMonad.Ok ());
            Vale_X64_Decls.result = (Vale_X64_Machine_s.Block c)
          }
      | Vale_Def_PossiblyMonad.Err reason ->
          {
            Vale_X64_Decls.success = (Vale_Def_PossiblyMonad.Err reason);
            Vale_X64_Decls.result = orig
          }




let (check_if_same_printed_code :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      Vale_X64_Decls.va_transformation_result)
  =
  fun orig ->
    fun hint ->
      {
        Vale_X64_Decls.success = (prints_to_same_code orig hint);
        Vale_X64_Decls.result = orig
      }

let (movbe_elim :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Vale_X64_Decls.va_transformation_result)
  =
  Vale_Transformers_PeepHole.peephole_transform
    Vale_Transformers_MovbeElim.movbe_elim_ph

let (mov_mov_elim :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Vale_X64_Decls.va_transformation_result)
  =
  Vale_Transformers_PeepHole.peephole_transform
    Vale_Transformers_MovMovElim.mov_mov_elim_ph

let (prefetch_elim :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
    Vale_X64_Decls.va_transformation_result)
  =
  Vale_Transformers_PeepHole.peephole_transform
    Vale_Transformers_PrefetchElim.prefetch_elim_ph
