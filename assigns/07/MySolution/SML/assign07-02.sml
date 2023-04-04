(* ****** ****** *)
use
"mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () =>
//
*)

fun make_stream(n: int, j: int): (int*int) stream =
  fn () => strcon_cons((n,j), make_stream(n, j+1))



(* fun tuple_stream_make(str1: int stream, str2: int stream, n: int): int*int stream =
  fn () => 
    case str1() of
      strcon_nil => strcon_nil
      |
      strcon_cons(x1,xs) => 
        stream_foreach() *)
(* 
fun testers(n: int, lst: int stream): int*int stream =
  fn () => strcon_cons((n, stream_get_at(lst, n)), ) *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-02.sml] *)
