(* 目的：時間から午前か午後かを返す *)
(* jikan : int -> string *)
let jikan h = 
  if h < 12 then "午前"
            else "午後"

(* テスト *)
let test1 = jikan 0 = "午前"
let test2 = jikan 11 = "午前"
let test3 = jikan 12 = "午後"
