open Prims
let (va_code_Mem64_lemma :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun uu___ -> Vale_X64_Machine_s.Block []
let (va_codegen_success_Mem64_lemma : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('h, 'base, 'offset, 'b, 'index, 't, 'vaus0, 'vauk) va_wp_Mem64_lemma =
  unit

let (va_quick_Mem64_lemma :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Prims.int ->
        Vale_X64_Memory.buffer64 ->
          Prims.int ->
            Vale_Arch_HeapTypes_s.taint ->
              (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun base ->
      fun offset ->
        fun b ->
          fun index ->
            fun t ->
              Vale_X64_QuickCode.QProc ((va_code_Mem64_lemma ()), [], (), ())

type 'h heaplet_id_is_none = unit
type ('h, 'i) heaplet_id_is_some = unit
type 'p norm_list = 'p

let (norm_loc : Vale_X64_Memory.loc -> Vale_X64_Memory.loc) = fun l -> l
type 'h trigger_create_heaplet = unit
let (declare_buffer64 :
  unit Vale_Arch_HeapImpl.buffer ->
    Vale_Arch_HeapImpl.heaplet_id ->
      Vale_Arch_HeapTypes_s.taint ->
        Vale_Arch_HeapImpl.mutability -> Vale_Arch_HeapImpl.buffer_info)
  =
  fun b ->
    fun hid ->
      fun t ->
        fun mut ->
          {
            Vale_Arch_HeapImpl.bi_typ = Vale_Arch_HeapTypes_s.TUInt64;
            Vale_Arch_HeapImpl.bi_buffer = b;
            Vale_Arch_HeapImpl.bi_heaplet = hid;
            Vale_Arch_HeapImpl.bi_taint = t;
            Vale_Arch_HeapImpl.bi_mutable = mut
          }
let (declare_buffer128 :
  unit Vale_Arch_HeapImpl.buffer ->
    Vale_Arch_HeapImpl.heaplet_id ->
      Vale_Arch_HeapTypes_s.taint ->
        Vale_Arch_HeapImpl.mutability -> Vale_Arch_HeapImpl.buffer_info)
  =
  fun b ->
    fun hid ->
      fun t ->
        fun mut ->
          {
            Vale_Arch_HeapImpl.bi_typ = Vale_Arch_HeapTypes_s.TUInt128;
            Vale_Arch_HeapImpl.bi_buffer = b;
            Vale_Arch_HeapImpl.bi_heaplet = hid;
            Vale_Arch_HeapImpl.bi_taint = t;
            Vale_Arch_HeapImpl.bi_mutable = mut
          }
type ('layout, 'bs) create_post = unit


let (va_code_CreateHeaplets :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Ghost
            (Vale_X64_Machine_Semantics_s.AnnotateGhost ())))
let (va_codegen_success_CreateHeaplets : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('buffers, 'vaus0, 'vauk) va_wp_CreateHeaplets = unit

let (va_quick_CreateHeaplets :
  Vale_Arch_HeapImpl.buffer_info Prims.list ->
    (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun buffers ->
    Vale_X64_QuickCode.QProc
      ((va_code_CreateHeaplets ()), [Vale_X64_QuickCode.Mod_mem_layout], (),
        ())
let (va_code_DestroyHeaplets :
  unit ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  =
  fun uu___ ->
    Vale_X64_Taint_Semantics.mk_ins
      (Obj.magic
         (Vale_X64_InsLemmas.make_instr_annotate [] []
            Vale_X64_Instruction_s.PreserveFlags
            Vale_X64_Instructions_s.ins_Ghost
            (Vale_X64_Machine_Semantics_s.AnnotateGhost ())))
let (va_codegen_success_DestroyHeaplets : unit -> Vale_X64_Decls.va_pbool) =
  fun uu___ -> Vale_X64_Decls.va_ttrue ()

type ('vaus0, 'vauk) va_wp_DestroyHeaplets = unit

let (va_quick_DestroyHeaplets :
  unit -> (unit, unit) Vale_X64_QuickCode.quickCode) =
  fun uu___ ->
    Vale_X64_QuickCode.QProc
      ((va_code_DestroyHeaplets ()), [Vale_X64_QuickCode.Mod_mem_layout], (),
        ())
let (va_code_Load64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            Vale_X64_Taint_Semantics.mk_ins
              (Obj.magic
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          (Vale_X64_InsLemmas.make_instr_annotate
                             [(Vale_X64_Instruction_s.Out,
                                (Vale_X64_Instruction_s.IOpEx
                                   Vale_X64_Instruction_s.IOp64))]
                             [Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64]
                             Vale_X64_Instruction_s.PreserveFlags
                             Vale_X64_Instructions_s.ins_Mov64
                             (Vale_X64_Machine_Semantics_s.AnnotateMov64 ())))
                         uu___1 uu___) (Obj.magic dst)
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       src))), offset)), t)))))
let (va_codegen_success_Load64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_Load64_buffer = unit

let (va_quick_Load64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer64 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Load64_buffer h dst src offset t),
                    [Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_Store64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            Vale_X64_Taint_Semantics.mk_ins
              (Obj.magic
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          (Vale_X64_InsLemmas.make_instr_annotate
                             [(Vale_X64_Instruction_s.Out,
                                (Vale_X64_Instruction_s.IOpEx
                                   Vale_X64_Instruction_s.IOp64))]
                             [Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64]
                             Vale_X64_Instruction_s.PreserveFlags
                             Vale_X64_Instructions_s.ins_Mov64
                             (Vale_X64_Machine_Semantics_s.AnnotateMov64 ())))
                         uu___1 uu___)
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       dst))), offset)), t))) (Obj.magic src)))
let (va_codegen_success_Store64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_Store64_buffer = unit

let (va_quick_Store64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer64 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_Store64_buffer h dst src offset t),
                    [Vale_X64_QuickCode.Mod_mem;
                    Vale_X64_QuickCode.va_mod_heaplet h], (), ())
