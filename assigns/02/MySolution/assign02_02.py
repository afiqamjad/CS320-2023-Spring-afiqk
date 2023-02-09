####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################

# fun
# list_quicksort
# (xs: int list): int list =
# let
    # (* ****** ****** *)
    # fun
    # qsort(xs: int list): int list =
    # (
    # case xs of
    # nil => nil
    # |
    # x1 :: xs =>
    # let
        # val (ys, zs) = qpart(xs, x1)
        # val ys = qsort(ys) and zs = qsort(zs)
    # in
        #   ys @ [x1] @ zs
    # end
    # )    #and
    # qpart
    # (xs: int list, p0: int): int list * int list =
    # (
    # case xs of
    # nil => (nil, nil)
    # |
    # x1 :: xs =>
    # let
        # val (ys, zs) = qpart(xs, p0)
        # in
        #   if x1 <= p0 then (x1 :: ys, zs) else (ys, x1 :: zs)
    # end
    # )
    # (* ****** ****** *)
    # in
    #   qsort(xs)
# end (* end-of-[list_quicksort]: let *) 
    
def mylist_quicksort(xs):

    def qsort(xs):
        if mylist_nilq(xs):
            return mylist_nil()
        ys, zs = qpart(mylist_cons.get_cons2(xs), mylist_cons.get_cons1(xs))
        ys = qsort(ys)
        zs = qsort(zs)
        return mylist_append(mylist_append(ys, mylist_cons(mylist_cons.get_cons1(xs), mylist_nil())), zs)

    def qpart(xs, p0):
        if mylist_nilq(xs):
            return mylist_nil(), mylist_nil()
        ys, zs = qpart(mylist_cons.get_cons2(xs), p0)
        if mylist_cons.get_cons1(xs) <= p0:
            return mylist_cons(mylist_cons.get_cons1(xs), ys), zs
        return ys, mylist_cons(mylist_cons.get_cons1(xs), zs)
        
    return qsort(xs)