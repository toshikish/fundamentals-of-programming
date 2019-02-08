(* 目的：身長と体重から体型を返す *)
(* taikei : float -> float -> string *)
let taikei h w = 
  if bmi h w < 18.5 then "やせ"
  else if bmi h w < 25.0 then "標準"
  else if bmi h w < 30.0 then "肥満"
  else "高度肥満"

(* テスト *)
let test7 = taikei 1.7 52.0 = "やせ"
let test8 = taikei 1.7 53.465 = "標準"
let test9 = taikei 1.7 72.25 = "肥満"
let test10 = taikei 1.7 86.7 = "高度肥満"
