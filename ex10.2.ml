;;
#use "ex10.1.ml"

(* 目的：整数のリストを昇順に整列したリストを返す *)
(* ins_sort : int list -> int list *)
let rec ins_sort lst =
  match lst with [] -> [] | first :: rest -> insert (ins_sort rest) first

let test5 = ins_sort [] = []

let test6 = ins_sort [ 1 ] = [ 1 ]

let test7 = ins_sort [ 1; 2; 3; 4; 5 ] = [ 1; 2; 3; 4; 5 ]

let test8 = ins_sort [ 5; 3; 1; 4; 2 ] = [ 1; 2; 3; 4; 5 ]
