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

fun cubed(first: int): int =
  first*first*first

fun make_stream(n: int, j: int): (int*int) stream =
  fn () => strcon_cons((n,j), make_stream(n, j+1))

fun testing(n: int): (int*int) stream stream =
  fn () => strcon_cons(make_stream(n, n), testing(n + 1))

fun checker(bruh1: (int*int), bruh2: (int*int)): bool =
  if ((cubed(#1(bruh1)) + cubed(#2(bruh1))) <= (cubed(#1(bruh2)) + cubed(#2(bruh2)))) then
    true
  else
    false

fun merged(n: int): (int*int) stream = fn() =>
  strcon_cons((0,n), stream_merge2(make_stream(n,n), merged(n+1), fn(x,y) => checker(x,y)))

val theNatPairs_cubesum: (int * int) stream = 
  (* enumerates all the pairs (i, j) of natural numbers satisfying $i <= j$ *)
  stream_cons((0,0), merged(1))















(* fun make_merged_stream(fxs: (int*int) stream stream, x1: int) =
  let
    val first = stream_get_at(fxs, x1)
    val second = stream_get_at(fxs, x1 + 1)
    val first_merged = stream_merge2(first, second, fn(x,y) => checker(x,y))
  in
  fn () =>  stream_merge2(first_merged, make_merged_stream(fxs, x1 + 2)(), fn (x, y) => checker(x,y))
  end  *)
(* fun merged(fxs: (int*int) stream, x: int): (int*int) stream =
fn () =>
  case fxs of
    strcon_nil => strcon_nil
    |
    strcon_cons(x1, fxs) => strcon_cons(x1, stream_merge2(merged(fxs), make_stream(x + 1), fn (x,y) => checker(x,y))) *)
(*Put the first element first and then merge the rest*)
  
(**********************************************************************************************************)
(**********************************************************************************************************)

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
