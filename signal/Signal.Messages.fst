/// Signal.Messages (implementation)
/// =================================
module Signal.Messages

let serialize_ad
    (our_ephemeral_pub_key)
    (prev_counter) (counter)
    (their_identity_pub_key)
    (our_identity_pub_key) =
    concat their_identity_pub_key
      (concat our_identity_pub_key
	(concat (our_ephemeral_pub_key)
	  (concat ((nat_to_bytes 4 prev_counter))
	    ((nat_to_bytes 4 counter)))))

let serialize_ad_injective ek1 pc1 c1 tik1 oik1 ek2 pc2 c2 tik2 oik2 =
  let ad1 = serialize_ad ek1 pc1 c1 tik1 oik1 in
  let ad2 = serialize_ad ek2 pc2 c2 tik2 oik2 in
  match split ad1, split ad2 with
  | Success (x1,y1), Success (x2,y2) ->
  (match split y1, split y2 with
   | Success (x1,y1), Success (x2,y2) ->
   (match split y1, split y2 with
    | Success (x1,y1), Success (x2,y2) ->
    (match split y1, split y2 with
    | Success (x1,y1), Success (x2,y2) -> ()
    | _ -> ())
   | _ -> ())
  | _ -> ())
 | _ -> ()


private let ratcheted_root_key_condition (i:nat) (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (rk:bytes) =
  (exists ek1 rk1. is_signal_root_key i rk (dh_secret_label p sid (v+1) ek1) /\
	       (exists k. k<i /\ is_ratcheted_root_key k r p peer sid v rk1 true) /\
	       (A.can_flow i (A.get_label signal_key_usages rk1) public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek1 == readers [V peer rsid rv])))


                     

#set-options "--z3rlimit 200 --max_fuel 2 --max_ifuel 2"
let sent_ratcheted_root_key i j r p peer sid v rk' ek rk = 
  if v = 0 && r = I  then ()
  else(
    assert((exists ek1 rk1. is_signal_root_key i rk (dh_secret_label p sid (v+1) ek1) /\
	       (exists k. k<i /\ is_ratcheted_root_key k r p peer sid v rk1 true) /\
	       (A.can_flow i (A.get_label signal_key_usages rk1) public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek1 == readers [V peer rsid rv]))) <==>  is_ratcheted_root_key i r p peer sid (v+1) rk false);
    assert(ratcheted_root_key_condition i r p peer sid v rk  <==>  is_ratcheted_root_key i r p peer sid (v+1) rk false); 
    assert(sent_ratcheted_root_key_condition i j r p peer sid v rk' ek rk ==> ratcheted_root_key_condition i r p peer sid v rk);
    ()
  )
#reset-options   
   


let recv_ratcheted_root_key (i:nat) (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (rk':bytes) (ek:bytes) (rk:bytes) = ()

let rec is_ratcheted_root_key_later (i:nat) (j:nat) (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (recv:bool)
=  if v = 0 && r = R then ()
   else if v = 0 && r = I then ()
   else if v = 1 && r = I then ()
   else is_ratcheted_root_key_later i j r p peer sid (v-1) recv

let rec is_ratcheted_root_key_later_forall (r:role) (p:principal) (peer:principal) (sid:nat) (v:nat) (recv:bool)
=  if v = 0 && r = R then ()
   else if v = 0 && r = I then ()
   else if v = 1 && r = I then ()
   else is_ratcheted_root_key_later_forall r p peer sid (v-1) recv


val helper_lemma: r:role -> p:principal -> peer:principal -> sid:nat -> v:nat{v>0}  -> 
  Lemma
  (requires (forall (i:nat) rk. is_ratcheted_root_key i r p peer sid (v-1) rk true ==>
			  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk)) /\
            (  forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==> 
               (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\ is_ratcheted_root_key k r p peer sid (v-1) rk' true) /\
                (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))
               )
            )
  )
  (ensures  forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==> 
               (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\  A.can_flow k (readers [P p; P peer]) (A.get_label signal_key_usages rk')) /\
                (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))
               )
  )





#set-options "--z3rlimit 500 --max_fuel 8 --max_ifuel 4"
let helper_lemma r p peer sid v = ()

#reset-options



#set-options "--z3rlimit 200 --max_fuel 2 --max_ifuel 2"
let rec is_ratcheted_root_key_lemma_forall r p peer sid v recv = 
  can_flow_to_join_forall_trace_index A.cpred;
  flows_to_public_can_flow_forall A.cpred;
  if v = 0 && r = R && recv = false then ()
  else if v = 0 && r = I then ()
  else if v = 0 && r = R && recv = true then(
    (*assert(forall i rk. is_ratcheted_root_key i r p peer sid v rk recv ==> (exists ek1. is_signal_root_key i rk (dh_secret_label0 p ek1) /\
      (A.can_flow i (readers [P p; P peer]) public \/
       (exists rsid rv. A.get_dhkey_label signal_key_usages ek1 == readers [V peer rsid rv]))));*)
    ()
  )
  else if v = 1 && r = I && recv = false then( 
    assert (forall i. A.can_flow i (readers [P p; P peer]) (readers [P peer]));
    ()
  )else if recv = false then( 
    assert(v>0);
    is_ratcheted_root_key_lemma_forall  r p peer sid (v-1) true;
     assert(forall (i:nat) rk. is_ratcheted_root_key i r p peer sid (v-1) rk true ==>
			  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk));
     assert( forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==> 
               (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\ is_ratcheted_root_key k r p peer sid (v-1) rk' true)/\
	       (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))));
    helper_lemma r p peer sid v;
    assert (forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==> 
               (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\  A.can_flow k (readers [P p; P peer]) (A.get_label signal_key_usages rk')) /\
                (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))
               ));
    assert (forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==> 
               (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       (exists k. k<i /\  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk')) /\
                (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))
               ));
    ()
  )else (
    is_ratcheted_root_key_lemma_forall  r p peer sid v false;
    assert(forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk false ==>
			  A.can_flow i (readers [P p; P peer]) (A.get_label signal_key_usages rk));
    assert(forall (i:nat) rk. is_ratcheted_root_key i r p peer sid v rk true ==> (exists ek rk'. is_signal_root_key i rk (dh_secret_label p sid v ek) /\
	       is_ratcheted_root_key i r p peer sid v rk' false /\
	       (A.can_flow i (A.get_label signal_key_usages rk') public \/
		 (exists rsid rv. A.get_dhkey_label signal_key_usages ek == readers [V peer rsid rv]))));
    ()
  )


let  is_ratcheted_root_key_lemma i r p peer sid v recv = is_ratcheted_root_key_lemma_forall r p peer sid v recv



