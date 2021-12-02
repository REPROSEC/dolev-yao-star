open Prims
type location_with_value =
  (Vale_Transformers_Locations.location_eq, Obj.t) Prims.dtuple2
type locations_with_values = location_with_value Prims.list
type rw_set =
  {
  loc_reads: Vale_Transformers_Locations.location Prims.list ;
  loc_writes: Vale_Transformers_Locations.location Prims.list ;
  loc_constant_writes: locations_with_values }
let (__proj__Mkrw_set__item__loc_reads :
  rw_set -> Vale_Transformers_Locations.location Prims.list) =
  fun projectee ->
    match projectee with
    | { loc_reads; loc_writes; loc_constant_writes;_} -> loc_reads
let (__proj__Mkrw_set__item__loc_writes :
  rw_set -> Vale_Transformers_Locations.location Prims.list) =
  fun projectee ->
    match projectee with
    | { loc_reads; loc_writes; loc_constant_writes;_} -> loc_writes
let (__proj__Mkrw_set__item__loc_constant_writes :
  rw_set -> locations_with_values) =
  fun projectee ->
    match projectee with
    | { loc_reads; loc_writes; loc_constant_writes;_} -> loc_constant_writes
let (locations_of_maddr :
  Vale_X64_Machine_s.maddr ->
    Vale_Transformers_Locations.location ->
      Vale_Transformers_Locations.location Prims.list)
  =
  fun m ->
    fun mem -> mem ::
      (match m with
       | Vale_X64_Machine_s.MConst uu___ -> []
       | Vale_X64_Machine_s.MReg (r, uu___) ->
           [Vale_Transformers_Locations.ALocReg r]
       | Vale_X64_Machine_s.MIndex (b, uu___, i, uu___1) ->
           [Vale_Transformers_Locations.ALocReg b;
           Vale_Transformers_Locations.ALocReg i])
let (locations_of_operand64 :
  Vale_X64_Machine_s.operand64 ->
    (Vale_Transformers_Locations.location Prims.list *
      Vale_Transformers_Locations.location Prims.list))
  =
  fun o ->
    match o with
    | Vale_X64_Machine_s.OConst uu___ -> ([], [])
    | Vale_X64_Machine_s.OReg r ->
        ([],
          [Vale_Transformers_Locations.ALocReg
             (Vale_X64_Machine_s.Reg (Prims.int_zero, r))])
    | Vale_X64_Machine_s.OMem (m, uu___) ->
        ((locations_of_maddr m Vale_Transformers_Locations.ALocMem),
          [Vale_Transformers_Locations.ALocMem])
    | Vale_X64_Machine_s.OStack (m, uu___) ->
        (((Vale_Transformers_Locations.ALocReg
             (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))
          :: (locations_of_maddr m Vale_Transformers_Locations.ALocStack)),
          [Vale_Transformers_Locations.ALocStack])
let (locations_of_operand128 :
  Vale_X64_Machine_s.operand128 ->
    (Vale_Transformers_Locations.location Prims.list *
      Vale_Transformers_Locations.location Prims.list))
  =
  fun o ->
    match o with
    | Vale_X64_Machine_s.OConst uu___ -> ([], [])
    | Vale_X64_Machine_s.OReg r ->
        ([],
          [Vale_Transformers_Locations.ALocReg
             (Vale_X64_Machine_s.Reg (Prims.int_one, r))])
    | Vale_X64_Machine_s.OMem (m, uu___) ->
        ((locations_of_maddr m Vale_Transformers_Locations.ALocMem),
          [Vale_Transformers_Locations.ALocMem])
    | Vale_X64_Machine_s.OStack (m, uu___) ->
        (((Vale_Transformers_Locations.ALocReg
             (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))
          :: (locations_of_maddr m Vale_Transformers_Locations.ALocStack)),
          [Vale_Transformers_Locations.ALocStack])
let (locations_of_explicit :
  Vale_X64_Instruction_s.instr_operand_explicit ->
    Obj.t ->
      (Vale_Transformers_Locations.location Prims.list *
        Vale_Transformers_Locations.location Prims.list))
  =
  fun t ->
    fun i ->
      match t with
      | Vale_X64_Instruction_s.IOp64 -> locations_of_operand64 (Obj.magic i)
      | Vale_X64_Instruction_s.IOpXmm ->
          locations_of_operand128 (Obj.magic i)
