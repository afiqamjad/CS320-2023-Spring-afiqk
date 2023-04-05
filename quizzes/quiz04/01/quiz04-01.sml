(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01
*)

fun alphabeta_cycling_list(): char stream = 
    let
      val theAlphabet =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

      fun str_to_list(n: string): char list =
            string_listize(n)

      fun make_stream(n: char list, j: int): char stream =
            fn() => 
                strcon_cons(list_get_at(n, (j mod 26)), make_stream(n, (j mod 26) + 1))

      val hello = str_to_list(theAlphabet)
    in
      make_stream(hello, 0)
    end
(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)