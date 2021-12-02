/// Signal.Messages
/// ================
module Signal.Messages

open SecrecyLabels
open GlobalRuntimeLib
open CryptoLib

module A = LabeledCryptoAPI

type role = 
| I 
| R

let dh_shared_secret_usage s1 s2 ss = 
  if (s1 = "Signal.identity_key" || s2 = "Signal.identity_key" || s1 = "Signal.one_time_pre_key" || s2 = "Signal.one_time_pre_key" ||
     s1 = "Signal.signed_pre_key" || s2 = "Signal.signed_pre_key")
     then Some (kdf_usage "Signal.kdf_input_key") 
  else None
let dh_unknown_peer_usage s1 ss = 
  if s1 = "Signal.identity_key" || s1 = "Signal.one_time_pre_key" || s1 = "Signal.signed_pre_key" then Some (kdf_usage "Signal.kdf_input_key") else None

let zz =
    let zb = Seq.create 32 0uy in
    bytestring_to_bytes zb

let on =
    let zb = Seq.create 32 0uy in
    let zb' = zb.[31] <- 1uy in
    bytestring_to_bytes zb'

let zz_on_disjoint_lemma () :
  Lemma (on <> zz) = admit()


let kdf_extract_usage s k salt = if s = "Signal.kdf_input_key" then Some (kdf_usage "Signal.kdf_input_key") 
				 else if s = "Signal.root_key" then Some (kdf_usage "Signal.root_key") 
				 else if s = "Signal.chain_key" then Some (kdf_usage "Signal.chain_key") 
				 else if s = "Signal.aead_iv" then Some (nonce_usage "AEAD_NONCE") 
				 else None
let kdf_expand_usage s k info = if s = "Signal.kdf_input_key" then Some (kdf_usage "Signal.root_key") 
				else if s = "Signal.root_key" then Some (kdf_usage "Signal.chain_key") 
				else if s = "Signal.chain_key" && info = zz then Some (aead_usage "Signal.aead_key")
				else if s = "Signal.chain_key" && info = on then Some (kdf_usage "Signal.aead_iv")
				else None

let kdf_extend_label s k salt kl sl = if s = "Signal.aead_iv" then Some public else Some private_label

let signal_key_usages : A.key_usages = {
  A.dh_shared_secret_usage = dh_shared_secret_usage;
  A.dh_unknown_peer_usage = dh_unknown_peer_usage;
  A.dh_usage_commutes_lemma = (fun () -> ());
  A.dh_unknown_peer_usage_lemma = (fun () -> ());
  A.kdf_extend_label = kdf_extend_label;
  A.kdf_extract_usage = kdf_extract_usage;
  A.kdf_expand_usage = kdf_expand_usage;
}

val serialize_ad: our_ephemeral_pub_key:bytes -> prev_counter:nat -> counter:nat -> their_identity_pub_key:bytes -> our_identity_pub_key:bytes -> bytes

