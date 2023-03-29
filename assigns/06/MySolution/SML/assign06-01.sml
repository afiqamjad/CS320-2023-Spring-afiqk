(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

fun
stream_from(n: int): int stream =
fn () => strcon_cons(n, stream_from(n+1))

val nats  = stream_from(0)

val realz = stream_make_map(nats, fn x => Real.fromInt x)

fun calcul(xs: real stream, acc: real, counter: real, sign: real): real stream =
    fn () =>
        case xs () of
            strcon_nil => strcon_nil
            |
            strcon_cons(x1, xs) => 
                let
                  val sign = sign
                  val acc = acc + (1.0 / (sign * counter))
                in
                  strcon_cons(acc, calcul(xs, acc, counter + 1.0, sign * ~1.0))
                end

fun wrapper(xs: real stream): real stream =
    calcul(xs, 0.0, 1.0, 1.0)

val the_ln2_stream: real stream = 
        wrapper(realz)
    



(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)
