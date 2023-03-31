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
    i = 0
    bruh = {}
    def helper(qnxs, intz):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fchlds(nx1, intz):
                if not( nx2 in bruh): 
                    qnxs.put(nx2)
                    bruh[nx2] = 0
            return strcon_cons(nx1, lambda: helper(qnxs, i+1))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.Queue()
    for nx1 in nxs:
        qnxs.put(nx1)
        bruh[nx1] = 0
    return lambda: helper(qnxs, 0)

def alphabet():
    return "abcdefghijklmnopqrstuvwxyz"

def checker(word):
    if word_is_legal(word):
        return True
    return False

def get_children(word, intz):
    temp = ""
    lst = [word]
    for i in range(intz, len(word)):
        for j in alphabet():
            temp = word.replace(word[i], j)
            if checker(temp) and temp != word:
                lst.append(temp)
    return lst

def doublet_stream_from(word):

    initial = [word]
    bruh = gtree_bfs(initial, lambda x, y: get_children(x, y))
    return bruh

lst1 = []
stream_foreach(doublet_stream_from("water"), lambda x: lst1.append(x))

#print(lst1[len(lst1) - 30:len(lst1) - 1])
#print(lst1)
print(len(stream_get_at(doublet_stream_from('water'), 324)))
####################################################
