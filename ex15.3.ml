(* 目的：与えられた自然数のリストから素数をすべて求める *)
(* sieve : int list -> int list *)
let rec sieve lst =
  let filter_multiples n lst = List.filter (fun k -> k mod n > 0) lst in
  match lst with
  | [] -> []
  | first :: rest -> first :: sieve (filter_multiples first rest)

let rec enumerate2 n = if n = 2 then [ 2 ] else enumerate2 (n - 1) @ [ n ]

let test1 = sieve [] = []

let test2 = sieve (enumerate2 2) = [ 2 ]

let test3 = sieve (enumerate2 6) = [ 2; 3; 5 ]

(* 目的：与えられた自然数以下の素数をすべて求める *)
(* prime : int -> int list *)
let prime n = sieve (enumerate2 n)

let test4 = prime 2 = [ 2 ]

let test5 = prime 6 = [ 2; 3; 5 ]
