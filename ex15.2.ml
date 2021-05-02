(* 目的：二つの自然数の最大公約数を求める *)
(* gcd : int -> int -> int *)
let rec gcd m n = if n = 0 then m else gcd n (m mod n)

let test1 = gcd 6 0 = 6

let test2 = gcd 12 35 = 1

let test3 = gcd 12 8 = 4
