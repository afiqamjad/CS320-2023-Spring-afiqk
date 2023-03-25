####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#.
def AB():
    return "abcdefghijklmnopqrstuvwxyz"

def string_length(word):
    return pylist_foldleft(word, 0, lambda acc,x0:acc+1) 

def list_tabulate(n0, fopr):
    return int1_foldleft(n0, [], lambda xs,i: xs + [fopr(i)])

def string_tabulate(wlen, work):
    return string_make_pylist(list_tabulate(wlen, work))

def strsub(word,j):
    return word[j]

def word_neighbors(word):
    """                                                                                                                                                       
    Note that this function should returns a fnlist                                                                                                           
    (not a pylist)                                                                                                                                            
    Your implementation should be combinator-based very                                                                                                       
    much like the posted solution.                                                                                                                            
    """
    wlen = string_length(word)
    return \
        fnlist_concat(string_imap_fnlist\
                      (word, lambda i, c: fnlist_concat\
                       (string_imap_fnlist(AB(), lambda _, c1: fnlist_sing\
                                           (string_tabulate(wlen, lambda j: strsub(word, j) if i != j else c1)) if (c != c1) else fnlist_nil()))))
#
####################################################
