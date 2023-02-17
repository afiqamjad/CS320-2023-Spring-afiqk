(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)
fun list_tabulate(n: int, f: int -> 'a): 'a list =
    if n <= 0 then
        []
    else
        let
        val x = n - 1
        fun helper2(bruh: int, huh: 'a list): 'a list =
            if bruh = 0 then
                f(bruh)::huh
            else
                helper2(bruh - 1, f(bruh)::huh)
        in
        helper2(x, [])
        end
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
