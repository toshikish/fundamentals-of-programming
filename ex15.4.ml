;;
#use "ex12.1.ml"

(* 目的：eki_t 型のリストから最短距離最小の駅とそれ以外の駅のリストの組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
let rec saitan_wo_bunri lst =
  (* minimum : eki_t list -> eki_t *)
  let rec minimum ls =
    match ls with
    | [] -> { namae = ""; saitan_kyori = infinity; temae_list = [] }
    | first :: rest -> (
        let min_rest = minimum rest in
        match (first, min_rest) with
        | ( { namae = fn; saitan_kyori = fd; temae_list = fl },
            { namae = rn; saitan_kyori = rd; temae_list = rl } ) ->
            if fd <= rd then first else min_rest)
  in
  (* remove_eki : eki_t -> eki_t list -> eki_t list *)
  let rec remove_eki eki ls =
    match ls with
    | [] -> []
    | first :: rest ->
        if first = eki then remove_eki eki rest
        else first :: remove_eki eki rest
  in
  let min_lst = minimum lst in
  (min_lst, remove_eki min_lst lst)

let test1 =
  saitan_wo_bunri
    [
      { namae = "池袋"; saitan_kyori = infinity; temae_list = [] };
      { namae = "新大塚"; saitan_kyori = 6.2; temae_list = [] };
      { namae = "後楽園"; saitan_kyori = 4.8; temae_list = [] };
      { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
      { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
    ]
  = ( { namae = "後楽園"; saitan_kyori = 4.8; temae_list = [] },
      [
        { namae = "池袋"; saitan_kyori = infinity; temae_list = [] };
        { namae = "新大塚"; saitan_kyori = 6.2; temae_list = [] };
        { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
        { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
      ] )

let rec saitan_wo_bunri eki_list =
  match eki_list with
  | [] -> ({ namae = ""; saitan_kyori = infinity; temae_list = [] }, [])
  | [ first ] -> (first, [])
  | first :: rest -> (
      let p, v = saitan_wo_bunri rest in
      match (first, p) with
      | ( { namae = fn; saitan_kyori = fd; temae_list = fl },
          { namae = pn; saitan_kyori = pd; temae_list = pl } ) ->
          if fd < pd then (first, p :: v) else (p, first :: v))

let test2 =
  saitan_wo_bunri
    [
      { namae = "池袋"; saitan_kyori = infinity; temae_list = [] };
      { namae = "新大塚"; saitan_kyori = 6.2; temae_list = [] };
      { namae = "後楽園"; saitan_kyori = 4.8; temae_list = [] };
      { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
      { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
    ]
  = ( { namae = "後楽園"; saitan_kyori = 4.8; temae_list = [] },
      [
        { namae = "池袋"; saitan_kyori = infinity; temae_list = [] };
        { namae = "新大塚"; saitan_kyori = 6.2; temae_list = [] };
        { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
        { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
      ] )
