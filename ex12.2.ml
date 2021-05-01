;;
#use "metro.ml"

;;
#use "ex12.1.ml"

(* 目的：ダイクストラのアルゴリズムに必要な頂点のリストを生成する *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list lst =
  match lst with
  | [] -> []
  | { kanji = k; kana = a; romaji = r; shozoku = s } :: rest ->
      { namae = k; saitan_kyori = infinity; temae_list = [] }
      :: make_eki_list rest

let eki_list = make_eki_list global_ekimei_list
