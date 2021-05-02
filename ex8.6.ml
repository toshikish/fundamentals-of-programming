;;
#use "ex8.5.ml"

(* 目的：駅名の情報を受け取り，「路線名，駅名（かな）」の形式の文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei =
  match ekimei with
  | { kanji = kj; kana = kn; romaji = r; shozoku = s } ->
      s ^ "，" ^ kj ^ "（" ^ kn ^ "）"

(* テスト *)
let test1 =
  hyoji
    {
      kanji = "茗荷谷";
      kana = "みょうがだに";
      romaji = "myogadani";
      shozoku = "丸ノ内線";
    }
  = "丸ノ内線，茗荷谷（みょうがだに）"
