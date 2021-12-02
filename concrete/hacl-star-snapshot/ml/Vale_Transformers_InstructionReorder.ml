open Prims
let rec (locations_of_locations_with_values :
  Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
    Vale_Transformers_Locations.location Prims.list)
  =
  fun lv ->
    match lv with
    | [] -> []
    | (Prims.Mkdtuple2 (l, v))::lv1 -> l ::
        (locations_of_locations_with_values lv1)
let (write_same_constants :
  Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
    Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
      unit Vale_Def_PossiblyMonad.possibly)
  =
  fun c1 ->
    fun c2 ->
      Vale_Def_PossiblyMonad.for_all
        (fun x1 ->
           Vale_Def_PossiblyMonad.for_all
             (fun x2 ->
                let uu___ = x1 in
                match uu___ with
                | Prims.Mkdtuple2 (l1, v1) ->
                    let uu___1 = x2 in
                    (match uu___1 with
                     | Prims.Mkdtuple2 (l2, v2) ->
                         if (if l1 = l2 then v1 = v2 else true)
                         then Vale_Def_PossiblyMonad.Ok ()
                         else
                           Vale_Def_PossiblyMonad.Err
                             "not writing same constants")) c2) c1
let (aux_write_exchange_allowed :
  Vale_Transformers_Locations.location Prims.list ->
    Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
      Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
        Vale_Transformers_Locations.location ->
          unit Vale_Def_PossiblyMonad.possibly)
  =
  fun w2 ->
    fun c1 ->
      fun c2 ->
        fun x ->
          let uu___ =
            ((locations_of_locations_with_values c1),
              (locations_of_locations_with_values c2)) in
          match uu___ with
          | (cv1, cv2) ->
              Vale_Def_PossiblyMonad.op_Bar_Bar_Dot
                (Vale_Transformers_Locations.disjoint_location_from_locations
                   x w2)
                (if
                   (FStar_List_Tot_Base.mem x cv1) &&
                     (FStar_List_Tot_Base.mem x cv2)
                 then Vale_Def_PossiblyMonad.Ok ()
                 else Vale_Def_PossiblyMonad.Err "non constant write")
let (write_exchange_allowed :
  Vale_Transformers_Locations.location Prims.list ->
    Vale_Transformers_Locations.location Prims.list ->
      Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
        Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
          unit Vale_Def_PossiblyMonad.possibly)
  =
  fun w1 ->
    fun w2 ->
      fun c1 ->
        fun c2 ->
          Vale_Def_PossiblyMonad.op_Amp_Amp_Dot
            (Vale_Def_PossiblyMonad.op_Amp_Amp_Dot
               (write_same_constants c1 c2)
               (Vale_Def_PossiblyMonad.for_all
                  (aux_write_exchange_allowed w2 c1 c2) w1))
            (Vale_Def_PossiblyMonad.for_all
               (aux_write_exchange_allowed w1 c2 c1) w2)
let (rw_exchange_allowed :
  Vale_Transformers_BoundedInstructionEffects.rw_set ->
    Vale_Transformers_BoundedInstructionEffects.rw_set ->
      unit Vale_Def_PossiblyMonad.possibly)
  =
  fun rw1 ->
    fun rw2 ->
      let uu___ =
        ((rw1.Vale_Transformers_BoundedInstructionEffects.loc_reads),
          (rw1.Vale_Transformers_BoundedInstructionEffects.loc_writes),
          (rw1.Vale_Transformers_BoundedInstructionEffects.loc_constant_writes)) in
      match uu___ with
      | (r1, w1, c1) ->
          let uu___1 =
            ((rw2.Vale_Transformers_BoundedInstructionEffects.loc_reads),
              (rw2.Vale_Transformers_BoundedInstructionEffects.loc_writes),
              (rw2.Vale_Transformers_BoundedInstructionEffects.loc_constant_writes)) in
          (match uu___1 with
           | (r2, w2, c2) ->
               Vale_Def_PossiblyMonad.op_Amp_Amp_Dot
                 (Vale_Def_PossiblyMonad.op_Amp_Amp_Dot
                    (match Vale_Transformers_Locations.disjoint_locations r1
                             w2
                     with
                     | Vale_Def_PossiblyMonad.Ok () ->
                         Vale_Def_PossiblyMonad.Ok ()
                     | Vale_Def_PossiblyMonad.Err rr ->
                         Vale_Def_PossiblyMonad.Err
                           (Prims.strcat
                              "read set of 1st not disjoint from write set of 2nd because "
                              rr))
                    (match Vale_Transformers_Locations.disjoint_locations r2
                             w1
                     with
                     | Vale_Def_PossiblyMonad.Ok () ->
                         Vale_Def_PossiblyMonad.Ok ()
                     | Vale_Def_PossiblyMonad.Err rr ->
                         Vale_Def_PossiblyMonad.Err
                           (Prims.strcat
                              "read set of 2nd not disjoint from write set of 1st because "
                              rr)))
                 (match write_exchange_allowed w1 w2 c1 c2 with
                  | Vale_Def_PossiblyMonad.Ok () ->
                      Vale_Def_PossiblyMonad.Ok ()
                  | Vale_Def_PossiblyMonad.Err rr ->
                      Vale_Def_PossiblyMonad.Err
                        (Prims.strcat "write sets not disjoint because " rr)))
let (ins_exchange_allowed :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Machine_Semantics_s.ins -> unit Vale_Def_PossiblyMonad.possibly)
  =
  fun i1 ->
    fun i2 ->
      match match (i1, i2) with
            | (Vale_X64_Bytes_Code_s.Instr (uu___, uu___1, uu___2),
               Vale_X64_Bytes_Code_s.Instr (uu___3, uu___4, uu___5)) ->
                rw_exchange_allowed
                  (Vale_Transformers_BoundedInstructionEffects.rw_set_of_ins
                     i1)
                  (Vale_Transformers_BoundedInstructionEffects.rw_set_of_ins
                     i2)
            | (uu___, uu___1) ->
                Vale_Def_PossiblyMonad.Err
                  "non-generic instructions: conservatively disallowed exchange"
      with
      | Vale_Def_PossiblyMonad.Ok () -> Vale_Def_PossiblyMonad.Ok ()
      | Vale_Def_PossiblyMonad.Err rr ->
          Vale_Def_PossiblyMonad.Err
            (Prims.strcat rr
               (Prims.op_Hat " for instructions "
                  (Prims.op_Hat
                     (Vale_X64_Print_s.print_ins i1 Vale_X64_Print_s.gcc)
                     (Prims.op_Hat " and "
                        (Vale_X64_Print_s.print_ins i2 Vale_X64_Print_s.gcc)))))



