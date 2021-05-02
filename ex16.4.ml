;;
#use "ex10.11.ml"

;;
#use "ex15.5.ml"

(* ex16.3.ml *)
(* 目的：直前に確定した駅をもとに未確定の駅のリストを更新する *)
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *)
let koushin p v ekikan_list =
  List.map
    (fun q ->
      match (p, q) with
      | ( { namae = np; saitan_kyori = sp; temae_list = tp },
          { namae = nq; saitan_kyori = sq; temae_list = tq } ) ->
          let d = get_ekikan_kyori np nq ekikan_list in
          if d = infinity || sp +. d > sq then q
          else { namae = nq; saitan_kyori = sp +. d; temae_list = nq :: tp })
    v

(* 目的：未確定の駅のリストの各駅の最短距離と最短経路を求める *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_list ekikan_list =
  match eki_list with
  | [] -> []
  | first :: rest ->
      let p, v = saitan_wo_bunri eki_list in
      p :: dijkstra_main (koushin p v ekikan_list) ekikan_list

(* 駅の例 *)
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

(* 駅リストの例 *)
let lst = [eki1; eki2; eki3; eki4]

(* テスト *)
let test1 = dijkstra_main [] global_ekikan_list = []
let test2 = dijkstra_main lst global_ekikan_list =
  [{namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
   {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};
   {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]};
   {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}]
