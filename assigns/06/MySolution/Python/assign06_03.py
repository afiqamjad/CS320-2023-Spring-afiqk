####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
from queue import LifoQueue
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################

def gtree_dfs(cnxs, fchildren):
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            for nx2 in reversed(fchildren(nx1)):
                nxs.put(nx2)
            return strcon_cons(nx1, lambda: helper(nxs))
    nxs = LifoQueue()
    for nx1 in cnxs:
        nxs.put(nx1)
    return lambda: helper(nxs)

# initialize stream with [0,0,0,0,....] where array is size N
# add children of the current array to stream
# go to first child, and add all valid children into the stream
#     - valid means that check condition compared to the queens in rows before it
#         - to do this check if its same number, or if the diff between cols and rows are equak (therefore diagonal)
# iterate until all indices are filled
# return
# filter solutions

def initial(N):
    lst = []
    for i in range(N):
        lst[i] = 0
    return strcon_cons(lst, strcon_nil())


# fun
# queen8_puzzle_solve(): board_t list =
# (*
# returns a list of boards consisting of all the solutions to the puzzle.
# *)
# //
# *)

##########################################################

# type
# int8 =
# int*int*int*int
# *
# int*int*int*int
# type board_t = int8

##########################################################

# val
# board_foreach =
#     fn
#     ( bd: board_t
#     , work: int -> unit) =>
#     let
#         val
#         (x0, x1, x2, x3, x4, x5, x6, x7) = bd
#     in
#         work(x0); work(x1);
#         work(x2); work(x3);
#         work(x4); work(x5); work(x6); work(x7)
#     end
def board_foreach(bd, work):
    return
    

##########################################################

# val
# board_get_at =
# fn(bd: board_t, i: int) =>
#     foreach_to_get_at(board_foreach)(bd, i)
def board_get_at(bd, i):
    

##########################################################

# val
# board_tabulate =
# fn(f: int -> int) =>
#     (f(0), f(1), f(2), f(3), f(4), f(5), f(6), f(7))

##########################################################

# val
# board_fset_at =
# fn(bd: board_t, i: int, p: int) =>
#     board_tabulate
#     (fn(j) => if i = j then p else board_get_at(bd, j))

##########################################################

# val
# board_safety =
# fn(bd, i) =>
#     let
#         val pi =
#         board_get_at(bd, i)
#         val
#         helper =
#         fn(j) =>
#             let
#                 val pj =
#                 board_get_at(bd, j)
#             in
#                 pi <> pj andalso
#                 (abs(i-j) <> abs(pi-pj))
#             end
#     in
#         int1_forall(i, fn j => helper(j))
#     end

##########################################################

# val
# int1_map_list =
# fn(xs, fopr) =>
#     foreach_to_map_list(int1_foreach)(xs, fopr)

##########################################################

# val
# board_extend =
# fn(bd: board_t, i: int) =>
#     list_filter
#     (int1_map_list
#     (N, fn(p) => board_fset_at(bd, i, p+1)), fn(bd) => board_safety(bd, i))

##########################################################

# val
# queen8_puzzle_solve =
# fn() =>
#     int1_foldleft
#     ( N, [board_tabulate(fn _ => 0)]
#     , fn(bds, i) => list_concat(list_map(bds, fn(bd) => board_extend(bd, i))))

##########################################################

def solve_N_queen_puzzle(N):
    """
    Please revisit assign04-04.sml.
    A board of size N is a tuple of length N.
    ######
    For instance, a tuple (0, 0, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are no queen pieces on the board.
    ######
    For instance, a tuple (2, 1, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are two queen pieces; the queen piece
    on the 1st row is on the 2nd column; the queen piece
    on the 2nd row is on the 1st column; the last two rows
    contain no queen pieces.
    ######
    This function [solve_N_queen_puzzle] should return
    a stream of ALL the boards of size N that contain N
    queen pieces (one on each row and on each column) such
    that no queen piece on the board can catch any other ones
    on the same board.
    """
    raise NotImplementedError
####################################################
