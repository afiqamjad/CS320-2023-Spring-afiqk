(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
The mytree datatype is defined as follows.
Each node in mytree contains a stored element
plus a list of children, where the list can be
empty.
//
Please implement a function mytree_dfs_streamize
that enumerates a given mytree in a depth-first manner.
//
*)
(* ****** ****** *)

datatype 'a mytree =
  mytree_node of 'a * ('a mytree list)

(* ****** ****** *)

fun one_branch(t1: 'a mytree list): 'a strcon =
    case t1 of
      [] => strcon_nil
      |
      mytree_node(x1, xs)::xss => strcon_cons(x1, fn () => one_branch(xs@xss))

fun
mytree_dfs_streamize(t0: 'a mytree): 'a stream =
  fn() =>
    one_branch([t0])

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02.sml] *)
