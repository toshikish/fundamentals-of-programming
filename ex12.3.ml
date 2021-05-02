;;
#use "ex12.1.ml"

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

let eki_list = [
{namae="池袋"; saitan_kyori = infinity; temae_list = []};
{namae="新大塚"; saitan_kyori = infinity; temae_list = []};
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []};
{namae="後楽園"; saitan_kyori = infinity; temae_list = []};
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []};
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []}
]
let test1 = shokika [] "茗荷谷" = []
let test2 = shokika eki_list "茗荷谷" = [
{namae="池袋"; saitan_kyori = infinity; temae_list = []};
{namae="新大塚"; saitan_kyori = infinity; temae_list = []};
{namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
{namae="後楽園"; saitan_kyori = infinity; temae_list = []};
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []};
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []}
]
