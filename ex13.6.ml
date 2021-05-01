;;
#use "ex10.11.ml"

;;
#use "ex12.1.ml"

(* 目的：直前に確定した駅と未確定の駅を受け取り，未確定の駅を更新する *)
(* koushin1 : eki_t -> eki_t -> eki_t *)
let koushin1 p q =
  match (p, q) with
  | ( { namae = np; saitan_kyori = sp; temae_list = tp },
      { namae = nq; saitan_kyori = sq; temae_list = tq } ) ->
      let d = get_ekikan_kyori np nq global_ekikan_list in
      if d = infinity || sp +. d > sq then q
      else { namae = nq; saitan_kyori = sp +. d; temae_list = nq :: tp }

let test1 =
  koushin1
    { namae = "渋谷"; saitan_kyori = 10.0; temae_list = [ "渋谷" ] }
    { namae = "表参道"; saitan_kyori = 15.0; temae_list = [] }
  = {
      namae = "表参道";
      saitan_kyori = 11.3;
      temae_list = [ "表参道"; "渋谷" ];
    }

let test2 =
  koushin1
    { namae = "渋谷"; saitan_kyori = 10.0; temae_list = [ "渋谷" ] }
    { namae = "表参道"; saitan_kyori = 11.0; temae_list = [] }
  = { namae = "表参道"; saitan_kyori = 11.0; temae_list = [] }

let test3 =
  koushin1
    { namae = "渋谷"; saitan_kyori = 10.0; temae_list = [ "渋谷" ] }
    { namae = "青山一丁目"; saitan_kyori = 11.0; temae_list = [] }
  = { namae = "青山一丁目"; saitan_kyori = 11.0; temae_list = [] }
