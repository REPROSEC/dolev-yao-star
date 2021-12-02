/// Signal.SecurityProperties (implementation)
/// ===========================================
module Signal.SecurityProperties

let msg_secret i a b m =
  attacker_only_knows_publishable_values signal m;
  assert (attacker_knows_at i m ==> can_flow i (get_label signal_key_usages m) public);
  assert (attacker_knows_at i m ==> can_flow i (readers [P a; P b]) public);
  includes_corrupt_2_lemma i (P a) (P b);
  ()

val x3dh_labeled_key_secret_i: i:nat -> j:nat -> a:principal -> sid:nat -> b:principal ->
    Lemma (forall k spk opk. (i <= j /\ is_labeled signal_global_usage i k (x3dh_key_label_i a sid b spk opk) /\
			       can_flow j (get_label signal_key_usages k) public) ==>
			contains_corrupt_id cpred j [V a sid 0; P b])
let x3dh_labeled_key_secret_i i j a sid b =
  can_flow_to_join_forall i; can_flow_to_meet_forall i;
  can_flow_to_join_forall j; can_flow_to_meet_forall j;
  assert (can_flow i (readers [V a sid 0; P b]) (join (readers [V a sid 0]) (readers [P b])));
  assert (forall spk opk. can_flow i (readers [V a sid 0; P b]) ((x3dh_root_key0_label_i a sid b spk opk)));
  assert (forall spk opk. can_flow i (readers [V a sid 0; P b]) ((x3dh_key_label_i a sid b spk opk)));
  assert (forall k spk opk. is_labeled signal_global_usage i k (x3dh_key_label_i a sid b spk opk) ==>
		       (get_label signal_key_usages k) == (x3dh_key_label_i a sid b spk opk));
  assert (forall k spk opk. ((get_label signal_key_usages k) == (x3dh_key_label_i a sid b spk opk) /\
		        can_flow j (get_label signal_key_usages k) public) ==>
			can_flow j (x3dh_key_label_i a sid b spk opk) public);
  assert (forall spk opk. can_flow j (readers [V a sid 0; P b]) (x3dh_key_label_i a sid b spk opk));
  assert (forall l. can_flow j l public /\
 	       can_flow j (readers [V a sid 0; P b]) l ==>
	       can_flow j (readers [V a sid 0; P b]) public);
  assert (forall k spk opk. (is_labeled signal_global_usage i k (x3dh_key_label_i a sid b spk opk) /\
	       can_flow j (get_label signal_key_usages k) public) ==>
	       can_flow j (readers [V a sid 0; P b]) public);
  includes_corrupt_2_lemma j (V a sid 0) (P b)

let x3dh_key_secret_i i a sid b spk opk k =
  //assert (exists spk opk. is_labeled signal_global_usage i k (x3dh_key_label_i a sid b spk opk)); 
  let (k,iv) = k in
  attacker_only_knows_publishable_values signal k;
  assert (attacker_knows_at i k ==> can_flow i (get_label signal_key_usages k) public); 
  x3dh_labeled_key_secret_i i i a sid b

val x3dh_labeled_key_secret_r: i:nat -> j:nat -> a:principal -> b:principal ->
    Lemma (forall k sid ek0 ek1. (i <= j /\ is_labeled signal_global_usage i k (x3dh_key_label_r a sid b ek0 ek1) /\ can_flow j (get_label signal_key_usages k) public) ==>
					contains_corrupt_id cpred j [P a; P b])