let (locations_of_implicit :
  Vale_X64_Instruction_s.instr_operand_implicit ->
    (Vale_Transformers_Locations.location Prims.list *
      Vale_Transformers_Locations.location Prims.list))
  =
  fun t ->
    match t with
    | Vale_X64_Instruction_s.IOp64One i -> locations_of_operand64 i
    | Vale_X64_Instruction_s.IOpXmmOne i -> locations_of_operand128 i
    | Vale_X64_Instruction_s.IOpFlagsCf ->
        ([], [Vale_Transformers_Locations.ALocCf])
    | Vale_X64_Instruction_s.IOpFlagsOf ->
        ([], [Vale_Transformers_Locations.ALocOf])
let (both :
  (Vale_Transformers_Locations.location Prims.list *
    Vale_Transformers_Locations.location Prims.list) ->
    Vale_Transformers_Locations.location Prims.list)
  =
  fun x ->
    let uu___ = x in
    match uu___ with | (a, b) -> FStar_List_Tot_Base.append a b
let rec (aux_read_set0 :
  Vale_X64_Instruction_s.instr_operand Prims.list ->
    Obj.t -> Vale_Transformers_Locations.location Prims.list)
  =
  fun args ->
    fun oprs ->
      match args with
      | [] -> []
      | (Vale_X64_Instruction_s.IOpEx i)::args1 ->
          let uu___ = Obj.magic oprs in
          (match uu___ with
           | (l, r) ->
               FStar_List_Tot_Base.append (both (locations_of_explicit i l))
                 (aux_read_set0 args1 r))
      | (Vale_X64_Instruction_s.IOpIm i)::args1 ->
          FStar_List_Tot_Base.append (both (locations_of_implicit i))
            (aux_read_set0 args1 oprs)
let rec (aux_read_set1 :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> Vale_Transformers_Locations.location Prims.list)
  =
  fun outs ->
    fun args ->
      fun oprs ->
        match outs with
        | [] -> aux_read_set0 args oprs
        | (Vale_X64_Instruction_s.Out, Vale_X64_Instruction_s.IOpEx i)::outs1
            ->
            let uu___ = Obj.magic oprs in
            (match uu___ with
             | (l, r) ->
                 FStar_List_Tot_Base.append
                   (FStar_Pervasives_Native.fst (locations_of_explicit i l))
                   (aux_read_set1 outs1 args r))
        | (Vale_X64_Instruction_s.InOut, Vale_X64_Instruction_s.IOpEx i)::outs1
            ->
            let uu___ = Obj.magic oprs in
            (match uu___ with
             | (l, r) ->
                 FStar_List_Tot_Base.append
                   (both (locations_of_explicit i l))
                   (aux_read_set1 outs1 args r))
        | (Vale_X64_Instruction_s.Out, Vale_X64_Instruction_s.IOpIm i)::outs1
            ->
            FStar_List_Tot_Base.append
              (FStar_Pervasives_Native.fst (locations_of_implicit i))
              (aux_read_set1 outs1 args oprs)
        | (Vale_X64_Instruction_s.InOut, Vale_X64_Instruction_s.IOpIm i)::outs1
            ->
            FStar_List_Tot_Base.append (both (locations_of_implicit i))
              (aux_read_set1 outs1 args oprs)
let (read_set :
  Vale_X64_Instruction_s.instr_t_record ->
    Obj.t -> Vale_Transformers_Locations.location Prims.list)
  =
  fun i ->
    fun oprs ->
      aux_read_set1
        (Vale_X64_Instruction_s.__proj__InstrTypeRecord__item__outs i)
        (Vale_X64_Instruction_s.__proj__InstrTypeRecord__item__args i) oprs
let rec (aux_write_set :
  Vale_X64_Instruction_s.instr_out Prims.list ->
    Vale_X64_Instruction_s.instr_operand Prims.list ->
      Obj.t -> Vale_Transformers_Locations.location Prims.list)
  =
  fun outs ->
    fun args ->
      fun oprs ->
        match outs with
        | [] -> []
        | (uu___, Vale_X64_Instruction_s.IOpEx i)::outs1 ->
            let uu___1 = Obj.magic oprs in
            (match uu___1 with
             | (l, r) ->
                 FStar_List_Tot_Base.append
                   (FStar_Pervasives_Native.snd (locations_of_explicit i l))
                   (aux_write_set outs1 args r))
        | (uu___, Vale_X64_Instruction_s.IOpIm i)::outs1 ->
            FStar_List_Tot_Base.append
              (FStar_Pervasives_Native.snd (locations_of_implicit i))
              (aux_write_set outs1 args oprs)
