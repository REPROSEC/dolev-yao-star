open Prims
type printer =
  {
  print_reg_name: Vale_X64_Machine_s.reg_64 -> Prims.string ;
  print_reg32_name: Vale_X64_Machine_s.reg_64 -> Prims.string ;
  print_small_reg_name: Vale_X64_Machine_s.reg_64 -> Prims.string ;
  reg_prefix: unit -> Prims.string ;
  mem_prefix: Prims.string -> Prims.string ;
  maddr:
    Prims.string ->
      (Prims.string * Prims.string) FStar_Pervasives_Native.option ->
        Prims.string -> Prims.string
    ;
  const: Prims.int -> Prims.string ;
  ins_name:
    Prims.string -> Vale_X64_Machine_s.operand64 Prims.list -> Prims.string ;
  op_order: Prims.string -> Prims.string -> (Prims.string * Prims.string) ;
  align: unit -> Prims.string ;
  header: unit -> Prims.string ;
  footer: unit -> Prims.string ;
  proc_name: Prims.string -> Prims.string ;
  ret: Prims.string -> Prims.string ;
  sha256rnds2_explicit_xmm0: unit -> Prims.bool }
let (__proj__Mkprinter__item__print_reg_name :
  printer -> Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} ->
        print_reg_name
let (__proj__Mkprinter__item__print_reg32_name :
  printer -> Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} ->
        print_reg32_name
let (__proj__Mkprinter__item__print_small_reg_name :
  printer -> Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} ->
        print_small_reg_name
