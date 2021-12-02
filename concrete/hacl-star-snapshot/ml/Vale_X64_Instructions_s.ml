open Prims
let (eval_Mov64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  = fun src -> FStar_Pervasives_Native.Some src
let (ins_Mov64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Mov64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "mov"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_MovBe64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun src ->
    if Vale_X64_CPU_Features_s.movbe_enabled
    then
      FStar_Pervasives_Native.Some (Vale_Def_Types_s.reverse_bytes_nat64 src)
    else FStar_Pervasives_Native.None
let (ins_MovBe64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_MovBe64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "movbe"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Bswap64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    FStar_Pervasives_Native.Some (Vale_Def_Types_s.reverse_bytes_nat64 dst)
let (ins_Bswap64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))] []
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Bswap64)
    (Obj.magic
       (fun dst ->
          Vale_X64_Instruction_s.print_s "bswap"
            [Vale_X64_Instruction_s.P64 dst]))
let (eval_Cmovc64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Prims.bool -> Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      fun carry -> FStar_Pervasives_Native.Some (if carry then src else dst)
let (ins_Cmovc64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64;
    Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Cmovc64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "cmovc"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Add64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Prims.bool * Vale_Def_Words_s.nat64) FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      let sum = dst + src in
      FStar_Pervasives_Native.Some
        ((sum >= (Prims.parse_int "0x10000000000000000")),
          (sum mod (Prims.parse_int "0x10000000000000000")))
let (ins_Add64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Add64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "add"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_AddLea64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      FStar_Pervasives_Native.Some
        ((src1 + src2) mod (Prims.parse_int "0x10000000000000000"))
let (ins_AddLea64 :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AddLea64)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              let m =
                match (src1, src2) with
                | (Vale_X64_Machine_s.OReg r1, Vale_X64_Machine_s.OConst i2)
                    ->
                    Vale_X64_Machine_s.MReg
                      ((Vale_X64_Machine_s.Reg (Prims.int_zero, r1)), i2)
                | (Vale_X64_Machine_s.OReg r1, Vale_X64_Machine_s.OReg r2) ->
                    Vale_X64_Machine_s.MIndex
                      ((Vale_X64_Machine_s.Reg (Prims.int_zero, r1)),
                        Prims.int_one,
                        (Vale_X64_Machine_s.Reg (Prims.int_zero, r2)),
                        Prims.int_zero)
                | uu___ ->
                    Vale_X64_Machine_s.MConst
                      (Prims.parse_int "0x100000000000000000000000000000000") in
              let m1 = (m, Vale_Arch_HeapTypes_s.Public) in
              Vale_X64_Instruction_s.print "lea"
                [Vale_X64_Instruction_s.P64 dst;
                Vale_X64_Instruction_s.P64 (Vale_X64_Machine_s.OMem m1)]))
let (eval_AddCarry64 :
  Prims.bool ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 ->
        (Prims.bool * Vale_Def_Words_s.nat64) FStar_Pervasives_Native.option)
  =
  fun old_carry ->
    fun dst ->
      fun src ->
        let sum =
          (dst + src) + (if old_carry then Prims.int_one else Prims.int_zero) in
        FStar_Pervasives_Native.Some
          ((sum >= (Prims.parse_int "0x10000000000000000")),
            (sum mod (Prims.parse_int "0x10000000000000000")))
let (ins_AddCarry64 :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_AddCarry64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "adc"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Adcx64_Adox64 :
  Prims.bool ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 ->
        (Prims.bool * Vale_Def_Words_s.nat64) FStar_Pervasives_Native.option)
  =
  fun old_flag ->
    fun dst ->
      fun src ->
        let sum =
          (dst + src) + (if old_flag then Prims.int_one else Prims.int_zero) in
        if Vale_X64_CPU_Features_s.adx_enabled
        then
          FStar_Pervasives_Native.Some
            ((sum >= (Prims.parse_int "0x10000000000000000")),
              (sum mod (Prims.parse_int "0x10000000000000000")))
        else FStar_Pervasives_Native.None
let (ins_Adcx64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Adcx64_Adox64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "adcx"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (ins_Adox64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsOf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Adcx64_Adox64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "adox"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Sub64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Prims.bool * Vale_Def_Words_s.nat64) FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      let diff = dst - src in
      FStar_Pervasives_Native.Some
        ((diff < Prims.int_zero),
          (diff mod (Prims.parse_int "0x10000000000000000")))
let (ins_Sub64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Sub64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "sub"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Sbb64 :
  Prims.bool ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 ->
        (Prims.bool * Vale_Def_Words_s.nat64) FStar_Pervasives_Native.option)
  =
  fun old_carry ->
    fun dst ->
      fun src ->
        let diff =
          dst - (src + (if old_carry then Prims.int_one else Prims.int_zero)) in
        FStar_Pervasives_Native.Some
          ((diff < Prims.int_zero),
            (diff mod (Prims.parse_int "0x10000000000000000")))
let (ins_Sbb64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Sbb64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "sbb"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Mul64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Vale_Def_Words_s.nat64 * Vale_Def_Words_s.nat64)
        FStar_Pervasives_Native.option)
  =
  fun rax ->
    fun src ->
      FStar_Pervasives_Native.Some
        ((FStar_UInt.mul_div (Prims.of_int (64)) rax src),
          (FStar_UInt.mul_mod (Prims.of_int (64)) rax src))
let (ins_Mul64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpIm
          (Vale_X64_Instruction_s.IOp64One
             (Vale_X64_Machine_s.OReg (Prims.of_int (3))))));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpIm
         (Vale_X64_Instruction_s.IOp64One
            (Vale_X64_Machine_s.OReg Prims.int_zero))))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Mul64)
    (Obj.magic
       (fun src ->
          Vale_X64_Instruction_s.print_s "mul"
            [Vale_X64_Instruction_s.P64 src]))
