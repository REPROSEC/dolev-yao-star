open Prims
type location =
  | ALocMem 
  | ALocStack 
  | ALocReg of Vale_X64_Machine_s.reg 
  | ALocCf 
  | ALocOf 
let (uu___is_ALocMem : location -> Prims.bool) =
  fun projectee -> match projectee with | ALocMem -> true | uu___ -> false
let (uu___is_ALocStack : location -> Prims.bool) =
  fun projectee -> match projectee with | ALocStack -> true | uu___ -> false
let (uu___is_ALocReg : location -> Prims.bool) =
  fun projectee -> match projectee with | ALocReg _0 -> true | uu___ -> false
let (__proj__ALocReg__item___0 : location -> Vale_X64_Machine_s.reg) =
  fun projectee -> match projectee with | ALocReg _0 -> _0
let (uu___is_ALocCf : location -> Prims.bool) =
  fun projectee -> match projectee with | ALocCf -> true | uu___ -> false
let (uu___is_ALocOf : location -> Prims.bool) =
  fun projectee -> match projectee with | ALocOf -> true | uu___ -> false
type locations = location Prims.list
let (aux_print_reg_from_location : location -> Prims.string) =
  fun a ->
    let uu___ = a in
    match uu___ with
    | ALocReg (Vale_X64_Machine_s.Reg (file, id)) ->
        (match file with
         | uu___1 when uu___1 = Prims.int_zero ->
             Vale_X64_Print_s.print_reg_name id
         | uu___1 when uu___1 = Prims.int_one ->
             Vale_X64_Print_s.print_xmm id Vale_X64_Print_s.gcc)
let (disjoint_location :
  location -> location -> unit Vale_Def_PossiblyMonad.possibly) =
  fun a1 ->
    fun a2 ->
      match (a1, a2) with
      | (ALocCf, ALocCf) ->
          Vale_Def_PossiblyMonad.Err "carry flag not disjoint from itself"
      | (ALocOf, ALocOf) ->
          Vale_Def_PossiblyMonad.Err "overflow flag not disjoint from itself"
      | (ALocCf, uu___) -> Vale_Def_PossiblyMonad.Ok ()
      | (ALocOf, uu___) -> Vale_Def_PossiblyMonad.Ok ()
      | (uu___, ALocCf) -> Vale_Def_PossiblyMonad.Ok ()
      | (uu___, ALocOf) -> Vale_Def_PossiblyMonad.Ok ()
      | (ALocMem, ALocMem) ->
          Vale_Def_PossiblyMonad.Err "memory not disjoint from itself"
      | (ALocStack, ALocStack) ->
          Vale_Def_PossiblyMonad.Err "stack not disjoint from itself"
      | (ALocMem, ALocStack) -> Vale_Def_PossiblyMonad.Ok ()
      | (ALocStack, ALocMem) -> Vale_Def_PossiblyMonad.Ok ()
      | (ALocReg r1, ALocReg r2) ->
          if r1 <> r2
          then Vale_Def_PossiblyMonad.Ok ()
          else
            Vale_Def_PossiblyMonad.Err
              (Prims.strcat "register "
                 (Prims.strcat (aux_print_reg_from_location a1)
                    " not disjoint from itself"))
      | (ALocReg uu___, uu___1) -> Vale_Def_PossiblyMonad.Ok ()
      | (uu___, ALocReg uu___1) -> Vale_Def_PossiblyMonad.Ok ()

let (disjoint_location_from_locations :
  location -> location Prims.list -> unit Vale_Def_PossiblyMonad.possibly) =
  fun a ->
    fun l ->
      Vale_Def_PossiblyMonad.for_all (fun b -> disjoint_location a b) l
let (disjoint_locations :
  location Prims.list ->
    location Prims.list -> unit Vale_Def_PossiblyMonad.possibly)
  =
  fun l1 ->
    fun l2 ->
      Vale_Def_PossiblyMonad.for_all
        (fun x -> disjoint_location_from_locations x l2) l1


type 'a location_val_t = Obj.t
type 'a location_val_eqt = Obj.t
type location_eq = location
let (raise_location_val_eqt : location_eq -> Obj.t -> Obj.t) =
  fun uu___1 ->
    fun uu___ ->
      (fun l -> fun v -> Obj.magic (FStar_Universe.raise_val v)) uu___1 uu___
let (eval_location :
  location -> Vale_X64_Machine_Semantics_s.machine_state -> Obj.t) =
  fun a ->
    fun s ->
      match a with
      | ALocMem -> Obj.repr s.Vale_X64_Machine_Semantics_s.ms_heap
      | ALocStack ->
          Obj.repr
            (FStar_Universe.raise_val
               ((s.Vale_X64_Machine_Semantics_s.ms_stack),
                 (s.Vale_X64_Machine_Semantics_s.ms_stackTaint)))
      | ALocReg r ->
          Obj.repr
            (FStar_Universe.raise_val
               (s.Vale_X64_Machine_Semantics_s.ms_regs r))
      | ALocCf ->
          Obj.repr
            (FStar_Universe.raise_val
               (Vale_X64_Machine_Semantics_s.cf
                  s.Vale_X64_Machine_Semantics_s.ms_flags))
      | ALocOf ->
          Obj.repr
            (FStar_Universe.raise_val
               (Vale_X64_Machine_Semantics_s.overflow
                  s.Vale_X64_Machine_Semantics_s.ms_flags))
