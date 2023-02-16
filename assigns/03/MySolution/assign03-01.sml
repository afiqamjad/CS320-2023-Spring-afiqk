(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)

fun
find_root(f0: int -> int): int =
    if f0(0) = 0 then
        0
    else
        let
          val x = 1
          fun looper(y: int): int =
            if f0(y) = 0 then
                y
            else
                if (y + y) > 0 then
                looper(y*(~1))
            else
                looper((y*(~1)) + 1)
        in
          looper(x)
        end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01.sml] *)