let (eval_Mulx64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Vale_Def_Words_s.nat64 * Vale_Def_Words_s.nat64)
        FStar_Pervasives_Native.option)
  =
  fun rdx ->
    fun src ->
      let hi = FStar_UInt.mul_div (Prims.of_int (64)) rdx src in
      let lo = FStar_UInt.mul_mod (Prims.of_int (64)) rdx src in
      if Vale_X64_CPU_Features_s.bmi2_enabled
      then FStar_Pervasives_Native.Some (hi, lo)
      else FStar_Pervasives_Native.None
let (ins_Mulx64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpIm
       (Vale_X64_Instruction_s.IOp64One
          (Vale_X64_Machine_s.OReg (Prims.of_int (3))));
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Mulx64)
    (Obj.magic
       (fun dst_hi ->
          fun dst_lo ->
            fun src ->
              Vale_X64_Instruction_s.print_s "mulx"
                [Vale_X64_Instruction_s.P64 dst_hi;
                Vale_X64_Instruction_s.P64 dst_lo;
                Vale_X64_Instruction_s.P64 src]))
let (eval_IMul64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      FStar_Pervasives_Native.Some
        (FStar_UInt.mul_mod (Prims.of_int (64)) dst src)
let (ins_IMul64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_IMul64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "imul"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_And64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      FStar_Pervasives_Native.Some
        (Vale_Def_Types_s.iand (Prims.parse_int "0x10000000000000000") dst
           src)
let (ins_And64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_And64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "and"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.P64 src]))
let (eval_Xor64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Vale_Def_Words_s.nat64 * (Prims.bool * Prims.bool))
        FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      FStar_Pervasives_Native.Some
        ((Vale_Def_Types_s.ixor (Prims.parse_int "0x10000000000000000") dst
            src), (false, false))
let (ins_Xor64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsCf));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpIm Vale_X64_Instruction_s.IOpFlagsOf))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Xor64)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print_s "xor"
              (if (Vale_X64_Machine_s.uu___is_OReg dst) && (dst = src)
               then
                 [Vale_X64_Instruction_s.P32 dst;
                 Vale_X64_Instruction_s.P32 src]
               else
                 [Vale_X64_Instruction_s.P64 dst;
                 Vale_X64_Instruction_s.P64 src])))
let (eval_Shr64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun amt ->
      if amt < (Prims.of_int (64))
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.ishr (Prims.parse_int "0x10000000000000000") dst
             amt)
      else FStar_Pervasives_Native.None
let (ins_Shr64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Shr64)
    (Obj.magic
       (fun dst ->
          fun amt ->
            Vale_X64_Instruction_s.print_s "shr"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.PShift amt]))
let (eval_Shl64 :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun amt ->
      if amt < (Prims.of_int (64))
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.ishl (Prims.parse_int "0x10000000000000000") dst
             amt)
      else FStar_Pervasives_Native.None
let (ins_Shl64 : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.HavocFlags (Obj.magic eval_Shl64)
    (Obj.magic
       (fun dst ->
          fun amt ->
            Vale_X64_Instruction_s.print_s "shl"
              [Vale_X64_Instruction_s.P64 dst;
              Vale_X64_Instruction_s.PShift amt]))
let (eval_Cpuid :
  Vale_Def_Words_s.nat64 ->
    Vale_Def_Words_s.nat64 ->
      (Vale_Def_Words_s.nat64 * (Vale_Def_Words_s.nat64 *
        (Vale_Def_Words_s.nat64 * Vale_Def_Words_s.nat64)))
        FStar_Pervasives_Native.option)
  =
  fun rax ->
    fun rcx ->
      FStar_Pervasives_Native.Some
        ((Vale_X64_CPU_Features_s.cpuid Prims.int_zero rax rcx),
          ((Vale_X64_CPU_Features_s.cpuid Prims.int_one rax rcx),
            ((Vale_X64_CPU_Features_s.cpuid (Prims.of_int (2)) rax rcx),
              (Vale_X64_CPU_Features_s.cpuid (Prims.of_int (3)) rax rcx))))
let (ins_Cpuid : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpIm
          (Vale_X64_Instruction_s.IOp64One
             (Vale_X64_Machine_s.OReg Prims.int_zero))));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpIm
         (Vale_X64_Instruction_s.IOp64One
            (Vale_X64_Machine_s.OReg Prims.int_one))));
    (Vale_X64_Instruction_s.InOut,
      (Vale_X64_Instruction_s.IOpIm
         (Vale_X64_Instruction_s.IOp64One
            (Vale_X64_Machine_s.OReg (Prims.of_int (2))))));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpIm
         (Vale_X64_Instruction_s.IOp64One
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))] []
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Cpuid)
    (Obj.magic (Vale_X64_Instruction_s.print "cpuid" []))
let (eval_Xgetbv :
  Vale_Def_Words_s.nat64 ->
    (Vale_Def_Words_s.nat64 * Vale_Def_Words_s.nat64)
      FStar_Pervasives_Native.option)
  =
  fun rcx ->
    if Vale_X64_CPU_Features_s.osxsave_enabled && (rcx = Prims.int_zero)
    then
      FStar_Pervasives_Native.Some
        ((Vale_X64_CPU_Features_s.xgetbv Prims.int_zero rcx),
          (Vale_X64_CPU_Features_s.xgetbv (Prims.of_int (3)) rcx))
    else FStar_Pervasives_Native.None
