module Spec.Agile.DH

open FStar.Mul
open Lib.IntTypes
open Lib.Sequence
open Lib.ByteSequence


/// Constants

type algorithm =
  | DH_Curve25519
  | DH_P256

inline_for_extraction
let size_key (a:algorithm) : Tot size_nat =
  match a with
  | DH_Curve25519 -> 32
  | DH_P256 -> 32

inline_for_extraction
let size_public (a:algorithm) : Tot size_nat =
  match a with
  | DH_Curve25519 -> 32
  | DH_P256 -> 64

/// Types

type scalar (a:algorithm) = lbytes (size_key a)
type serialized_point (a:algorithm) = lbytes (size_public a)


/// Functions

val clamp: alg:algorithm{alg = DH_Curve25519} -> scalar alg -> Tot (scalar alg)
val dh: a:algorithm -> s:scalar a -> p:serialized_point a -> Tot (option (serialized_point a))
val secret_to_public: a:algorithm -> scalar a -> Tot (option (serialized_point a))
