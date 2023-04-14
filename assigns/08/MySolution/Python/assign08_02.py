####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    first = next(gen1, None)
    second = next(gen2, None)

    while (first != None or second != None): 
        if first is None:
            yield second
            second = next(gen2, None)
        elif second is None:
            yield first
            first = next(gen1, None)
        elif lte3(first, second):
            yield first
            first = next(gen1, None)
        else:
            yield second
            second = next(gen2, None)
####################################################
