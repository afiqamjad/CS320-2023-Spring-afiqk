(* ****** ****** *)
use
"mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(*
For a list [1,2,3]

1. xs = []
   xss = [[0]]

2. xs = [3]
   xss = [[0,3],[3,0]]

3. xs = [2,3]
   xss = [[0,2,3],[2,0,3],[2,3,0]]

4. xs = [1,2,3]
   xss = [[0,1,2,3], [1,0,2,3], [1,2,0,3], [1,2,3,0]]
*)

(* fun insert(a: 'a, ls: 'a list) =
   #2 (list_foldright (ls, ([], [[a]]), fn ((xs, xss), x) =>
        let val xs = x :: xs
        in
            (xs, (a :: xs) :: list_map(xss, fn xs0 => x :: xs0))
        end))

fun perm (xs: 'a list) =
    case xs of
        [] => [[]]
        |
        x :: xs => 
            let val xss = perm(xs)
            in
              list_concat (list_map (xss, fn xs0 => insert (x, xs0)))
            end*)

fun insert2(a: 'a, xs: 'a list): 'a list stream =
    fn () =>
        case (a, xs) of
            (x1, []) => strcon_cons([x1], stream_nil())
            |
            (x1, x2::xs) => strcon_cons((x1::x2::xs), stream_make_map(insert2(x1, xs), fn y => x2::y))

fun stream_permute_list(xs: 'a list): 'a list stream =
    case xs of
        [] => stream_cons([], stream_nil())
        |
        x1::xs => stream_concat(stream_make_map(stream_permute_list(xs), fn x => insert2(x1, x)))


(* fun mkList (n: int) : int list =
    if n <= 0 then [] else n :: mkList (n - 1) *)
    

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)