let (__proj__Mkprinter__item__reg_prefix : printer -> unit -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> reg_prefix
let (__proj__Mkprinter__item__mem_prefix :
  printer -> Prims.string -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> mem_prefix
let (__proj__Mkprinter__item__maddr :
  printer ->
    Prims.string ->
      (Prims.string * Prims.string) FStar_Pervasives_Native.option ->
        Prims.string -> Prims.string)
  =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> maddr
let (__proj__Mkprinter__item__const : printer -> Prims.int -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> const
let (__proj__Mkprinter__item__ins_name :
  printer ->
    Prims.string -> Vale_X64_Machine_s.operand64 Prims.list -> Prims.string)
  =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> ins_name
let (__proj__Mkprinter__item__op_order :
  printer -> Prims.string -> Prims.string -> (Prims.string * Prims.string)) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> op_order
let (__proj__Mkprinter__item__align : printer -> unit -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> align
let (__proj__Mkprinter__item__header : printer -> unit -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> header
let (__proj__Mkprinter__item__footer : printer -> unit -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> footer
let (__proj__Mkprinter__item__proc_name :
  printer -> Prims.string -> Prims.string) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> proc_name
let (__proj__Mkprinter__item__ret : printer -> Prims.string -> Prims.string)
  =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} -> ret
let (__proj__Mkprinter__item__sha256rnds2_explicit_xmm0 :
  printer -> unit -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { print_reg_name; print_reg32_name; print_small_reg_name; reg_prefix;
        mem_prefix; maddr; const; ins_name; op_order; align; header; 
        footer; proc_name; ret; sha256rnds2_explicit_xmm0;_} ->
        sha256rnds2_explicit_xmm0
let (print_reg_name : Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun r ->
    match r with
    | uu___ when uu___ = Prims.int_zero -> "rax"
    | uu___ when uu___ = Prims.int_one -> "rbx"
    | uu___ when uu___ = (Prims.of_int (2)) -> "rcx"
    | uu___ when uu___ = (Prims.of_int (3)) -> "rdx"
    | uu___ when uu___ = (Prims.of_int (4)) -> "rsi"
    | uu___ when uu___ = (Prims.of_int (5)) -> "rdi"
    | uu___ when uu___ = (Prims.of_int (6)) -> "rbp"
    | uu___ when uu___ = (Prims.of_int (7)) -> "rsp"
    | uu___ when uu___ = (Prims.of_int (8)) -> "r8"
    | uu___ when uu___ = (Prims.of_int (9)) -> "r9"
    | uu___ when uu___ = (Prims.of_int (10)) -> "r10"
    | uu___ when uu___ = (Prims.of_int (11)) -> "r11"
    | uu___ when uu___ = (Prims.of_int (12)) -> "r12"
    | uu___ when uu___ = (Prims.of_int (13)) -> "r13"
    | uu___ when uu___ = (Prims.of_int (14)) -> "r14"
    | uu___ when uu___ = (Prims.of_int (15)) -> "r15"
let (print_reg32_name : Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun r ->
    match r with
    | uu___ when uu___ = Prims.int_zero -> "eax"
    | uu___ when uu___ = Prims.int_one -> "ebx"
    | uu___ when uu___ = (Prims.of_int (2)) -> "ecx"
    | uu___ when uu___ = (Prims.of_int (3)) -> "edx"
    | uu___ when uu___ = (Prims.of_int (4)) -> "esi"
    | uu___ when uu___ = (Prims.of_int (5)) -> "edi"
    | uu___ when uu___ = (Prims.of_int (6)) -> "ebp"
    | uu___ when uu___ = (Prims.of_int (7)) -> "esp"
    | uu___ -> Prims.strcat (print_reg_name r) "d"
let (print_small_reg_name : Vale_X64_Machine_s.reg_64 -> Prims.string) =
  fun r ->
    match r with
    | uu___ when uu___ = Prims.int_zero -> "al"
    | uu___ when uu___ = Prims.int_one -> "bl"
    | uu___ when uu___ = (Prims.of_int (2)) -> "cl"
    | uu___ when uu___ = (Prims.of_int (3)) -> "dl"
    | uu___ -> " !!! INVALID small operand !!!  Expected al, bl, cl, or dl."
let (print_reg64 : Vale_X64_Machine_s.reg_64 -> printer -> Prims.string) =
  fun r -> fun p -> Prims.strcat (p.reg_prefix ()) (p.print_reg_name r)
let (print_reg32 : Vale_X64_Machine_s.reg_64 -> printer -> Prims.string) =
  fun r -> fun p -> Prims.strcat (p.reg_prefix ()) (p.print_reg32_name r)
let (print_small_reg : Vale_X64_Machine_s.reg_64 -> printer -> Prims.string)
  =
  fun r -> fun p -> Prims.strcat (p.reg_prefix ()) (p.print_small_reg_name r)
let (print_maddr :
  Vale_X64_Machine_s.maddr ->
    Prims.string ->
      (Vale_X64_Machine_s.reg -> printer -> Prims.string) ->
        printer -> Prims.string)
  =
  fun m ->
    fun ptr_type ->
      fun reg_printer ->
        fun p ->
          Prims.strcat (p.mem_prefix ptr_type)
            (match m with
             | Vale_X64_Machine_s.MConst n -> p.const n
             | Vale_X64_Machine_s.MReg (r, offset) ->
                 p.maddr (reg_printer r p) FStar_Pervasives_Native.None
                   (Prims.string_of_int offset)
             | Vale_X64_Machine_s.MIndex (base, scale, index, offset) ->
                 p.maddr (reg_printer base p)
                   (FStar_Pervasives_Native.Some
                      ((Prims.string_of_int scale), (reg_printer index p)))
                   (Prims.string_of_int offset))
let (print_reg_int : Vale_X64_Machine_s.reg -> printer -> Prims.string) =
  fun r ->
    fun p ->
      match r with
      | Vale_X64_Machine_s.Reg (uu___, r1) when uu___ = Prims.int_zero ->
          print_reg64 r1 p
      | uu___ -> "!!! INVALID integer register !!!"
let (print_operand : Vale_X64_Machine_s.operand64 -> printer -> Prims.string)
  =
  fun o ->
    fun p ->
      match o with
      | Vale_X64_Machine_s.OConst n ->
          if
            (Prims.int_zero <= n) &&
              (n < (Prims.parse_int "0x10000000000000000"))
          then p.const n
          else
            Prims.strcat "!!! INVALID constant: "
              (Prims.strcat (Prims.string_of_int n) " !!!")
      | Vale_X64_Machine_s.OReg r -> print_reg64 r p
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          print_maddr m "qword" print_reg_int p
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          print_maddr m "qword" print_reg_int p
let (print_operand32 :
  Vale_X64_Machine_s.operand64 -> printer -> Prims.string) =
  fun o ->
    fun p ->
      match o with
      | Vale_X64_Machine_s.OConst n ->
          if (Prims.int_zero <= n) && (n < (Prims.parse_int "0x100000000"))
          then p.const n
          else
            Prims.strcat "!!! INVALID constant: "
              (Prims.strcat (Prims.string_of_int n) " !!!")
      | Vale_X64_Machine_s.OReg r -> print_reg32 r p
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          print_maddr m "dword" print_reg_int p
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          print_maddr m "dword" print_reg_int p
let (print_small_operand :
  Vale_X64_Machine_s.operand64 -> printer -> Prims.string) =
  fun o ->
    fun p ->
      match o with
      | Vale_X64_Machine_s.OConst n ->
          if n < (Prims.of_int (64))
          then p.const n
          else
            Prims.strcat "!!! INVALID constant: "
              (Prims.strcat (Prims.string_of_int n) " !!!!")
      | Vale_X64_Machine_s.OReg r -> print_small_reg r p
      | uu___ -> "!!! INVALID small operand !!! Expected al, bl, cl, or dl."
let (print_imm8 : Prims.int -> printer -> Prims.string) =
  fun i -> fun p -> p.const i
let (print_xmm : Vale_X64_Machine_s.reg_xmm -> printer -> Prims.string) =
  fun x ->
    fun p ->
      Prims.strcat (p.reg_prefix ())
        (Prims.strcat "xmm" (Prims.string_of_int x))
let (print_mov128_op :
  Vale_X64_Machine_s.operand128 -> printer -> Prims.string) =
  fun o ->
    fun p ->
      match o with
      | Vale_X64_Machine_s.OConst uu___ ->
          "!!! INVALID xmm constants not allowed !!!"
      | Vale_X64_Machine_s.OReg x -> print_xmm x p
      | Vale_X64_Machine_s.OMem (m, uu___) ->
          print_maddr m "xmmword" print_reg_int p
      | Vale_X64_Machine_s.OStack (m, uu___) ->
          print_maddr m "xmmword" print_reg_int p
let print_any : 'a . 'a -> Prims.string =
  fun uu___ -> failwith "Not yet implemented:print_any"
let (print_shift_operand :
  Vale_X64_Machine_s.operand64 -> printer -> Prims.string) =
  fun o ->
    fun p ->
      match o with
      | Vale_X64_Machine_s.OConst n ->
          if n < (Prims.of_int (64))
          then p.const n
          else
            Prims.strcat "!!! INVALID shift operand: "
              (Prims.strcat (Prims.string_of_int n) " is too large !!!")
      | Vale_X64_Machine_s.OReg rRcx ->
          print_small_reg (Vale_X64_Machine_s.__proj__OReg__item__r o) p
      | uu___ -> "!!! INVALID shift operand !!! Expected constant or cl."
let (cmp_not :
  Vale_X64_Machine_Semantics_s.ocmp -> Vale_X64_Machine_Semantics_s.ocmp) =
  fun o ->
    match o with
    | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
        Vale_X64_Bytes_Code_s.ONe (o1, o2)
    | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
        Vale_X64_Bytes_Code_s.OEq (o1, o2)
    | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
        Vale_X64_Bytes_Code_s.OGt (o1, o2)
    | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
        Vale_X64_Bytes_Code_s.OLt (o1, o2)
    | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
        Vale_X64_Bytes_Code_s.OGe (o1, o2)
    | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
        Vale_X64_Bytes_Code_s.OLe (o1, o2)

let (print_pair : Prims.string -> Prims.string -> printer -> Prims.string) =
  fun dst ->
    fun src ->
      fun p ->
        let uu___ = p.op_order dst src in
        match uu___ with
        | (first, second) -> Prims.strcat first (Prims.strcat ", " second)
let (print_instr :
  Vale_X64_Instruction_s.instr_print -> printer -> Prims.string) =
  fun ip ->
    fun p ->
      let uu___ = ip in
      match uu___ with
      | Vale_X64_Instruction_s.Print (name, kind, oprs) ->
          let uu___1 =
            match kind with
            | Vale_X64_Instruction_s.POpcode -> (false, oprs)
            | Vale_X64_Instruction_s.PSuffix -> (true, oprs)
            | Vale_X64_Instruction_s.PrintPSha256rnds2 ->
                (false,
                  (if p.sha256rnds2_explicit_xmm0 ()
                   then
                     FStar_List_Tot_Base.append oprs
                       [Vale_X64_Instruction_s.PXmm
                          (Vale_X64_Machine_s.OReg Prims.int_zero)]
                   else oprs)) in
          (match uu___1 with
           | (suffix, oprs1) ->
               let rec get_operands oprs2 =
                 match oprs2 with
                 | [] -> []
                 | (Vale_X64_Instruction_s.P8 o)::oprs3 -> o ::
                     (get_operands oprs3)
                 | (Vale_X64_Instruction_s.P16 o)::oprs3 -> o ::
                     (get_operands oprs3)
                 | (Vale_X64_Instruction_s.P32 o)::oprs3 -> o ::
                     (get_operands oprs3)
                 | (Vale_X64_Instruction_s.P64 o)::oprs3 -> o ::
                     (get_operands oprs3)
                 | uu___2::oprs3 -> get_operands oprs3 in
               let uu___2 =
                 if suffix
                 then ((p.ins_name name (get_operands oprs1)), "")
                 else (name, " ") in
               (match uu___2 with
                | (opcode, space) ->
                    let print_operand1 po =
                      match po with
                      | Vale_X64_Instruction_s.P8 o ->
                          print_small_operand o p
                      | Vale_X64_Instruction_s.P16 o ->
                          "!!! UNSUPPORTED OPERAND !!!"
                      | Vale_X64_Instruction_s.P32 o -> print_operand32 o p
                      | Vale_X64_Instruction_s.P64 o -> print_operand o p
                      | Vale_X64_Instruction_s.PXmm o -> print_mov128_op o p
                      | Vale_X64_Instruction_s.PImm i -> p.const i
                      | Vale_X64_Instruction_s.PShift o ->
                          print_shift_operand o p in
                    let rec print_operands oprs2 =
                      match oprs2 with
                      | [] -> ""
                      | o::[] -> print_operand1 o
                      | o::oprs3 ->
                          print_pair (print_operand1 o)
                            (print_operands oprs3) p in
                    (match oprs1 with
                     | [] -> Prims.strcat "  " opcode
                     | uu___3 ->
                         Prims.strcat "  "
                           (Prims.strcat opcode
                              (Prims.strcat space (print_operands oprs1))))))
let (print_ins : Vale_X64_Machine_Semantics_s.ins -> printer -> Prims.string)
  =
  fun ins ->
    fun p ->
      let print_pair1 dst src = print_pair dst src p in
      let print_op_pair dst src print_dst print_src =
        print_pair1 (print_dst dst p) (print_src src p) in
      let print_ops dst src =
        print_op_pair dst src print_operand print_operand in
      let print_shift dst amount =
        print_op_pair dst amount print_operand print_shift_operand in
      let print_xmm_op dst src =
        let uu___ = p.op_order (print_xmm dst p) (print_operand src p) in
        match uu___ with
        | (first, second) -> Prims.strcat first (Prims.strcat ", " second) in
      let print_xmm_op32 dst src =
        let uu___ = p.op_order (print_xmm dst p) (print_operand32 src p) in
        match uu___ with
        | (first, second) -> Prims.strcat first (Prims.strcat ", " second) in
      let print_op_xmm dst src =
        let uu___ = p.op_order (print_operand dst p) (print_xmm src p) in
        match uu___ with
        | (first, second) -> Prims.strcat first (Prims.strcat ", " second) in
      let print_xmms dst src =
        let uu___ = p.op_order (print_xmm dst p) (print_xmm src p) in
        match uu___ with
        | (first, second) -> Prims.strcat first (Prims.strcat ", " second) in
      let print_xmms_3 dst src1 src2 =
        print_pair1 (print_xmm dst p) (print_xmms src1 src2) in
      let print_vpxor dst src1 src2 =
        print_pair1 (print_xmm dst p)
          (print_pair1 (print_xmm src1 p) (print_mov128_op src2 p)) in
      let print_instr1 ip = print_instr ip p in
      match ins with
      | Vale_X64_Bytes_Code_s.Instr
          (Vale_X64_Instruction_s.InstrTypeRecord (uu___, uu___1, uu___2, i),
           oprs, uu___3)
          ->
          print_instr1
            (Vale_X64_Instruction_s.instr_printer uu___ uu___1 uu___2 i oprs)
      | Vale_X64_Bytes_Code_s.Push (src, uu___) ->
          Prims.strcat (p.ins_name "  push" [src]) (print_operand src p)
      | Vale_X64_Bytes_Code_s.Pop (dst, uu___) ->
          Prims.strcat (p.ins_name "  pop" [dst]) (print_operand dst p)
      | Vale_X64_Bytes_Code_s.Alloc n ->
          Prims.strcat
            (p.ins_name "  sub"
               [Vale_X64_Machine_s.OReg (Prims.of_int (7));
               Vale_X64_Machine_s.OConst n])
            (print_ops (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
               (Vale_X64_Machine_s.OConst n))
      | Vale_X64_Bytes_Code_s.Dealloc n ->
          Prims.strcat
            (p.ins_name "  add"
               [Vale_X64_Machine_s.OReg (Prims.of_int (7));
               Vale_X64_Machine_s.OConst n])
            (print_ops (Vale_X64_Machine_s.OReg (Prims.of_int (7)))
               (Vale_X64_Machine_s.OConst n))
let (print_cmp :
  Vale_X64_Machine_Semantics_s.ocmp -> Prims.int -> printer -> Prims.string)
  =
  fun c ->
    fun counter ->
      fun p ->
        let print_ops o1 o2 =
          let uu___ = p.op_order (print_operand o1 p) (print_operand o2 p) in
          match uu___ with
          | (first, second) ->
              Prims.strcat "  cmp "
                (Prims.strcat first
                   (Prims.strcat ", " (Prims.strcat second "\n"))) in
        match c with
        | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  je "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
        | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  jne "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
        | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  jbe "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
        | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  jae "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
        | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  jb "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
        | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
            Prims.strcat (print_ops o1 o2)
              (Prims.strcat "  ja "
                 (Prims.strcat "L"
                    (Prims.strcat (Prims.string_of_int counter) "\n")))
let rec (print_block :
  Vale_X64_Machine_Semantics_s.codes ->
    Prims.int -> printer -> (Prims.string * Prims.int))
  =
  fun b ->
    fun n ->
      fun p ->
        match b with
        | [] -> ("", n)
        | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
            (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateSpace
             uu___2)))::tail
            -> print_block tail n p
        | (Vale_X64_Machine_s.Ins (Vale_X64_Bytes_Code_s.Instr
            (uu___, uu___1, Vale_X64_Machine_Semantics_s.AnnotateGhost
             uu___2)))::tail
            -> print_block tail n p
        | head::tail ->
            let uu___ = print_code head n p in
            (match uu___ with
             | (head_str, n') ->
                 let uu___1 = print_block tail n' p in
                 (match uu___1 with
                  | (rest, n'') -> ((Prims.strcat head_str rest), n'')))
and (print_code :
  Vale_X64_Machine_Semantics_s.code ->
    Prims.int -> printer -> (Prims.string * Prims.int))
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
            let cmp = print_cmp (cmp_not cond) n1 p in
            let uu___ = print_code true_code (n + (Prims.of_int (2))) p in
            (match uu___ with
             | (true_str, n') ->
                 let jmp =
                   Prims.strcat "  jmp L"
                     (Prims.strcat (Prims.string_of_int n2) "\n") in
                 let label1 =
                   Prims.strcat "L"
                     (Prims.strcat (Prims.string_of_int n1) ":\n") in
                 let uu___1 = print_code false_code n' p in
                 (match uu___1 with
                  | (false_str, n'1) ->
                      let label2 =
                        Prims.strcat "L"
                          (Prims.strcat (Prims.string_of_int n2) ":\n") in
                      ((Prims.strcat cmp
                          (Prims.strcat true_str
                             (Prims.strcat jmp
                                (Prims.strcat label1
                                   (Prims.strcat false_str label2))))), n'1)))
        | Vale_X64_Machine_s.While (cond, body) ->
            let n1 = n in
            let n2 = n + Prims.int_one in
            let jmp =
              Prims.strcat "  jmp L"
                (Prims.strcat (Prims.string_of_int n2) "\n") in
            let label1 =
              Prims.strcat (p.align ())
                (Prims.strcat " 16\nL"
                   (Prims.strcat (Prims.string_of_int n1) ":\n")) in
            let uu___ = print_code body (n + (Prims.of_int (2))) p in
            (match uu___ with
             | (body_str, n') ->
                 let label2 =
                   Prims.strcat (p.align ())
                     (Prims.strcat " 16\nL"
                        (Prims.strcat (Prims.string_of_int n2) ":\n")) in
                 let cmp = print_cmp cond n1 p in
                 ((Prims.strcat jmp
                     (Prims.strcat label1
                        (Prims.strcat body_str (Prims.strcat label2 cmp)))),
                   n'))
let (print_header : printer -> unit) =
  fun p -> FStar_IO.print_string (p.header ())
let (print_proc :
  Prims.string ->
    Vale_X64_Machine_Semantics_s.code -> Prims.int -> printer -> Prims.int)
  =
  fun name ->
    fun code ->
      fun label ->
        fun p ->
          let proc = p.proc_name name in
          let uu___ = print_code code label p in
          match uu___ with
          | (code_str, final_label) ->
              let ret = p.ret name in
              (FStar_IO.print_string
                 (Prims.strcat proc (Prims.strcat code_str ret));
               final_label)
let (print_footer : printer -> unit) =
  fun p -> FStar_IO.print_string (p.footer ())
let (masm : printer) =
  let reg_prefix unit = "" in
  let mem_prefix ptr_type = Prims.strcat ptr_type " ptr " in
  let maddr base adj offset =
    match adj with
    | FStar_Pervasives_Native.None ->
        Prims.strcat "["
          (Prims.strcat base (Prims.strcat " + " (Prims.strcat offset "]")))
    | FStar_Pervasives_Native.Some (scale, index) ->
        Prims.strcat "["
          (Prims.strcat base
             (Prims.strcat " + "
                (Prims.strcat scale
                   (Prims.strcat " * "
                      (Prims.strcat index
                         (Prims.strcat " + " (Prims.strcat offset "]"))))))) in
  let const n = Prims.string_of_int n in
  let ins_name name ops = Prims.strcat name " " in
  let op_order dst src = (dst, src) in
  let align uu___ = "ALIGN" in
  let header uu___ = ".code\n" in
  let footer uu___ = "end\n" in
  let proc_name name =
    Prims.strcat "ALIGN 16\n" (Prims.strcat name " proc\n") in
  let ret name = Prims.strcat "  ret\n" (Prims.strcat name " endp\n") in
  {
    print_reg_name;
    print_reg32_name;
    print_small_reg_name;
    reg_prefix;
    mem_prefix;
    maddr;
    const;
    ins_name;
    op_order;
    align;
    header;
    footer;
    proc_name;
    ret;
    sha256rnds2_explicit_xmm0 = (fun unit -> true)
  }
let (gcc : printer) =
  let reg_prefix unit = "%" in
  let mem_prefix ptr_type = "" in
  let maddr base adj offset =
    match adj with
    | FStar_Pervasives_Native.None ->
        Prims.strcat offset (Prims.strcat "(" (Prims.strcat base ")"))
    | FStar_Pervasives_Native.Some (scale, index) ->
        Prims.strcat offset
          (Prims.strcat " ("
             (Prims.strcat base
                (Prims.strcat ", "
                   (Prims.strcat scale
                      (Prims.strcat ", " (Prims.strcat index ")")))))) in
  let const n = Prims.strcat "$" (Prims.string_of_int n) in
  let rec ins_name name ops =
    match ops with
    | [] -> Prims.strcat name " "
    | (Vale_X64_Machine_s.OMem uu___)::uu___1 -> Prims.strcat name "q "
    | uu___::tail -> ins_name name tail in
  let op_order dst src = (src, dst) in
  let align uu___ = ".balign" in
  let header uu___ = ".text\n" in
  let footer uu___ = "\n" in
  let proc_name name =
    Prims.strcat ".global "
      (Prims.strcat name (Prims.strcat "\n" (Prims.strcat name ":\n"))) in
  let ret name = "  ret\n\n" in
  {
    print_reg_name;
    print_reg32_name;
    print_small_reg_name;
    reg_prefix;
    mem_prefix;
    maddr;
    const;
    ins_name;
    op_order;
    align;
    header;
    footer;
    proc_name;
    ret;
    sha256rnds2_explicit_xmm0 = (fun unit -> false)
  }