type ('s1, 's2) equiv_states = unit
type ('s1, 's2) equiv_states_ext = unit
type ('s1, 's2) equiv_states_or_both_not_ok = unit
type ('s1, 's2) equiv_ostates = unit
let (erroring_option_state :
  Vale_X64_Machine_Semantics_s.machine_state FStar_Pervasives_Native.option
    -> Prims.bool)
  =
  fun s ->
    match s with
    | FStar_Pervasives_Native.None -> true
    | FStar_Pervasives_Native.Some s1 ->
        Prims.op_Negation s1.Vale_X64_Machine_Semantics_s.ms_ok
type ('s1, 's2) equiv_option_states = unit
let (proof_run :
  Vale_X64_Machine_Semantics_s.machine_state ->
    unit Vale_X64_Machine_Semantics_s.st ->
      Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun s ->
    fun f ->
      let uu___ = f s in
      match uu___ with
      | ((), s1) ->
          let uu___1 = s1 in
          {
            Vale_X64_Machine_Semantics_s.ms_ok =
              (s1.Vale_X64_Machine_Semantics_s.ms_ok &&
                 s.Vale_X64_Machine_Semantics_s.ms_ok);
            Vale_X64_Machine_Semantics_s.ms_regs =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_regs);
            Vale_X64_Machine_Semantics_s.ms_flags =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_flags);
            Vale_X64_Machine_Semantics_s.ms_heap =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_heap);
            Vale_X64_Machine_Semantics_s.ms_stack =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_stack);
            Vale_X64_Machine_Semantics_s.ms_stackTaint =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_stackTaint);
            Vale_X64_Machine_Semantics_s.ms_trace =
              (uu___1.Vale_X64_Machine_Semantics_s.ms_trace)
          }








let (filt_state :
  Vale_X64_Machine_Semantics_s.machine_state ->
    Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun s ->
    let uu___ = s in
    {
      Vale_X64_Machine_Semantics_s.ms_ok =
        (uu___.Vale_X64_Machine_Semantics_s.ms_ok);
      Vale_X64_Machine_Semantics_s.ms_regs =
        (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
      Vale_X64_Machine_Semantics_s.ms_flags =
        (uu___.Vale_X64_Machine_Semantics_s.ms_flags);
      Vale_X64_Machine_Semantics_s.ms_heap =
        (uu___.Vale_X64_Machine_Semantics_s.ms_heap);
      Vale_X64_Machine_Semantics_s.ms_stack =
        (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
      Vale_X64_Machine_Semantics_s.ms_stackTaint =
        (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
      Vale_X64_Machine_Semantics_s.ms_trace = []
    }

let (run2 :
  unit Vale_X64_Machine_Semantics_s.st ->
    unit Vale_X64_Machine_Semantics_s.st ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun f1 ->
    fun f2 ->
      fun s ->
        FStar_Pervasives_Native.snd
          (let uu___ = f1 s in
           match uu___ with
           | (x, s1) ->
               let uu___1 =
                 let uu___2 = f2 s1 in
                 match uu___2 with
                 | (x1, s11) ->
                     let uu___3 = ((), s11) in
                     (match uu___3 with
                      | (y, s2) ->
                          ((),
                            (let uu___4 = s2 in
                             {
                               Vale_X64_Machine_Semantics_s.ms_ok =
                                 ((s1.Vale_X64_Machine_Semantics_s.ms_ok &&
                                     s11.Vale_X64_Machine_Semantics_s.ms_ok)
                                    && s2.Vale_X64_Machine_Semantics_s.ms_ok);
                               Vale_X64_Machine_Semantics_s.ms_regs =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_regs);
                               Vale_X64_Machine_Semantics_s.ms_flags =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_flags);
                               Vale_X64_Machine_Semantics_s.ms_heap =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_heap);
                               Vale_X64_Machine_Semantics_s.ms_stack =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_stack);
                               Vale_X64_Machine_Semantics_s.ms_stackTaint =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_stackTaint);
                               Vale_X64_Machine_Semantics_s.ms_trace =
                                 (uu___4.Vale_X64_Machine_Semantics_s.ms_trace)
                             }))) in
               (match uu___1 with
                | (y, s2) ->
                    ((),
                      (let uu___2 = s2 in
                       {
                         Vale_X64_Machine_Semantics_s.ms_ok =
                           ((s.Vale_X64_Machine_Semantics_s.ms_ok &&
                               s1.Vale_X64_Machine_Semantics_s.ms_ok)
                              && s2.Vale_X64_Machine_Semantics_s.ms_ok);
                         Vale_X64_Machine_Semantics_s.ms_regs =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_regs);
                         Vale_X64_Machine_Semantics_s.ms_flags =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_flags);
                         Vale_X64_Machine_Semantics_s.ms_heap =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_heap);
                         Vale_X64_Machine_Semantics_s.ms_stack =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_stack);
                         Vale_X64_Machine_Semantics_s.ms_stackTaint =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_stackTaint);
                         Vale_X64_Machine_Semantics_s.ms_trace =
                           (uu___2.Vale_X64_Machine_Semantics_s.ms_trace)
                       }))))
type ('s, 'f1, 'f2) commutes = unit







let rec (value_of_const_loc :
  Vale_Transformers_BoundedInstructionEffects.locations_with_values ->
    Vale_Transformers_Locations.location_eq ->
      unit Vale_Transformers_Locations.location_val_eqt)
  =
  fun lv ->
    fun l ->
      let uu___ = lv in
      match uu___ with
      | x::xs ->
          if (FStar_Pervasives.dfst x) = l
          then FStar_Pervasives.dsnd x
          else value_of_const_loc xs l













let (wrap_ss :
  (Vale_X64_Machine_Semantics_s.machine_state ->
     Vale_X64_Machine_Semantics_s.machine_state)
    -> unit Vale_X64_Machine_Semantics_s.st)
  =
  fun f ->
    fun s0 ->
      let uu___ = (s0, s0) in
      match uu___ with
      | (x, s1) ->
          let uu___1 = ((), (f x)) in
          (match uu___1 with
           | (y, s2) ->
               ((),
                 (let uu___2 = s2 in
                  {
                    Vale_X64_Machine_Semantics_s.ms_ok =
                      ((s0.Vale_X64_Machine_Semantics_s.ms_ok &&
                          s1.Vale_X64_Machine_Semantics_s.ms_ok)
                         && s2.Vale_X64_Machine_Semantics_s.ms_ok);
                    Vale_X64_Machine_Semantics_s.ms_regs =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_regs);
                    Vale_X64_Machine_Semantics_s.ms_flags =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_flags);
                    Vale_X64_Machine_Semantics_s.ms_heap =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_heap);
                    Vale_X64_Machine_Semantics_s.ms_stack =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_stack);
                    Vale_X64_Machine_Semantics_s.ms_stackTaint =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_stackTaint);
                    Vale_X64_Machine_Semantics_s.ms_trace =
                      (uu___2.Vale_X64_Machine_Semantics_s.ms_trace)
                  })))
