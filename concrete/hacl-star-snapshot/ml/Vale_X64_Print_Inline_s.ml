open Prims
let (print_rettype :
  Prims.string FStar_Pervasives_Native.option -> Prims.string) =
  fun ret_val ->
    match ret_val with
    | FStar_Pervasives_Native.None -> "void"
    | FStar_Pervasives_Native.Some uu___ -> "uint64_t"
let (print_basetype : Vale_Arch_HeapTypes_s.base_typ -> Prims.string) =
  fun t ->
    match t with
    | Vale_Arch_HeapTypes_s.TUInt8 -> "uint8_t"
    | Vale_Arch_HeapTypes_s.TUInt16 -> "uint16_t"
    | Vale_Arch_HeapTypes_s.TUInt32 -> "uint32_t"
    | Vale_Arch_HeapTypes_s.TUInt64 -> "uint64_t"
    | Vale_Arch_HeapTypes_s.TUInt128 -> "ERROR"
let (print_arg :
  Vale_Interop_Base.td ->
    Prims.nat -> (Prims.nat -> Prims.string) -> Prims.string)
  =
  fun a ->
    fun i ->
      fun names ->
        match a with
        | Vale_Interop_Base.TD_Base src ->
            Prims.strcat (print_basetype src) (Prims.strcat " " (names i))
        | Vale_Interop_Base.TD_Buffer (src, uu___, uu___1) ->
            Prims.strcat (print_basetype src) (Prims.strcat " *" (names i))
        | Vale_Interop_Base.TD_ImmBuffer (src, uu___, uu___1) ->
            Prims.strcat (print_basetype src) (Prims.strcat " *" (names i))
let rec (print_args :
  Vale_Interop_Base.td Prims.list ->
    Prims.nat -> (Prims.nat -> Prims.string) -> Prims.string)
  =
  fun args ->
    fun i ->
      fun names ->
        match args with
        | [] -> ""
        | a::[] -> print_arg a i names
        | a::q ->
            Prims.strcat (print_arg a i names)
              (Prims.strcat ", " (print_args q (i + Prims.int_one) names))
let rec (build_reserved_args_outs :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
      Vale_X64_Machine_s.reg_64 -> Prims.bool)
  =
  fun l ->
    fun reserved ->
      fun r ->
        match l with
        | [] -> reserved r
        | hd::tl ->
            let uu___ = hd in
            (match uu___ with
             | (uu___1, op) ->
                 let reserved1 r1 =
                   match op with
                   | Vale_X64_Instruction_s.IOpIm
                       (Vale_X64_Instruction_s.IOp64One
                       (Vale_X64_Machine_s.OReg reg)) ->
                       if r1 = reg then true else reserved r1
                   | uu___2 -> reserved r1 in
                 build_reserved_args_outs tl reserved1 r)
let rec (build_reserved_args_ins :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
      Vale_X64_Machine_s.reg_64 -> Prims.bool)
  =
  fun l ->
    fun reserved ->
      fun r ->
        match l with
        | [] -> reserved r
        | hd::tl ->
            let reserved1 r1 =
              match hd with
              | Vale_X64_Instruction_s.IOpIm (Vale_X64_Instruction_s.IOp64One
                  (Vale_X64_Machine_s.OReg reg)) ->
                  if r1 = reg then true else reserved r1
              | uu___ -> reserved r1 in
            build_reserved_args_ins tl reserved1 r
