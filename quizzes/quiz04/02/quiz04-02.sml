(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-02
*)
fun stream_dupremov(fxs: int stream) =
    let
      fun checker(fxs: int stream, item: int, intz: int) =
            if intz <> 0 then
                if stream_get_at(fxs, intz - 1) <> item then 
                    true
                else
                    false
            else
                true
    in
      stream_make_ifilter(fxs, fn (intz,y) => checker(fxs, y, intz)) 
    end
    

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)