let (wrap_sos :
  (Vale_X64_Machine_Semantics_s.machine_state ->
     Vale_X64_Machine_Semantics_s.machine_state
       FStar_Pervasives_Native.option)
    -> unit Vale_X64_Machine_Semantics_s.st)
  =
  fun f ->
    fun s ->
      match f s with
      | FStar_Pervasives_Native.None ->
          ((),
            (let uu___ = s in
             {
               Vale_X64_Machine_Semantics_s.ms_ok = false;
               Vale_X64_Machine_Semantics_s.ms_regs =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
               Vale_X64_Machine_Semantics_s.ms_flags =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_flags);
               Vale_X64_Machine_Semantics_s.ms_heap =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_heap);
               Vale_X64_Machine_Semantics_s.ms_stack =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
               Vale_X64_Machine_Semantics_s.ms_stackTaint =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
               Vale_X64_Machine_Semantics_s.ms_trace =
                 (uu___.Vale_X64_Machine_Semantics_s.ms_trace)
             }))
      | FStar_Pervasives_Native.Some s' -> ((), s')

let rec (safely_bounded_code_p :
  Vale_X64_Machine_Semantics_s.code -> Prims.bool) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins i ->
        Vale_Transformers_BoundedInstructionEffects.safely_bounded i
    | Vale_X64_Machine_s.Block l -> safely_bounded_codes_p l
    | Vale_X64_Machine_s.IfElse (c1, t, f) -> false
    | Vale_X64_Machine_s.While (c1, b) -> false
and (safely_bounded_codes_p :
  Vale_X64_Machine_Semantics_s.codes -> Prims.bool) =
  fun l ->
    match l with
    | [] -> true
    | x::xs -> (safely_bounded_code_p x) && (safely_bounded_codes_p xs)
type safely_bounded_ins = Vale_X64_Machine_Semantics_s.ins
type safely_bounded_code = Vale_X64_Machine_Semantics_s.code
type safely_bounded_codes = Vale_X64_Machine_Semantics_s.codes





let rec (rw_set_of_code :
  safely_bounded_code -> Vale_Transformers_BoundedInstructionEffects.rw_set)
  =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins i ->
        Vale_Transformers_BoundedInstructionEffects.rw_set_of_ins i
    | Vale_X64_Machine_s.Block l -> rw_set_of_codes l
    | Vale_X64_Machine_s.IfElse (c1, t, f) ->
        Vale_Transformers_BoundedInstructionEffects.add_r_to_rw_set
          (Vale_Transformers_BoundedInstructionEffects.locations_of_ocmp c1)
          (Vale_Transformers_BoundedInstructionEffects.rw_set_in_parallel
             (rw_set_of_code t) (rw_set_of_code f))
    | Vale_X64_Machine_s.While (c1, b) ->
        let uu___ =
          Vale_Transformers_BoundedInstructionEffects.add_r_to_rw_set
            (Vale_Transformers_BoundedInstructionEffects.locations_of_ocmp c1)
            (rw_set_of_code b) in
        {
          Vale_Transformers_BoundedInstructionEffects.loc_reads =
            (uu___.Vale_Transformers_BoundedInstructionEffects.loc_reads);
          Vale_Transformers_BoundedInstructionEffects.loc_writes =
            (uu___.Vale_Transformers_BoundedInstructionEffects.loc_writes);
          Vale_Transformers_BoundedInstructionEffects.loc_constant_writes =
            []
        }
and (rw_set_of_codes :
  safely_bounded_codes -> Vale_Transformers_BoundedInstructionEffects.rw_set)
  =
  fun c ->
    match c with
    | [] ->
        {
          Vale_Transformers_BoundedInstructionEffects.loc_reads = [];
          Vale_Transformers_BoundedInstructionEffects.loc_writes = [];
          Vale_Transformers_BoundedInstructionEffects.loc_constant_writes =
            []
        }
    | x::xs ->
        Vale_Transformers_BoundedInstructionEffects.rw_set_in_series
          (rw_set_of_code x) (rw_set_of_codes xs)










let (code_exchange_allowed :
  safely_bounded_code ->
    safely_bounded_code -> unit Vale_Def_PossiblyMonad.possibly)
  =
  fun c1 ->
    fun c2 ->
      match rw_exchange_allowed (rw_set_of_code c1) (rw_set_of_code c2) with
      | Vale_Def_PossiblyMonad.Ok () -> Vale_Def_PossiblyMonad.Ok ()
      | Vale_Def_PossiblyMonad.Err rr ->
          Vale_Def_PossiblyMonad.Err
            (Prims.strcat rr
               (Prims.op_Hat " for instructions "
                  (Prims.op_Hat
                     (FStar_Pervasives_Native.fst
                        (Vale_X64_Print_s.print_code c1 Prims.int_zero
                           Vale_X64_Print_s.gcc))
                     (Prims.op_Hat " and "
                        (FStar_Pervasives_Native.fst
                           (Vale_X64_Print_s.print_code c2 Prims.int_zero
                              Vale_X64_Print_s.gcc))))))

let rec (bubble_to_top :
  Vale_X64_Machine_Semantics_s.codes ->
    Prims.nat ->
      Vale_X64_Machine_Semantics_s.codes Vale_Def_PossiblyMonad.possibly)
  =
  fun cs ->
    fun i ->
      match cs with
      | uu___::[] -> Vale_Def_PossiblyMonad.Ok []
      | h::t ->
          if i = Prims.int_zero
          then Vale_Def_PossiblyMonad.Ok t
          else
            (let x = FStar_List_Tot_Base.index cs i in
             if Prims.op_Negation (safely_bounded_code_p x)
             then
               Vale_Def_PossiblyMonad.Err
                 (Prims.strcat "Cannot safely move "
                    (FStar_Pervasives_Native.fst
                       (Vale_X64_Print_s.print_code x Prims.int_zero
                          Vale_X64_Print_s.gcc)))
             else
               if Prims.op_Negation (safely_bounded_code_p h)
               then
                 Vale_Def_PossiblyMonad.Err
                   (Prims.strcat "Cannot safely move beyond "
                      (FStar_Pervasives_Native.fst
                         (Vale_X64_Print_s.print_code h Prims.int_zero
                            Vale_X64_Print_s.gcc)))
               else
                 (match bubble_to_top t (i - Prims.int_one) with
                  | Vale_Def_PossiblyMonad.Err reason ->
                      Vale_Def_PossiblyMonad.Err reason
                  | Vale_Def_PossiblyMonad.Ok res ->
                      (match code_exchange_allowed x h with
                       | Vale_Def_PossiblyMonad.Err reason ->
                           Vale_Def_PossiblyMonad.Err reason
                       | Vale_Def_PossiblyMonad.Ok () ->
                           Vale_Def_PossiblyMonad.Ok (h :: res))))
