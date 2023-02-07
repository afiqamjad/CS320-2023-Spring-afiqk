(* ****** ****** *)
(*
HX-2023-02-07: 50 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)

fun smaller_sort(cs: int2): int2 =
  if #1(cs) <= #2(cs) then
    cs
  else
    (#2(cs), #1(cs))

(34)(12)
fun medium_sort(cs1: int2, cs2: int2): int4 =
  if #1(cs2) < #2(cs1) then
    (#1(cs2),#2(cs2),#1(cs1),#2(cs1))
  else
    (#1(cs1),#2(cs1),#1(cs2),#2(cs2))
fun
int5_sort_nr(xs: int5): int5 =
if #1(xs)*#2(xs)*#3(xs)*#4(xs)*#5(xs) = #1(xs)*#1(xs)*#1(xs)*#1(xs)*#1(xs) then
  xs
else
  let
    val first = (#1(xs), #2(xs))
    val second = (#3(xs), #4(xs))
    val third = #5(xs)
    val smallFirst = smaller_sort(first)
    val smallSecond = smaller_sort(second)
    val medium = medium_sort(smallFirst, smallSecond)
  in
    if third < #4(medium) then
      (third, #1(medium),#2(medium),#3(medium),#4(medium))
    else
       (#1(medium),#2(medium),#3(medium),#4(medium), third)
  end
(*
Please Give your implementation as follows:
*)


(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-int5_sort_nonrec.sml] *)
