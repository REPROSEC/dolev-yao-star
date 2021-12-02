open Prims
type 'a possibly =
  | Ok of 'a 
  | Err of Prims.string 
let uu___is_Ok : 'a . 'a possibly -> Prims.bool =
  fun projectee -> match projectee with | Ok v -> true | uu___ -> false
let __proj__Ok__item__v : 'a . 'a possibly -> 'a =
  fun projectee -> match projectee with | Ok v -> v
let uu___is_Err : 'a . 'a possibly -> Prims.bool =
  fun projectee -> match projectee with | Err reason -> true | uu___ -> false
let __proj__Err__item__reason : 'a . 'a possibly -> Prims.string =
  fun projectee -> match projectee with | Err reason -> reason
let return : 'a . 'a -> 'a possibly = fun x -> Ok x
let bind : 'a 'b . 'a possibly -> ('a -> 'b possibly) -> 'b possibly =
  fun x -> fun f -> match x with | Err s -> Err s | Ok x' -> f x'
let fail_with : 'a . Prims.string -> 'a possibly = fun s -> Err s
let unimplemented : 'a . Prims.string -> 'a possibly =
  fun s -> Err (Prims.strcat "Unimplemented: " s)
let loosen : 't1 't2 . 't1 possibly -> 't2 possibly =
  fun x -> match x with | Ok x' -> Ok (Obj.magic x') | Err s -> Err s
let tighten : 't1 't2 . 't1 possibly -> 't2 possibly =
  fun x -> match x with | Ok x' -> Ok (Obj.magic x') | Err s -> Err s
type pbool = unit possibly
let (op_Bang_Bang : unit possibly -> Prims.bool) = fun x -> uu___is_Ok x
let (ttrue : unit possibly) = Ok ()
let (ffalse : Prims.string -> unit possibly) = fun reason -> Err reason
let (op_Slash_Subtraction : Prims.bool -> Prims.string -> unit possibly) =
  fun b -> fun reason -> if b then Ok () else Err reason
let (op_Slash_Plus_Greater : unit possibly -> Prims.string -> unit possibly)
  =
  fun p ->
    fun r ->
      match p with | Ok () -> Ok () | Err rr -> Err (Prims.strcat rr r)
let (op_Slash_Plus_Less : unit possibly -> Prims.string -> unit possibly) =
  fun p ->
    fun r ->
      match p with | Ok () -> Ok () | Err rr -> Err (Prims.strcat r rr)
let (op_Amp_Amp_Dot : unit possibly -> unit possibly -> unit possibly) =
  fun x -> fun y -> match x with | Ok () -> y | Err reason -> Err reason
let (op_Bar_Bar_Dot : unit possibly -> unit possibly -> unit possibly) =
  fun x ->
    fun y ->
      match x with
      | Ok () -> Ok ()
      | Err rx ->
          (match y with
           | Ok () -> Ok ()
           | Err rr -> Err (Prims.strcat (Prims.strcat rx " and ") rr))
let rec for_all :
  'a . ('a -> unit possibly) -> 'a Prims.list -> unit possibly =
  fun f ->
    fun l ->
      match l with
      | [] -> Ok ()
      | x::xs -> op_Amp_Amp_Dot (f x) (for_all f xs)

