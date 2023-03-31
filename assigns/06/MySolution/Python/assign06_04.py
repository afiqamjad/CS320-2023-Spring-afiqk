####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
from dictwords import word_is_legal
import queue
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
####################################################
def gtree_bfs(nxs, fchlds):
    def helper(qnxs):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fchlds(nx1[-1], nx1): 
                    qnxs.put(nx2)
            return strcon_cons(tuple(nx1), lambda: helper(qnxs))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.Queue()
    for nx1 in nxs:
        qnxs.put([nx1])
    return lambda: helper(qnxs)

def alphabet():
    return "abcdefghijklmnopqrstuvwxyz"

def checker(word):
    return word_is_legal(word)
    

def get_children(word, lst):
    temp = ""
    lst2 = []
    for i in range(len(word)):
        for j in alphabet():
            if i == 0:
                temp = j + word[1:]
            elif i == len(word) - 1:
                temp = word[:len(word) - 1] + j
            else:
                temp = word[:i] + j + word[i+1:]
            if checker(temp) and temp != word:
                lst.append(temp)
                lst2.append(lst[:])
                lst.pop()
    return lst2

def doublet_stream_from(word):

    initial = [word]
    bruh = gtree_bfs(initial, lambda x, y: get_children(x, y))
    return bruh

# #print(lst1[len(lst1) - 30:len(lst1) - 1])
# #print(lst1)
# print(len(stream_get_at(doublet_stream_from('water'), 324)))
# print(get_children("caker", ["water", "bater", "baker", "caker"]))
####################################################
# lst = [("water",),
# ("water", "bater"),
# ("water", "cater"),
# ("water", "dater"),
# ("water", "eater"),
# ("water", "gater"),
# ("water", "hater"),
# ("water", "later"),
# ("water", "mater"),
# ("water", "pater"),
# ("water", "rater"),
# ("water", "tater"),
# ("water", "wader"),
# ("water", "wafer"),
# ("water", "wager"),
# ("water", "waker"),
# ("water", "waler"),
# ("water", "waver"),
# ("water", "waxer"),
# ("water", "bater", "cater"),
# ("water", "bater", "dater"),
# ("water", "bater", "eater"),
# ("water", "bater", "gater"),
# ("water", "bater", "hater"),
# ("water", "bater", "later"),
# ("water", "bater", "mater"),
# ("water", "bater", "pater"),
# ("water", "bater", "rater"),
# ("water", "bater", "tater"),
# ("water", "bater", "water"),
# ("water", "bater", "biter"),
# ("water", "bater", "baker"),
# ("water", "bater", "baler"),
# ("water", "bater", "barer"),
# ("water", "bater", "batea"),
# ("water", "bater", "bated"),
# ("water", "bater", "batel"),
# ("water", "cater", "bater"),
# ("water", "cater", "dater"),
# ("water", "cater", "eater"),
# ("water", "cater", "gater"),
# ("water", "cater", "hater"),
# ("water", "cater", "later"),
# ("water", "cater", "mater"),
# ("water", "cater", "pater"),
# ("water", "cater", "rater"),
# ("water", "cater", "tater"),
# ("water", "cater", "water"),
# ("water", "cater", "citer"),
# ("water", "cater", "caber"),
# ("water", "cater", "cader"),
# ("water", "cater", "cager"),
# ("water", "cater", "caker"),
# ("water", "cater", "caner"),
# ("water", "cater", "caper"),
# ("water", "cater", "carer"),
# ("water", "cater", "caser"),
# ("water", "dater", "bater"),
# ("water", "dater", "cater"),
# ("water", "dater", "eater"),
# ("water", "dater", "gater"),
# ("water", "dater", "hater"),
# ("water", "dater", "later"),
# ("water", "dater", "mater"),
# ("water", "dater", "pater"),
# ("water", "dater", "rater"),
# ("water", "dater", "tater"),
# ("water", "dater", "water"),
# ("water", "dater", "deter"),
# ("water", "dater", "diter"),
# ("water", "dater", "doter"),
# ("water", "dater", "daker"),
# ("water", "dater", "daler"),
# ("water", "dater", "darer"),
# ("water", "dater", "daver"),
# ("water", "eater", "bater"),
# ("water", "eater", "cater"),
# ("water", "eater", "dater"),
# ("water", "eater", "gater"),
# ("water", "eater", "hater"),
# ("water", "eater", "later"),
# ("water", "eater", "mater"),
# ("water", "eater", "pater"),
# ("water", "eater", "rater"),
# ("water", "eater", "tater"),
# ("water", "eater", "water"),
# ("water", "eater", "enter"),
# ("water", "eater", "ester"),
# ("water", "eater", "exter"),
# ("water", "eater", "eager"),
# ("water", "eater", "easer"),
# ("water", "eater", "eaver"),
# ("water", "eater", "eaten"),
# ("water", "gater", "bater"),
# ("water", "gater", "cater"),
# ("water", "gater", "dater"),
# ("water", "gater", "eater"),
# ("water", "gater", "hater"),
# ("water", "gater", "later"),
# ("water", "gater", "mater")],
# lenz = 74
#print(stream_get_at(doublet_stream_from('water'), 325)),
# print(lst[0][lenz]),