/// This module defines the low-level mechanics of the global trace effect.
/// We define a new effect called Crypto that maintains a monotonically growing global trace of entries.
/// We also define an API of functions for reading and writing elements into this global trace.
/// This API is not used directly, instead the attacker uses AttackerAPI, and applications use ApplicationAPI,
/// which provide wrappers around these functions.

module GlobalRuntimeLib
open SecrecyLabels
open CryptoLib
open CryptoEffect

(* An API for the Crypto effect. These are all the functions an *)
(* application or attacker can use to read or write elements from the *)
(* global trace *)

(* Abbreviations for various kinds of trace entries *)
unfold
let was_rand_generated_at (trace_index:nat) (r:bytes) (label:label) (usage:usage) =
  trace_entry_at trace_index (RandGen r label usage) /\ r == g_rand trace_index label usage

let was_rand_generated_before (j:nat) (t:bytes) (l:label) (u:usage) =
  exists (trace_index:nat). trace_index <= j /\ was_rand_generated_at trace_index t l u

let did_event_occur_at trace_index p (ev,tl) =
    trace_entry_at trace_index (Event p (ev,tl))

let did_event_occur_before (j:nat) p (ev,tl) =
  exists trace_index. trace_index < j /\ did_event_occur_at trace_index p (ev,tl)

let was_message_sent_at trace_index p1 p2 t =
    trace_entry_at trace_index (Message p1 p2 t)

let was_message_sent_before j p1 p2 t =
  exists i. i <= j /\ trace_entry_at i (Message p1 p2 t)

let state_was_set_at trace_index principal v new_state =
  trace_entry_at trace_index (SetState principal v new_state)

let was_corrupted_at trace_index p s v = trace_entry_at trace_index (Corrupt p s v)

