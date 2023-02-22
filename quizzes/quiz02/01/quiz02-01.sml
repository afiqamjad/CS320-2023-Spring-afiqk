(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
val strlen = (* length *)
foreach_to_length(string_foreach)
val strsub = (* subscripting *)
foreach_to_get_at(string_foreach)
(* ****** ****** *)
(*
HX-2023-02-20:
Please implement a function
[quiz02_01' of the following type:
//
fun
quiz02_01
(word: string): char -> int =
//
Given a word 'word' (of the type string),
'quiz02_01(word)' returns a function of the
type 'char -> int'; when applied to a char,
this function returns the number of times this
char appears in 'word'.
For instance, we have
quiz02_01("$abb^cccdddd")(#"0") = 0
quiz02_01("$abb^cccdddd")(#"1") = 0
quiz02_01("$abb^cccdddd")(#"a") = 1
quiz02_01("$abb^cccdddd")(#"b") = 2
quiz02_01("$abb^cccdddd")(#"c") = 3
quiz02_01("$abb^cccdddd")(#"d") = 4
quiz02_01("$abb^cccdddd")(#"z") = 0
quiz02_01("$abb^cccdddd")(#"$") = 1
quiz02_01("$abb^cccdddd")(#"^") = 1
*)
(* ****** ****** *)
val
string_foreach =
fn( cs, work ) =>
int1_foreach
(String.size(cs), fn(i) => work(String.sub(cs, i)))

fun quiz02_01 (word: string) : char -> int = 
    let
      val x = 0
      fun add(a: int, b: int): int =
        a + b
    in
      fn (bruh: char): int =>
        string_foreach(word, fn(bruh2) => if bruh = bruh2 then add(x, 1) else add(x, 0))
    end
    
(* ****** ****** *)
(* end of [CS320-2023-Spring-quizzes-quiz02_01.sml] *)