let (update_location :
  location ->
    Obj.t ->
      Vale_X64_Machine_Semantics_s.machine_state ->
        Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun a ->
    fun v ->
      fun s ->
        match a with
        | ALocMem ->
            let v1 = Obj.magic v in
            let uu___ = s in
            {
              Vale_X64_Machine_Semantics_s.ms_ok =
                (uu___.Vale_X64_Machine_Semantics_s.ms_ok);
              Vale_X64_Machine_Semantics_s.ms_regs =
                (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
              Vale_X64_Machine_Semantics_s.ms_flags =
                (uu___.Vale_X64_Machine_Semantics_s.ms_flags);
              Vale_X64_Machine_Semantics_s.ms_heap = v1;
              Vale_X64_Machine_Semantics_s.ms_stack =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
              Vale_X64_Machine_Semantics_s.ms_stackTaint =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
              Vale_X64_Machine_Semantics_s.ms_trace =
                (uu___.Vale_X64_Machine_Semantics_s.ms_trace)
            }
        | ALocStack ->
            let v1 = FStar_Universe.downgrade_val (Obj.magic v) in
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
                (FStar_Pervasives_Native.fst v1);
              Vale_X64_Machine_Semantics_s.ms_stackTaint =
                (FStar_Pervasives_Native.snd v1);
              Vale_X64_Machine_Semantics_s.ms_trace =
                (uu___.Vale_X64_Machine_Semantics_s.ms_trace)
            }
        | ALocReg r ->
            let v1 = FStar_Universe.downgrade_val (Obj.magic v) in
            Vale_X64_Machine_Semantics_s.update_reg' r v1 s
        | ALocCf ->
            let v1 = FStar_Universe.downgrade_val (Obj.magic v) in
            let uu___ = s in
            {
              Vale_X64_Machine_Semantics_s.ms_ok =
                (uu___.Vale_X64_Machine_Semantics_s.ms_ok);
              Vale_X64_Machine_Semantics_s.ms_regs =
                (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
              Vale_X64_Machine_Semantics_s.ms_flags =
                ((fun f ->
                    if f = Prims.int_zero
                    then v1
                    else s.Vale_X64_Machine_Semantics_s.ms_flags f));
              Vale_X64_Machine_Semantics_s.ms_heap =
                (uu___.Vale_X64_Machine_Semantics_s.ms_heap);
              Vale_X64_Machine_Semantics_s.ms_stack =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
              Vale_X64_Machine_Semantics_s.ms_stackTaint =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
              Vale_X64_Machine_Semantics_s.ms_trace =
                (uu___.Vale_X64_Machine_Semantics_s.ms_trace)
            }
        | ALocOf ->
            let v1 = FStar_Universe.downgrade_val (Obj.magic v) in
            let uu___ = s in
            {
              Vale_X64_Machine_Semantics_s.ms_ok =
                (uu___.Vale_X64_Machine_Semantics_s.ms_ok);
              Vale_X64_Machine_Semantics_s.ms_regs =
                (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
              Vale_X64_Machine_Semantics_s.ms_flags =
                ((fun f ->
                    if f = (Prims.of_int (11))
                    then v1
                    else s.Vale_X64_Machine_Semantics_s.ms_flags f));
              Vale_X64_Machine_Semantics_s.ms_heap =
                (uu___.Vale_X64_Machine_Semantics_s.ms_heap);
              Vale_X64_Machine_Semantics_s.ms_stack =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
              Vale_X64_Machine_Semantics_s.ms_stackTaint =
                (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
              Vale_X64_Machine_Semantics_s.ms_trace =
                (uu___.Vale_X64_Machine_Semantics_s.ms_trace)
            }

let (filter_state :
  Vale_X64_Machine_Semantics_s.machine_state ->
    Vale_X64_Machine_Semantics_s.flags_t ->
      Prims.bool ->
        Vale_X64_Machine_s.observation Prims.list ->
          Vale_X64_Machine_Semantics_s.machine_state)
  =
  fun s ->
    fun flags ->
      fun ok ->
        fun trace ->
          let uu___ = s in
          {
            Vale_X64_Machine_Semantics_s.ms_ok = ok;
            Vale_X64_Machine_Semantics_s.ms_regs =
              (uu___.Vale_X64_Machine_Semantics_s.ms_regs);
            Vale_X64_Machine_Semantics_s.ms_flags =
              (fun f ->
                 if f = Prims.int_zero
                 then s.Vale_X64_Machine_Semantics_s.ms_flags Prims.int_zero
                 else
                   if f = (Prims.of_int (11))
                   then
                     s.Vale_X64_Machine_Semantics_s.ms_flags
                       (Prims.of_int (11))
                   else flags f);
            Vale_X64_Machine_Semantics_s.ms_heap =
              (uu___.Vale_X64_Machine_Semantics_s.ms_heap);
            Vale_X64_Machine_Semantics_s.ms_stack =
              (uu___.Vale_X64_Machine_Semantics_s.ms_stack);
            Vale_X64_Machine_Semantics_s.ms_stackTaint =
              (uu___.Vale_X64_Machine_Semantics_s.ms_stackTaint);
            Vale_X64_Machine_Semantics_s.ms_trace = trace
          }

