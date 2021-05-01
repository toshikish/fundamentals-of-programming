(* 目的：文字列のリストを結合して一つの文字列を作る *)
(* concat : string list -> string *)
let concat lst = List.fold_right ( ^ ) lst ""

let test1 = concat [] = ""

let test2 = concat [ "春" ] = "春"

let test3 = concat [ "春"; "夏"; "秋"; "冬" ] = "春夏秋冬"