let (ins_Xgetbv : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpIm
          (Vale_X64_Instruction_s.IOp64One
             (Vale_X64_Machine_s.OReg Prims.int_zero))));
    (Vale_X64_Instruction_s.Out,
      (Vale_X64_Instruction_s.IOpIm
         (Vale_X64_Instruction_s.IOp64One
            (Vale_X64_Machine_s.OReg (Prims.of_int (3))))))]
    [Vale_X64_Instruction_s.IOpIm
       (Vale_X64_Instruction_s.IOp64One
          (Vale_X64_Machine_s.OReg (Prims.of_int (2))))]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Xgetbv)
    (Obj.magic (Vale_X64_Instruction_s.print "xgetbv" []))
let check_avx :
  'a . 'a FStar_Pervasives_Native.option -> 'a FStar_Pervasives_Native.option
  =
  fun x ->
    if Vale_X64_CPU_Features_s.avx_enabled
    then x
    else FStar_Pervasives_Native.None
let check_sse2 :
  'a . 'a FStar_Pervasives_Native.option -> 'a FStar_Pervasives_Native.option
  =
  fun x ->
    if Vale_X64_CPU_Features_s.sse2_enabled
    then x
    else FStar_Pervasives_Native.None
let check_ssse3 :
  'a . 'a FStar_Pervasives_Native.option -> 'a FStar_Pervasives_Native.option
  =
  fun x ->
    if Vale_X64_CPU_Features_s.ssse3_enabled
    then x
    else FStar_Pervasives_Native.None
let check_sse4_1 :
  'a . 'a FStar_Pervasives_Native.option -> 'a FStar_Pervasives_Native.option
  =
  fun x ->
    if Vale_X64_CPU_Features_s.sse4_1_enabled
    then x
    else FStar_Pervasives_Native.None
let (eval_Movdqu :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src -> check_sse2 (FStar_Pervasives_Native.Some src)
let (ins_Movdqu : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Movdqu)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "movdqu"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_Pxor :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      check_sse2
        (FStar_Pervasives_Native.Some (Vale_Def_Types_s.quad32_xor dst src))
let (ins_Pxor : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Pxor)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "pxor"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_VPxor :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      check_avx
        (FStar_Pervasives_Native.Some (Vale_Def_Types_s.quad32_xor src1 src2))
let (ins_VPxor : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_VPxor)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              Vale_X64_Instruction_s.print "vpxor"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src1;
                Vale_X64_Instruction_s.PXmm src2]))
let (eval_Pand :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      check_sse2
        (FStar_Pervasives_Native.Some
           (let uu___ = dst in
            match uu___ with
            | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
                Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
                let uu___1 = src in
                (match uu___1 with
                 | { Vale_Def_Words_s.lo0 = y0; Vale_Def_Words_s.lo1 = y1;
                     Vale_Def_Words_s.hi2 = y2; Vale_Def_Words_s.hi3 = y3;_}
                     ->
                     {
                       Vale_Def_Words_s.lo0 =
                         (Vale_Def_Types_s.iand
                            (Prims.parse_int "0x100000000") x0 y0);
                       Vale_Def_Words_s.lo1 =
                         (Vale_Def_Types_s.iand
                            (Prims.parse_int "0x100000000") x1 y1);
                       Vale_Def_Words_s.hi2 =
                         (Vale_Def_Types_s.iand
                            (Prims.parse_int "0x100000000") x2 y2);
                       Vale_Def_Words_s.hi3 =
                         (Vale_Def_Types_s.iand
                            (Prims.parse_int "0x100000000") x3 y3)
                     })))
let (ins_Pand : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Pand)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "pand"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_Paddd_raw :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      FStar_Pervasives_Native.Some
        {
          Vale_Def_Words_s.lo0 =
            ((src1.Vale_Def_Words_s.lo0 + src2.Vale_Def_Words_s.lo0) mod
               (Prims.parse_int "0x100000000"));
          Vale_Def_Words_s.lo1 =
            ((src1.Vale_Def_Words_s.lo1 + src2.Vale_Def_Words_s.lo1) mod
               (Prims.parse_int "0x100000000"));
          Vale_Def_Words_s.hi2 =
            ((src1.Vale_Def_Words_s.hi2 + src2.Vale_Def_Words_s.hi2) mod
               (Prims.parse_int "0x100000000"));
          Vale_Def_Words_s.hi3 =
            ((src1.Vale_Def_Words_s.hi3 + src2.Vale_Def_Words_s.hi3) mod
               (Prims.parse_int "0x100000000"))
        }
let (eval_Paddd :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_sse2 (eval_Paddd_raw src1 src2)
let (ins_Paddd : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Paddd)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "paddd"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_VPaddd :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_avx (eval_Paddd_raw src1 src2)
let (ins_VPaddd : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_VPaddd)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              Vale_X64_Instruction_s.print "vpaddd"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src1;
                Vale_X64_Instruction_s.PXmm src2]))
let (eval_Pslld :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amt ->
    fun dst ->
      check_sse2
        (if (Prims.int_zero <= amt) && (amt < (Prims.of_int (32)))
         then
           FStar_Pervasives_Native.Some
             (let uu___ = dst in
              match uu___ with
              | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
                  Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
                  {
                    Vale_Def_Words_s.lo0 =
                      (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000")
                         x0 amt);
                    Vale_Def_Words_s.lo1 =
                      (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000")
                         x1 amt);
                    Vale_Def_Words_s.hi2 =
                      (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000")
                         x2 amt);
                    Vale_Def_Words_s.hi3 =
                      (Vale_Def_Types_s.ishl (Prims.parse_int "0x100000000")
                         x3 amt)
                  })
         else FStar_Pervasives_Native.None)
let (ins_Pslld :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun amt ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Pslld amt))
      (Obj.magic
         (fun dst ->
            Vale_X64_Instruction_s.print "pslld"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PImm amt]))
