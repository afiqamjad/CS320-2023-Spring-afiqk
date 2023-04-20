(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// an infinite stream fxs of integers and returns a stream
// enumerating all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

fun stream_drawdowns(fxs: int stream): int list stream = 
     let
        fun help(x1: int list, fxss: int stream): int list stream = 
            fn() =>
                case fxss() of
                    strcon_nil => strcon_nil
                    |
                    strcon_cons(x2, xs) =>
                        case x1 of
                            [] => help([x2], xs)()
                            |
                            x3::xss => 
                                if x2 <= x3 then 
                                    help(x2::x1, xs)()
                                else 
                                    strcon_cons(list_reverse(x1), help([x2], xs))
    in
        help([], fxs)
    end

(* ****** ****** *)


(* end of [CS320-2023-Spring-midterm2-04.sml] *)
