(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)
(*DONE*)

fun
list_nchoose2(xs: int list): (int * int) list =
    let
      val listEnd = list_filter(list_append(list_cross2_col(xs,xs), list_cross2_row(xs,xs)), fn(x) => #1(x) <= #2(x) andalso #1(x) <> #2(x))
    in
      list_reduce_left(list_filter(list_append(list_cross2_col(xs,xs), list_cross2_row(xs,xs)), fn(x) => #1(x) <= #2(x) andalso #1(x) <> #2(x)),
      [], fn(acc, x) => if list_length(acc) = (list_length(listEnd) div 2) then acc else x::acc)
    end


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
