########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################
import nltk
nltk.download('words')
from nltk.corpus import words

def dfs(nodes, children):
    visited = set()
    stack = []
    res = []

    for x in nodes:
        stack.append(x)
        visited.add(x)

    while stack:
        curr = stack.pop()
        res.append(curr)

        for nxt in reversed(children(curr)):
            if nxt not in visited:
                stack.append(nxt)
                visited.add(nxt)
    return res

def children(node, lset):
    res = []
    try:
        i = node.index("$")
        for letter in lset:
            res.append(node[:i] + letter + node[i+1:])
        return res
    except ValueError:
        return []

def safe(word, inc_set, included):
    for i, letter in enumerate(word):
        if (i, letter) in inc_set:
            return False
    for l in included:
        if l not in word:
            return False
    return "$" not in word and word in words.words()

def wordle_guess(hints):
    guessed = "$" * len(hints[0])
    alphabet = set("abcdefghijklmnopqrstuvwxyz")
    inc_g = set()
    included = []

    for x in hints:
        for i, info in enumerate(x):
            if info[0] == 1:
                guessed = guessed[:i] + info[1] + guessed[i+1:]
            elif info[0] == 2:
                inc_g.add((i, info[1]))
                included += info[1]
            elif info[0] == 0:
                alphabet.discard(info[1])

    if "$" not in guessed:
        return guessed

    valid = dfs([guessed], lambda x: children(x, included))

    for word in valid:
        if safe(word, inc_g, included):
            return word
        
    return guessed
########################################################################
