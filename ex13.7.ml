;;
#use "ex13.6.ml"

(* 目的：直前に確定した駅をもとに未確定の駅のリストを更新する *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v = List.map (koushin1 p) v

(* 駅の例 *)
let eki1 = { namae = "池袋"; saitan_kyori = infinity; temae_list = [] }

let eki2 =
  {
    namae = "新大塚";
    saitan_kyori = 1.2;
    temae_list = [ "新大塚"; "茗荷谷" ];
  }

let eki3 =
  { namae = "茗荷谷"; saitan_kyori = 0.; temae_list = [ "茗荷谷" ] }

let eki4 = { namae = "後楽園"; saitan_kyori = infinity; temae_list = [] }

(* 駅リストの例 *)
let lst = [ eki1; eki2; eki3; eki4 ]

(* テスト *)
let test1 = koushin eki2 [] = []

let test2 =
  koushin eki2 lst
  = [
      {
        namae = "池袋";
        saitan_kyori = 3.0;
        temae_list = [ "池袋"; "新大塚"; "茗荷谷" ];
      };
      eki2;
      eki3;
      eki4;
    ]
