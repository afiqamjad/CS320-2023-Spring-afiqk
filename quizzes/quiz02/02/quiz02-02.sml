Quiz02-02:
(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
//
HX-2023-02-20: 60 points
//
Please implement a function of the name quiz02_02
that takes two lists xs and ys of integers and checks
whether there exists a pair (x, y) such that |x-y| < 10
where x is in xs and y is in ys.
//
*)
(* ****** ****** *)
val abs =
fn(x:int) => if x >= 0 then x else ~x
(* ****** ****** *)
val quiz02_02 : (int list * int list) : bool = ??
(* ****** ****** *)
(* end of [CS320-2023-Spring-quizzes-quiz02_02.sml] *)