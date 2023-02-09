####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02.sml)
# mylist_rappend (see list_rappend in assign02.sml)
# mylist_reverse (see list_reverse in assign02.sml)
#
####################################################
# fun
# list_append
# (xs: 'a list, ys: 'a list): 'a list =
# (
# case xs of
#   nil => ys
# | x1 :: xs => x1 :: list_append(xs, ys)
# )

# (* ****** ****** *)

def mylist_append(bs, cs):
    if mylist_nilq(bs):
        return cs
    return mylist_cons(mylist_cons.get_cons1(bs),mylist_append(mylist_cons.get_cons2(bs), cs))

# fun
# list_rappend
# (xs: 'a list, ys: 'a list): 'a list =
# (
# case xs of
#   nil => ys
# | x1 :: xs => list_rappend(xs, x1 :: ys)
# )

def mylist_rappend(bs, cs):
    if mylist_nilq(bs):
        return cs
    return mylist_rappend(mylist_cons.get_cons2(bs), mylist_cons(mylist_cons.get_cons1(bs), cs))

# (* ****** ****** *)
# fun
# list_reverse
# (xs: 'a list): 'a list = list_rappend(xs, [])
# (* ****** ****** *)

def mylist_reverse(bs):
    return mylist_rappend(bs, mylist_nil())