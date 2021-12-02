open Prims
let rec (get_non_space : FStar_String.char Prims.list -> Prims.string) =
  fun x ->
    match x with
    | [] -> "."
    | x1::xs ->
        if x1 = 32
        then get_non_space xs
        else FStar_String.string_of_list [x1]
let print_ins :
  'uuuuu . Vale_X64_Machine_Semantics_s.ins -> 'uuuuu -> Prims.string =
  fun i ->
    fun uu___ ->
      get_non_space
        (FStar_String.list_of_string
           (Vale_X64_Print_s.print_ins i Vale_X64_Print_s.gcc))
let rec (aux_print_code : Vale_X64_Machine_Semantics_s.code -> Prims.string)
  =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins i -> print_ins i Vale_X64_Print_s.gcc
    | Vale_X64_Machine_s.Block l ->
        Prims.strcat "(" (Prims.strcat (aux_print_codes l) ")")
    | Vale_X64_Machine_s.IfElse (uu___, t, f) ->
        Prims.strcat "I" (Prims.strcat (aux_print_code t) (aux_print_code f))
    | Vale_X64_Machine_s.While (uu___, b) ->
        Prims.strcat "W" (aux_print_code b)
and (aux_print_codes : Vale_X64_Machine_Semantics_s.codes -> Prims.string) =
  fun c ->
    match c with
    | [] -> ""
    | x::xs -> Prims.strcat (aux_print_code x) (aux_print_codes xs)
let print_code :
  'uuuuu 'uuuuu1 .
    Vale_X64_Machine_Semantics_s.code ->
      'uuuuu -> 'uuuuu1 -> (Prims.string * Prims.int)
  =
  fun c ->
    fun uu___ ->
      fun uu___1 ->
        ((Prims.strcat "<" (Prims.strcat (aux_print_code c) ">\n")),
          Prims.int_zero)