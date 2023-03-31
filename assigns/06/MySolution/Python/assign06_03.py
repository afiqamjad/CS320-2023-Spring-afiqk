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

#
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
        lst.append(0)
    return [lst]

def checking(x1, intz, num):
    boolz = True
    if intz == 0:
        return boolz
    for i in range(intz):
        if (x1[i] == num or (abs(intz - i) == abs(x1[i] - num))):
            boolz = False
            break
    return boolz

def get_children(x1, N):
    i = 1
    x2 = x1[:]
    x3 = []
    intz = 0
    while intz < N:
        if x1[intz] != 0:
            intz = intz + 1
        else:
            break
    while i <= N:
        if checking(x1, intz, i):
            x2[intz] = i
            x3.append(x2[:])
        i = i + 1
    return x3
            

def solve_N_queen_puzzle(N):
    bruh = initial(N)
    bruh2 = gtree_dfs(bruh, lambda x: get_children(x, len(bruh[0])))
    bruh3 = stream_make_filter(bruh2, lambda x1: tuple(x1) if x1[-1] != 0 else None)
    return bruh3


#  stream_foreach(solve_N_queen_puzzle(4), lambda x: print(x))


# stream_foreach(solve_N_queen_puzzle(11), lambda x: print(x))
    
####################################################
