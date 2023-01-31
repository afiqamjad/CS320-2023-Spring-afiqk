(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

use "./../assign01.sml";

fun xlist_size(xs: 'a xlist): int =
(
case xs of
xlist_nil => 0
|
xlist_cons(x1, xs) => 1 + xlist_size(xs)
|
xlist_snoc(xs, x1) => xlist_size(xs) + 1
|
xlist_append(xs, ys) => xlist_size(xs) + xlist_size(ys)
|
xlist_reverse(xs) => xlist_size(xs)
)

