(* 目的：昇順に並んでいる整数のリストに昇順に整数を挿入したリストを返す *)
(* insert : int -> int list -> int list *)
let rec insert lst n =
  match lst with
  | [] -> [ n ]
  | first :: rest -> if n <= first then n :: lst else first :: insert rest n

let test1 = insert [] 1 = [ 1 ]

let test2 = insert [ 1; 3; 4; 7; 8 ] 5 = [ 1; 3; 4; 5; 7; 8 ]

let test3 = insert [ 1; 3; 4; 7; 8 ] 0 = [ 0; 1; 3; 4; 7; 8 ]

let test4 = insert [ 1; 3; 4; 7; 8 ] 9 = [ 1; 3; 4; 7; 8; 9 ]
