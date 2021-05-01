;;
#use "metro.ml"

(* 目的：駅名リストから該当するローマ字表記の駅名があれば漢字表記にする *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji r0 lst =
  match lst with
  | [] -> ""
  | { kanji = k; kana = a; romaji = r; shozoku = s } :: rest ->
      if r = r0 then k else romaji_to_kanji r0 rest

let test1 = romaji_to_kanji "" global_ekimei_list = ""

let test2 =
  romaji_to_kanji "yoyogiuehara" global_ekimei_list = "代々木上原"
