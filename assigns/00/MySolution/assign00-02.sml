
fun isDivisibleBy(x: int, y: int): bool =
  if y = 1 then true else if x mod y = 0 then false else isDivisibleBy(x, y-1);

fun isPrime(n0: int): bool =
  if n0 > 1 then if isDivisibleBy(n0, n0-1) then true else false else false