let (eval_Psrld :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amt ->
    fun dst ->
      check_sse2
        (if (Prims.int_zero <= amt) && (amt < (Prims.of_int (32)))
         then
           FStar_Pervasives_Native.Some
             (let uu___ = dst in
              match uu___ with
              | { Vale_Def_Words_s.lo0 = x0; Vale_Def_Words_s.lo1 = x1;
                  Vale_Def_Words_s.hi2 = x2; Vale_Def_Words_s.hi3 = x3;_} ->
                  {
                    Vale_Def_Words_s.lo0 =
                      (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000")
                         x0 amt);
                    Vale_Def_Words_s.lo1 =
                      (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000")
                         x1 amt);
                    Vale_Def_Words_s.hi2 =
                      (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000")
                         x2 amt);
                    Vale_Def_Words_s.hi3 =
                      (Vale_Def_Types_s.ishr (Prims.parse_int "0x100000000")
                         x3 amt)
                  })
         else FStar_Pervasives_Native.None)
let (ins_Psrld :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun amt ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Psrld amt))
      (Obj.magic
         (fun dst ->
            Vale_X64_Instruction_s.print "psrld"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PImm amt]))
let (eval_Psrldq :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amt ->
    fun dst ->
      check_sse2
        (if (Prims.int_zero <= amt) && (amt < (Prims.of_int (16)))
         then
           let src_bytes = Vale_Def_Types_s.le_quad32_to_bytes dst in
           let zero_pad = FStar_Seq_Base.create amt Prims.int_zero in
           let remaining_bytes =
             FStar_Seq_Base.slice src_bytes amt
               (FStar_Seq_Base.length src_bytes) in
           FStar_Pervasives_Native.Some
             (Vale_Def_Types_s.le_bytes_to_quad32
                (FStar_Seq_Base.append zero_pad remaining_bytes))
         else FStar_Pervasives_Native.None)
let (ins_Psrldq :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun amt ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Psrldq amt))
      (Obj.magic
         (fun dst ->
            Vale_X64_Instruction_s.print "psrldq"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PImm amt]))
let (eval_Palignr_raw :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amount ->
    fun src1 ->
      fun src2 ->
        if amount = (Prims.of_int (4))
        then
          FStar_Pervasives_Native.Some
            {
              Vale_Def_Words_s.lo0 = (src2.Vale_Def_Words_s.lo1);
              Vale_Def_Words_s.lo1 = (src2.Vale_Def_Words_s.hi2);
              Vale_Def_Words_s.hi2 = (src2.Vale_Def_Words_s.hi3);
              Vale_Def_Words_s.hi3 = (src1.Vale_Def_Words_s.lo0)
            }
        else
          if amount = (Prims.of_int (8))
          then
            FStar_Pervasives_Native.Some
              {
                Vale_Def_Words_s.lo0 = (src2.Vale_Def_Words_s.hi2);
                Vale_Def_Words_s.lo1 = (src2.Vale_Def_Words_s.hi3);
                Vale_Def_Words_s.hi2 = (src1.Vale_Def_Words_s.lo0);
                Vale_Def_Words_s.hi3 = (src1.Vale_Def_Words_s.lo1)
              }
          else FStar_Pervasives_Native.None
let (eval_Palignr :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amount ->
    fun src1 -> fun src2 -> check_ssse3 (eval_Palignr_raw amount src1 src2)
let (ins_Palignr :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun amount ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Palignr amount))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "palignr"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm amount]))
let (eval_VPalignr :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun amount ->
    fun src1 -> fun src2 -> check_avx (eval_Palignr_raw amount src1 src2)
let (ins_VPalignr :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun amount ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
      Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_VPalignr amount))
      (Obj.magic
         (fun dst ->
            fun src1 ->
              fun src2 ->
                Vale_X64_Instruction_s.print "vpalignr"
                  [Vale_X64_Instruction_s.PXmm dst;
                  Vale_X64_Instruction_s.PXmm src1;
                  Vale_X64_Instruction_s.PXmm src2;
                  Vale_X64_Instruction_s.PImm amount]))
let (eval_Shufpd_raw :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun permutation ->
    fun src1 ->
      fun src2 ->
        if
          (Prims.int_zero <= permutation) &&
            (permutation < (Prims.of_int (4)))
        then
          FStar_Pervasives_Native.Some
            {
              Vale_Def_Words_s.lo0 =
                ((if (permutation mod (Prims.of_int (2))) = Prims.int_zero
                  then src1.Vale_Def_Words_s.lo0
                  else src1.Vale_Def_Words_s.hi2));
              Vale_Def_Words_s.lo1 =
                ((if (permutation mod (Prims.of_int (2))) = Prims.int_zero
                  then src1.Vale_Def_Words_s.lo1
                  else src1.Vale_Def_Words_s.hi3));
              Vale_Def_Words_s.hi2 =
                ((if
                    ((permutation / (Prims.of_int (2))) mod
                       (Prims.of_int (2)))
                      = Prims.int_zero
                  then src2.Vale_Def_Words_s.lo0
                  else src2.Vale_Def_Words_s.hi2));
              Vale_Def_Words_s.hi3 =
                ((if
                    ((permutation / (Prims.of_int (2))) mod
                       (Prims.of_int (2)))
                      = Prims.int_zero
                  then src2.Vale_Def_Words_s.lo1
                  else src2.Vale_Def_Words_s.hi3))
            }
        else FStar_Pervasives_Native.None
let (eval_Shufpd :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun permutation ->
    fun src1 ->
      fun src2 -> check_sse2 (eval_Shufpd_raw permutation src1 src2)
let (ins_Shufpd :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun permutation ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags
      (Obj.magic (eval_Shufpd permutation))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "shufpd"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm permutation]))
