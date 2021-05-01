;;
#use "ex12.2.ml"

(* 目的：eki_t 型のリストを初期化する *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika lst start =
  match lst with
  | [] -> []
  | first :: rest ->
      (match first with
      | { namae = n; saitan_kyori = d; temae_list = l } ->
          if n = start then { namae = n; saitan_kyori = 0.; temae_list = [ n ] }
          else first)
      :: shokika rest start

let initialized = shokika (make_eki_list global_ekimei_list) "池袋"
