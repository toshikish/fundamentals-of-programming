(* 目的：x 軸について対称な点の座標を返す *)
(* taisho_x : int * int -> int * int *)
let taisho_x pair = match pair with
  (a, b) -> (a, -b)

(* テスト *)
let test1 = taisho_x (0, 0) = (0, 0)
let test2 = taisho_x (3, 4) = (3, -4)
let test3 = taisho_x (3, -4) = (3, 4)
