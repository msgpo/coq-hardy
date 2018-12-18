Require Export ZArith.
Require Export Znumtheory.
Require Export Zpow_facts.

Definition inf_primes_of_form (f : Z -> Z) :=
  forall l : Z, exists n : Z, l < n /\ prime (f n).
  

(* Theorem 10: x>=2 -> pi(x) >= loglog x *)

(* Theorem 11: Infinitely many primes of form, 4n+3 *)
Theorem theorem_11 : inf_primes_of_form (fun n => 4*n+3).
Proof.
  unfold inf_primes_of_form.
  intros.
Abort.

(* Theorem 12: 6n+5 *)
Theorem theorem_12 : inf_primes_of_form (fun n => 6*n+5).
Proof.
Abort.

(* Theorem 13 *)
Theorem theorem_13 :
  forall a b: Z, rel_prime a b -> 
                 forall p : Z, prime p /\ p<>2 /\ (p|(a*a + b*b)) -> p mod 4 = 1.
Abort.
                                                                      
(* Theorem 14: 8n+5 *)
Theorem theorem_14 : inf_primes_of_form (fun n => 8*n+5).
Abort.

(* Theorem 15: Dirichlet's theorem (not proven in book...) *)
Theorem dirichlets_theorem : forall a b : Z,
    a > 0 /\ (rel_prime a b) -> inf_primes_of_form (fun n => a*n+b).
Proof.
  intros.
Abort.

(* Theorem 16: No two Fermat numbers have a gcd > 1 *)
Definition F (n : Z) := 2^2^n + 1.

Lemma div_minus_trans : forall m a b : Z, (m|a) /\ (m|(a+b)) -> (m | b).
Proof.
  intros.
  destruct H.
  destruct H.
  destruct H0.
  rewrite H in H0.

  assert (mdb : x0 * m - x * m = b). omega.
  clear H0 H a.
  rewrite <- Z.mul_sub_distr_r in mdb.

  exists (x0 - x).
  auto.
Qed.

Theorem theorem_16 : forall n k : Z,
    rel_prime (F n) (F (n+k)).
Proof.
  intros.
  constructor; auto with zarith.
  intros m dn dnk.

  assert (mn2 : Z.abs m <> 2).
  admit.
  
  assert ((F n)|((F (n+k))-2)).
  admit.

  specialize (Z.divide_trans m (F n) (F (n + k) - 2)).
  intros.
  apply H0 in H; [|assumption].
  clear H0 dn.

  specialize (div_minus_trans m (F (n + k)) (-2)).
  intros.
  destruct H0.
  split; auto.

  clear H dnk.
  
  
Abort.

