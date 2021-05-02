;;
#use "ex8.5.ml"

(* 目的：最短距離の昇順に並んでいる駅名のリストに昇順に駅名を挿入したリストを返す *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert lst ekimei0 =
  match lst with
  | [] -> [ ekimei0 ]
  | ({ kanji = k; kana = a; romaji = r; shozoku = l } as ekimei) :: rest -> (
      match ekimei0 with
      | { kanji = k0; kana = a0; romaji = r0; shozoku = l0 } ->
          if a = a0 then ekimei_insert rest ekimei0
          else if a < a0 then ekimei :: ekimei_insert rest ekimei0
          else ekimei0 :: lst)

let test1 = ekimei_insert [] {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"}
= [{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};]
let test2 = ekimei_insert [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
] {kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}
= [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
]

let test3 = ekimei_insert [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
] {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}
= [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
]

(* 目的：ekimei_t 型のリストを整列して重複を排除する *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst =
  match lst with
  | [] -> []
  | first :: rest -> ekimei_insert (seiretsu rest) first

let test4 = seiretsu [] = []
let test5 = seiretsu [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"};
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyama-itchome"; shozoku="半蔵門線"};
] = [
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"};
]
