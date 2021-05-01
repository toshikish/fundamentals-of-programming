let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

(* 目的：1から与えられた自然数までの合計を求める *)
(* one_to_n : int -> int *)
let one_to_n n = List.fold_right ( + ) (enumerate n) 0

let test1 = one_to_n 1 = 1

let test2 = one_to_n 2 = 3

let test3 = one_to_n 3 = 6

let test4 = one_to_n 4 = 10
