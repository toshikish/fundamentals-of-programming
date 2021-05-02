;;
#use "ex12.1.ml"

(* 目的：eki_t 型のリストから最短距離最小の駅とそれ以外の駅のリストの組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
let saitan_wo_bunri eki_list =
  List.fold_right
    (* eki_t -> eki_t * eki_t list -> eki_t * eki_t list *)
      (fun first (p, v) ->
      match (first, p) with
      | ( { namae = fn; saitan_kyori = fd; temae_list = fl },
          { namae = pn; saitan_kyori = pd; temae_list = pl } ) ->
          if pn = "" then (first, v)
          else if fd < pd then (first, p :: v)
          else (p, first :: v))
    eki_list
    ({ namae = ""; saitan_kyori = infinity; temae_list = [] }, [])

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
        { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
        { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
      ] )

let saitan_wo_bunri eki_list =
  match eki_list with
  | [] -> ({ namae = ""; saitan_kyori = infinity; temae_list = [] }, [])
  | first :: rest ->
      List.fold_right
        (* eki_t -> eki_t * eki_t list -> eki_t * eki_t list *)
          (fun first (p, v) ->
          match (first, p) with
          | ( { namae = fn; saitan_kyori = fd; temae_list = fl },
              { namae = pn; saitan_kyori = pd; temae_list = pl } ) ->
              if fd < pd then (first, p :: v) else (p, first :: v))
        rest (first, [])

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
        { namae = "新大塚"; saitan_kyori = 6.2; temae_list = [] };
        { namae = "御茶ノ水"; saitan_kyori = 19.2; temae_list = [] };
        { namae = "本郷三丁目"; saitan_kyori = infinity; temae_list = [] };
        { namae = "池袋"; saitan_kyori = infinity; temae_list = [] };
      ] )