let (eval_VShufpd :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun permutation ->
    fun src1 -> fun src2 -> check_avx (eval_Shufpd_raw permutation src1 src2)
let (ins_VShufpd :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun permutation ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
      Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags
      (Obj.magic (eval_VShufpd permutation))
      (Obj.magic
         (fun dst ->
            fun src1 ->
              fun src2 ->
                Vale_X64_Instruction_s.print "vshufpd"
                  [Vale_X64_Instruction_s.PXmm dst;
                  Vale_X64_Instruction_s.PXmm src1;
                  Vale_X64_Instruction_s.PXmm src2;
                  Vale_X64_Instruction_s.PImm permutation]))
let (is_full_byte_reversal_mask : Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q ->
    (((q.Vale_Def_Words_s.lo0 = (Prims.parse_int "0x0C0D0E0F")) &&
        (q.Vale_Def_Words_s.lo1 = (Prims.parse_int "0x08090A0B")))
       && (q.Vale_Def_Words_s.hi2 = (Prims.parse_int "0x04050607")))
      && (q.Vale_Def_Words_s.hi3 = (Prims.parse_int "0x00010203"))
let (is_byte_reversal_mask : Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q ->
    (((q.Vale_Def_Words_s.lo0 = (Prims.parse_int "0x00010203")) &&
        (q.Vale_Def_Words_s.lo1 = (Prims.parse_int "0x04050607")))
       && (q.Vale_Def_Words_s.hi2 = (Prims.parse_int "0x08090A0B")))
      && (q.Vale_Def_Words_s.hi3 = (Prims.parse_int "0x0C0D0E0F"))
let (is_high_dup_reversal_mask : Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q ->
    (((q.Vale_Def_Words_s.lo0 = (Prims.parse_int "0x0C0D0E0F")) &&
        (q.Vale_Def_Words_s.lo1 = (Prims.parse_int "0x08090A0B")))
       && (q.Vale_Def_Words_s.hi2 = (Prims.parse_int "0x0C0D0E0F")))
      && (q.Vale_Def_Words_s.hi3 = (Prims.parse_int "0x08090A0B"))
let (is_lower_upper_byte_reversal_mask :
  Vale_Def_Types_s.quad32 -> Prims.bool) =
  fun q ->
    (((q.Vale_Def_Words_s.lo0 = (Prims.parse_int "0x04050607")) &&
        (q.Vale_Def_Words_s.lo1 = (Prims.parse_int "0x00010203")))
       && (q.Vale_Def_Words_s.hi2 = (Prims.parse_int "0x0C0D0E0F")))
      && (q.Vale_Def_Words_s.hi3 = (Prims.parse_int "0x08090A0B"))
let (eval_Pshufb_raw :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      if is_full_byte_reversal_mask src2
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.reverse_bytes_quad32 src1)
      else
        if is_byte_reversal_mask src2
        then
          FStar_Pervasives_Native.Some
            {
              Vale_Def_Words_s.lo0 =
                (Vale_Def_Types_s.reverse_bytes_nat32
                   src1.Vale_Def_Words_s.lo0);
              Vale_Def_Words_s.lo1 =
                (Vale_Def_Types_s.reverse_bytes_nat32
                   src1.Vale_Def_Words_s.lo1);
              Vale_Def_Words_s.hi2 =
                (Vale_Def_Types_s.reverse_bytes_nat32
                   src1.Vale_Def_Words_s.hi2);
              Vale_Def_Words_s.hi3 =
                (Vale_Def_Types_s.reverse_bytes_nat32
                   src1.Vale_Def_Words_s.hi3)
            }
        else
          if is_high_dup_reversal_mask src2
          then
            FStar_Pervasives_Native.Some
              {
                Vale_Def_Words_s.lo0 =
                  (Vale_Def_Types_s.reverse_bytes_nat32
                     src1.Vale_Def_Words_s.hi3);
                Vale_Def_Words_s.lo1 =
                  (Vale_Def_Types_s.reverse_bytes_nat32
                     src1.Vale_Def_Words_s.hi2);
                Vale_Def_Words_s.hi2 =
                  (Vale_Def_Types_s.reverse_bytes_nat32
                     src1.Vale_Def_Words_s.hi3);
                Vale_Def_Words_s.hi3 =
                  (Vale_Def_Types_s.reverse_bytes_nat32
                     src1.Vale_Def_Words_s.hi2)
              }
          else
            if is_lower_upper_byte_reversal_mask src2
            then
              FStar_Pervasives_Native.Some
                {
                  Vale_Def_Words_s.lo0 =
                    (Vale_Def_Types_s.reverse_bytes_nat32
                       src1.Vale_Def_Words_s.lo1);
                  Vale_Def_Words_s.lo1 =
                    (Vale_Def_Types_s.reverse_bytes_nat32
                       src1.Vale_Def_Words_s.lo0);
                  Vale_Def_Words_s.hi2 =
                    (Vale_Def_Types_s.reverse_bytes_nat32
                       src1.Vale_Def_Words_s.hi3);
                  Vale_Def_Words_s.hi3 =
                    (Vale_Def_Types_s.reverse_bytes_nat32
                       src1.Vale_Def_Words_s.hi2)
                }
            else FStar_Pervasives_Native.None
let (eval_Pshufb :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_ssse3 (eval_Pshufb_raw src1 src2)
let (ins_Pshufb : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Pshufb)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "pshufb"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_VPshufb :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_avx (eval_Pshufb_raw src1 src2)
let (ins_VPshufb : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_VPshufb)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              Vale_X64_Instruction_s.print "vpshufb"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src1;
                Vale_X64_Instruction_s.PXmm src2]))
let (eval_Pshufd :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun permutation ->
    fun src ->
      check_sse2
        (let bits = Vale_Def_Types_s.byte_to_twobits permutation in
         FStar_Pervasives_Native.Some
           {
             Vale_Def_Words_s.lo0 =
               (Vale_Def_Types_s.select_word src bits.Vale_Def_Words_s.lo0);
             Vale_Def_Words_s.lo1 =
               (Vale_Def_Types_s.select_word src bits.Vale_Def_Words_s.lo1);
             Vale_Def_Words_s.hi2 =
               (Vale_Def_Types_s.select_word src bits.Vale_Def_Words_s.hi2);
             Vale_Def_Words_s.hi3 =
               (Vale_Def_Types_s.select_word src bits.Vale_Def_Words_s.hi3)
           })
let (ins_Pshufd :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun permutation ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags
      (Obj.magic (eval_Pshufd permutation))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "pshufd"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm permutation]))
let (eval_Pcmpeqd :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      check_sse2
        (let eq_result b =
           if b then (Prims.parse_int "0xFFFFFFFF") else Prims.int_zero in
         FStar_Pervasives_Native.Some
           {
             Vale_Def_Words_s.lo0 =
               (eq_result
                  (src.Vale_Def_Words_s.lo0 = dst.Vale_Def_Words_s.lo0));
             Vale_Def_Words_s.lo1 =
               (eq_result
                  (src.Vale_Def_Words_s.lo1 = dst.Vale_Def_Words_s.lo1));
             Vale_Def_Words_s.hi2 =
               (eq_result
                  (src.Vale_Def_Words_s.hi2 = dst.Vale_Def_Words_s.hi2));
             Vale_Def_Words_s.hi3 =
               (eq_result
                  (src.Vale_Def_Words_s.hi3 = dst.Vale_Def_Words_s.hi3))
           })
let (ins_Pcmpeqd : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Pcmpeqd)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "pcmpeqd"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_Pextrq :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat64 FStar_Pervasives_Native.option)
  =
  fun index ->
    fun src ->
      check_sse4_1
        (let src_two = Vale_Def_Words_Four_s.four_to_two_two src in
         FStar_Pervasives_Native.Some
           (Vale_Def_Words_Two_s.two_to_nat (Prims.of_int (32))
              (Vale_Def_Words_Two_s.two_select src_two
                 (index mod (Prims.of_int (2))))))
let (ins_Pextrq :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun index ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Pextrq index))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "pextrq"
                [Vale_X64_Instruction_s.P64 dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm index]))