let rec (num_blocks_in_codes :
  Vale_X64_Machine_Semantics_s.codes -> Prims.nat) =
  fun c ->
    match c with
    | [] -> Prims.int_zero
    | (Vale_X64_Machine_s.Block l)::t ->
        (Prims.int_one + (num_blocks_in_codes l)) + (num_blocks_in_codes t)
    | uu___::t -> num_blocks_in_codes t

type transformation_hint =
  | MoveUpFrom of Prims.nat 
  | DiveInAt of Prims.nat * transformation_hint 
  | InPlaceIfElse of transformation_hint Prims.list * transformation_hint
  Prims.list 
  | InPlaceWhile of transformation_hint Prims.list 
let (uu___is_MoveUpFrom : transformation_hint -> Prims.bool) =
  fun projectee ->
    match projectee with | MoveUpFrom p -> true | uu___ -> false
let (__proj__MoveUpFrom__item__p : transformation_hint -> Prims.nat) =
  fun projectee -> match projectee with | MoveUpFrom p -> p
let (uu___is_DiveInAt : transformation_hint -> Prims.bool) =
  fun projectee ->
    match projectee with | DiveInAt (p, q) -> true | uu___ -> false
let (__proj__DiveInAt__item__p : transformation_hint -> Prims.nat) =
  fun projectee -> match projectee with | DiveInAt (p, q) -> p
let (__proj__DiveInAt__item__q : transformation_hint -> transformation_hint)
  = fun projectee -> match projectee with | DiveInAt (p, q) -> q
let (uu___is_InPlaceIfElse : transformation_hint -> Prims.bool) =
  fun projectee ->
    match projectee with
    | InPlaceIfElse (ifTrue, ifFalse) -> true
    | uu___ -> false
let (__proj__InPlaceIfElse__item__ifTrue :
  transformation_hint -> transformation_hint Prims.list) =
  fun projectee ->
    match projectee with | InPlaceIfElse (ifTrue, ifFalse) -> ifTrue
let (__proj__InPlaceIfElse__item__ifFalse :
  transformation_hint -> transformation_hint Prims.list) =
  fun projectee ->
    match projectee with | InPlaceIfElse (ifTrue, ifFalse) -> ifFalse
let (uu___is_InPlaceWhile : transformation_hint -> Prims.bool) =
  fun projectee ->
    match projectee with | InPlaceWhile whileBody -> true | uu___ -> false
let (__proj__InPlaceWhile__item__whileBody :
  transformation_hint -> transformation_hint Prims.list) =
  fun projectee -> match projectee with | InPlaceWhile whileBody -> whileBody
type transformation_hints = transformation_hint Prims.list
let rec (string_of_transformation_hint : transformation_hint -> Prims.string)
  =
  fun th ->
    match th with
    | MoveUpFrom p ->
        Prims.strcat "(MoveUpFrom "
          (Prims.strcat (Prims.string_of_int p) ")")
    | DiveInAt (p, q) ->
        Prims.strcat "(DiveInAt "
          (Prims.strcat (Prims.string_of_int p)
             (Prims.strcat " "
                (Prims.strcat (string_of_transformation_hint q) ")")))
    | InPlaceIfElse (tr, fa) ->
        Prims.strcat "(InPlaceIfElse "
          (Prims.strcat (string_of_transformation_hints tr)
             (Prims.strcat " "
                (Prims.strcat (string_of_transformation_hints fa) ")")))
    | InPlaceWhile bo ->
        Prims.strcat "(InPlaceWhile "
          (Prims.strcat (string_of_transformation_hints bo) ")")
and (aux_string_of_transformation_hints :
  transformation_hints -> Prims.string) =
  fun ts ->
    match ts with
    | [] -> ""
    | x::xs ->
        Prims.strcat (string_of_transformation_hint x)
          (Prims.strcat "; " (aux_string_of_transformation_hints xs))
and (string_of_transformation_hints : transformation_hints -> Prims.string) =
  fun ts ->
    Prims.strcat "["
      (Prims.strcat (aux_string_of_transformation_hints ts) "]")
let rec (wrap_diveinat :
  Prims.nat -> transformation_hints -> transformation_hints) =
  fun p ->
    fun l ->
      match l with
      | [] -> []
      | x::xs -> (DiveInAt (p, x)) :: (wrap_diveinat p xs)
