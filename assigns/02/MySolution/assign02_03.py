####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################

# fun
# list_mergesort
# (xs: int list): int list =
# let

# fun
# split
# (xs: int list): int list * int list =
# (
# case xs of
#   nil => ([], [])
# | x1 :: xs =>
# (
#   case xs of
#     nil => ([x1], [])
#   | x2 :: xs =>
#     let
#       val
#       (ys, zs) = split(xs)
#     in
#       (x1 :: ys, x2 :: zs)
#     end
# )
# )

# fun merge
# ( ys: int list
# , zs: int list): int list =
# (
# case ys of
#   nil => zs
# | y1 :: ys =>
# (
#   case zs of
#     nil => y1 :: ys
#   | z1 :: zs =>
#     if y1 <= z1
#     then y1 :: merge(ys, z1 :: zs)
#     else z1 :: merge(y1 :: ys, zs)
# )
# )

# in

# case xs of
#   nil => []
# | x1 :: xs =>
# (
#   case xs of
#     nil => [x1]
#   | x2 :: xs =>
#     let
#       val (ys, zs) = split(xs)
#     in
#       merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
#     end
# )

# end (* end-of-[list_mergesort]: let *)

def mylist_mergesort(xs):
    
    def split(xs):
        if mylist_nilq(xs):
            return mylist_nil(), mylist_nil()
        if mylist_nilq(mylist_cons.get_cons2(xs)):
            return mylist_cons(mylist_cons.get_cons1(xs), mylist_nil()), mylist_nil()
        ys, zs = split(mylist_cons.get_cons2(mylist_cons.get_cons2(xs)))
        return mylist_cons(mylist_cons.get_cons1(xs),ys), mylist_cons(mylist_cons.get_cons1(mylist_cons.get_cons2(xs)),zs)

    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        if mylist_nilq(zs):
            return ys
        if mylist_cons.get_cons1(ys) <= mylist_cons.get_cons1(zs):
            return mylist_cons(mylist_cons.get_cons1(ys), merge(mylist_cons.get_cons2(ys), zs))
        return mylist_cons(mylist_cons.get_cons1(zs), merge(ys, mylist_cons.get_cons2(zs)))

    if mylist_nilq(xs):
        return mylist_nil()
    if mylist_nilq(mylist_cons.get_cons2(xs)):
        return mylist_cons(mylist_cons.get_cons1(xs), mylist_nil())
    ys, zs = split(mylist_cons.get_cons2(mylist_cons.get_cons2(xs)))
    return merge(mylist_mergesort(mylist_cons(mylist_cons.get_cons1(xs), ys)), mylist_mergesort(mylist_cons(mylist_cons.get_cons1(mylist_cons.get_cons2(xs)),zs)))