let (va_code_LoadBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            Vale_X64_Taint_Semantics.mk_ins
              (Obj.magic
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          (Vale_X64_InsLemmas.make_instr_annotate
                             [(Vale_X64_Instruction_s.Out,
                                (Vale_X64_Instruction_s.IOpEx
                                   Vale_X64_Instruction_s.IOp64))]
                             [Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64]
                             Vale_X64_Instruction_s.PreserveFlags
                             Vale_X64_Instructions_s.ins_MovBe64
                             (Vale_X64_Machine_Semantics_s.AnnotateMovbe64 ())))
                         uu___1 uu___) (Obj.magic dst)
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       src))), offset)), t)))))
let (va_codegen_success_LoadBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_LoadBe64_buffer = unit

let (va_quick_LoadBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Machine_s.operand64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer64 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_LoadBe64_buffer h dst src offset t),
                    [Vale_X64_QuickCode.va_mod_dst_opr64 dst], (), ())
let (va_code_StoreBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
              Vale_X64_Machine_s.precode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            Vale_X64_Taint_Semantics.mk_ins
              (Obj.magic
                 ((fun uu___1 ->
                     fun uu___ ->
                       (Obj.magic
                          (Vale_X64_InsLemmas.make_instr_annotate
                             [(Vale_X64_Instruction_s.Out,
                                (Vale_X64_Instruction_s.IOpEx
                                   Vale_X64_Instruction_s.IOp64))]
                             [Vale_X64_Instruction_s.IOpEx
                                Vale_X64_Instruction_s.IOp64]
                             Vale_X64_Instruction_s.PreserveFlags
                             Vale_X64_Instructions_s.ins_MovBe64
                             (Vale_X64_Machine_Semantics_s.AnnotateMovbe64 ())))
                         uu___1 uu___)
                    (Obj.magic
                       (Vale_X64_Machine_s.OMem
                          ((Vale_X64_Machine_s.MReg
                              ((Vale_X64_Machine_s.Reg
                                  (Prims.int_zero,
                                    (Vale_X64_Machine_s.__proj__OReg__item__r
                                       dst))), offset)), t))) (Obj.magic src)))
let (va_codegen_success_StoreBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int -> Vale_Arch_HeapTypes_s.taint -> Vale_X64_Decls.va_pbool)
  =
  fun h ->
    fun dst -> fun src -> fun offset -> fun t -> Vale_X64_Decls.va_ttrue ()

type ('h, 'dst, 'src, 'offset, 't, 'b, 'index, 'vaus0,
  'vauk) va_wp_StoreBe64_buffer = unit

let (va_quick_StoreBe64_buffer :
  Vale_Arch_HeapImpl.heaplet_id ->
    Vale_X64_Decls.va_operand_reg_opr64 ->
      Vale_X64_Decls.va_operand_reg_opr64 ->
        Prims.int ->
          Vale_Arch_HeapTypes_s.taint ->
            Vale_X64_Memory.buffer64 ->
              Prims.int -> (unit, unit) Vale_X64_QuickCode.quickCode)
  =
  fun h ->
    fun dst ->
      fun src ->
        fun offset ->
          fun t ->
            fun b ->
              fun index ->
                Vale_X64_QuickCode.QProc
                  ((va_code_StoreBe64_buffer h dst src offset t),
                    [Vale_X64_QuickCode.Mod_mem;
                    Vale_X64_QuickCode.va_mod_heaplet h], (), ())