let split3 :
  'a . 'a Prims.list -> Prims.nat -> ('a Prims.list * 'a * 'a Prims.list) =
  fun l ->
    fun i ->
      let uu___ = FStar_List_Tot_Base.splitAt i l in
      match uu___ with
      | (a1, as1) ->
          let uu___1 = as1 in (match uu___1 with | b::c -> (a1, b, c))
let rec (is_empty_code : Vale_X64_Machine_Semantics_s.code -> Prims.bool) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins uu___ -> false
    | Vale_X64_Machine_s.Block l -> is_empty_codes l
    | Vale_X64_Machine_s.IfElse (uu___, t, f) -> false
    | Vale_X64_Machine_s.While (uu___, c1) -> false
and (is_empty_codes : Vale_X64_Machine_Semantics_s.codes -> Prims.bool) =
  fun c ->
    match c with
    | [] -> true
    | x::xs -> (is_empty_code x) && (is_empty_codes xs)
let rec (perform_reordering_with_hint :
  transformation_hint ->
    Vale_X64_Machine_Semantics_s.codes ->
      Vale_X64_Machine_Semantics_s.codes Vale_Def_PossiblyMonad.possibly)
  =
  fun t ->
    fun c ->
      match c with
      | [] -> Vale_Def_PossiblyMonad.Err "trying to transform empty code"
      | x::xs ->
          if is_empty_codes [x]
          then perform_reordering_with_hint t xs
          else
            (match t with
             | MoveUpFrom i ->
                 if i < (FStar_List_Tot_Base.length c)
                 then
                   (match bubble_to_top c i with
                    | Vale_Def_PossiblyMonad.Err s ->
                        Vale_Def_PossiblyMonad.Err s
                    | Vale_Def_PossiblyMonad.Ok x' ->
                        Vale_Def_PossiblyMonad.Ok
                          ((FStar_List_Tot_Base.index c i) :: x'))
                 else
                   Vale_Def_PossiblyMonad.Err
                     (Prims.strcat "invalid hint : "
                        (string_of_transformation_hint t))
             | DiveInAt (i, t') ->
                 if i < (FStar_List_Tot_Base.length c)
                 then
                   let uu___1 = split3 c i in
                   (match uu___1 with
                    | (left, mid, right) ->
                        (match mid with
                         | Vale_X64_Machine_s.Block l ->
                             (match perform_reordering_with_hint t' l with
                              | Vale_Def_PossiblyMonad.Err s ->
                                  Vale_Def_PossiblyMonad.Err s
                              | Vale_Def_PossiblyMonad.Ok x' ->
                                  (match x' with
                                   | [] ->
                                       Vale_Def_PossiblyMonad.Err
                                         "impossible"
                                   | y::ys ->
                                       (match bubble_to_top
                                                (FStar_List_Tot_Base.append
                                                   left [y]) i
                                        with
                                        | Vale_Def_PossiblyMonad.Err s ->
                                            Vale_Def_PossiblyMonad.Err s
                                        | Vale_Def_PossiblyMonad.Ok x'1 ->
                                            Vale_Def_PossiblyMonad.Ok (y ::
                                              (FStar_List_Tot_Base.append x'1
                                                 ((Vale_X64_Machine_s.Block
                                                     ys) :: right))))))
                         | uu___2 ->
                             Vale_Def_PossiblyMonad.Err
                               (Prims.strcat
                                  "trying to dive into a non-block : "
                                  (Prims.strcat
                                     (string_of_transformation_hint t)
                                     (Prims.strcat " "
                                        (FStar_Pervasives_Native.fst
                                           (Vale_X64_Print_s.print_code
                                              (Vale_X64_Machine_s.Block c)
                                              Prims.int_zero
                                              Vale_X64_Print_s.gcc)))))))
                 else
                   Vale_Def_PossiblyMonad.Err
                     (Prims.strcat "invalid hint : "
                        (string_of_transformation_hint t))
             | InPlaceIfElse (tht, thf) ->
                 (match x with
                  | Vale_X64_Machine_s.IfElse
                      (c1, Vale_X64_Machine_s.Block t1,
                       Vale_X64_Machine_s.Block f)
                      ->
                      (match perform_reordering_with_hints tht t1 with
                       | Vale_Def_PossiblyMonad.Err s ->
                           Vale_Def_PossiblyMonad.Err s
                       | Vale_Def_PossiblyMonad.Ok x' ->
                           (match perform_reordering_with_hints thf f with
                            | Vale_Def_PossiblyMonad.Err s ->
                                Vale_Def_PossiblyMonad.Err s
                            | Vale_Def_PossiblyMonad.Ok x'1 ->
                                Vale_Def_PossiblyMonad.Ok
                                  ((Vale_X64_Machine_s.IfElse
                                      (c1, (Vale_X64_Machine_s.Block x'),
                                        (Vale_X64_Machine_s.Block x'1)))
                                  :: xs)))
                  | uu___1 ->
                      Vale_Def_PossiblyMonad.Err
                        (Prims.strcat "Invalid hint : "
                           (Prims.strcat (string_of_transformation_hint t)
                              (Prims.strcat " for codes "
                                 (FStar_Pervasives_Native.fst
                                    (Vale_X64_Print_s.print_code
                                       (Vale_X64_Machine_s.Block c)
                                       Prims.int_zero Vale_X64_Print_s.gcc))))))
             | InPlaceWhile thb ->
                 (match x with
                  | Vale_X64_Machine_s.While (c1, Vale_X64_Machine_s.Block b)
                      ->
                      (match perform_reordering_with_hints thb b with
                       | Vale_Def_PossiblyMonad.Err s ->
                           Vale_Def_PossiblyMonad.Err s
                       | Vale_Def_PossiblyMonad.Ok x' ->
                           Vale_Def_PossiblyMonad.Ok
                             ((Vale_X64_Machine_s.While
                                 (c1, (Vale_X64_Machine_s.Block x')))
                             :: xs))
                  | uu___1 ->
                      Vale_Def_PossiblyMonad.Err
                        (Prims.strcat "Invalid hint : "
                           (Prims.strcat (string_of_transformation_hint t)
                              (Prims.strcat " for codes "
                                 (FStar_Pervasives_Native.fst
                                    (Vale_X64_Print_s.print_code
                                       (Vale_X64_Machine_s.Block c)
                                       Prims.int_zero Vale_X64_Print_s.gcc)))))))
and (perform_reordering_with_hints :
  transformation_hints ->
    Vale_X64_Machine_Semantics_s.codes ->
      Vale_X64_Machine_Semantics_s.codes Vale_Def_PossiblyMonad.possibly)
  =
  fun ts ->
    fun c ->
      match ts with
      | [] ->
          if is_empty_codes c
          then Vale_Def_PossiblyMonad.Ok []
          else
            Vale_Def_PossiblyMonad.Err
              (Prims.strcat "no more transformation hints for "
                 (FStar_Pervasives_Native.fst
                    (Vale_X64_Print_s.print_code (Vale_X64_Machine_s.Block c)
                       Prims.int_zero Vale_X64_Print_s.gcc)))
      | t::ts' ->
          (match perform_reordering_with_hint t c with
           | Vale_Def_PossiblyMonad.Err s -> Vale_Def_PossiblyMonad.Err s
           | Vale_Def_PossiblyMonad.Ok x' ->
               (match x' with
                | [] -> Vale_Def_PossiblyMonad.Err "impossible"
                | x::xs ->
                    if is_empty_codes [x]
                    then
                      Vale_Def_PossiblyMonad.Err
                        "Trying to move 'empty' code."
                    else
                      (match perform_reordering_with_hints ts' xs with
                       | Vale_Def_PossiblyMonad.Err s ->
                           Vale_Def_PossiblyMonad.Err s
                       | Vale_Def_PossiblyMonad.Ok x'1 ->
                           Vale_Def_PossiblyMonad.Ok (x :: x'1))))
let (eq_ins :
  Vale_X64_Machine_Semantics_s.ins ->
    Vale_X64_Machine_Semantics_s.ins -> Prims.bool)
  =
  fun i1 ->
    fun i2 ->
      (Vale_X64_Print_s.print_ins i1 Vale_X64_Print_s.gcc) =
        (Vale_X64_Print_s.print_ins i2 Vale_X64_Print_s.gcc)
let rec (eq_code :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Machine_Semantics_s.code -> Prims.bool)
  =
  fun c1 ->
    fun c2 ->
      match (c1, c2) with
      | (Vale_X64_Machine_s.Ins i1, Vale_X64_Machine_s.Ins i2) ->
          eq_ins i1 i2
      | (Vale_X64_Machine_s.Block l1, Vale_X64_Machine_s.Block l2) ->
          eq_codes l1 l2
      | (Vale_X64_Machine_s.IfElse (c11, t1, f1), Vale_X64_Machine_s.IfElse
         (c21, t2, f2)) ->
          ((c11 = c21) && (eq_code t1 t2)) && (eq_code f1 f2)
      | (Vale_X64_Machine_s.While (c11, b1), Vale_X64_Machine_s.While
         (c21, b2)) -> (c11 = c21) && (eq_code b1 b2)
      | (uu___, uu___1) -> false
and (eq_codes :
  Vale_X64_Machine_Semantics_s.codes ->
    Vale_X64_Machine_Semantics_s.codes -> Prims.bool)
  =
  fun c1 ->
    fun c2 ->
      match (c1, c2) with
      | ([], []) -> true
      | (uu___, []) -> false
      | ([], uu___) -> false
      | (x::xs, y::ys) -> (eq_code x y) && (eq_codes xs ys)
let rec (fully_unblocked_code :
  Vale_X64_Machine_Semantics_s.code -> Vale_X64_Machine_Semantics_s.codes) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Ins i -> [c]
    | Vale_X64_Machine_s.Block l -> fully_unblocked_codes l
    | Vale_X64_Machine_s.IfElse (c1, t, f) ->
        [Vale_X64_Machine_s.IfElse
           (c1, (Vale_X64_Machine_s.Block (fully_unblocked_code t)),
             (Vale_X64_Machine_s.Block (fully_unblocked_code f)))]
    | Vale_X64_Machine_s.While (c1, b) ->
        [Vale_X64_Machine_s.While
           (c1, (Vale_X64_Machine_s.Block (fully_unblocked_code b)))]
and (fully_unblocked_codes :
  Vale_X64_Machine_Semantics_s.codes -> Vale_X64_Machine_Semantics_s.codes) =
  fun c ->
    match c with
    | [] -> []
    | x::xs ->
        FStar_List_Tot_Base.append (fully_unblocked_code x)
          (fully_unblocked_codes xs)
let (increment_hint : transformation_hint -> transformation_hint) =
  fun th ->
    match th with
    | MoveUpFrom p -> MoveUpFrom (p + Prims.int_one)
    | DiveInAt (p, q) -> DiveInAt ((p + Prims.int_one), q)
    | uu___ -> th
let rec (find_deep_code_transform :
  Vale_X64_Machine_Semantics_s.code ->
    Vale_X64_Machine_Semantics_s.codes ->
      transformation_hint Vale_Def_PossiblyMonad.possibly)
  =
  fun c ->
    fun cs ->
      match cs with
      | [] ->
          Vale_Def_PossiblyMonad.Err
            (Prims.strcat "Not found (during find_deep_code_transform): "
               (FStar_Pervasives_Native.fst
                  (Vale_X64_Print_s.print_code c Prims.int_zero
                     Vale_X64_Print_s.gcc)))
      | x::xs ->
          if is_empty_code x
          then find_deep_code_transform c xs
          else
            if eq_codes (fully_unblocked_code x) (fully_unblocked_code c)
            then Vale_Def_PossiblyMonad.Ok (MoveUpFrom Prims.int_zero)
            else
              (match x with
               | Vale_X64_Machine_s.Block l ->
                   (match find_deep_code_transform c l with
                    | Vale_Def_PossiblyMonad.Ok t ->
                        Vale_Def_PossiblyMonad.Ok
                          (DiveInAt (Prims.int_zero, t))
                    | Vale_Def_PossiblyMonad.Err reason ->
                        (match find_deep_code_transform c xs with
                         | Vale_Def_PossiblyMonad.Err s ->
                             Vale_Def_PossiblyMonad.Err s
                         | Vale_Def_PossiblyMonad.Ok x' ->
                             Vale_Def_PossiblyMonad.Ok (increment_hint x')))
               | uu___2 ->
                   (match find_deep_code_transform c xs with
                    | Vale_Def_PossiblyMonad.Err s ->
                        Vale_Def_PossiblyMonad.Err s
                    | Vale_Def_PossiblyMonad.Ok x' ->
                        Vale_Def_PossiblyMonad.Ok (increment_hint x')))


let rec (find_transformation_hints :
  Vale_X64_Machine_Semantics_s.codes ->
    Vale_X64_Machine_Semantics_s.codes ->
      transformation_hints Vale_Def_PossiblyMonad.possibly)
  =
  fun c1 ->
    fun c2 ->
      let uu___ = ((is_empty_codes c1), (is_empty_codes c2)) in
      match uu___ with
      | (e1, e2) ->
          if e1 && e2
          then Vale_Def_PossiblyMonad.Ok []
          else
            if e2
            then
              Vale_Def_PossiblyMonad.Err
                (Prims.strcat "non empty first code: "
                   (FStar_Pervasives_Native.fst
                      (Vale_X64_Print_s.print_code
                         (Vale_X64_Machine_s.Block c1) Prims.int_zero
                         Vale_X64_Print_s.gcc)))
            else
              if e1
              then
                Vale_Def_PossiblyMonad.Err
                  (Prims.strcat "non empty second code: "
                     (FStar_Pervasives_Native.fst
                        (Vale_X64_Print_s.print_code
                           (Vale_X64_Machine_s.Block c2) Prims.int_zero
                           Vale_X64_Print_s.gcc)))
              else
                (let uu___4 = c1 in
                 match uu___4 with
                 | h1::t1 ->
                     let uu___5 = c2 in
                     (match uu___5 with
                      | h2::t2 ->
                          if is_empty_code h1
                          then find_transformation_hints t1 c2
                          else
                            if is_empty_code h2
                            then find_transformation_hints c1 t2
                            else
                              (match find_deep_code_transform h2 c1 with
                               | Vale_Def_PossiblyMonad.Ok th ->
                                   (match perform_reordering_with_hint th c1
                                    with
                                    | Vale_Def_PossiblyMonad.Ok (h11::t11) ->
                                        (match find_transformation_hints t11
                                                 t2
                                         with
                                         | Vale_Def_PossiblyMonad.Err s ->
                                             Vale_Def_PossiblyMonad.Err s
                                         | Vale_Def_PossiblyMonad.Ok x' ->
                                             Vale_Def_PossiblyMonad.Ok (th ::
                                               x'))
                                    | Vale_Def_PossiblyMonad.Ok [] ->
                                        Vale_Def_PossiblyMonad.Err
                                          "Impossible"
                                    | Vale_Def_PossiblyMonad.Err reason ->
                                        Vale_Def_PossiblyMonad.Err
                                          (Prims.strcat
                                             "Unable to find valid movement for : "
                                             (Prims.strcat
                                                (FStar_Pervasives_Native.fst
                                                   (Vale_X64_Print_s.print_code
                                                      h2 Prims.int_zero
                                                      Vale_X64_Print_s.gcc))
                                                (Prims.strcat ". Reason: "
                                                   reason))))
                               | Vale_Def_PossiblyMonad.Err reason ->
                                   let uu___8 = c1 in
                                   (match uu___8 with
                                    | h11::t11 ->
                                        (match (h11, h2) with
                                         | (Vale_X64_Machine_s.Block l1,
                                            Vale_X64_Machine_s.Block l2) ->
                                             (match match find_transformation_hints
                                                            l1 l2
                                                    with
                                                    | Vale_Def_PossiblyMonad.Err
                                                        s ->
                                                        Vale_Def_PossiblyMonad.Err
                                                          s
                                                    | Vale_Def_PossiblyMonad.Ok
                                                        x' ->
                                                        (match find_transformation_hints
                                                                 t11 t2
                                                         with
                                                         | Vale_Def_PossiblyMonad.Err
                                                             s ->
                                                             Vale_Def_PossiblyMonad.Err
                                                               s
                                                         | Vale_Def_PossiblyMonad.Ok
                                                             x'1 ->
                                                             Vale_Def_PossiblyMonad.Ok
                                                               (FStar_List_Tot_Base.append
                                                                  (wrap_diveinat
                                                                    Prims.int_zero
                                                                    x') x'1))
                                              with
                                              | Vale_Def_PossiblyMonad.Ok ths
                                                  ->
                                                  Vale_Def_PossiblyMonad.Ok
                                                    ths
                                              | Vale_Def_PossiblyMonad.Err
                                                  reason1 ->
                                                  find_transformation_hints
                                                    c1
                                                    (FStar_List_Tot_Base.append
                                                       l2 t2))
                                         | (Vale_X64_Machine_s.IfElse
                                            (co1, Vale_X64_Machine_s.Block
                                             tr1, Vale_X64_Machine_s.Block
                                             fa1),
                                            Vale_X64_Machine_s.IfElse
                                            (co2, Vale_X64_Machine_s.Block
                                             tr2, Vale_X64_Machine_s.Block
                                             fa2)) ->
                                             (match if co1 = co2
                                                    then
                                                      Vale_Def_PossiblyMonad.Ok
                                                        ()
                                                    else
                                                      Vale_Def_PossiblyMonad.Err
                                                        (Prims.strcat
                                                           "Non-same conditions for IfElse: ("
                                                           (Prims.strcat
                                                              (Vale_X64_Print_s.print_cmp
                                                                 co1
                                                                 Prims.int_zero
                                                                 Vale_X64_Print_s.gcc)
                                                              (Prims.strcat
                                                                 ") and ("
                                                                 (Prims.strcat
                                                                    (
                                                                    Vale_X64_Print_s.print_cmp
                                                                    co2
                                                                    Prims.int_zero
                                                                    Vale_X64_Print_s.gcc)
                                                                    ")"))))
                                              with
                                              | Vale_Def_PossiblyMonad.Err s
                                                  ->
                                                  Vale_Def_PossiblyMonad.Err
                                                    s
                                              | Vale_Def_PossiblyMonad.Ok x'
                                                  ->
                                                  (match find_transformation_hints
                                                           tr1 tr2
                                                   with
                                                   | Vale_Def_PossiblyMonad.Err
                                                       s ->
                                                       Vale_Def_PossiblyMonad.Err
                                                         s
                                                   | Vale_Def_PossiblyMonad.Ok
                                                       x'1 ->
                                                       (match find_transformation_hints
                                                                fa1 fa2
                                                        with
                                                        | Vale_Def_PossiblyMonad.Err
                                                            s ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              s
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            x'2 ->
                                                            (match find_transformation_hints
                                                                    t11 t2
                                                             with
                                                             | Vale_Def_PossiblyMonad.Err
                                                                 s ->
                                                                 Vale_Def_PossiblyMonad.Err
                                                                   s
                                                             | Vale_Def_PossiblyMonad.Ok
                                                                 x'3 ->
                                                                 Vale_Def_PossiblyMonad.Ok
                                                                   ((
                                                                   InPlaceIfElse
                                                                    (x'1,
                                                                    x'2))
                                                                   :: x'3)))))
                                         | (Vale_X64_Machine_s.While
                                            (co1, Vale_X64_Machine_s.Block
                                             bo1),
                                            Vale_X64_Machine_s.While
                                            (co2, Vale_X64_Machine_s.Block
                                             bo2)) ->
                                             (match if co1 = co2
                                                    then
                                                      Vale_Def_PossiblyMonad.Ok
                                                        ()
                                                    else
                                                      Vale_Def_PossiblyMonad.Err
                                                        (Prims.strcat
                                                           "Non-same conditions for While: ("
                                                           (Prims.strcat
                                                              (Vale_X64_Print_s.print_cmp
                                                                 co1
                                                                 Prims.int_zero
                                                                 Vale_X64_Print_s.gcc)
                                                              (Prims.strcat
                                                                 ") and ("
                                                                 (Prims.strcat
                                                                    (
                                                                    Vale_X64_Print_s.print_cmp
                                                                    co2
                                                                    Prims.int_zero
                                                                    Vale_X64_Print_s.gcc)
                                                                    ")"))))
                                              with
                                              | Vale_Def_PossiblyMonad.Err s
                                                  ->
                                                  Vale_Def_PossiblyMonad.Err
                                                    s
                                              | Vale_Def_PossiblyMonad.Ok x'
                                                  ->
                                                  (match find_transformation_hints
                                                           bo1 bo2
                                                   with
                                                   | Vale_Def_PossiblyMonad.Err
                                                       s ->
                                                       Vale_Def_PossiblyMonad.Err
                                                         s
                                                   | Vale_Def_PossiblyMonad.Ok
                                                       x'1 ->
                                                       (match find_transformation_hints
                                                                t11 t2
                                                        with
                                                        | Vale_Def_PossiblyMonad.Err
                                                            s ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              s
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            x'2 ->
                                                            Vale_Def_PossiblyMonad.Ok
                                                              ((InPlaceWhile
                                                                  x'1)
                                                              :: x'2))))
                                         | (Vale_X64_Machine_s.Block l1,
                                            Vale_X64_Machine_s.IfElse
                                            (uu___9, uu___10, uu___11)) ->
                                             (match find_transformation_hints
                                                      (FStar_List_Tot_Base.append
                                                         l1 t11) c2
                                              with
                                              | Vale_Def_PossiblyMonad.Err s
                                                  ->
                                                  Vale_Def_PossiblyMonad.Err
                                                    s
                                              | Vale_Def_PossiblyMonad.Ok x'
                                                  ->
                                                  (match x' with
                                                   | [] ->
                                                       Vale_Def_PossiblyMonad.Err
                                                         "Impossible"
                                                   | th::uu___12 ->
                                                       let th1 =
                                                         DiveInAt
                                                           (Prims.int_zero,
                                                             th) in
                                                       (match perform_reordering_with_hint
                                                                th1 c1
                                                        with
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            (h12::t12) ->
                                                            (match find_transformation_hints
                                                                    t12 t2
                                                             with
                                                             | Vale_Def_PossiblyMonad.Err
                                                                 s ->
                                                                 Vale_Def_PossiblyMonad.Err
                                                                   s
                                                             | Vale_Def_PossiblyMonad.Ok
                                                                 x'1 ->
                                                                 Vale_Def_PossiblyMonad.Ok
                                                                   (th1 ::
                                                                   x'1))
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            [] ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              "Impossible"
                                                        | Vale_Def_PossiblyMonad.Err
                                                            reason1 ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              (Prims.strcat
                                                                 "Failed during left-unblock for "
                                                                 (Prims.strcat
                                                                    (
                                                                    FStar_Pervasives_Native.fst
                                                                    (Vale_X64_Print_s.print_code
                                                                    h2
                                                                    Prims.int_zero
                                                                    Vale_X64_Print_s.gcc))
                                                                    (
                                                                    Prims.strcat
                                                                    ". Reason: "
                                                                    reason1))))))
                                         | (Vale_X64_Machine_s.Block l1,
                                            Vale_X64_Machine_s.While
                                            (uu___9, uu___10)) ->
                                             (match find_transformation_hints
                                                      (FStar_List_Tot_Base.append
                                                         l1 t11) c2
                                              with
                                              | Vale_Def_PossiblyMonad.Err s
                                                  ->
                                                  Vale_Def_PossiblyMonad.Err
                                                    s
                                              | Vale_Def_PossiblyMonad.Ok x'
                                                  ->
                                                  (match x' with
                                                   | [] ->
                                                       Vale_Def_PossiblyMonad.Err
                                                         "Impossible"
                                                   | th::uu___11 ->
                                                       let th1 =
                                                         DiveInAt
                                                           (Prims.int_zero,
                                                             th) in
                                                       (match perform_reordering_with_hint
                                                                th1 c1
                                                        with
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            (h12::t12) ->
                                                            (match find_transformation_hints
                                                                    t12 t2
                                                             with
                                                             | Vale_Def_PossiblyMonad.Err
                                                                 s ->
                                                                 Vale_Def_PossiblyMonad.Err
                                                                   s
                                                             | Vale_Def_PossiblyMonad.Ok
                                                                 x'1 ->
                                                                 Vale_Def_PossiblyMonad.Ok
                                                                   (th1 ::
                                                                   x'1))
                                                        | Vale_Def_PossiblyMonad.Ok
                                                            [] ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              "Impossible"
                                                        | Vale_Def_PossiblyMonad.Err
                                                            reason1 ->
                                                            Vale_Def_PossiblyMonad.Err
                                                              (Prims.strcat
                                                                 "Failed during left-unblock for "
                                                                 (Prims.strcat
                                                                    (
                                                                    FStar_Pervasives_Native.fst
                                                                    (Vale_X64_Print_s.print_code
                                                                    h2
                                                                    Prims.int_zero
                                                                    Vale_X64_Print_s.gcc))
                                                                    (
                                                                    Prims.strcat
                                                                    ". Reason: "
                                                                    reason1))))))
                                         | (uu___9, Vale_X64_Machine_s.Block
                                            l2) ->
                                             find_transformation_hints c1
                                               (FStar_List_Tot_Base.append l2
                                                  t2)
                                         | (Vale_X64_Machine_s.IfElse
                                            (uu___9, uu___10, uu___11),
                                            Vale_X64_Machine_s.IfElse
                                            (uu___12, uu___13, uu___14)) ->
                                             Vale_Def_PossiblyMonad.Err
                                               (Prims.strcat
                                                  "Found weird non-standard code: "
                                                  (FStar_Pervasives_Native.fst
                                                     (Vale_X64_Print_s.print_code
                                                        h11 Prims.int_zero
                                                        Vale_X64_Print_s.gcc)))
                                         | (Vale_X64_Machine_s.While
                                            (uu___9, uu___10),
                                            Vale_X64_Machine_s.While
                                            (uu___11, uu___12)) ->
                                             Vale_Def_PossiblyMonad.Err
                                               (Prims.strcat
                                                  "Found weird non-standard code: "
                                                  (FStar_Pervasives_Native.fst
                                                     (Vale_X64_Print_s.print_code
                                                        h11 Prims.int_zero
                                                        Vale_X64_Print_s.gcc)))
                                         | uu___9 ->
                                             Vale_Def_PossiblyMonad.Err
                                               (Prims.strcat
                                                  "Find deep code failure. Reason: "
                                                  reason))))))





let rec (purge_empty_code :
  Vale_X64_Machine_Semantics_s.code -> Vale_X64_Machine_Semantics_s.code) =
  fun c ->
    match c with
    | Vale_X64_Machine_s.Block l ->
        Vale_X64_Machine_s.Block (purge_empty_codes l)
    | Vale_X64_Machine_s.IfElse (c1, t, f) ->
        Vale_X64_Machine_s.IfElse
          (c1, (purge_empty_code t), (purge_empty_code f))
    | Vale_X64_Machine_s.While (c1, b) ->
        Vale_X64_Machine_s.While (c1, (purge_empty_code b))
    | uu___ -> c
and (purge_empty_codes :
  Vale_X64_Machine_Semantics_s.codes -> Vale_X64_Machine_Semantics_s.codes) =
  fun cs ->
    match cs with
    | [] -> []
    | x::xs ->
        if is_empty_code x
        then purge_empty_codes xs
        else (purge_empty_code x) :: (purge_empty_codes xs)