let x3dh_labeled_key_secret_r i j a b =
  can_flow_to_join_forall i; can_flow_to_meet_forall i;
  can_flow_to_join_forall j; can_flow_to_meet_forall j;
  assert (can_flow i (readers [P a; P b]) (join (readers [P a]) (readers [P b])));
  assert (forall sid spk. can_flow i (readers [P a; P b]) ((x3dh_root_key0_label_r a sid b spk)));
  assert (forall sid spk opk. can_flow i (readers [P a; P b]) ((x3dh_key_label_r a sid b spk opk)));
  assert (forall k sid spk opk. is_labeled signal_global_usage i k (x3dh_key_label_r a sid b spk opk) ==>
			     (get_label signal_key_usages k) == (x3dh_key_label_r a sid b spk opk));
  assert (forall sid spk opk. can_flow j (readers [P a; P b]) (x3dh_key_label_r a sid b spk opk));
  assert (forall k sid ek0 ek1.
	      (is_labeled signal_global_usage i k (x3dh_key_label_r a sid b ek0 ek1) /\
	       can_flow j (get_label signal_key_usages k) public) ==>
	       can_flow j (readers [P a; P b]) public);
  includes_corrupt_2_lemma j (P a) (P b)

let x3dh_key_secret_r i a b sid spk opk k =  
  let len = global_timestamp () in
  let l = x3dh_key_label_r a sid b spk opk in
  let (k,iv) = k in
  assert(is_signal_aead_key i k l);
  assert(is_aead_key signal_global_usage i k l "Signal.aead_key"); 
  assert(is_secret signal_global_usage  i k l (aead_usage "Signal.aead_key" ));
  assert(is_labeled signal_global_usage i k (x3dh_key_label_r a sid b spk opk)); 
  attacker_only_knows_publishable_values signal k;  
  assert (attacker_knows_at i k ==> can_flow i (get_label signal_key_usages k) public);
  x3dh_labeled_key_secret_r i len a b

  

val x3dh_msg0_key_secret_r_helper: i:nat -> a:principal -> b:principal -> sid:nat-> spk:bytes-> opk:bytes-> k:signal_msg0_key_r i a b sid spk opk ->
 LCrypto unit signal
 (requires fun t0 -> i == trace_len t0)
    (ensures fun t0 _ t1 -> t0 == t1 /\
      ( is_unknown_to_attacker_at (trace_len t0) (fst k) \/
        ( corrupt_at i (P a) \/                      // and either a \/ b was compromised already at (i/t0) (when the key was created)
          corrupt_at i (P b) \/                      //     or either remote ephemeral key or (local onetime prekey/local signed prekey) must be compromised at t0
	  (exists isid iv rsid rv. corrupt_at (trace_len t0) (V a rsid rv) \/          
			  corrupt_at (trace_len t0) (V b isid iv)))
      ))

//#push-options "--z3rlimit 200 --max_fuel 4 --max_ifuel 4"
let x3dh_msg0_key_secret_r_helper i a b sid spk opk k_iv = 
  let len = global_timestamp () in
  let (k,iv) = k_iv in
  assert(is_msg0_key_r i a b k);
  assert( is_labeled signal_global_usage i k (x3dh_key_label_r a sid b spk opk));
  attacker_only_knows_publishable_values signal k;
  assert (attacker_knows_at i k ==> can_flow i (get_label signal_key_usages k) public);
  //let now = current_trace_len () in
  x3dh_labeled_key_secret_r i i a b;
  assert(is_unknown_to_attacker_at i k \/
         corrupt_at i (P a) \/ corrupt_at i (P b));
  x3dh_key_secret_r i a b sid spk opk k_iv
 
  

#push-options "--z3rlimit 500 --max_fuel 8 --max_ifuel 8"
let x3dh_msg0_key_secret_r i a b sid spk opk k_iv = 
  let len = global_timestamp () in 
  x3dh_key_secret_r i a b sid spk opk k_iv;
  let (k,iv) = k_iv in
  assert (is_unknown_to_attacker_at i k \/
       corrupt_at len (P a) \/
       corrupt_at len (P b)); 
  x3dh_msg0_key_secret_r_helper i a b sid spk opk k_iv
#pop-options

let is_msg_n_key_later_lemma i j r a b sid v k = ()