val serialize_ad_injective: our_ephemeral_pub_key:bytes -> prev_counter:nat -> counter:nat -> their_identity_pub_key:bytes -> our_identity_pub_key:bytes ->
			    our_ephemeral_pub_key':bytes -> prev_counter':nat -> counter':nat -> their_identity_pub_key':bytes -> our_identity_pub_key':bytes ->
    Lemma (serialize_ad our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key ==
	   serialize_ad our_ephemeral_pub_key' prev_counter' counter' their_identity_pub_key' our_identity_pub_key' ==>
	   (our_ephemeral_pub_key == our_ephemeral_pub_key' /\
	    our_identity_pub_key == our_identity_pub_key'))
	  [SMTPat (serialize_ad our_ephemeral_pub_key prev_counter counter their_identity_pub_key our_identity_pub_key);
	   SMTPat (serialize_ad our_ephemeral_pub_key' prev_counter' counter' their_identity_pub_key' our_identity_pub_key')]

let ppred i s pk m = True
let apred (i:nat) s (k:bytes) (m:bytes) (ad:bytes) = 
    (exists ek pc c tik oik p si v.
       ad == serialize_ad ek pc c tik oik /\
       (A.get_dhkey_label signal_key_usages oik) == (readers [P p]) /\
       (A.get_dhkey_label signal_key_usages ek)  == (readers [V p si v]))
let spred i s k m = True
let mpred i s k m = True

let signal_usage_preds : A.usage_preds = {
  A.can_pke_encrypt = ppred;
  A.can_aead_encrypt = apred;
  A.can_sign = spred;
  A.can_mac = mpred
}

let signal_global_usage : A.global_usage = {
  A.key_usages = signal_key_usages;
  A.usage_preds = signal_usage_preds;
}

type dh_key_string = s:string{s == "Signal.identity_key" \/ s == "Signal.one_time_pre_key" \/ s == "Signal.signed_pre_key"}

let is_signal_aead_key i b l = A.is_aead_key signal_global_usage i b l "Signal.aead_key"
let is_signal_aead_key_iv i (b1,b2) l = A.is_aead_key signal_global_usage i b1 l "Signal.aead_key" /\ A.is_publishable signal_global_usage i b2
let is_signal_chain_key i b l = A.is_kdf_key signal_global_usage i b l "Signal.chain_key"
let is_signal_root_key i b l = A.is_kdf_key signal_global_usage i b l "Signal.root_key"
let is_signal_kdf_input i b l = A.is_kdf_key signal_global_usage i b l "Signal.kdf_input_key"
let is_signal_dh_private_key i b l (s:dh_key_string) = A.is_dh_private_key signal_global_usage i b l s
let is_signal_dh_public_key i b l (s:dh_key_string) = A.is_dh_public_key signal_global_usage i b l s

let dh_secret_label0 (p:principal) (pk:bytes) = join (readers [P p]) (A.get_dhkey_label signal_key_usages pk)
let dh_secret_label (p:principal) (sid:nat) (v:nat) (pk:bytes) = join (readers [V p sid v]) (A.get_dhkey_label signal_key_usages pk)

let kdf_meet (l1:label) (l2:label) = join (meet l1 l2) (private_label)

let x3dh_root_key0_label_i (p:principal) (sid:nat) (peer:principal)
			  (spk:bytes) (opk:bytes) =
    (kdf_meet  (kdf_meet  (kdf_meet
           (dh_secret_label0 p spk)
           (join (readers [V p sid 0]) (readers [P peer])))
           (dh_secret_label p sid 0 spk))
           (dh_secret_label p sid 0 opk))

let x3dh_root_key0_label_r (p:principal) (sid:nat) (peer:principal) (epk0:bytes) =
    (kdf_meet  (kdf_meet  (kdf_meet
           (join (readers [P p]) (readers [P peer]))
           (dh_secret_label0 p epk0))
           (dh_secret_label0 p epk0))
           (dh_secret_label p sid 0 epk0))
 
let x3dh_key_label_i (p:principal) (sid:nat) (peer:principal) (spk:bytes) (opk:bytes) =
    kdf_meet (x3dh_root_key0_label_i p sid peer spk opk) (dh_secret_label p sid 1 spk)

let x3dh_key_label_r (p:principal) (sid:nat) (peer:principal) (epk0:bytes) (epk1:bytes) =
    kdf_meet (x3dh_root_key0_label_r p sid peer epk0) (dh_secret_label0 p epk1)

open FStar.Mul
let count (v,recv) =
  if recv then 2*v+1
  else 2*v

let rec is_ratcheted_root_key (i:nat) (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (rk:bytes) (recv:bool) : Tot Type0 (decreases (count (v,recv)))  =
  if v = 0 && r = R && recv = false then False
  else if v = 0 && r = I then False
  else if v = 0 && r = R && recv = true then
    (exists ek1. is_signal_root_key i rk (dh_secret_label0 p ek1) /\
      (A.can_flow i (readers [P p; P peer]) public \/
       (exists rsid rv. A.get_dhkey_label signal_key_usages ek1 == readers [V peer rsid rv])))
  else if v = 1 && r = I && recv = false then
    (exists spk. is_signal_root_key i rk (dh_secret_label p sid 1 spk) /\
      (A.can_flow i (readers [P peer]) public \/
       A.get_dhkey_label signal_key_usages spk == readers [P peer]))
  else if recv = false then
    (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\ is_ratcheted_root_key k r p peer sid (v-1) rk' true) /\
	       (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv])))
  else (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       is_ratcheted_root_key i r p peer sid v rk' false /\
	       (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv])))

let sent_ratcheted_root_key_condition (i:nat) (j:nat) (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (rk':bytes) (ek:bytes) (rk:bytes)=
  j<i /\
  (is_signal_root_key i rk (dh_secret_label p sid (v+1) ek) /\
	 is_ratcheted_root_key j r p peer sid v rk' true /\
	 (A.can_flow i (A.get_label signal_key_usages rk') public \/
		     (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv])))

val sent_ratcheted_root_key : i:nat -> j:nat-> r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> rk':bytes -> ek:bytes -> rk:bytes -> 
    Lemma (sent_ratcheted_root_key_condition i j r p peer sid v rk' ek rk ==>
	 is_ratcheted_root_key i r p peer sid (v+1) rk false) 

(*
val sent_ratcheted_root_key : i:nat -> j:nat{j<i}-> r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> rk':bytes -> ek:bytes -> rk:bytes -> 
    Lemma (is_signal_root_key i rk (dh_secret_label p sid (v+1) ek) /\
	 is_ratcheted_root_key j r p peer sid v rk' true /\
	 (A.can_flow i (A.get_label signal_key_usages rk') public \/
		     (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv])) ==>
	 is_ratcheted_root_key i r p peer sid (v+1) rk false) 
*)

val recv_ratcheted_root_key : i:nat -> r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> rk':bytes -> ek:bytes -> rk:bytes -> 
    Lemma (is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	  is_ratcheted_root_key i r p peer sid v rk' false /\
	  (A.can_flow i (A.get_label signal_key_usages rk') public \/
		      (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv])) ==>
	  is_ratcheted_root_key i r p peer sid v rk true) 

val is_ratcheted_root_key_later : i:nat -> j:nat -> r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> recv:bool -> 
    Lemma (forall rk. is_ratcheted_root_key i r p peer sid v rk recv /\ later_than j i ==> is_ratcheted_root_key j r p peer sid v rk recv)

val is_ratcheted_root_key_later_forall : r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> recv:bool -> 
    Lemma (forall (i:nat) (j:nat) rk. is_ratcheted_root_key i r p peer sid v rk recv /\ later_than j i ==> is_ratcheted_root_key j r p peer sid v rk recv)

val is_ratcheted_root_key_lemma_forall :  r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> recv:bool -> 
    Lemma (ensures (forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk recv ==>
			  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk)))
	  (decreases (count (v,recv)))


val is_ratcheted_root_key_lemma : i:nat -> r:role -> p:principal -> peer:principal -> sid:nat -> v:nat -> recv:bool -> 
    Lemma (ensures (forall rk. is_ratcheted_root_key i r p peer sid v rk recv ==>
			  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk)))
	  

