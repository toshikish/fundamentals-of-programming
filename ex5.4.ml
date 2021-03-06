(* 目的：2次方程式の判別式の値を返す *)
(* hanbetsushiki : float -> float -> float -> float *)
let hanbetsushiki a b c = b *. b -. 4.0 *. a *. c

(* 目的：2次方程式の解の個数を返す *)
(* kai_no_kosuu : float -> float -> float -> int *)
let kai_no_kosuu a b c = 
  if hanbetsushiki a b c > 0.0 then 2
  else if hanbetsushiki a b c = 0.0 then 1
  else 0
(* テスト *)
let test1 = kai_no_kosuu 1.0 (-5.0) 6.0 = 2
let test2 = kai_no_kosuu 1.0 4.0 4.0 = 1
let test3 = kai_no_kosuu (-1.0) 5.0 (-26.0) = 0

(* 目的：2次方程式が虚数解を持つかどうかを返す *)
(* kyosuukai : float -> float -> float -> bool *)
let kyosuukai a b c = hanbetsushiki a b c < 0.0
(* テスト *)
let test4 = kyosuukai 1.0 (-5.0) 6.0 = false
let test5 = kyosuukai 1.0 4.0 4.0 = false
let test6 = kyosuukai (-1.0) 5.0 (-26.0) = true
