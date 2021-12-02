open Prims
type code =
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
type codes =
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
    Prims.list
type fuel = Vale_X64_Decls.va_fuel
type ('c, 's0, 'f0, 'sN) eval =
  (unit, unit, unit, unit) Vale_X64_Decls.eval_code
type ('r, 'msg, 'p) labeled_wrap = (unit, unit, 'p) Prims.labeled
type ('r, 'msg, 'p) label = (unit, unit, 'p) labeled_wrap


type ('a, 'x, 'y) precedes_wrap = ('a, 'a, unit, unit) Prims.precedes
let rec (mods_contains1 :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_QuickCode.mod_t -> Prims.bool)
  =
  fun allowed ->
    fun found ->
      match allowed with
      | [] -> Vale_X64_QuickCode.mod_eq Vale_X64_QuickCode.Mod_None found
      | h::t ->
          (Vale_X64_QuickCode.mod_eq h found) || (mods_contains1 t found)
let rec (mods_contains :
  Vale_X64_QuickCode.mod_t Prims.list ->
    Vale_X64_QuickCode.mod_t Prims.list -> Prims.bool)
  =
  fun allowed ->
    fun found ->
      match found with
      | [] -> true
      | h::t -> (mods_contains1 allowed h) && (mods_contains allowed t)
let (if_code :
  Prims.bool ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun b -> fun c1 -> fun c2 -> if b then c1 else c2
type ('a, 'dummyV0) quickCodes =
  | QEmpty of 'a 
  | QSeq of unit * (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode * (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * Prims.range * Prims.string *
  (Obj.t, unit) Vale_X64_QuickCode.quickCode * ('a, unit) quickCodes 
  | QBind of unit * (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode * (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * Prims.range * Prims.string *
  (Obj.t, unit) Vale_X64_QuickCode.quickCode * unit 
  | QGetState of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * unit 
  | QPURE of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * Prims.range * Prims.string * unit *
  unit * ('a, unit) quickCodes 
  | QLemma of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * Prims.range * Prims.string * unit *
  unit * unit * ('a, unit) quickCodes 
  | QGhost of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * unit * Prims.range * Prims.string *
  unit * unit * unit * unit 
  | QAssertBy of (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp)
  Vale_X64_Machine_s.precode Prims.list * Prims.range * Prims.string * unit *
  (unit, unit) quickCodes * ('a, unit) quickCodes 
let uu___is_QEmpty :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QEmpty _0 -> true | uu___1 -> false
let __proj__QEmpty__item___0 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> 'a
  = fun uu___ -> fun projectee -> match projectee with | QEmpty _0 -> _0
let uu___is_QSeq :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QSeq (b, c, cs, r, msg, _5, _6) -> true
      | uu___1 -> false
let __proj__QSeq__item__c :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QSeq (b, c, cs, r, msg, _5, _6) -> c
let __proj__QSeq__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QSeq (b, c, cs, r, msg, _5, _6) -> cs
let __proj__QSeq__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QSeq (b, c, cs, r, msg, _5, _6) -> r
let __proj__QSeq__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QSeq (b, c, cs, r, msg, _5, _6) -> msg
let __proj__QSeq__item___5 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes -> (unit, unit) Vale_X64_QuickCode.quickCode
  =
  fun uu___1 ->
    fun uu___ ->
      (fun uu___ ->
         fun projectee ->
           match projectee with
           | QSeq (b, c, cs, r, msg, _5, _6) -> Obj.magic _5) uu___1 uu___
let __proj__QSeq__item___6 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QSeq (b, c, cs, r, msg, _5, _6) -> _6
let uu___is_QBind :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QBind (b, c, cs, r, msg, _5, _6) -> true
      | uu___1 -> false
let __proj__QBind__item__c :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QBind (b, c, cs, r, msg, _5, _6) -> c
let __proj__QBind__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QBind (b, c, cs, r, msg, _5, _6) -> cs
let __proj__QBind__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QBind (b, c, cs, r, msg, _5, _6) -> r
let __proj__QBind__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QBind (b, c, cs, r, msg, _5, _6) -> msg
let __proj__QBind__item___5 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes -> (unit, unit) Vale_X64_QuickCode.quickCode
  =
  fun uu___1 ->
    fun uu___ ->
      (fun uu___ ->
         fun projectee ->
           match projectee with
           | QBind (b, c, cs, r, msg, _5, _6) -> Obj.magic _5) uu___1 uu___

let uu___is_QGetState :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QGetState (cs, _1) -> true | uu___1 -> false
let __proj__QGetState__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee -> match projectee with | QGetState (cs, _1) -> cs

let uu___is_QPURE :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QPURE (cs, r, msg, pre, _4, _5) -> true
      | uu___1 -> false
let __proj__QPURE__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QPURE (cs, r, msg, pre, _4, _5) -> cs
let __proj__QPURE__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QPURE (cs, r, msg, pre, _4, _5) -> r
let __proj__QPURE__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QPURE (cs, r, msg, pre, _4, _5) -> msg

let __proj__QPURE__item___5 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QPURE (cs, r, msg, pre, _4, _5) -> _5
let uu___is_QLemma :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QLemma (cs, r, msg, pre, post, _5, _6) -> true
      | uu___1 -> false
let __proj__QLemma__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QLemma (cs, r, msg, pre, post, _5, _6) -> cs
let __proj__QLemma__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QLemma (cs, r, msg, pre, post, _5, _6) -> r
let __proj__QLemma__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QLemma (cs, r, msg, pre, post, _5, _6) -> msg

let __proj__QLemma__item___6 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QLemma (cs, r, msg, pre, post, _5, _6) -> _6
let uu___is_QGhost :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QGhost (cs, b, r, msg, pre, post, _6, _7) -> true
      | uu___1 -> false
let __proj__QGhost__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QGhost (cs, b, r, msg, pre, post, _6, _7) -> cs
let __proj__QGhost__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QGhost (cs, b, r, msg, pre, post, _6, _7) -> r
let __proj__QGhost__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QGhost (cs, b, r, msg, pre, post, _6, _7) -> msg


let uu___is_QAssertBy :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.bool
  =
  fun uu___ ->
    fun projectee ->
      match projectee with
      | QAssertBy (cs, r, msg, p, _4, _5) -> true
      | uu___1 -> false
let __proj__QAssertBy__item__cs :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      ('a, unit) quickCodes ->
        (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
          Prims.list
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QAssertBy (cs, r, msg, p, _4, _5) -> cs
let __proj__QAssertBy__item__r :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.range
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QAssertBy (cs, r, msg, p, _4, _5) -> r
let __proj__QAssertBy__item__msg :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> Prims.string
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QAssertBy (cs, r, msg, p, _4, _5) -> msg
let __proj__QAssertBy__item___4 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> (unit, unit) quickCodes
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QAssertBy (cs, r, msg, p, _4, _5) -> _4
let __proj__QAssertBy__item___5 :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun uu___ ->
    fun projectee ->
      match projectee with | QAssertBy (cs, r, msg, p, _4, _5) -> _5
let va_QBind :
  'a 'b .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
        Prims.list ->
        Prims.range ->
          Prims.string ->
            ('b, unit) Vale_X64_QuickCode.quickCode ->
              unit -> ('a, unit) quickCodes
  =
  fun c ->
    fun cs ->
      fun r ->
        fun msg ->
          fun qc -> fun qcs -> QBind ((), c, cs, r, msg, (Obj.magic qc), ())
let va_QEmpty : 'a . 'a -> ('a, unit) quickCodes = fun v -> QEmpty v
let va_QLemma :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Prims.range ->
        Prims.string ->
          unit ->
            unit -> unit -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun cs ->
    fun r ->
      fun msg ->
        fun pre ->
          fun post ->
            fun l -> fun qcs -> QLemma (cs, r, msg, (), (), (), qcs)
let va_QSeq :
  'a 'b .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
        Prims.list ->
        Prims.range ->
          Prims.string ->
            ('b, unit) Vale_X64_QuickCode.quickCode ->
              ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun c ->
    fun cs ->
      fun r ->
        fun msg ->
          fun qc -> fun qcs -> QSeq ((), c, cs, r, msg, (Obj.magic qc), qcs)
let (va_qPURE :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
    Prims.list ->
    unit ->
      unit ->
        Prims.range ->
          Prims.string ->
            unit -> (Obj.t, unit) quickCodes -> (Obj.t, unit) quickCodes)
  =
  fun cs ->
    fun pre ->
      fun a ->
        fun r ->
          fun msg -> fun l -> fun qcs -> QPURE (cs, r, msg, (), (), qcs)
type ('a, 'c, 'qc, 's0, 'k) wp_proc = Obj.t
type 'a wp_Seq_t = unit
type 'a wp_Bind_t = unit
type ('p, 'uuuuu, 'uuuuu1) k_AssertBy = 'p
let (va_range1 : Prims.range) =
  Prims.mk_range "" Prims.int_zero Prims.int_zero Prims.int_zero
    Prims.int_zero

type ('a, 'cs, 'qcs, 'mods, 'k, 's0) wp = Obj.t
type ('a, 'b, 'cs, 'qcs, 'mods, 'k) wp_Seq = Obj.t
type ('a, 'b, 'cs, 'qcs, 'mods, 'k) wp_Bind = Obj.t
type ('m, 's1, 's2) state_mod_eq = Obj.t











let (block :
  (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
    Prims.list ->
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode)
  = fun block1 -> Vale_X64_Machine_s.Block block1
type ('a, 'cs, 'qcs, 'mods, 's0, 'k) wp_block = Obj.t

let qblock :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Vale_X64_QuickCode.mod_t Prims.list ->
        unit -> ('a, unit) Vale_X64_QuickCode.quickCode
  =
  fun cs ->
    fun mods ->
      fun qcs ->
        Vale_X64_QuickCode.QProc
          ((Vale_X64_Machine_s.Block cs), mods, (), ())
type ('a, 'c1, 'c2, 'b, 'qc1, 'qc2, 'mods, 's0, 'k) wp_InlineIf = unit

let va_qInlineIf :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
        Vale_X64_QuickCode.mod_t Prims.list ->
          Prims.bool ->
            ('a, unit) Vale_X64_QuickCode.quickCode ->
              ('a, unit) Vale_X64_QuickCode.quickCode ->
                ('a, unit) Vale_X64_QuickCode.quickCode
  =
  fun c1 ->
    fun c2 ->
      fun mods ->
        fun b ->
          fun qc1 ->
            fun qc2 ->
              Vale_X64_QuickCode.QProc ((if_code b c1 c2), mods, (), ())
type cmp =
  | Cmp_eq of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | Cmp_ne of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | Cmp_le of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | Cmp_ge of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | Cmp_lt of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
  | Cmp_gt of Vale_X64_Machine_s.operand64 * Vale_X64_Machine_s.operand64 
let (uu___is_Cmp_eq : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_eq (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_eq__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_eq (o1, o2) -> o1
let (__proj__Cmp_eq__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_eq (o1, o2) -> o2
let (uu___is_Cmp_ne : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_ne (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_ne__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_ne (o1, o2) -> o1
let (__proj__Cmp_ne__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_ne (o1, o2) -> o2
let (uu___is_Cmp_le : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_le (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_le__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_le (o1, o2) -> o1
let (__proj__Cmp_le__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_le (o1, o2) -> o2
let (uu___is_Cmp_ge : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_ge (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_ge__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_ge (o1, o2) -> o1
let (__proj__Cmp_ge__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_ge (o1, o2) -> o2
let (uu___is_Cmp_lt : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_lt (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_lt__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_lt (o1, o2) -> o1
let (__proj__Cmp_lt__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_lt (o1, o2) -> o2
let (uu___is_Cmp_gt : cmp -> Prims.bool) =
  fun projectee ->
    match projectee with | Cmp_gt (o1, o2) -> true | uu___ -> false
let (__proj__Cmp_gt__item__o1 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_gt (o1, o2) -> o1
let (__proj__Cmp_gt__item__o2 : cmp -> Vale_X64_Machine_s.operand64) =
  fun projectee -> match projectee with | Cmp_gt (o1, o2) -> o2
let (cmp_to_ocmp : cmp -> Vale_X64_Decls.ocmp) =
  fun c ->
    match c with
    | Cmp_eq (o1, o2) -> Vale_X64_Decls.va_cmp_eq o1 o2
    | Cmp_ne (o1, o2) -> Vale_X64_Decls.va_cmp_ne o1 o2
    | Cmp_le (o1, o2) -> Vale_X64_Decls.va_cmp_le o1 o2
    | Cmp_ge (o1, o2) -> Vale_X64_Decls.va_cmp_ge o1 o2
    | Cmp_lt (o1, o2) -> Vale_X64_Decls.va_cmp_lt o1 o2
    | Cmp_gt (o1, o2) -> Vale_X64_Decls.va_cmp_gt o1 o2
type ('c, 's) valid_cmp = Obj.t

type ('a, 'c1, 'c2, 'b, 'qc1, 'qc2, 'mods, 's0, 'k) wp_If = unit

let va_qIf :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
        Vale_X64_QuickCode.mod_t Prims.list ->
          cmp ->
            ('a, unit) Vale_X64_QuickCode.quickCode ->
              ('a, unit) Vale_X64_QuickCode.quickCode ->
                ('a, unit) Vale_X64_QuickCode.quickCode
  =
  fun c1 ->
    fun c2 ->
      fun mods ->
        fun b ->
          fun qc1 ->
            fun qc2 ->
              Vale_X64_QuickCode.QProc
                ((Vale_X64_Machine_s.IfElse ((cmp_to_ocmp b), c1, c2)), mods,
                  (), ())
type ('a, 'd, 'c, 'qc, 'mods, 'inv, 'dec, 's1, 'g1, 's2, 'g2) wp_While_inv =
  unit
type ('a, 'd, 'c, 'b, 'qc, 'mods, 'inv, 'dec, 'g1, 's1, 'k) wp_While_body =
  unit
type ('a, 'd, 'c, 'b, 'qc, 'mods, 'inv, 'dec, 'g0, 's0, 'k) wp_While = unit


let va_qWhile :
  'a 'd .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode ->
      Vale_X64_QuickCode.mod_t Prims.list ->
        cmp ->
          ('a -> ('a, unit) Vale_X64_QuickCode.quickCode) ->
            unit ->
              (Vale_X64_State.vale_state -> 'a -> 'd) ->
                'a -> ('a, unit) Vale_X64_QuickCode.quickCode
  =
  fun c ->
    fun mods ->
      fun b ->
        fun qc ->
          fun inv ->
            fun dec ->
              fun g0 ->
                Vale_X64_QuickCode.QProc
                  ((Vale_X64_Machine_s.While ((cmp_to_ocmp b), c)), mods, (),
                    ())
type 'p tAssertLemma = unit

let va_qAssert :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Prims.range ->
        Prims.string ->
          unit -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun cs ->
    fun r ->
      fun msg -> fun e -> fun qcs -> QLemma (cs, r, msg, (), (), (), qcs)
type 'p tAssumeLemma = unit

let va_qAssume :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Prims.range ->
        Prims.string ->
          unit -> ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun cs ->
    fun r ->
      fun msg -> fun e -> fun qcs -> QLemma (cs, r, msg, (), (), (), qcs)
type 'p tAssertSquashLemma = unit

let va_qAssertSquash :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Prims.range -> Prims.string -> unit -> unit -> ('a, unit) quickCodes
  =
  fun cs ->
    fun r ->
      fun msg -> fun e -> fun qcs -> QGhost (cs, (), r, msg, (), (), (), ())
let va_qAssertBy :
  'a .
    (Vale_X64_Decls.ins, Vale_X64_Decls.ocmp) Vale_X64_Machine_s.precode
      Prims.list ->
      Prims.range ->
        Prims.string ->
          unit ->
            (unit, unit) quickCodes ->
              ('a, unit) quickCodes -> ('a, unit) quickCodes
  =
  fun cs ->
    fun r ->
      fun msg ->
        fun p ->
          fun qcsBy ->
            fun qcsTail -> QAssertBy (cs, r, msg, (), qcsBy, qcsTail)

type ('r0, 'r1, 'rf, 'k) regs_match_file = Obj.t
type ('r0, 'r1, 'k) regs_match = Obj.t
type ('r0, 'r1) all_regs_match = unit
type ('s0, 's1) state_match = unit



type ('s0, 's1) va_state_match = unit
type ('a, 'c, 'qc, 's0, 'k) wp_sound_code_pre = unit
type ('a, 'c, 'qc, 's0, 'k, 'uuuuu) wp_sound_code_post = Obj.t
let (normal_steps : Prims.string Prims.list) =
  ["Vale.X64.State.__proj__Mkvale_state__item__vs_ok";
  "Vale.X64.State.__proj__Mkvale_state__item__vs_regs";
  "Vale.X64.State.__proj__Mkvale_state__item__vs_flags";
  "Vale.X64.State.__proj__Mkvale_state__item__vs_heap";
  "Vale.X64.State.__proj__Mkvale_state__item__vs_stack";
  "Vale.X64.State.__proj__Mkvale_state__item__vs_stackTaint";
  "Vale.Arch.HeapImpl.__proj__Mkvale_full_heap__item__vf_layout";
  "Vale.Arch.HeapImpl.__proj__Mkvale_full_heap__item__vf_heap";
  "Vale.Arch.HeapImpl.__proj__Mkvale_full_heap__item__vf_heaplets";
  "Vale.X64.QuickCode.__proj__QProc__item__wp";
  "Vale.X64.QuickCode.__proj__QProc__item__mods";
  "Vale.X64.Machine_s.uu___is_OConst";
  "Vale.X64.Machine_s.uu___is_OReg";
  "Vale.X64.Machine_s.uu___is_OMem";
  "Vale.X64.Machine_s.uu___is_OStack";
  "FStar.FunctionalExtensionality.on_dom"]
type 'x normal = 'x


