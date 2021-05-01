;;
#use "metro.ml"

;;
#use "ex12.1.ml"

(* 目的：ダイクストラのアルゴリズムに必要な頂点のリストを生成する *)
(* make_eki_list : ekimei_t list -> eki_t list *)

let rec make_eki_list lst =
  List.map
    (fun ekimei ->
      match ekimei with
      | { kanji = k; kana = a; romaji = r; shozoku = s } ->
          { namae = k; saitan_kyori = infinity; temae_list = [] })
    lst

let ekimei_list = [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
]

let test1 = make_eki_list [] = [] 
let test2 = make_eki_list ekimei_list = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
]

(* 目的：eki_t 型のリストを初期化する *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika lst start =
  List.map
    (fun eki ->
      match eki with
      | { namae = n; saitan_kyori = d; temae_list = l } ->
          if n = start then { namae = n; saitan_kyori = 0.; temae_list = [ n ] }
          else eki)
    lst

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
