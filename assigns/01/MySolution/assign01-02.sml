(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

use "./../assign01.sml";
use "./../MySolution/assign01-01.sml";

val xs = xlist_nil
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
if i0 >= 0 andalso i0 < xlist_size(xs) then
let
  fun loop(xs, i0) = 
  (
    case xs of
    xlist_nil => raise XlistSubscript
    |
    xlist_cons(x1, xs) => if i0 > 0 then loop(xs, i0-1) else x1 
    |
    xlist_snoc(xs, x1) => if i0 < xlist_size(xs) then loop(xs, i0-1) else x1
    |
    xlist_append(xs, ys) => if i0 < xlist_size(xs) then loop(xs, i0-xlist_size(ys)) else loop(ys,i0-xlist_size(xs))
    |
    xlist_reverse(xs) => loop(xs, i0)
  )
in
  loop(xs, i0)
end
else raise XlistSubscript