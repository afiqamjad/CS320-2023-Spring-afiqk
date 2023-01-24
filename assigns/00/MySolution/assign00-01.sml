fun fact(x: int): int =
  if x > 0 then x * fact(x-1) else 1;


fun fact2(x: int): int = fact(x) handle Overflow => 0;

fun fact3(a: int): int = 
  if fact2(a) <> 0 then fact3(a+1) else a;

val N = fact3(0);  
