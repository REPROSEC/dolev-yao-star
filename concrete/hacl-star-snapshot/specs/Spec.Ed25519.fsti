module Spec.Ed25519

open FStar.Mul
open Lib.IntTypes
open Lib.Sequence
open Lib.ByteSequence
open Lib.RawIntTypes


#reset-options "--max_fuel 0 --z3rlimit 100"

///
/// Constants
///
inline_for_extraction
let size_signature: size_nat = 64

val secret_to_public (secret:lbytes 32) : lbytes 32

///
/// Ed25519 API
///

val expand_keys (secret: lbytes 32) : (lbytes 32 & lbytes 32 & lbytes 32)

val sign_expanded:
  pub:lbytes 32 ->
  s:lbytes 32 ->
  prefix:lbytes 32 ->
  msg: bytes{64 + length msg <= max_size_t} ->
  Tot (lbytes 64)

val sign:
    secret: lbytes 32
  -> msg: bytes{64 + length msg <= max_size_t} ->
  Tot (lbytes 64)

val verify:
    public: lbytes 32
  -> msg: bytes{64 + length msg <= max_size_t}
  -> signature: lbytes 64 ->
  Tot bool
