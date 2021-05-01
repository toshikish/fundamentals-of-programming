;;
#use "ex10.11.ml"

;;
#use "ex12.1.ml"

(* 目的：直前に確定した駅をもとに未確定の駅のリストを更新する *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v =
  let koushin1 p q =
    match (p, q) with
    | ( { namae = np; saitan_kyori = sp; temae_list = tp },
        { namae = nq; saitan_kyori = sq; temae_list = tq } ) ->
        let d = get_ekikan_kyori np nq global_ekikan_list in
        if d = infinity || sp +. d > sq then q
        else { namae = nq; saitan_kyori = sp +. d; temae_list = nq :: tp }
  in
  List.map (koushin1 p) v

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
