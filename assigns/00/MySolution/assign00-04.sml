(*
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
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
  if length = 0 then str(strsub(cs,0)) else strcat(substring2(cs, length - 1), str(strsub(cs,length)));

fun str2int(cs: string): int =
let
  val lengthDecrease = strlen(cs) - 1
in
  if lengthDecrease = 0 then ord(strsub(cs, 0)) - 48 else (str2int(substring2(cs,lengthDecrease - 1)))*10  + ord(strsub(cs, lengthDecrease)) - 48
end