let (eval_Pinsrd :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat64 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun index ->
    fun dst ->
      fun src ->
        check_sse4_1
          (FStar_Pervasives_Native.Some
             (Vale_Def_Types_s.insert_nat32 dst
                (src mod (Prims.parse_int "0x100000000"))
                (index mod (Prims.of_int (4)))))
let (ins_Pinsrd :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun index ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Pinsrd index))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "pinsrd"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.P32 src;
                Vale_X64_Instruction_s.PImm index]))
let (eval_Pinsrq :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Words_s.nat64 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun index ->
    fun dst ->
      fun src ->
        check_sse4_1
          (FStar_Pervasives_Native.Some
             (Vale_Def_Types_s.insert_nat64_def dst src
                (index mod (Prims.of_int (2)))))
let (ins_Pinsrq :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun index ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Pinsrq index))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "pinsrq"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.P64 src;
                Vale_X64_Instruction_s.PImm index]))
let (eval_Pslldq_raw :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun count ->
    fun src ->
      if count = (Prims.of_int (4))
      then
        FStar_Pervasives_Native.Some
          {
            Vale_Def_Words_s.lo0 = Prims.int_zero;
            Vale_Def_Words_s.lo1 = (src.Vale_Def_Words_s.lo0);
            Vale_Def_Words_s.hi2 = (src.Vale_Def_Words_s.lo1);
            Vale_Def_Words_s.hi3 = (src.Vale_Def_Words_s.hi2)
          }
      else
        if count = (Prims.of_int (8))
        then
          FStar_Pervasives_Native.Some
            {
              Vale_Def_Words_s.lo0 = Prims.int_zero;
              Vale_Def_Words_s.lo1 = Prims.int_zero;
              Vale_Def_Words_s.hi2 = (src.Vale_Def_Words_s.lo0);
              Vale_Def_Words_s.hi3 = (src.Vale_Def_Words_s.lo1)
            }
        else FStar_Pervasives_Native.None
let (eval_VPslldq :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun count -> fun src -> check_avx (eval_Pslldq_raw count src)
let (ins_VPslldq :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun count ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_VPslldq count))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "vpslldq"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm count]))
let (eval_Psrldq_8_raw :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun count ->
    fun src ->
      if count = (Prims.of_int (8))
      then
        FStar_Pervasives_Native.Some
          {
            Vale_Def_Words_s.lo0 = (src.Vale_Def_Words_s.hi2);
            Vale_Def_Words_s.lo1 = (src.Vale_Def_Words_s.hi3);
            Vale_Def_Words_s.hi2 = Prims.int_zero;
            Vale_Def_Words_s.hi3 = Prims.int_zero
          }
      else FStar_Pervasives_Native.None
let (eval_VPsrldq :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun count -> fun src -> check_avx (eval_Psrldq_8_raw count src)
let (ins_VPsrldq :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun count ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_VPsrldq count))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "vpsrldq"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm count]))
let (eval_Pclmulqdq :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun imm ->
    fun src1 ->
      fun src2 ->
        let uu___ = src1 in
        match uu___ with
        | { Vale_Def_Words_s.lo0 = a0; Vale_Def_Words_s.lo1 = a1;
            Vale_Def_Words_s.hi2 = a2; Vale_Def_Words_s.hi3 = a3;_} ->
            let uu___1 = src2 in
            (match uu___1 with
             | { Vale_Def_Words_s.lo0 = b0; Vale_Def_Words_s.lo1 = b1;
                 Vale_Def_Words_s.hi2 = b2; Vale_Def_Words_s.hi3 = b3;_} ->
                 let f x0 x1 y0 y1 =
                   let x =
                     Vale_Math_Poly2_Bits_s.of_double32
                       { Vale_Def_Words_s.lo = x0; Vale_Def_Words_s.hi = x1 } in
                   let y =
                     Vale_Math_Poly2_Bits_s.of_double32
                       { Vale_Def_Words_s.lo = y0; Vale_Def_Words_s.hi = y1 } in
                   Vale_Math_Poly2_Bits_s.to_quad32
                     (Vale_Math_Poly2_s.mul x y) in
                 if Vale_X64_CPU_Features_s.pclmulqdq_enabled
                 then
                   (match imm with
                    | uu___2 when uu___2 = Prims.int_zero ->
                        FStar_Pervasives_Native.Some (f a0 a1 b0 b1)
                    | uu___2 when uu___2 = Prims.int_one ->
                        FStar_Pervasives_Native.Some (f a2 a3 b0 b1)
                    | uu___2 when uu___2 = (Prims.of_int (16)) ->
                        FStar_Pervasives_Native.Some (f a0 a1 b2 b3)
                    | uu___2 when uu___2 = (Prims.of_int (17)) ->
                        FStar_Pervasives_Native.Some (f a2 a3 b2 b3)
                    | uu___2 -> FStar_Pervasives_Native.None)
                 else FStar_Pervasives_Native.None)
let (ins_Pclmulqdq :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun imm ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.InOut,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_Pclmulqdq imm))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "pclmulqdq"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm imm]))
let (eval_VPclmulqdq :
  Prims.int ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun imm -> fun src1 -> fun src2 -> check_avx (eval_Pclmulqdq imm src1 src2)
let (ins_VPclmulqdq :
  Prims.int -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun imm ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
      Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic (eval_VPclmulqdq imm))
      (Obj.magic
         (fun dst ->
            fun src1 ->
              fun src2 ->
                Vale_X64_Instruction_s.print "vpclmulqdq"
                  [Vale_X64_Instruction_s.PXmm dst;
                  Vale_X64_Instruction_s.PXmm src1;
                  Vale_X64_Instruction_s.PXmm src2;
                  Vale_X64_Instruction_s.PImm imm]))
let (eval_AESNI_enc :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      if Vale_X64_CPU_Features_s.aesni_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.quad32_xor
             (Vale_AES_AES_s.mix_columns_LE
                (Vale_AES_AES_s.sub_bytes (Vale_AES_AES_s.shift_rows_LE src1)))
             src2)
      else FStar_Pervasives_Native.None
let (ins_AESNI_enc :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AESNI_enc)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "aesenc"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_VAESNI_enc :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_avx (eval_AESNI_enc src1 src2)
let (ins_VAESNI_enc :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_VAESNI_enc)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              Vale_X64_Instruction_s.print "vaesenc"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src1;
                Vale_X64_Instruction_s.PXmm src2]))
