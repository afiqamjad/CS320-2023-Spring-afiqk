(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)
use "./../../02/assign02.sml";
use "./../../../mysmlib/mysmlib-cls.sml";
(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)
fun list_longest_ascend(xs: int list): int list =
    let
      fun compare(xs3: int list, xs4: int list): int list =
        if list_length(xs3) >= list_length(xs4) then
            xs3
        else
            xs4
      fun remover(xs2: int list, starter: int): int list =
        case xs2 of
            nil => []
            |
            hd::tl => (if hd < starter then
                            remover(tl, starter)
                        else
                            hd::remover(tl, starter))
    in
      case xs of
        nil => []
        |
        (x1::tl) => compare(x1::list_longest_ascend(remover(tl, x1)),list_longest_ascend(tl))
    end

    val xs9 = [4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1]
    

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-04.sml] *)
