open Prims
type pre_peephole =
  {
  ph:
    Vale_X64_Machine_Semantics_s.ins Prims.list ->
      Vale_X64_Machine_Semantics_s.ins Prims.list
        FStar_Pervasives_Native.option
    ;
  input_hint: Prims.pos }
let (__proj__Mkpre_peephole__item__ph :
  pre_peephole ->
    Vale_X64_Machine_Semantics_s.ins Prims.list ->
      Vale_X64_Machine_Semantics_s.ins Prims.list
        FStar_Pervasives_Native.option)
  = fun projectee -> match projectee with | { ph; input_hint;_} -> ph
let (__proj__Mkpre_peephole__item__input_hint : pre_peephole -> Prims.pos) =
  fun projectee -> match projectee with | { ph; input_hint;_} -> input_hint

type ('p, 'is, 's) peephole_correct = Obj.t
type peephole = pre_peephole
let rec (num_ins_in_code : Vale_X64_Machine_Semantics_s.code -> Prims.nat) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins uu___ -> Prims.int_one
    | Vale_X64_Machine_s.Block l -> num_ins_in_codes l
    | Vale_X64_Machine_s.IfElse (c1, t, f) ->
        (num_ins_in_code t) + (num_ins_in_code f)
    | Vale_X64_Machine_s.While (c1, b) -> num_ins_in_code b
and (num_ins_in_codes : Vale_X64_Machine_Semantics_s.codes -> Prims.nat) =
  fun c ->
    match c with
    | [] -> Prims.int_zero
    | h::t -> (num_ins_in_code h) + (num_ins_in_codes t)

let rec (pull_instructions_from_codes :
  Vale_X64_Machine_Semantics_s.codes ->
    Prims.pos ->
      (Vale_X64_Machine_Semantics_s.ins Prims.list *
        Vale_X64_Machine_Semantics_s.codes) FStar_Pervasives_Native.option)
  =
  fun cs ->
    fun num ->
      match cs with
      | [] -> FStar_Pervasives_Native.None
      | c::cs' ->
          (match c with
           | Vale_X64_Machine_s.Ins i ->
               if num = Prims.int_one
               then FStar_Pervasives_Native.Some ([i], cs')
               else
                 (match pull_instructions_from_codes cs'
                          (num - Prims.int_one)
                  with
                  | FStar_Pervasives_Native.None ->
                      FStar_Pervasives_Native.None
                  | FStar_Pervasives_Native.Some (is2, cs'') ->
                      FStar_Pervasives_Native.Some ((i :: is2), cs''))
           | Vale_X64_Machine_s.Block l ->
               pull_instructions_from_codes
                 (FStar_List_Tot_Base.append l cs') num
           | Vale_X64_Machine_s.IfElse (uu___, uu___1, uu___2) ->
               FStar_Pervasives_Native.None
           | Vale_X64_Machine_s.While (uu___, uu___1) ->
               FStar_Pervasives_Native.None)
let rec (wrap_instructions :
  Vale_X64_Machine_Semantics_s.ins Prims.list ->
    Vale_X64_Machine_Semantics_s.codes)
  =
  fun is ->
    match is with
    | [] -> []
    | i::is' -> (Vale_X64_Machine_s.Ins i) :: (wrap_instructions is')
let rec (apply_peephole_to_codes :
  peephole ->
    Vale_X64_Machine_Semantics_s.codes -> Vale_X64_Machine_Semantics_s.codes)
  =
  fun p ->
    fun cs ->
      match cs with
      | [] -> []
      | c::cs' ->
          (match pull_instructions_from_codes cs p.input_hint with
           | FStar_Pervasives_Native.None -> c ::
               (apply_peephole_to_codes p cs')
           | FStar_Pervasives_Native.Some (is, cs'') ->
               (match p.ph is with
                | FStar_Pervasives_Native.None -> c ::
                    (apply_peephole_to_codes p cs')
                | FStar_Pervasives_Native.Some is' ->
                    (Vale_X64_Machine_s.Block (wrap_instructions is')) ::
                    (apply_peephole_to_codes p cs'')))
let rec (apply_peephole_to_code :
  peephole ->
    Vale_X64_Machine_Semantics_s.code -> Vale_X64_Machine_Semantics_s.code)
  =
  fun p ->
    fun c ->
      match c with
      | Vale_X64_Machine_s.Ins i ->
          if p.input_hint = Prims.int_one
          then
            (match p.ph [i] with
             | FStar_Pervasives_Native.None -> c
             | FStar_Pervasives_Native.Some is ->
                 Vale_X64_Machine_s.Block (wrap_instructions is))
          else c
      | Vale_X64_Machine_s.Block l ->
          let l' = apply_peephole_to_codes p l in Vale_X64_Machine_s.Block l'
      | Vale_X64_Machine_s.IfElse (c1, t, f) ->
          let t' = apply_peephole_to_code p t in
          let f' = apply_peephole_to_code p f in
          Vale_X64_Machine_s.IfElse (c1, t', f')
      | Vale_X64_Machine_s.While (c1, b) ->
          let b' = apply_peephole_to_code p b in
          Vale_X64_Machine_s.While (c1, b')




let (peephole_transform :
  peephole ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      Vale_X64_Decls.va_transformation_result)
  =
  fun p ->
    fun orig ->
      if Vale_X64_Lemmas.code_modifies_ghost orig
      then
        {
          Vale_X64_Decls.success =
            (Vale_X64_Decls.va_ffalse
               "code directly modifies ghost state (via ins_Ghost instruction)");
          Vale_X64_Decls.result = orig
        }
      else
        {
          Vale_X64_Decls.success = (Vale_X64_Decls.va_ttrue ());
          Vale_X64_Decls.result = (apply_peephole_to_code p orig)
        }

let coerce_to_normal : 'a . 'a -> 'a = fun x -> x

