open Prims
let (nat_to_uint : Vale_Arch_HeapTypes_s.base_typ -> Obj.t -> Obj.t) =
  fun t ->
    fun x ->
      match t with
      | Vale_Arch_HeapTypes_s.TUInt8 ->
          Obj.repr (FStar_UInt8.uint_to_t (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt16 ->
          Obj.repr (FStar_UInt16.uint_to_t (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt32 ->
          Obj.repr (FStar_UInt32.uint_to_t (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt64 ->
          Obj.repr (FStar_UInt64.uint_to_t (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt128 -> Obj.repr x
let (uint_to_nat : Vale_Arch_HeapTypes_s.base_typ -> Obj.t -> Obj.t) =
  fun t ->
    fun x ->
      match t with
      | Vale_Arch_HeapTypes_s.TUInt8 ->
          Obj.repr (FStar_UInt8.v (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt16 ->
          Obj.repr (FStar_UInt16.v (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt32 ->
          Obj.repr (FStar_UInt32.v (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt64 ->
          Obj.repr (FStar_UInt64.v (Obj.magic x))
      | Vale_Arch_HeapTypes_s.TUInt128 -> Obj.repr x
let (nat_to_uint_seq_t :
  Vale_Arch_HeapTypes_s.base_typ ->
    Obj.t FStar_Seq_Base.seq -> Obj.t FStar_Seq_Base.seq)
  =
  fun t ->
    fun b ->
      if (FStar_Seq_Base.length b) = Prims.int_zero
      then FStar_Seq_Base.MkSeq []
      else
        FStar_Seq_Base.init_aux (FStar_Seq_Base.length b) Prims.int_zero
          (fun i -> nat_to_uint t (FStar_Seq_Base.index b i))
let (uint_to_nat_seq_t :
  Vale_Arch_HeapTypes_s.base_typ ->
    Obj.t FStar_Seq_Base.seq -> Obj.t FStar_Seq_Base.seq)
  =
  fun t ->
    fun b ->
      if (FStar_Seq_Base.length b) = Prims.int_zero
      then FStar_Seq_Base.MkSeq []
      else
        FStar_Seq_Base.init_aux (FStar_Seq_Base.length b) Prims.int_zero
          (fun i -> uint_to_nat t (FStar_Seq_Base.index b i))
let (view_of_base_typ :
  Vale_Arch_HeapTypes_s.base_typ ->
    (FStar_UInt8.t, Obj.t) LowStar_BufferView_Up.view)
  =
  fun uu___ ->
    (fun t ->
       match t with
       | Vale_Arch_HeapTypes_s.TUInt8 ->
           Obj.magic (Obj.repr Vale_Interop_Views.up_view8)
       | Vale_Arch_HeapTypes_s.TUInt16 ->
           Obj.magic (Obj.repr Vale_Interop_Views.up_view16)
       | Vale_Arch_HeapTypes_s.TUInt32 ->
           Obj.magic (Obj.repr Vale_Interop_Views.up_view32)
       | Vale_Arch_HeapTypes_s.TUInt64 ->
           Obj.magic (Obj.repr Vale_Interop_Views.up_view64)
       | Vale_Arch_HeapTypes_s.TUInt128 ->
           Obj.magic (Obj.repr Vale_Interop_Views.up_view128)) uu___
type hprop = unit
type hsprop = unit
type ('src, 't, 'x, 'h, 's) mem_correspondence_1 = unit
type ('src, 't, 'x, 'h, 's) mem_imm_correspondence_1 = unit
type ('args, 'uuuuu, 'uuuuu1) mem_correspondence = Obj.t

type ('maxuarity, 'argureg, 'n, 'args, 'uuuuu) register_args = Obj.t
type ('maxuarity, 'n, 'args, 'uuuuu) stack_args = Obj.t
type ('m, 'tm, 'a) taint_hyp_arg = Obj.t
type ('args, 's0) taint_hyp = Obj.t
type ('maxuarity, 'argureg, 'args, 's0) vale_pre_hyp = unit
type ('maxuarity, 'argureg, 'pre, 'args, 'hsumem) to_low_pre = unit
type ('post, 'args, 'hsumem0, 'res, 'hsumem1) to_low_post = unit
