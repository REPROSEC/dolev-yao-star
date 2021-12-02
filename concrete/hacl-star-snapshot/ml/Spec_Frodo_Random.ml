open Prims
type state_t = FStar_UInt8.t Lib_Sequence.seq
let (randombytes_init_ : (FStar_UInt8.t, unit) Lib_Sequence.lseq -> state_t)
  = fun entropy_input -> failwith "Not yet implemented:randombytes_init_"
let (randombytes_ :
  state_t -> Prims.nat -> ((FStar_UInt8.t, unit) Lib_Sequence.lseq * state_t))
  = fun state -> fun len -> failwith "Not yet implemented:randombytes_"