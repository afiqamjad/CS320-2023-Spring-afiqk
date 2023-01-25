(*
Assign00-03: 10 points
Please implement a function that converts a given
integer to a string that represents the integer:
fun int2str(i0: int): string
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

fun int2strBasic(n: int): string = 
    str(chr(n+48));

fun int2str(i0: int): string =
    if i0 < 10 then int2strBasic(i0) else strcat(int2str(i0 div 10), int2strBasic(i0 - ((i0 div 10) * 10)))