let was_corrupted_before trace_index p s v =
  (exists idx'. idx' <= trace_index /\ was_corrupted_at idx' p s v)

(** Print a string *)
val print_string: string -> Crypto unit
		   (requires (fun t0 -> True))
		   (ensures (fun t0 _ t1 -> t0 == t1))

(** Print a bytestring *)
val print_bytes: bytes -> Crypto unit
		   (requires (fun t0 -> True))
		   (ensures (fun t0 _ t1 -> t0 == t1))

(** Print the current trace *)
val print_trace: unit -> Crypto unit
		   (requires (fun t0 -> True))
		   (ensures (fun t0 _ t1 -> t0 == t1))

(** "Emit" an error inside of a CRYPTO function *)
val error: #a:Type -> e:string -> Crypto a
		   (requires (fun t0 -> True))
		   (ensures (fun t0 s t1 ->
		     match s with
		     | Error _ -> t0 == t1
		     | Success _ -> False))

(* Local abbreviations *)
type event = CryptoEffect.event
type trace_len = CryptoEffect.trace_len

(** Get the current trace length *)
(* A notion of global timestamps defined as the length of the global trace *)
val global_timestamp: unit -> Crypto timestamp
		   (requires (fun t0 -> True))
		   (ensures (fun t0 s t1 ->
		     match s with
		     | Success t -> t0 == t1 /\ Ghost.reveal t == trace_len t0
		     | Error _ -> False))

(* Get the current trace for use in specifications and assertions *)
type g_trace = Ghost.erased trace
val get: unit -> Crypto g_trace
		   (requires (fun t0 -> True))
		   (ensures (fun t0 x t1 ->
		     match x with
		     | Success x -> Ghost.reveal x == t0 /\ t0 == t1
		     | Error _ -> False))

(** Generate fresh (random) values. Returns the generated value (which is always a nonce). *)
val gen: l:label -> u:usage -> Crypto bytes
                      (requires (fun t0 -> True))
                      (ensures (fun t0 (s) t1 ->
			match s with
			| Error _ -> t0 == t1
			| Success s ->
                          trace_len t1 = trace_len t0 + 1 /\
                          was_rand_generated_at (trace_len t0) s l u))

(** Triggering protocol-specific events, e.g., for authentication properties. *)
val trigger_event: p:principal -> ev:event -> Crypto unit
                      (requires (fun t0 -> True))
                      (ensures (fun t0 (s) t1 ->
			match s with
			| Error _ -> t0 == t1
			| Success s ->
				  trace_len t1 = trace_len t0 + 1 /\
				  did_event_occur_at (trace_len t0) p ev))

(** Send messages on the network. This publishes the message to the attacker. Returns the index of
the send event in the trace. Note that sender and receiver are not checked in any way. *)
val send: sender:principal -> receiver:principal -> msg:bytes -> Crypto nat
                      (requires (fun t0 -> True))
                      (ensures (fun t0 trace_index t1 ->
			match trace_index with
			| Error _ -> t0 == t1
			| Success n ->
                          (trace_len t1 = trace_len t0 + 1 /\
                          n = trace_len t0 /\
                          was_message_sent_at n sender receiver msg)))

(** Receive a message. Returns [Some bytes] if the given trace index corresponds to a send event for
the given receiver, [None] otherwise. *)
val receive_i: trace_index:nat -> receiver:principal -> Crypto (claimed_sender:principal * bytes)
                      (requires (fun t0 -> trace_index < trace_len t0))
                      (ensures (fun t0 t t1 ->
                        t0 == t1 /\
                        (match t with
			 | Error _ -> True
			 | Success (_,t) ->
                           (exists sender recv. was_message_sent_at trace_index sender recv t))))


/// Version and actual state content are kept separately to be able to later model metadata leakage:
/// The version vector represents metadata about where things are stored. If we kept metadata and
/// session state inside one type, this would be harder to model.
(** Set the internal state [s] of a principal [p] with version vector [v]. *)
val set_state: p:principal -> v:version_vec -> s:state_vec -> Crypto unit
                      (requires (fun t0 -> trace_len v = trace_len s))
                      (ensures (fun t0 trace_index t1 ->
			match trace_index with
			| Error _ -> t0 == t1
			| Success _ ->
				  trace_len t1 = trace_len t0 + 1 /\
				  state_was_set_at (trace_len t0) p v s))


(** Get state for principal (set at index trace_index) *)
val get_state_i: trace_index:nat -> p:principal -> Crypto (version_vec & state_vec)
                      (requires (fun t0 -> trace_index < trace_len t0))
                      (ensures (fun t0 s t1 ->
                        t0 == t1 /\
                        (match s with
                         | Error _ -> True
                         | Success (v,s) -> state_was_set_at trace_index p v s)))


(** Helper function for [get_last_update_index_before] below *)
let has_last_update (t:trace) (p:principal) (trace_index:nat) (jvs:option (nat & version_vec & state_vec)) : Type0 =
    match jvs with
    // State of p has not been set yet (up to index trace_index in the trace)
    | None -> forall j v s. j <= trace_index ==> ~ (state_was_set_at j p v s)
    // State of p has been set at some index [j <= trace_index] and there is no index k with [k > j]
    // and [k <= trace_index] at which p's state has been set.
    // I.e., the latest SetState for p (in the trace up to length trace_index) was at index j.
    | Some (j,v,s) -> j <= trace_index /\ state_was_set_at j p v s /\ (forall k v s. (j < k /\ k <= trace_index) ==> ~ (state_was_set_at k p v s))


(** Get the index of the last update to a principal's state before trace_index. *)
val get_last_state_before: trace_index:nat -> p:principal -> Crypto (option (nat & version_vec & state_vec))
                      (requires (fun t0 -> trace_index < trace_len t0))
                      (ensures (fun t0 jvs t1 -> t0 == t1 /\
				 (match jvs with
				  | Success jvs -> has_last_update t0 p trace_index jvs
				  | Error _ -> True)))


(** Compromise a version. *)
val compromise: p:principal -> s:nat -> v:nat -> Crypto unit
                (requires (fun t0 -> True))
                (ensures (fun t0 r t1 ->
		      match r with
		      | Error _ -> t0 == t1
		      | Success _ ->
                        trace_len t1 = trace_len t0 + 1 /\
                        was_corrupted_at (trace_len t0) p s v))
