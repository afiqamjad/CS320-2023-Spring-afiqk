(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

val theNatPairs: (int*int) stream = fn () =>
    let
      fun loop(i, j) = strcon_cons((i, j), fn() =>
        if j = 0 then 
            loop(0, i + 1)
        else 
            loop(i + 1, j - 1)
    )
    in
      loop(0, 0) 
    end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)