let rec (build_reserved_args :
  Vale_X64_Machine_Semantics_s.code ->
    (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
      Vale_X64_Machine_s.reg_64 -> Prims.bool)
  =
  fun c ->
    fun reserved ->
      fun r ->
        match c with
        | Vale_X64_Machine_s.Ins ins ->
            (match ins with
             | Vale_X64_Bytes_Code_s.Instr (i, uu___, uu___1) ->
                 let reserved1 =
                   build_reserved_args_outs
                     (Vale_X64_Instruction_s.__proj__InstrTypeRecord__item__outs
                        i) reserved in
                 let reserved2 =
                   build_reserved_args_ins
                     (Vale_X64_Instruction_s.__proj__InstrTypeRecord__item__args
                        i) reserved1 in
                 reserved2 r
             | uu___ -> reserved r)
        | Vale_X64_Machine_s.Block l ->
            build_reserved_args_block l reserved r
        | Vale_X64_Machine_s.IfElse (cond, ifTrue, ifFalse) ->
            let reservedT = build_reserved_args ifTrue reserved in
            build_reserved_args ifFalse reservedT r
        | Vale_X64_Machine_s.While (cond, body) ->
            build_reserved_args body reserved r
and (build_reserved_args_block :
  Vale_X64_Machine_Semantics_s.code Prims.list ->
    (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
      Vale_X64_Machine_s.reg_64 -> Prims.bool)
  =
  fun l ->
    fun reserved ->
      fun r ->
        match l with
        | [] -> reserved r
        | hd::tl ->
            let reserved1 = build_reserved_args hd reserved in
            build_reserved_args_block tl reserved1 r
let (print_output_ret :
  Prims.string FStar_Pervasives_Native.option ->
    (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
      Prims.nat ->
        (Prims.string Prims.list *
          (Vale_X64_Machine_s.reg_64 -> Prims.string) * Prims.nat))
  =
  fun ret_val ->
    fun reg_names ->
      fun counter ->
        match ret_val with
        | FStar_Pervasives_Native.None -> ([], reg_names, counter)
        | FStar_Pervasives_Native.Some name ->
            ([Prims.strcat "\"=&r\" (" (Prims.strcat name ")")],
              ((fun r ->
                  if r = Prims.int_zero
                  then Prims.string_of_int counter
                  else reg_names r)), (counter + Prims.int_one))
let (print_modified_input :
  Prims.nat ->
    Vale_Interop_Base.td ->
      Prims.nat ->
        (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
          (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
            (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
              (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
                Prims.nat ->
                  (Prims.nat -> Prims.string) ->
                    (Prims.string Prims.list *
                      (Vale_X64_Machine_s.reg_64 -> Prims.string) *
                      Prims.nat))
  =
  fun n ->
    fun a ->
      fun i ->
        fun of_arg ->
          fun regs_mod ->
            fun reserved_regs ->
              fun reg_names ->
                fun counter ->
                  fun arg_names ->
                    if regs_mod (of_arg i)
                    then
                      ([Prims.strcat "\"+&r\" ("
                          (Prims.strcat (arg_names i)
                             (if reserved_regs (of_arg i) then "_r)" else ")"))],
                        (fun r ->
                           (if
                              (r = (of_arg i)) &&
                                (Prims.op_Negation (reserved_regs r))
                            then Prims.string_of_int counter
                            else reg_names r)), (counter + Prims.int_one))
                    else ([], reg_names, counter)
let rec (get_modified_input_strings :
  Prims.nat ->
    (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_Interop_Base.td Prims.list ->
            Prims.nat ->
              Prims.string FStar_Pervasives_Native.option ->
                (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
                  Prims.nat ->
                    (Prims.nat -> Prims.string) ->
                      (Prims.string Prims.list *
                        (Vale_X64_Machine_s.reg_64 -> Prims.string) *
                        Prims.nat))
  =
  fun n ->
    fun of_arg ->
      fun regs_mod ->
        fun reserved_regs ->
          fun args ->
            fun i ->
              fun ret_val ->
                fun reg_names ->
                  fun counter ->
                    fun arg_names ->
                      match args with
                      | [] -> print_output_ret ret_val reg_names counter
                      | a::q ->
                          let uu___ =
                            print_modified_input n a i of_arg regs_mod
                              reserved_regs reg_names counter arg_names in
                          (match uu___ with
                           | (output, reg_names1, counter1) ->
                               let uu___1 =
                                 get_modified_input_strings n of_arg regs_mod
                                   reserved_regs q (i + Prims.int_one)
                                   ret_val reg_names1 counter1 arg_names in
                               (match uu___1 with
                                | (outputs, reg_names2, counter2) ->
                                    ((FStar_List_Tot_Base.append output
                                        outputs), reg_names2, counter2)))
let (print_modified_inputs :
  Prims.nat ->
    (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_Interop_Base.td Prims.list ->
            Prims.string FStar_Pervasives_Native.option ->
              (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
                Prims.nat ->
                  (Prims.nat -> Prims.string) ->
                    (Prims.string *
                      (Vale_X64_Machine_s.reg_64 -> Prims.string) *
                      Prims.nat))
  =
  fun n ->
    fun of_arg ->
      fun regs_mod ->
        fun reserved_regs ->
          fun args ->
            fun ret_val ->
              fun reg_names ->
                fun counter ->
                  fun arg_names ->
                    let rec aux uu___ =
                      match uu___ with
                      | [] -> "\n"
                      | a::[] -> Prims.strcat a "\n"
                      | a::q -> Prims.strcat a (Prims.strcat ", " (aux q)) in
                    let uu___ =
                      get_modified_input_strings n of_arg regs_mod
                        reserved_regs args Prims.int_zero ret_val reg_names
                        counter arg_names in
                    match uu___ with
                    | (outputs, output_reg_names, output_nbr) ->
                        ((aux outputs), output_reg_names, output_nbr)
let (print_nonmodified_input :
  Prims.nat ->
    (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_Interop_Base.td ->
            Prims.nat ->
              (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
                Prims.nat ->
                  (Prims.nat -> Prims.string) ->
                    (Prims.string Prims.list *
                      (Vale_X64_Machine_s.reg_64 -> Prims.string) *
                      Prims.nat))
  =
  fun n ->
    fun of_arg ->
      fun regs_mod ->
        fun reserved_regs ->
          fun a ->
            fun i ->
              fun reg_names ->
                fun counter ->
                  fun arg_names ->
                    if regs_mod (of_arg i)
                    then ([], reg_names, counter)
                    else
                      ([Prims.strcat "\"r\" ("
                          (Prims.strcat (arg_names i)
                             (if reserved_regs (of_arg i) then "_r)" else ")"))],
                        ((fun r ->
                            if
                              (r = (of_arg i)) &&
                                (Prims.op_Negation (reserved_regs r))
                            then Prims.string_of_int counter
                            else reg_names r)), (counter + Prims.int_one))
let rec (get_nonmodified_input_strings :
  Prims.nat ->
    (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_Interop_Base.td Prims.list ->
            Prims.nat ->
              (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
                Prims.nat ->
                  (Prims.nat -> Prims.string) ->
                    (Prims.string Prims.list *
                      (Vale_X64_Machine_s.reg_64 -> Prims.string) *
                      Prims.nat))
  =
  fun n ->
    fun of_arg ->
      fun regs_mod ->
        fun reserved_regs ->
          fun args ->
            fun i ->
              fun reg_names ->
                fun counter ->
                  fun arg_names ->
                    match args with
                    | [] -> ([], reg_names, counter)
                    | a::q ->
                        let uu___ =
                          print_nonmodified_input n of_arg regs_mod
                            reserved_regs a i reg_names counter arg_names in
                        (match uu___ with
                         | (input, reg_names1, counter1) ->
                             let uu___1 =
                               get_nonmodified_input_strings n of_arg
                                 regs_mod reserved_regs q (i + Prims.int_one)
                                 reg_names1 counter1 arg_names in
                             (match uu___1 with
                              | (inputs, reg_names2, counter2) ->
                                  ((FStar_List_Tot_Base.append input inputs),
                                    reg_names2, counter2)))
let (print_nonmodified_inputs :
  Prims.nat ->
    (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
      (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_Interop_Base.td Prims.list ->
            (Vale_X64_Machine_s.reg_64 -> Prims.string) ->
              Prims.nat ->
                (Prims.nat -> Prims.string) ->
                  (Prims.string * (Vale_X64_Machine_s.reg_64 -> Prims.string)
                    * Prims.nat))
  =
  fun n ->
    fun of_arg ->
      fun regs_mod ->
        fun reserved_regs ->
          fun args ->
            fun reg_names ->
              fun counter ->
                fun arg_names ->
                  let rec aux uu___ =
                    match uu___ with
                    | [] -> "\n"
                    | a::[] -> Prims.strcat a "\n"
                    | a::q -> Prims.strcat a (Prims.strcat ", " (aux q)) in
                  let uu___ =
                    get_nonmodified_input_strings n of_arg regs_mod
                      reserved_regs args Prims.int_zero reg_names counter
                      arg_names in
                  match uu___ with
                  | (inputs, input_reg_names, counter1) ->
                      ((aux inputs), input_reg_names, counter1)
let (print_modified_registers :
  Prims.nat ->
    Prims.string FStar_Pervasives_Native.option ->
      (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
            Vale_Interop_Base.td Prims.list -> Prims.string)
  =
  fun n ->
    fun ret_val ->
      fun of_arg ->
        fun regs_mod ->
          fun reserved_args ->
            fun args ->
              let output_register a =
                (FStar_Pervasives_Native.uu___is_Some ret_val) &&
                  (a = Prims.int_zero) in
              let rec input_register i a =
                if i >= n
                then false
                else
                  (a = (of_arg i)) || (input_register (i + Prims.int_one) a) in
              let rec aux uu___ =
                match uu___ with
                | [] -> "\"memory\", \"cc\"\n"
                | a::q ->
                    if
                      ((Prims.op_Negation (regs_mod a)) ||
                         (input_register Prims.int_zero a))
                        || (output_register a)
                    then aux q
                    else
                      Prims.strcat "\"%"
                        (Prims.strcat (Vale_X64_Print_s.print_reg_name a)
                           (Prims.strcat "\", " (aux q))) in
              aux
                [Prims.int_zero;
                Prims.int_one;
                (Prims.of_int (2));
                (Prims.of_int (3));
                (Prims.of_int (4));
                (Prims.of_int (5));
                (Prims.of_int (6));
                (Prims.of_int (7));
                (Prims.of_int (8));
                (Prims.of_int (9));
                (Prims.of_int (10));
                (Prims.of_int (11));
                (Prims.of_int (12));
                (Prims.of_int (13));
                (Prims.of_int (14));
                (Prims.of_int (15))]
let (print_explicit_register_arg :
  Prims.nat ->
    Vale_Interop_Base.td ->
      Prims.nat ->
        (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
          (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
            (Prims.nat -> Prims.string) -> (Prims.bool * Prims.string))
  =
  fun n ->
    fun a ->
      fun i ->
        fun of_arg ->
          fun reserved ->
            fun names ->
              let ty =
                match a with
                | Vale_Interop_Base.TD_Base uu___ -> "uint64_t "
                | uu___ -> "uint64_t *" in
              if reserved (of_arg i)
              then
                (true,
                  (Prims.strcat "  register "
                     (Prims.strcat ty
                        (Prims.strcat (names i)
                           (Prims.strcat "_r asm(\""
                              (Prims.strcat
                                 (Vale_X64_Print_s.print_reg_name (of_arg i))
                                 (Prims.strcat "\") = "
                                    (Prims.strcat (names i) ";\n"))))))))
              else (false, "")
let rec (print_explicit_register_args :
  Prims.nat ->
    Vale_Interop_Base.td Prims.list ->
      Prims.nat ->
        (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
          (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
            (Prims.nat -> Prims.string) -> (Prims.bool * Prims.string))
  =
  fun n ->
    fun args ->
      fun i ->
        fun of_arg ->
          fun reserved ->
            fun names ->
              match args with
              | [] -> (false, "")
              | a::q ->
                  let uu___ =
                    print_explicit_register_arg n a i of_arg reserved names in
                  (match uu___ with
                   | (was_explicit, explicit_str) ->
                       let uu___1 =
                         print_explicit_register_args n q (i + Prims.int_one)
                           of_arg reserved names in
                       (match uu___1 with
                        | (are_explicit, rest_str) ->
                            ((was_explicit || are_explicit),
                              (Prims.strcat explicit_str rest_str))))
let (print_register_ret :
  (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
    Prims.string FStar_Pervasives_Native.option -> Prims.string)
  =
  fun reserved ->
    fun uu___ ->
      match uu___ with
      | FStar_Pervasives_Native.None -> ""
      | FStar_Pervasives_Native.Some name ->
          if reserved Prims.int_zero
          then
            Prims.strcat "  register uint64_t "
              (Prims.strcat name " asm(\"rax\");\n")
          else Prims.strcat "  uint64_t " (Prims.strcat name ";\n")
let (print_cmp :
  Vale_X64_Machine_Semantics_s.ocmp ->
    Prims.int -> Vale_X64_Print_s.printer -> Prims.string)
  =
  fun c ->
    fun counter ->
      fun p ->
        let print_ops o1 o2 =
          let uu___ =
            p.Vale_X64_Print_s.op_order (Vale_X64_Print_s.print_operand o1 p)
              (Vale_X64_Print_s.print_operand o2 p) in
          match uu___ with
          | (first, second) ->
              Prims.strcat "  cmp "
                (Prims.strcat first
                   (Prims.strcat ", " (Prims.strcat second "\n"))) in
        match c with
        | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  je "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
        | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  jne "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
        | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  jbe "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
        | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  jae "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
        | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  jb "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
        | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
            Prims.strcat "    \""
              (Prims.strcat (print_ops o1 o2)
                 (Prims.strcat "  ja "
                    (Prims.strcat "L"
                       (Prims.strcat (Prims.string_of_int counter) ";\"\n"))))
let rec (print_spaces : Prims.nat -> Prims.string) =
  fun n ->
    match n with
    | uu___ when uu___ = Prims.int_zero -> ""
    | n1 -> Prims.strcat " " (print_spaces (n1 - Prims.int_one))
let (print_ins :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Print_s.printer -> Prims.string)
  =
  fun ins ->
    fun p ->
      match ins with
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateComment s) ->
          Prims.strcat "    // " s
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateLargeComment
           s)
          -> Prims.strcat "\n    /////// " (Prims.strcat s " ////// \n")
      | Vale_X64_Bytes_Code_s.Instr
          (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateSpace n) ->
          print_spaces n
      | uu___ ->
          Prims.strcat "    \""
            (Prims.strcat (Vale_X64_Print_s.print_ins ins p) ";\"")
let rec (print_block :
  Vale_X64_Machine_Semantics_s.codes ->
    Prims.int -> Vale_X64_Print_s.printer -> (Prims.string * Prims.int))
  =
  fun b ->
    fun n ->
      fun p ->
        match b with
        | [] -> ("", n)
        | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
            (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateSpace
             spaces)))::(Vale_X64_Machine_s.Ins
            (Vale_X64_Bytes_Code_s.Instr
            (uu___2, uu___3, Vale_X64_Machine_Semantics_s.AnnotateComment s)))::tail
            ->
            let head_str = Prims.strcat "    // " (Prims.strcat s "\n") in
            let uu___4 = print_block tail n p in
            (match uu___4 with
             | (rest, n') ->
                 ((Prims.strcat (print_spaces spaces)
                     (Prims.strcat head_str rest)), n'))
        | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
            (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateSpace
             spaces)))::(Vale_X64_Machine_s.Ins
            i)::tail ->
            let head_str = print_ins i p in
            let uu___2 = print_block tail n p in
            (match uu___2 with
             | (rest, n') ->
                 ((Prims.strcat (print_spaces spaces)
                     (Prims.strcat head_str rest)), n'))
        | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
            (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateNewline
             uu___2)))::tail
            ->
            let uu___3 = print_block tail n p in
            (match uu___3 with | (rest, n') -> ((Prims.strcat "\n" rest), n'))
        | head::tail ->
            let uu___ = print_code head n p in
            (match uu___ with
             | (head_str, n') ->
                 let uu___1 = print_block tail n' p in
                 (match uu___1 with
                  | (rest, n'') -> ((Prims.strcat head_str rest), n'')))
and (print_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.int -> Vale_X64_Print_s.printer -> (Prims.string * Prims.int))
  =
  fun c ->
    fun n ->
      fun p ->
        match c with
        | Vale_X64_Machine_s.Ins ins ->
            ((Prims.strcat (print_ins ins p) "\n"), n)
        | Vale_X64_Machine_s.Block b -> print_block b n p
        | Vale_X64_Machine_s.IfElse (cond, true_code, false_code) ->
            let n1 = n in
            let n2 = n + Prims.int_one in
            let cmp = print_cmp (Vale_X64_Print_s.cmp_not cond) n1 p in
            let uu___ = print_code true_code (n + (Prims.of_int (2))) p in
            (match uu___ with
             | (true_str, n') ->
                 let jmp =
                   Prims.strcat "    \"  jmp L"
                     (Prims.strcat (Prims.string_of_int n2) ";\"\n") in
                 let label1 =
                   Prims.strcat "    \"L"
                     (Prims.strcat (Prims.string_of_int n1) ":\"\n") in
                 let uu___1 = print_code false_code n' p in
                 (match uu___1 with
                  | (false_str, n'1) ->
                      let label2 =
                        Prims.strcat "    \"L"
                          (Prims.strcat (Prims.string_of_int n2) ":\"\n") in
                      ((Prims.strcat cmp
                          (Prims.strcat true_str
                             (Prims.strcat jmp
                                (Prims.strcat label1
                                   (Prims.strcat false_str label2))))), n'1)))
        | Vale_X64_Machine_s.While (cond, body) ->
            let n1 = n in
            let n2 = n + Prims.int_one in
            let jmp =
              Prims.strcat "    \"  jmp L"
                (Prims.strcat (Prims.string_of_int n2) ";\"\n") in
            let label1 =
              Prims.strcat "    \""
                (Prims.strcat (p.Vale_X64_Print_s.align ())
                   (Prims.strcat " 16\nL"
                      (Prims.strcat (Prims.string_of_int n1) ":\"\n"))) in
            let uu___ = print_code body (n + (Prims.of_int (2))) p in
            (match uu___ with
             | (body_str, n') ->
                 let label2 =
                   Prims.strcat "    \""
                     (Prims.strcat (p.Vale_X64_Print_s.align ())
                        (Prims.strcat " 16\nL"
                           (Prims.strcat (Prims.string_of_int n2) ":\"\n"))) in
                 let cmp = print_cmp cond n1 p in
                 ((Prims.strcat jmp
                     (Prims.strcat label1
                        (Prims.strcat body_str (Prims.strcat label2 cmp)))),
                   n'))
let rec (print_fn_comments : Prims.string Prims.list -> Prims.string) =
  fun uu___ ->
    match uu___ with
    | [] -> ""
    | hd::tl ->
        Prims.strcat "// "
          (Prims.strcat hd (Prims.strcat "\n" (print_fn_comments tl)))
let rec (remove_blank :
  Vale_X64_Machine_Semantics_s.code -> Vale_X64_Machine_Semantics_s.code) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins uu___ -> c
    | Vale_X64_Machine_s.Block b ->
        Vale_X64_Machine_s.Block (remove_blanks b)
    | Vale_X64_Machine_s.IfElse (cond, ct, cf) ->
        Vale_X64_Machine_s.IfElse
          (cond, (remove_blank ct), (remove_blank cf))
    | Vale_X64_Machine_s.While (cond, cb) ->
        Vale_X64_Machine_s.While (cond, (remove_blank cb))
and (remove_blanks :
  Vale_X64_Machine_Semantics_s.codes -> Vale_X64_Machine_Semantics_s.codes) =
  fun b ->
    match b with
    | [] -> []
    | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
        (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateGhost uu___2)))::cs
        -> remove_blanks cs
    | (Vale_X64_Machine_s.Block b1)::cs ->
        (match remove_blanks b1 with
         | [] -> remove_blanks cs
         | b2 -> (Vale_X64_Machine_s.Block b2) :: (remove_blanks cs))
    | c::cs -> c :: (remove_blanks cs)
let rec (uses_rax :
  Prims.nat ->
    Vale_Interop_Base.td Prims.list ->
      Prims.nat ->
        (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64) ->
          Prims.bool)
  =
  fun n ->
    fun args ->
      fun i ->
        fun of_arg ->
          match args with
          | [] -> false
          | a::q ->
              if (of_arg i) = Prims.int_zero
              then true
              else uses_rax n q (i + Prims.int_one) of_arg
let (print_inline :
  Prims.string ->
    Prims.int ->
      Prims.string FStar_Pervasives_Native.option ->
        Prims.nat ->
          Vale_Interop_Base.td Prims.list ->
            (Prims.nat -> Prims.string) ->
              Vale_X64_Machine_Semantics_s.code ->
                (unit Vale_Interop_X64.reg_nat -> Vale_X64_Machine_s.reg_64)
                  ->
                  (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
                    Prims.string Prims.list -> Prims.int)
  =
  fun name ->
    fun label ->
      fun ret_val ->
        fun n ->
          fun args ->
            fun arg_names ->
              fun code ->
                fun of_arg ->
                  fun regs_mod ->
                    fun fn_comments ->
                      let comments = print_fn_comments fn_comments in
                      let reserved_regs =
                        build_reserved_args code (fun uu___ -> false) in
                      let inputs_use_rax =
                        uses_rax (FStar_List_Tot_Base.length args) args
                          Prims.int_zero of_arg in
                      if
                        (reserved_regs Prims.int_zero) &&
                          (FStar_Pervasives_Native.uu___is_Some ret_val)
                      then
                        failwith
                          "We require the annotation register uint64_t result(rax), but it would be ignored by gcc < 9"
                      else ();
                      if
                        inputs_use_rax &&
                          (FStar_Pervasives_Native.uu___is_Some ret_val)
                      then
                        failwith
                          "inputs are not allowed to be passed in rax when there is a return argument"
                      else ();
                      (let header =
                         Prims.strcat "static inline "
                           (Prims.strcat (print_rettype ret_val)
                              (Prims.strcat " "
                                 (Prims.strcat name
                                    (Prims.strcat " ("
                                       (Prims.strcat
                                          (print_args args Prims.int_zero
                                             arg_names) ") \n{\n"))))) in
                       let ret_reg = print_register_ret reserved_regs ret_val in
                       let uu___2 =
                         print_explicit_register_args n args Prims.int_zero
                           of_arg reserved_regs arg_names in
                       match uu___2 with
                       | (has_explicit, explicit_regs) ->
                           let start_code =
                             Prims.strcat
                               (if
                                  (FStar_Pervasives_Native.uu___is_Some
                                     ret_val)
                                    || has_explicit
                                then "\n"
                                else "") "  asm volatile(\n" in
                           let init_reg_names r =
                             Prims.strcat "%"
                               (Vale_X64_Print_s.print_reg_name r) in
                           let uu___3 =
                             print_modified_inputs n of_arg regs_mod
                               reserved_regs args ret_val init_reg_names
                               Prims.int_zero arg_names in
                           (match uu___3 with
                            | (output_str, output_reg_names, output_nbr) ->
                                let output_str1 =
                                  Prims.strcat "  : " output_str in
                                let uu___4 =
                                  print_nonmodified_inputs n of_arg regs_mod
                                    reserved_regs args output_reg_names
                                    output_nbr arg_names in
                                (match uu___4 with
                                 | (input_str, inlined_reg_names, uu___5) ->
                                     let input_str1 =
                                       Prims.strcat "  : " input_str in
                                     let inlined_reg32_names r =
                                       if
                                         (Prims.strcat "%"
                                            (Vale_X64_Print_s.print_reg_name
                                               r))
                                           = (inlined_reg_names r)
                                       then
                                         Prims.strcat "%"
                                           (Vale_X64_Print_s.print_reg32_name
                                              r)
                                       else
                                         Prims.strcat "k"
                                           (inlined_reg_names r) in
                                     let inlined_small_reg_names r =
                                       if r > (Prims.of_int (3))
                                       then
                                         Vale_X64_Print_s.print_small_reg_name
                                           r
                                       else
                                         if
                                           (Prims.strcat "%"
                                              (Vale_X64_Print_s.print_reg_name
                                                 r))
                                             = (inlined_reg_names r)
                                         then
                                           Prims.strcat "%"
                                             (Vale_X64_Print_s.print_small_reg_name
                                                r)
                                         else
                                           Prims.strcat "b"
                                             (inlined_reg_names r) in
                                     let printer =
                                       let uu___6 = Vale_X64_Print_s.gcc in
                                       {
                                         Vale_X64_Print_s.print_reg_name =
                                           inlined_reg_names;
                                         Vale_X64_Print_s.print_reg32_name =
                                           inlined_reg32_names;
                                         Vale_X64_Print_s.print_small_reg_name
                                           = inlined_small_reg_names;
                                         Vale_X64_Print_s.reg_prefix =
                                           (uu___6.Vale_X64_Print_s.reg_prefix);
                                         Vale_X64_Print_s.mem_prefix =
                                           (uu___6.Vale_X64_Print_s.mem_prefix);
                                         Vale_X64_Print_s.maddr =
                                           (uu___6.Vale_X64_Print_s.maddr);
                                         Vale_X64_Print_s.const =
                                           (uu___6.Vale_X64_Print_s.const);
                                         Vale_X64_Print_s.ins_name =
                                           (uu___6.Vale_X64_Print_s.ins_name);
                                         Vale_X64_Print_s.op_order =
                                           (uu___6.Vale_X64_Print_s.op_order);
                                         Vale_X64_Print_s.align =
                                           (uu___6.Vale_X64_Print_s.align);
                                         Vale_X64_Print_s.header =
                                           (uu___6.Vale_X64_Print_s.header);
                                         Vale_X64_Print_s.footer =
                                           (uu___6.Vale_X64_Print_s.footer);
                                         Vale_X64_Print_s.proc_name =
                                           (uu___6.Vale_X64_Print_s.proc_name);
                                         Vale_X64_Print_s.ret =
                                           (uu___6.Vale_X64_Print_s.ret);
                                         Vale_X64_Print_s.sha256rnds2_explicit_xmm0
                                           =
                                           (uu___6.Vale_X64_Print_s.sha256rnds2_explicit_xmm0)
                                       } in
                                     let uu___6 =
                                       print_code (remove_blank code) label
                                         printer in
                                     (match uu___6 with
                                      | (code_str, final_label) ->
                                          let modified_str =
                                            Prims.strcat "  : "
                                              (print_modified_registers n
                                                 ret_val of_arg regs_mod
                                                 reserved_regs args) in
                                          let close_code =
                                            Prims.strcat "  );\n"
                                              (Prims.strcat
                                                 (if
                                                    FStar_Pervasives_Native.uu___is_Some
                                                      ret_val
                                                  then
                                                    Prims.strcat
                                                      "\n  return "
                                                      (Prims.strcat
                                                         (FStar_Pervasives_Native.__proj__Some__item__v
                                                            ret_val) ";\n")
                                                  else "") "}\n\n") in
                                          (FStar_IO.print_string
                                             (Prims.strcat comments
                                                (Prims.strcat header
                                                   (Prims.strcat ret_reg
                                                      (Prims.strcat
                                                         explicit_regs
                                                         (Prims.strcat
                                                            start_code
                                                            (Prims.strcat
                                                               code_str
                                                               (Prims.strcat
                                                                  output_str1
                                                                  (Prims.strcat
                                                                    input_str1
                                                                    (Prims.strcat
                                                                    modified_str
                                                                    close_code)))))))));
                                           final_label)))))