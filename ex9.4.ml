(* 目的：整数のリストの長さを返す *)
(* length : int list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest

(* テスト *)
let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1; 2; 3] = 3
