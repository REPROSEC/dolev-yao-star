open Prims
let (print_function :
  Prims.string ->
    Prims.string FStar_Pervasives_Native.option ->
      (Prims.string * Vale_Interop_Base.td * Vale_X64_Machine_s.reg_64)
        Prims.list ->
        (Vale_X64_Machine_s.reg_64 -> Prims.bool) ->
          Vale_X64_Machine_Semantics_s.code -> unit)
  =
  fun name ->
    fun ret_val ->
      fun args ->
        fun regs_mod ->
          fun c ->
            let len = FStar_List_Tot_Base.length args in
            let arg_names n =
              match FStar_List_Tot_Base.nth args n with
              | FStar_Pervasives_Native.None -> ""
              | FStar_Pervasives_Native.Some (x, uu___, uu___1) -> x in
            let arg_types =
              FStar_List_Tot_Base.map
                (fun uu___ -> match uu___ with | (uu___1, t, uu___2) -> t)
                args in
            let arg_regs n =
              match FStar_List_Tot_Base.nth args n with
              | FStar_Pervasives_Native.None -> Prims.int_zero
              | FStar_Pervasives_Native.Some (uu___, uu___1, r) -> r in
            let uu___ =
              Vale_X64_Print_Inline_s.print_inline name Prims.int_zero
                ret_val len arg_types arg_names c arg_regs regs_mod [] in
            ()
