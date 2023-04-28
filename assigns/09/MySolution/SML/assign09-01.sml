(* ****** ****** *)
(*
HX-2023-04-15: 10 points
*)
(* ****** ****** *)

(*
Please *translate* the following function
list_merge2 into list_kmerge2, where the latter
is of the so-called continuation-passing style (CPS)
*)

(* ****** ****** *)

(*
fun
list_merge2
(xs1: int list
,xs2: int list): int list =
(
case xs1 of
  nil => xs2
| x1 :: xs1 =>
(
case xs2 of
  nil => x1 :: xs1
| x2 :: xs2 =>
  if
  (x1 <= x2)
  then x1 :: list_merge2(xs1, x2 :: xs2)
  else x2 :: list_merge2(x1 :: xs1, xs2)
)
)
*)

(* ****** ****** *)

fun
list_kmerge2
(xs: int list, xs1: int list, res: int list -> 'a): 'a =
(
  case xs of
    nil => res(xs1)
  | 
    x1 :: xs =>
      (
        case xs1 of
          nil => res((x1 :: xs))
        | 
          x2 :: xs1 =>
            if x1 <= x2 then
              list_kmerge2(xs, x2 :: xs1, fn y => res((x1 :: y)))
            else 
              list_kmerge2(x1 :: xs, xs1, fn y => res((x2 :: y)))
)
);
(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-01.sml] *)
