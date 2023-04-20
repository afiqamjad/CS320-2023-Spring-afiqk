(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

fun
stream_take
(fxs: 'a stream, n: int): 'a stream =
fn () =>
    (if n <= 0 then
        strcon_nil
    else
        case fxs() of
            strcon_nil => strcon_nil
            |
            strcon_cons(x1, fxs) => strcon_cons(x1, stream_take(fxs, n - 1))
            )

(* ****** ****** *)


fun
stream_drop
(fxs: 'a stream, n: int): 'a stream =
fn() =>
    (case fxs() of
        strcon_nil => strcon_nil
        |
        strcon_cons(x1,xs) => 
            if n >= 1 then
                stream_drop(xs, n - 1)()
            else
                strcon_cons(x1, stream_drop(xs, n))  
    )


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00.sml] *)
