(** * Testcases for [unfold.v]
Authors: 
    - Lulof Pirée (1363638)

Creation date: 14 June 2021

These tests are quite superfluous, 
as the implementation is EXACTLY the same as the definition
of the build-in [unfold].

--------------------------------------------------------------------------------

This file is part of Waterproof-lib.

Waterproof-lib is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Waterproof-lib is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Waterproof-lib.  If not, see <https://www.gnu.org/licenses/>.
*)

From Ltac2 Require Import Ltac2.
From Ltac2 Require Import Option.

Require Import Waterproof.test_auxiliary.
Load unfold.


Definition some_function (x: nat) := 2 * x.

(** * Test 1
    Unfold a function IN THE GOAL to show that its definition
    proves the goal.
*)
Lemma test_unfold_1: forall (x:nat), some_function x = 2*x.
    intros x.
    Unfold some_function.
    reflexivity.
Qed.


(** * Test 2
    Unfold a function IN A HYPOTHESIS to show that its definition
    proves the goal.
*)
Lemma test_unfold_2: forall (x a:nat), some_function x = a -> 2*x = a.
    intros x a h.
    Unfold some_function in h.
    exact h.
Qed.

(** * Test 3
    Same as test 1, but with alternative notation.
*)
Lemma test_unfold_3: forall (x:nat), some_function x = 2*x.
    intros x.
    Expand the definition of some_function.
    reflexivity.
Qed.


(** * Test 3
    Same as test 2, but with alternative notation.
*)
Lemma test_unfold_4: forall (x a:nat), some_function x = a -> 2*x = a.
    intros x a h.
    Expand the definition of some_function in h.
    exact h.
Qed.