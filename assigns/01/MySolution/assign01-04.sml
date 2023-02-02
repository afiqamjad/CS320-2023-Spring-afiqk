(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

use "./../../../mysmlib/mysmlib-cls.sml";
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


fun substring2(cs: string, length: int): string = 
  if length = 0 then str(strsub(cs,0)) else strcat(substring2(cs, length - 1), str(strsub(cs,length)));

fun str2int2(cs: string): int =
let
  val lengthDecrease = strlen(cs) - 1
in
  if lengthDecrease = 0 then 
    if (ord(strsub(cs, 0)) - 48) <= 9 andalso (ord(strsub(cs, 0)) - 48) >= 0 then 
      (ord(strsub(cs, 0)) - 48) else 0 
  else (str2int2(substring2(cs,lengthDecrease - 1)))*10  + (if (ord(strsub(cs, lengthDecrease)) - 48) <= 9 andalso (ord(strsub(cs, lengthDecrease)) - 48) >= 0 then 
    ord(strsub(cs, lengthDecrease)) - 48 else 0)
end

fun str2int_opt(cs: string): int option =
  if int2str(str2int2(cs)) = cs then SOME(str2int2(cs)) else NONE


