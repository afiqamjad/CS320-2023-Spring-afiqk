(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-16: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(* ****** ****** *)

fun
isPrime(n0: int): bool =
let
  fun tester(huh: int): bool =
      if huh < 2 then true else
        if n0 mod huh = 0 then
          false
        else
          true
in
  if n0 >= 2 then 
    if int1_forall((n0 div 2) + 1, tester) then true else false
  else
    false
end

(* end of [CS320-2023-Spring-assign04-01.sml] *)
