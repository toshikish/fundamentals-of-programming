;;
#use "ex10.10.ml"

(* 目的：隣接する二つの漢字表記の駅名間の距離を求める *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori k1 k2 lst =
  match lst with
  | [] -> infinity
  | { kiten = s; shuten = e; keiyu = l; kyori = d; jikan = t } :: rest ->
      if (s = k1 && e = k2) || (s = k2 && e = k1) then d
      else get_ekikan_kyori k1 k2 rest

let test1 = get_ekikan_kyori "" "" global_ekikan_list = infinity

let test2 = get_ekikan_kyori "渋谷" "表参道" global_ekikan_list = 1.3

let test3 = get_ekikan_kyori "表参道" "渋谷" global_ekikan_list = 1.3

let test4 = get_ekikan_kyori "渋谷" "外苑前" global_ekikan_list = infinity
