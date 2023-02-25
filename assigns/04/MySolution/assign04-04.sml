(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)
type board_t =
int * int * int * int * int * int * int * int

fun board_get
  (bd: board_t, i: int): int =
  if i = 0 then #1(bd)
  else if i = 1 then #2(bd)
  else if i = 2 then #3(bd)
  else if i = 3 then #4(bd)
  else if i = 4 then #5(bd)
  else if i = 5 then #6(bd)
  else if i = 6 then #7(bd)
  else if i = 7 then #8(bd)
  else ~1

fun board_set
  (bd: board_t, i: int, j:int): board_t = let
  val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
  if i = 0 then let
    val x0 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 1 then let
    val x1 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 2 then let
    val x2 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 3 then let
    val x3 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 4 then let
    val x4 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 5 then let
    val x5 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 6 then let
    val x6 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 7 then let
    val x7 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else bd
  end 

(*The function safety_test1 tests whether a queen piece on row i0 and column j0 can capture another one on row i and column j.*)
fun safety_test1
(
  i0: int, j0: int, i: int, j: int
) : bool =
(*
** [abs]: the absolute value function
*)
  j0 <> j andalso abs (i0 - i) <> abs (j0 - j)


(*The function safety_test2 tests whether a queen piece on row i0 and column j0 can capture any other pieces on a given board with a row number less than or equal to i.*)
fun safety_test2
(
  i0: int, j0: int, bd: board_t, i: int
) : bool =
  if i >= 0 then
    if safety_test1 (i0, j0, i, board_get (bd, i))
      then safety_test2 (i0, j0, bd, i-1) else false
  else true 

fun
queen8_puzzle_solve(): board_t list =
  let
    val emptyBoard = (9,9,9,9,9,9,9,9)
    val solutions2 = ((emptyBoard))
  in
    
  end
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)
