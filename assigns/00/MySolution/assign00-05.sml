(*
Assign00-05: 10 points
Please implement a function that returns the reverse of
a given string:
fun stringrev(cs: string): string
*)

val ord = Char.ord (* char to ascii *)
val chr = Char.chr (* ascii to char *)

(* ****** ****** *)

val str = String.str (* char to string *)

(* ****** ****** *)

val strlen =
String.size (* string length *)

val strcat = op^ (* string concatenation *)
val strsub = String.sub (* string subcripting *)

fun substring2(cs: string, length: int): string = 
  if length = 0 then str(strsub(cs,0)) else strcat(substring2(cs, length - 1), str(strsub(cs,length)))

fun stringrev(cs: string): string =
let
  val lengthDecrease = strlen(cs) - 1
in
  if cs = "" then "" else
  if lengthDecrease = 0 then str(strsub(cs, 0)) else strcat(str(strsub(cs, lengthDecrease)), stringrev(substring2(cs, lengthDecrease - 1)))
end
  