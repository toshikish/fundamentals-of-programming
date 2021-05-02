;;
#use "ex10.10.ml"

;;
#use "ex10.11.ml"

(* 目的：二つのローマ字表記の駅間距離について表示する *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji r1 r2 =
  let k1 = romaji_to_kanji r1 global_ekimei_list in
  let k2 = romaji_to_kanji r2 global_ekimei_list in
  if k1 = "" then r1 ^ " という駅は存在しません"
  else if k2 = "" then r2 ^ " という駅は存在しません"
  else
    let d = get_ekikan_kyori k1 k2 global_ekikan_list in
    if d = infinity then
      k1 ^ "駅と" ^ k2 ^ "駅はつながっていません"
    else
      k1 ^ "駅から" ^ k2 ^ "駅までは " ^ string_of_float d ^ " km です"

let test1 =
  kyori_wo_hyoji "myougadani" "shinotsuka"
  = "myougadani という駅は存在しません"

let test2 =
  kyori_wo_hyoji "myogadani" "shinotsuka"
  = "茗荷谷駅から新大塚駅までは 1.2 km です"

let test3 =
  kyori_wo_hyoji "myogadani" "ikebukuro"
  = "茗荷谷駅と池袋駅はつながっていません"