let (eval_AESNI_enc_last :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      if Vale_X64_CPU_Features_s.aesni_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.quad32_xor
             (Vale_AES_AES_s.sub_bytes (Vale_AES_AES_s.shift_rows_LE src1))
             src2)
      else FStar_Pervasives_Native.None
let (ins_AESNI_enc_last :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AESNI_enc_last)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "aesenclast"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_VAESNI_enc_last :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  = fun src1 -> fun src2 -> check_avx (eval_AESNI_enc_last src1 src2)
let (ins_VAESNI_enc_last :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_VAESNI_enc_last)
    (Obj.magic
       (fun dst ->
          fun src1 ->
            fun src2 ->
              Vale_X64_Instruction_s.print "vaesenclast"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src1;
                Vale_X64_Instruction_s.PXmm src2]))
let (eval_AESNI_dec :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      if Vale_X64_CPU_Features_s.aesni_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.quad32_xor
             (Vale_AES_AES_s.inv_mix_columns_LE
                (Vale_AES_AES_s.inv_sub_bytes
                   (Vale_AES_AES_s.inv_shift_rows_LE dst))) src)
      else FStar_Pervasives_Native.None
let (ins_AESNI_dec :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AESNI_dec)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "aesdec"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_AESNI_dec_last :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun dst ->
    fun src ->
      if Vale_X64_CPU_Features_s.aesni_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_Def_Types_s.quad32_xor
             (Vale_AES_AES_s.inv_sub_bytes
                (Vale_AES_AES_s.inv_shift_rows_LE dst)) src)
      else FStar_Pervasives_Native.None
let (ins_AESNI_dec_last :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AESNI_dec_last)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "aesdeclast"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_AESNI_imc :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src ->
    if Vale_X64_CPU_Features_s.aesni_enabled
    then FStar_Pervasives_Native.Some (Vale_AES_AES_s.inv_mix_columns_LE src)
    else FStar_Pervasives_Native.None
