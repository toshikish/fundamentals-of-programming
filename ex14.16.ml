let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

(* 目的：階乗を求める *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

let test1 = fac 1 = 1

let test2 = fac 2 = 2

let test3 = fac 3 = 6

let test4 = fac 4 = 24