let (write_set :
  Vale_X64_Instruction_s.instr_t_record ->
    Obj.t -> Vale_Transformers_Locations.location Prims.list)
  =
  fun i ->
    fun oprs ->
      let uu___ = i in
      match uu___ with
      | Vale_X64_Instruction_s.InstrTypeRecord
          (outs, args, havoc_flags, uu___1) ->
          let ws = aux_write_set outs args oprs in
          (match havoc_flags with
           | Vale_X64_Instruction_s.HavocFlags ->
               Vale_Transformers_Locations.ALocCf ::
               Vale_Transformers_Locations.ALocOf :: ws
           | Vale_X64_Instruction_s.PreserveFlags -> ws)
let (constant_writes :
  Vale_X64_Instruction_s.instr_t_record -> Obj.t -> locations_with_values) =
  fun i ->
    fun oprs ->
      let uu___ = i in
      match uu___ with
      | Vale_X64_Instruction_s.InstrTypeRecord
          (outs, args, havoc_flags, uu___1) ->
          (match havoc_flags with
           | Vale_X64_Instruction_s.HavocFlags ->
               let ws = aux_write_set outs args oprs in
               let cr = [] in
               let cr1 =
                 if
                   FStar_List_Tot_Base.mem Vale_Transformers_Locations.ALocCf
                     ws
                 then cr
                 else
                   (Prims.Mkdtuple2
                      (Vale_Transformers_Locations.ALocCf,
                        (Obj.magic FStar_Pervasives_Native.None)))
                   :: cr in
               let cr2 =
                 if
                   FStar_List_Tot_Base.mem Vale_Transformers_Locations.ALocOf
                     ws
                 then cr1
                 else
                   (Prims.Mkdtuple2
                      (Vale_Transformers_Locations.ALocOf,
                        (Obj.magic FStar_Pervasives_Native.None)))
                   :: cr1 in
               cr2
           | Vale_X64_Instruction_s.PreserveFlags -> [])
let (rw_set_of_ins : Vale_X64_Machine_Semantics_s.ins -> rw_set) =
  fun i ->
    match i with
    | Vale_X64_Bytes_Code_s.Instr (i1, oprs, uu___) ->
        {
          loc_reads = (read_set i1 oprs);
          loc_writes = (write_set i1 oprs);
          loc_constant_writes = (constant_writes i1 oprs)
        }
    | Vale_X64_Bytes_Code_s.Push (src, t) ->
        {
          loc_reads =
            ((Vale_Transformers_Locations.ALocReg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))
            :: Vale_Transformers_Locations.ALocStack ::
            (both (locations_of_operand64 src)));
          loc_writes =
            [Vale_Transformers_Locations.ALocReg
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))));
            Vale_Transformers_Locations.ALocStack];
          loc_constant_writes = []
        }
    | Vale_X64_Bytes_Code_s.Pop (dst, t) ->
        {
          loc_reads =
            ((Vale_Transformers_Locations.ALocReg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))
            :: Vale_Transformers_Locations.ALocStack ::
            (FStar_Pervasives_Native.fst (locations_of_operand64 dst)));
          loc_writes =
            ((Vale_Transformers_Locations.ALocReg
                (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7)))))
            :: (FStar_Pervasives_Native.snd (locations_of_operand64 dst)));
          loc_constant_writes = []
        }
    | Vale_X64_Bytes_Code_s.Alloc uu___ ->
        {
          loc_reads =
            [Vale_Transformers_Locations.ALocReg
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))];
          loc_writes =
            [Vale_Transformers_Locations.ALocReg
               (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))];
          loc_constant_writes = []
        }
    | Vale_X64_Bytes_Code_s.Dealloc uu___ ->
        {
          loc_reads =
            [Vale_Transformers_Locations.ALocStack;
            Vale_Transformers_Locations.ALocReg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))];
          loc_writes =
            [Vale_Transformers_Locations.ALocStack;
            Vale_Transformers_Locations.ALocReg
              (Vale_X64_Machine_s.Reg (Prims.int_zero, (Prims.of_int (7))))];
          loc_constant_writes = []
        }
