open Prims
type flag_val_t = Prims.bool FStar_Pervasives_Native.option
type t =
  (Vale_X64_Machine_s.flag, Prims.bool FStar_Pervasives_Native.option)
    FStar_Map.t
let (sel :
  Vale_X64_Machine_s.flag -> t -> Prims.bool FStar_Pervasives_Native.option)
  = fun r -> fun m -> FStar_Map.sel m r
let (upd :
  Vale_X64_Machine_s.flag ->
    Prims.bool FStar_Pervasives_Native.option -> t -> t)
  = fun r -> fun v -> fun m -> FStar_Map.upd m r v
let (sel_curry :
  t -> Vale_X64_Machine_s.flag -> Prims.bool FStar_Pervasives_Native.option)
  = fun m -> fun f -> sel f m
let (to_fun :
  t ->
    (Vale_X64_Machine_s.flag, Prims.bool FStar_Pervasives_Native.option)
      FStar_FunctionalExtensionality.restricted_t)
  = fun m -> sel_curry m
let (of_fun :
  (Vale_X64_Machine_s.flag -> Prims.bool FStar_Pervasives_Native.option) -> t)
  =
  fun m ->
    let m' = FStar_Map.const FStar_Pervasives_Native.None in
    let m'1 = FStar_Map.upd m' Prims.int_zero (m Prims.int_zero) in
    let m'2 = FStar_Map.upd m'1 Prims.int_one (m Prims.int_one) in
    let m'3 = FStar_Map.upd m'2 (Prims.of_int (2)) (m (Prims.of_int (2))) in
    let m'4 = FStar_Map.upd m'3 (Prims.of_int (3)) (m (Prims.of_int (3))) in
    let m'5 = FStar_Map.upd m'4 (Prims.of_int (4)) (m (Prims.of_int (4))) in
    let m'6 = FStar_Map.upd m'5 (Prims.of_int (5)) (m (Prims.of_int (5))) in
    let m'7 = FStar_Map.upd m'6 (Prims.of_int (6)) (m (Prims.of_int (6))) in
    let m'8 = FStar_Map.upd m'7 (Prims.of_int (7)) (m (Prims.of_int (7))) in
    let m'9 = FStar_Map.upd m'8 (Prims.of_int (8)) (m (Prims.of_int (8))) in
    let m'10 = FStar_Map.upd m'9 (Prims.of_int (9)) (m (Prims.of_int (9))) in
    let m'11 = FStar_Map.upd m'10 (Prims.of_int (10)) (m (Prims.of_int (10))) in
    let m'12 = FStar_Map.upd m'11 (Prims.of_int (11)) (m (Prims.of_int (11))) in
    let m'13 = FStar_Map.upd m'12 (Prims.of_int (12)) (m (Prims.of_int (12))) in
    let m'14 = FStar_Map.upd m'13 (Prims.of_int (13)) (m (Prims.of_int (13))) in
    let m'15 = FStar_Map.upd m'14 (Prims.of_int (14)) (m (Prims.of_int (14))) in
    let m'16 = FStar_Map.upd m'15 (Prims.of_int (15)) (m (Prims.of_int (15))) in
    m'16


type ('m1, 'm2) equal = unit

