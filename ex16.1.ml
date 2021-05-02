(* 目的：整数のリストを受け取り累積和を返す *)
(* sum_list : int list -> int list *)
let sum_list lst =
  (* 目的：整数のリストを受け取り累積和を返す *)
  (* ここで total0 はその時点までの累積和 *)
  (* hojo : int list -> int -> int list *)
  let rec hojo lst total0 =
    match lst with
    | [] -> []
    | first :: rest ->
        let total1 = first + total0 in
        total1 :: hojo rest total1
  in
  hojo lst 0

let test1 = sum_list [] = []

let test2 = sum_list [ 3; 2; 1; 4 ] = [ 3; 5; 6; 10 ]
