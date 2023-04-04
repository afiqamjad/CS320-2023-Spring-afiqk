(* ****** ****** *)
use
"mysmlib-cls.sml";
(* ****** ****** *)


(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)
fun stream_make(n: int): int stream =
    fn () =>
        strcon_cons(n, stream_make(n+1))


fun helper(intz: int, lst: 'a stream list): 'a list =
    list_foldright(lst, [], fn(x,xs) => stream_get_at(xs,intz)::x)

(* fun tester(intz: int, lst: 'a stream list): 'a stream =
    list_get_at(lst, intz)

fun tester2(str: 'a stream): 'a =
    stream_get_at(str, 1)

fun tester3(lst: 'a list): 'a =
    list_get_at(lst, 0) *)

val xs1 =
list_streamize[1]
val xs2 =
list_streamize[2,3,4]
val xs3 =
list_streamize[3,3]

val testing = helper(0, [xs1,xs2,xs3])

(* val one = tester(1, [xs1, xs2, xs3])
val two = tester2(one) *)
(* fun stream_ziplst(lst: 'a stream list): 'a list stream = *)
        
            
(* 
val xs1 =
list_streamize[1]
val xs2 =
list_streamize[2,2,2]
val xs3 =
list_streamize[3,3]
val fxss =
stream_ziplst([xs1, xs2, xs3]) *)
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-01.sml] *)
