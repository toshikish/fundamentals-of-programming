(* 目的：誕生日から星座を返す *)
(* seiza : int -> int -> string *)
let seiza m d = 
  if m = 3 && d >= 21 || m = 4 && d <= 19 then "牡羊座"
  else if m = 4 || m = 5 && d <= 20 then "牡牛座"
  else if m = 5 || m = 6 && d <= 21 then "双子座"
  else if m = 6 || m = 7 && d <= 22 then "蟹座"
  else if m = 7 || m = 8 && d <= 22 then "獅子座"
  else if m = 8 || m = 9 && d <= 22 then "乙女座"
  else if m = 9 || m = 10 && d <= 23 then "天秤座"
  else if m = 10 || m = 11 && d <= 22 then "蠍座"
  else if m = 11 || m = 12 && d <= 21 then "射手座"
  else if m = 12 || m = 1 && d <= 19 then "山羊座"
  else if m = 1 || m = 2 && d <= 18 then "水瓶座"
  else "魚座"

(* テスト *)
let test1 = seiza 12 25 = "山羊座"
let test2 = seiza 3 20 = "魚座"
let test3 = seiza 4 20 = "牡牛座"