let (ins_AESNI_imc :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.Out,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_AESNI_imc)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "aesimc"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_AESNI_keygen_assist :
  Vale_Def_Words_s.nat8 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun imm ->
    fun src ->
      if Vale_X64_CPU_Features_s.aesni_enabled
      then
        FStar_Pervasives_Native.Some
          {
            Vale_Def_Words_s.lo0 =
              (Vale_AES_AES_s.sub_word src.Vale_Def_Words_s.lo1);
            Vale_Def_Words_s.lo1 =
              (Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000")
                 (Vale_AES_AES_s.rot_word_LE
                    (Vale_AES_AES_s.sub_word src.Vale_Def_Words_s.lo1)) imm);
            Vale_Def_Words_s.hi2 =
              (Vale_AES_AES_s.sub_word src.Vale_Def_Words_s.hi3);
            Vale_Def_Words_s.hi3 =
              (Vale_Def_Types_s.ixor (Prims.parse_int "0x100000000")
                 (Vale_AES_AES_s.rot_word_LE
                    (Vale_AES_AES_s.sub_word src.Vale_Def_Words_s.hi3)) imm)
          }
      else FStar_Pervasives_Native.None
let (ins_AESNI_keygen_assist :
  Vale_Def_Words_s.nat8 ->
    (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun imm ->
    Vale_X64_Instruction_s.make_ins
      [(Vale_X64_Instruction_s.Out,
         (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
      [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
      Vale_X64_Instruction_s.PreserveFlags
      (Obj.magic (eval_AESNI_keygen_assist imm))
      (Obj.magic
         (fun dst ->
            fun src ->
              Vale_X64_Instruction_s.print "aeskeygenassist"
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src;
                Vale_X64_Instruction_s.PImm imm]))
let (eval_SHA256_rnds2 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 ->
        Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      fun wk ->
        if Vale_X64_CPU_Features_s.sha_enabled
        then
          FStar_Pervasives_Native.Some
            (Vale_X64_CryptoInstructions_s.sha256_rnds2_spec src1 src2 wk)
        else FStar_Pervasives_Native.None
let (ins_SHA256_rnds2 :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm;
    Vale_X64_Instruction_s.IOpIm
      (Vale_X64_Instruction_s.IOpXmmOne
         (Vale_X64_Machine_s.OReg Prims.int_zero))]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_SHA256_rnds2)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.Print
              ("sha256rnds2", Vale_X64_Instruction_s.PrintPSha256rnds2,
                [Vale_X64_Instruction_s.PXmm dst;
                Vale_X64_Instruction_s.PXmm src])))
let (eval_SHA256_msg1 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      if Vale_X64_CPU_Features_s.sha_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_X64_CryptoInstructions_s.sha256_msg1_spec src1 src2)
      else FStar_Pervasives_Native.None
let (ins_SHA256_msg1 :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_SHA256_msg1)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "sha256msg1"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_SHA256_msg2 :
  Vale_Def_Types_s.quad32 ->
    Vale_Def_Types_s.quad32 ->
      Vale_Def_Types_s.quad32 FStar_Pervasives_Native.option)
  =
  fun src1 ->
    fun src2 ->
      if Vale_X64_CPU_Features_s.sha_enabled
      then
        FStar_Pervasives_Native.Some
          (Vale_X64_CryptoInstructions_s.sha256_msg2_spec src1 src2)
      else FStar_Pervasives_Native.None
let (ins_SHA256_msg2 :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins
    [(Vale_X64_Instruction_s.InOut,
       (Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm))]
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOpXmm]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_SHA256_msg2)
    (Obj.magic
       (fun dst ->
          fun src ->
            Vale_X64_Instruction_s.print "sha256msg2"
              [Vale_X64_Instruction_s.PXmm dst;
              Vale_X64_Instruction_s.PXmm src]))
let (eval_Ghost : unit FStar_Pervasives_Native.option) =
  FStar_Pervasives_Native.Some ()
let (ins_Ghost : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins [] [] Vale_X64_Instruction_s.PreserveFlags
    (Obj.magic eval_Ghost) (Obj.magic (Vale_X64_Instruction_s.print "" []))
let (eval_Comment : unit FStar_Pervasives_Native.option) =
  FStar_Pervasives_Native.Some ()
let (ins_Comment :
  Prims.string -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun s ->
    Vale_X64_Instruction_s.make_ins [] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Comment)
      (Obj.magic (Vale_X64_Instruction_s.print (Prims.strcat ";# " s) []))
let (eval_LargeComment : unit FStar_Pervasives_Native.option) =
  FStar_Pervasives_Native.Some ()
let (ins_LargeComment :
  Prims.string -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  fun s ->
    Vale_X64_Instruction_s.make_ins [] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_LargeComment)
      (Obj.magic (Vale_X64_Instruction_s.print (Prims.strcat ";# " s) []))
let (eval_Newline : unit FStar_Pervasives_Native.option) =
  FStar_Pervasives_Native.Some ()
let (ins_Newline : (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep)
  =
  Vale_X64_Instruction_s.make_ins [] [] Vale_X64_Instruction_s.PreserveFlags
    (Obj.magic eval_Newline) (Obj.magic (Vale_X64_Instruction_s.print "" []))
let (eval_Space : unit FStar_Pervasives_Native.option) =
  FStar_Pervasives_Native.Some ()
let (ins_Space :
  Prims.nat -> (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  fun n ->
    Vale_X64_Instruction_s.make_ins [] []
      Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Space)
      (Obj.magic (Vale_X64_Instruction_s.print "" []))
let (eval_Prefetchnta :
  Vale_Def_Words_s.nat64 -> unit FStar_Pervasives_Native.option) =
  fun uu___ -> FStar_Pervasives_Native.Some ()
let (ins_Prefetchnta :
  (unit, unit, unit, unit) Vale_X64_Instruction_s.instr_dep) =
  Vale_X64_Instruction_s.make_ins []
    [Vale_X64_Instruction_s.IOpEx Vale_X64_Instruction_s.IOp64]
    Vale_X64_Instruction_s.PreserveFlags (Obj.magic eval_Prefetchnta)
    (Obj.magic
       (fun loc ->
          Vale_X64_Instruction_s.print_s "prefetchnta"
            [Vale_X64_Instruction_s.P64 loc]))