let (test_inline_mov_input : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         (Prims.of_int (15)))] in
    let regs_mod r = (r = Prims.int_zero) || (r = (Prims.of_int (3))) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              ((fun uu___2 ->
                  fun uu___1 ->
                    (Obj.magic
                       (Vale_X64_InsLemmas.make_instr
                          [(Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                          [Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                          Vale_X64_Instruction_s.PreserveFlags
                          Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))] in
    print_function "test_inline_mov_input"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_mov_add_input : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         (Prims.of_int (15)))] in
    let regs_mod r = (r = Prims.int_zero) || (r = (Prims.of_int (3))) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              ((fun uu___2 ->
                  fun uu___1 ->
                    (Obj.magic
                       (Vale_X64_InsLemmas.make_instr
                          [(Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                          [Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                          Vale_X64_Instruction_s.PreserveFlags
                          Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpIm
                               Vale_X64_Instruction_s.IOpFlagsCf));
                         (Vale_X64_Instruction_s.InOut,
                           (Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_Add64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OConst Prims.int_one))))] in
    print_function "test_inline_mov_add_input"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_mul_inputs : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         Prims.int_one);
      ("second_arg",
        (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
        (Prims.of_int (15)))] in
    let regs_mod r = (r = Prims.int_zero) || (r = (Prims.of_int (3))) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              ((fun uu___2 ->
                  fun uu___1 ->
                    (Obj.magic
                       (Vale_X64_InsLemmas.make_instr
                          [(Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                          [Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                          Vale_X64_Instruction_s.PreserveFlags
                          Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_one))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.InOut,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_IMul64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))] in
    print_function "test_inline_mul_inputs"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_mov_mul_rax_100 : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         Prims.int_one)] in
    let regs_mod r =
      ((r = Prims.int_zero) || (r = (Prims.of_int (2)))) ||
        (r = (Prims.of_int (3))) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              ((fun uu___2 ->
                  fun uu___1 ->
                    (Obj.magic
                       (Vale_X64_InsLemmas.make_instr
                          [(Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                          [Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                          Vale_X64_Instruction_s.PreserveFlags
                          Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_one))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                (Obj.magic (Vale_X64_Machine_s.OConst (Prims.of_int (100))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.InOut,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_IMul64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (2))))))] in
    print_function "test_inline_mov_mul_rax_100"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_mov_mul_inputs : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         Prims.int_one);
      ("second_arg",
        (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
        (Prims.of_int (15)))] in
    let regs_mod r =
      ((r = Prims.int_zero) || (r = (Prims.of_int (2)))) ||
        (r = (Prims.of_int (3))) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              ((fun uu___2 ->
                  fun uu___1 ->
                    (Obj.magic
                       (Vale_X64_InsLemmas.make_instr
                          [(Vale_X64_Instruction_s.Out,
                             (Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64))]
                          [Vale_X64_Instruction_s.IOpEx
                             Vale_X64_Instruction_s.IOp64]
                          Vale_X64_Instruction_s.PreserveFlags
                          Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                 (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_one))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (2))))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.InOut,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_IMul64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (2))))))] in
    print_function "test_inline_mov_mul_inputs"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_comment_add : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         (Prims.of_int (15)))] in
    let regs_mod r = (r = (Prims.of_int (15))) || (r = Prims.int_zero) in
    let s = "This is a comment" in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              (Vale_X64_InsLemmas.make_instr_annotate [] []
                 Vale_X64_Instruction_s.PreserveFlags
                 (Vale_X64_Instructions_s.ins_Comment s)
                 (Vale_X64_Machine_Semantics_s.AnnotateComment s)));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpIm
                               Vale_X64_Instruction_s.IOpFlagsCf));
                         (Vale_X64_Instruction_s.InOut,
                           (Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_Add64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))] in
    print_function "test_inline_comment_add"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_same_line : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         (Prims.of_int (15)))] in
    let regs_mod r = (r = (Prims.of_int (15))) || (r = Prims.int_zero) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              (Vale_X64_InsLemmas.make_instr_annotate [] []
                 Vale_X64_Instruction_s.PreserveFlags
                 (Vale_X64_Instructions_s.ins_Space Prims.int_zero)
                 (Vale_X64_Machine_Semantics_s.AnnotateSpace Prims.int_zero)));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpIm
                               Vale_X64_Instruction_s.IOpFlagsCf));
                         (Vale_X64_Instruction_s.InOut,
                           (Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_Add64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))] in
    print_function "test_inline_same_line"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline_same_line_newline : unit -> unit) =
  fun uu___ ->
    let args =
      [("first_arg",
         (Vale_Interop_Base.TD_Base Vale_Arch_HeapTypes_s.TUInt64),
         (Prims.of_int (15)))] in
    let regs_mod r = (r = (Prims.of_int (15))) || (r = Prims.int_zero) in
    let c =
      Vale_X64_Machine_s.Block
        [Vale_X64_Machine_s.Ins
           (Obj.magic
              (Vale_X64_InsLemmas.make_instr_annotate [] []
                 Vale_X64_Instruction_s.PreserveFlags
                 (Vale_X64_Instructions_s.ins_Space (Prims.of_int (4)))
                 (Vale_X64_Machine_Semantics_s.AnnotateSpace
                    (Prims.of_int (4)))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpIm
                               Vale_X64_Instruction_s.IOpFlagsCf));
                         (Vale_X64_Instruction_s.InOut,
                           (Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_Add64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             (Vale_X64_InsLemmas.make_instr_annotate [] []
                Vale_X64_Instruction_s.PreserveFlags
                Vale_X64_Instructions_s.ins_Newline
                (Vale_X64_Machine_Semantics_s.AnnotateNewline ())));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             (Vale_X64_InsLemmas.make_instr_annotate [] []
                Vale_X64_Instruction_s.PreserveFlags
                (Vale_X64_Instructions_s.ins_Space (Prims.of_int (4)))
                (Vale_X64_Machine_Semantics_s.AnnotateSpace
                   (Prims.of_int (4)))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpIm
                               Vale_X64_Instruction_s.IOpFlagsCf));
                         (Vale_X64_Instruction_s.InOut,
                           (Vale_X64_Instruction_s.IOpEx
                              Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.HavocFlags
                         Vale_X64_Instructions_s.ins_Add64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))));
        Vale_X64_Machine_s.Ins
          (Obj.magic
             ((fun uu___2 ->
                 fun uu___1 ->
                   (Obj.magic
                      (Vale_X64_InsLemmas.make_instr
                         [(Vale_X64_Instruction_s.Out,
                            (Vale_X64_Instruction_s.IOpEx
                               Vale_X64_Instruction_s.IOp64))]
                         [Vale_X64_Instruction_s.IOpEx
                            Vale_X64_Instruction_s.IOp64]
                         Vale_X64_Instruction_s.PreserveFlags
                         Vale_X64_Instructions_s.ins_Mov64)) uu___2 uu___1)
                (Obj.magic (Vale_X64_Machine_s.OReg Prims.int_zero))
                (Obj.magic (Vale_X64_Machine_s.OReg (Prims.of_int (15))))))] in
    print_function "test_inline_same_line_newline"
      (FStar_Pervasives_Native.Some "result") args regs_mod c
let (test_inline : unit -> unit) =
  fun uu___ ->
    test_inline_mov_input ();
    test_inline_mov_add_input ();
    test_inline_mul_inputs ();
    test_inline_mov_mul_rax_100 ();
    test_inline_mov_mul_inputs ();
    test_inline_comment_add ();
    test_inline_same_line ();
    test_inline_same_line_newline ()