val ratcheted_labeled_key_secret_forall: r:role -> a:principal -> b:principal -> sid:nat -> v:nat -> recv:bool ->
    Lemma (ensures (forall (i:nat) (j:nat) k. (later_than j i /\ (is_ratcheted_root_key i r a b sid v k recv /\ can_flow j (get_label signal_key_usages k) public)) ==>
			 ratcheted_compromise i j r a b sid v recv))
	  (decreases (count (v,recv)))


val helper_lemma1: a:principal -> b:principal -> sid:nat -> v:nat -> 
Lemma (forall (j:nat) k. 
           (
             (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
               can_flow j (get_label signal_key_usages k) public
           ) ==>
            (exists rsid rv. contains_corrupt_id cpred j
				[V a sid v; V b rsid rv])          
       )

let flow_from_join (a:principal) (b:principal) (sid:nat) (v:nat) (j:nat) (rsid:nat) (rv:nat) =
  can_flow j (join (readers [V a sid v])  (readers [V b rsid rv])) public ==> ( can_flow j (readers [V a sid v]) public) \/ (can_flow j (readers [V b rsid rv]) public)


let flow_from_join_lemma (a:principal) (b:principal) (sid:nat) (v:nat):
  Lemma(forall j rsid rv. flow_from_join a b sid v j rsid rv <==> 
    (
      can_flow j (join (readers [V a sid v])  (readers [V b rsid rv])) public ==> ( can_flow j (readers [V a sid v]) public) \/ (can_flow j (readers [V b rsid rv]) public)
    )
  )
= ()

val helper_lemma11: a:principal -> b:principal -> sid:nat -> v:nat -> j:nat -> rsid:nat -> rv:nat -> 
Lemma ( flow_from_join a b sid v j rsid rv
       )
       [SMTPat (flow_from_join a b sid v j rsid rv)]
#push-options "--z3rlimit 500 --max_fuel 2 --max_ifuel 2"
let helper_lemma11 a b sid v j rsid rv = can_flow_join_labels_public_lemma j (readers [V a sid v]) (readers [V b rsid rv])


val helper_lemma11_forall1: a:principal -> b:principal -> sid:nat -> v:nat ->
  Lemma (forall j rsid rv. flow_from_join a b sid v j rsid rv)      
  
#pop-options

#push-options "--z3rlimit 500 --max_fuel 8 --max_ifuel 8"
let helper_lemma11_forall1 a b sid v = ()




val helper_lemma11_forall: a:principal -> b:principal -> sid:nat -> v:nat ->
  Lemma (forall j rsid rv. can_flow j (join (readers [V a sid v])  (readers [V b rsid rv])) public ==> ( can_flow j (readers [V a sid v]) public) \/ (can_flow j (readers [V b rsid rv]) public)) 

let helper_lemma11_forall a b sid v = 
  helper_lemma11_forall1 a b sid v;
  assert(forall j rsid rv. flow_from_join a b sid v j rsid rv);
  flow_from_join_lemma a b sid v;
  assert(forall j rsid rv. can_flow j (join (readers [V a sid v])  (readers [V b rsid rv])) public ==> ( can_flow j (readers [V a sid v]) public) \/ (can_flow j (readers [V b rsid rv]) public));
  ()

let helper_lemma1 a b sid v =
   helper_lemma11_forall a b sid v;
   assert(forall (j:nat). 
             (exists rsid rv.
               can_flow j (join (readers [V a sid v])  (readers [V b rsid rv])) public
           ) ==>
            (exists rsid rv. can_flow j (readers [V a sid v]) public \/ can_flow j (readers [V b rsid rv]) public)          
       );
   assert (forall (j:nat) k. 
           (
             (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
               can_flow j (get_label signal_key_usages k) public
           ) ==>
            (exists rsid rv. can_flow j (readers [V a sid v]) public \/ can_flow j (readers [V b rsid rv]) public)          
       );
   includes_corrupt_2_lemma_forall;
   ()


val helper_lemma2: a:principal -> b:principal -> sid:nat -> v:nat -> 
Lemma (forall (j:nat) k. 
           (
             (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
               can_flow j (get_label signal_key_usages k) public
           ) ==>
           contains_corrupt_id cpred j [P a; P b]            
       )

let helper_lemma2 a b sid v = 
  helper_lemma1 a b sid v;
  assert(forall j rsid rv. can_flow j (readers [P a; P b]) (readers [V a sid v; V b rsid rv])); 
  ()

let rec ratcheted_labeled_key_secret_forall r a b sid v recv = 
  if v = 0 && r = I then ()
  else if v = 0 && r = R then (
    if recv = false then ()
    else (
    is_ratcheted_root_key_later_forall r a b sid v recv;
    is_ratcheted_root_key_lemma_forall r a b sid v true;
    includes_corrupt_2_lemma_forall_trace_index (P a) (P b);
    ())
  )
  else if v = 1 && r = I then(
    if recv = false then (
      is_ratcheted_root_key_lemma_forall r a b sid v false;
      includes_corrupt_2_lemma_forall_trace_index (P a) (P b);
    ())
    else (
      assert (forall (i:nat) k. is_ratcheted_root_key i r a b sid v k true <==>
	   (exists rk' ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
	       is_ratcheted_root_key i r a b sid v rk' false /\
	       (can_flow i (get_label signal_key_usages rk') public \/
		 (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv])))); 
      ratcheted_labeled_key_secret_forall r a b sid v false;
      assert (forall (i:nat) (j:nat) rk'. (later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow j (get_label signal_key_usages rk') public) ==> ratcheted_compromise i j r a b sid v false);
      assert(forall (i:nat) (j:nat). ratcheted_compromise i j r a b sid v false <==> ratcheted_compromise i j r a b sid v true);
      assert(forall (i:nat) (j:nat). ratcheted_compromise i j r a b sid v true <==> later_than j i /\ (contains_corrupt_id cpred j [P a; P b]));
      assert (forall ek rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv] ==>
		            dh_secret_label a sid v ek == (join (readers [V a sid v]) (readers [V b rsid rv])));
      assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) <==>
	   (
               later_than j i /\ 
               (exists rk' ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
	       is_ratcheted_root_key i r a b sid v rk' false /\
	       (can_flow i (get_label signal_key_usages rk') public \/
		 (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv]))
               ) /\
               can_flow j (get_label signal_key_usages k) public
            )
       );
      assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (exists rk'. later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow i (get_label signal_key_usages rk') public
            ) \/
            ( exists ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
                    (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv]) /\
                    can_flow j (get_label signal_key_usages k) public
            )
       );
       assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (exists rk'. later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow j (get_label signal_key_usages rk') public
            ) \/
            ( (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
              can_flow j (get_label signal_key_usages k) public
            )
       );
       assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (ratcheted_compromise i j r a b sid v false
            ) \/
            ( (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
              can_flow j (get_label signal_key_usages k) public
            )
       );
       helper_lemma2 a b sid v;
      assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (ratcheted_compromise i j r a b sid v false
            ) \/
            ( later_than j i /\ (contains_corrupt_id cpred j [P a; P b])
            )
       );
      ()
    )
  )
  else if recv = false then (
    assert(forall (i:nat) (j:nat{i<=j}). ratcheted_compromise i j r a b sid v false  <==> ((exists rsid rv. contains_corrupt_id cpred j [V a sid v; V b rsid rv]) \/ 
                                (exists k. k<i /\ ratcheted_compromise k i r a b sid (v-1) true)) );
    assert (forall (i:nat) k. is_ratcheted_root_key i r a b sid v k false <==>
	   (exists rk' ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\ (exists k. k<i /\ is_ratcheted_root_key k r a b sid (v-1) rk' true) /\
		      (can_flow i (get_label signal_key_usages rk') public \/
				(exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv])))); 
   
    ratcheted_labeled_key_secret_forall r a b sid (v-1) true; 

    assert (forall (i:nat) (j:nat) rk'. (later_than j i /\ is_ratcheted_root_key i r a b sid (v-1) rk' true /\
		      can_flow j (get_label signal_key_usages rk') public) ==> ratcheted_compromise i j r a b sid (v-1) true);

    can_flow_to_join_forall_trace_index; 
    can_flow_join_public_lemma_forall_trace_index;
   
    helper_lemma1 a b sid v;
    ()
    )
  else (
      assert (forall (i:nat) k. is_ratcheted_root_key i r a b sid v k true <==>
	   (exists rk' ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
	       is_ratcheted_root_key i r a b sid v rk' false /\
	       (can_flow i (get_label signal_key_usages rk') public \/
		 (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv])))); 
      ratcheted_labeled_key_secret_forall r a b sid v false;
      assert (forall (i:nat) (j:nat) rk'. (later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow j (get_label signal_key_usages rk') public) ==> ratcheted_compromise i j r a b sid v false);
      assert(forall (i:nat) (j:nat). ratcheted_compromise i j r a b sid v false <==> ratcheted_compromise i j r a b sid v true);      
      assert (forall ek rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv] ==>
		            dh_secret_label a sid v ek == (join (readers [V a sid v]) (readers [V b rsid rv])));
      assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) <==>
	   (
               later_than j i /\ 
               (exists rk' ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
	       is_ratcheted_root_key i r a b sid v rk' false /\
	       (can_flow i (get_label signal_key_usages rk') public \/
		 (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv]))
               ) /\
               can_flow j (get_label signal_key_usages k) public
            )
       );
      assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (exists rk'. later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow i (get_label signal_key_usages rk') public
            ) \/
            ( exists ek. is_signal_root_key i k (dh_secret_label a sid v ek) /\
                    (exists rsid rv. get_dhkey_label signal_key_usages ek == readers [V b rsid rv]) /\
                    can_flow j (get_label signal_key_usages k) public
            )
       );
       assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (exists rk'. later_than j i /\ is_ratcheted_root_key i r a b sid v rk' false  /\
		     can_flow j (get_label signal_key_usages rk') public
            ) \/
            ( (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
              can_flow j (get_label signal_key_usages k) public
            )
       );
       assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (ratcheted_compromise i j r a b sid v false
            ) \/
            ( (exists rsid rv. get_label signal_key_usages k == join (readers [V a sid v])  (readers [V b rsid rv]))  /\
              can_flow j (get_label signal_key_usages k) public
            )
       );
       helper_lemma1 a b sid v; 
       assert (forall (i:nat) (j:nat) k. (later_than j i /\ is_ratcheted_root_key i r a b sid v k true /\ can_flow j (get_label signal_key_usages k) public) ==>
            (ratcheted_compromise i j r a b sid v false
            ) \/
            ( later_than j i /\ (exists rsid rv. contains_corrupt_id cpred j
				[V a sid v; V b rsid rv])     
            )
       );
      ()
    )



val ratcheted_labeled_key_secret: i:nat -> j:nat{i<=j} -> r:role -> a:principal -> b:principal -> sid:nat -> v:nat -> recv:bool ->
    Lemma (ensures (forall k. (is_ratcheted_root_key i r a b sid v k recv /\ can_flow j (get_label signal_key_usages k) public) ==>
			 ratcheted_compromise i j r a b sid v recv))
	  (decreases (count (v,recv)))

#push-options "--z3rlimit 500 --max_fuel 4 --max_ifuel 4"
let ratcheted_labeled_key_secret i j r a b sid v recv = ratcheted_labeled_key_secret_forall  r a b sid v recv
 
  
let ratcheted_key_secret i r a b sid v k =
    attacker_only_knows_publishable_values signal k;
    ratcheted_labeled_key_secret i i r a b sid v false; 
    ()