let (locations_of_ocmp :
  Vale_X64_Machine_Semantics_s.ocmp ->
    Vale_Transformers_Locations.location Prims.list)
  =
  fun o ->
    match o with
    | Vale_X64_Bytes_Code_s.OEq (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
    | Vale_X64_Bytes_Code_s.ONe (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
    | Vale_X64_Bytes_Code_s.OLe (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
    | Vale_X64_Bytes_Code_s.OGe (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
    | Vale_X64_Bytes_Code_s.OLt (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
    | Vale_X64_Bytes_Code_s.OGt (o1, o2) ->
        FStar_List_Tot_Base.append (both (locations_of_operand64 o1))
          (both (locations_of_operand64 o2))
type ('exceptions, 's1, 's2) unchanged_except = unit
type ('locs, 'f) only_affects = unit
type ('locs, 's1, 's2) unchanged_at = Obj.t
type ('locv, 'f, 's) constant_on_execution = Obj.t
type ('rw, 'f) bounded_effects = unit
let (safely_bounded : Vale_X64_Machine_Semantics_s.ins -> Prims.bool) =
  fun i -> Vale_X64_Bytes_Code_s.uu___is_Instr i










type ('l, 's1, 's2) unchanged_at' = unit

















let machine_eval_code_Ins :
  'uuuuu .
    Vale_X64_Machine_Semantics_s.ins ->
      'uuuuu -> unit Vale_X64_Machine_Semantics_s.st
  =
  fun i ->
    fun fuel ->
      fun s ->
        ((),
          (FStar_Pervasives_Native.__proj__Some__item__v
             (Vale_X64_Machine_Semantics_s.machine_eval_code_ins_def i s)))







let (add_r_to_rw_set :
  Vale_Transformers_Locations.location Prims.list -> rw_set -> rw_set) =
  fun r ->
    fun rw ->
      let uu___ = rw in
      {
        loc_reads = (FStar_List_Tot_Base.append r rw.loc_reads);
        loc_writes = (uu___.loc_writes);
        loc_constant_writes = (uu___.loc_constant_writes)
      }
let rec intersect : 't . 't Prims.list -> 't Prims.list -> 't Prims.list =
  fun l1 ->
    fun l2 ->
      match l1 with
      | [] -> []
      | x::xs ->
          if FStar_List_Tot_Base.mem x l2
          then x :: (intersect xs l2)
          else intersect xs l2
let rec difference : 't . 't Prims.list -> 't Prims.list -> 't Prims.list =
  fun l1 ->
    fun l2 ->
      match l1 with
      | [] -> []
      | x::xs ->
          if FStar_List_Tot_Base.mem x l2
          then difference xs l2
          else x :: (difference xs l2)
let sym_difference : 't . 't Prims.list -> 't Prims.list -> 't Prims.list =
  fun l1 ->
    fun l2 ->
      FStar_List_Tot_Base.append (difference l1 l2) (difference l2 l1)
let (rw_set_in_parallel : rw_set -> rw_set -> rw_set) =
  fun rw1 ->
    fun rw2 ->
      {
        loc_reads =
          (FStar_List_Tot_Base.append
             (sym_difference rw1.loc_writes rw2.loc_writes)
             (FStar_List_Tot_Base.append rw1.loc_reads rw2.loc_reads));
        loc_writes =
          (FStar_List_Tot_Base.append rw1.loc_writes rw2.loc_writes);
        loc_constant_writes =
          (intersect rw1.loc_constant_writes rw2.loc_constant_writes)
      }
let (rw_set_in_series : rw_set -> rw_set -> rw_set) =
  fun rw1 ->
    fun rw2 ->
      {
        loc_reads =
          (FStar_List_Tot_Base.append rw1.loc_reads
             (difference rw2.loc_reads rw1.loc_writes));
        loc_writes =
          (FStar_List_Tot_Base.append rw1.loc_writes rw2.loc_writes);
        loc_constant_writes =
          (intersect rw1.loc_constant_writes rw2.loc_constant_writes)
      }



















