fun fact(x: int): int =
  if x > 0 then x * fact(x-1) else 1;


fun fact2(x: int): int = fact(x) handle Overflow => 0

val a = 1;
fun fact3(): int = 
  if fact2(a) = 0 then a else fact2(a+1);
