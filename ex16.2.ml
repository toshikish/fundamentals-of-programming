(* 目的：関数・初期値・リストを受け取り，初期値から始めて要素に左から関数を適用する *)
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init lst =
  match lst with [] -> init | first :: rest -> fold_left f (f init first) rest

let test1 = fold_left ( - ) 10 [] = 10

let test2 = fold_left ( - ) 10 [ 1; 2; 3 ] = 4
