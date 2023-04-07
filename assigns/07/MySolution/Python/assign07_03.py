####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.path.append('../../../07')
sys.path.append('./../../../../mypylib')
####################################################
from dictwords import *
from mypylib_cls import *
from assign05_02 import *
####################################################
"""
HX-2023-03-24: 10 points
Solving the doublet puzzle
"""
####################################################
"""
Please revisit assign06_04.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
<Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
"""
####################################################

def find_children(word):
    return fnlist_filter_pylist(word_neighbors(word), lambda x: word_is_legal(x))

def checker(x):
    if type(x) == strcon_cons:
        return x.cons1
    elif type(x) == strcon_nil:
        return None
    return None

def doublet_bfs_test(w1, w2):
    """
    Given two words w1 and w2, this function should
    return None if w1 and w2 do not for a doublet. Otherwise
    it returns a path connecting w1 and w2 that attests to the
    two words forming a doublet.
    """
    if w1 == "" or w2 == "":
        return None
    if len(w1) != len(w2):
        return None
    if w1 == w2:
        return [w1]
    bruh = gpath_bfs([w1], lambda x: find_children(x))
    huh = stream_make_filter(bruh, lambda x: x[0] == w1 and x[-1] == w2 if len(x) >= 2 else None)
    return checker(huh())


####################################################
