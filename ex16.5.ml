;;
#use "ex10.10.ml"

;;
#use "ex16.4.ml"

(* ex12.4.ml *)

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

(* 目的：ekimei_t 型のリストを整列して重複を排除する *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst =
  match lst with
  | [] -> []
  | first :: rest -> ekimei_insert (seiretsu rest) first

(* ex14.12.ml *)

(* 目的：頂点のリストを生成して初期化する *)
(* make_initial_eki_list : ekimei_t list -> eki_t list *)
let rec make_initial_eki_list lst start =
  List.map
    (fun ekimei ->
      match ekimei with
      | { kanji = k; kana = a; romaji = r; shozoku = s } ->
          if k = start then { namae = k; saitan_kyori = 0.; temae_list = [ k ] }
          else { namae = k; saitan_kyori = infinity; temae_list = [] })
    lst

(* 目的：始点・終点の駅名（ローマ字表記）から最短路を探索する *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra departure destination =
  let ekimei_list = seiretsu global_ekimei_list in
  let dep_k, des_k =
    ( romaji_to_kanji departure ekimei_list,
      romaji_to_kanji destination ekimei_list )
  in
  let eki_list = make_initial_eki_list ekimei_list dep_k in
  let final_eki_list = dijkstra_main eki_list global_ekikan_list in
  let rec find s lst =
    match lst with
    | [] -> { namae = ""; saitan_kyori = infinity; temae_list = [] }
    | ({ namae = n; saitan_kyori = d; temae_list = l } as first) :: rest ->
        if n = s then first else find s rest
  in
  find des_k final_eki_list

let test1 =
  dijkstra "ikebukuro" "korakuen"
  = {
      namae = "後楽園";
      saitan_kyori = 4.8;
      temae_list = [ "後楽園"; "茗荷谷"; "新大塚"; "池袋" ];
    }
