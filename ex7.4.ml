(* 目的：中点の座標を返す *)
(* chuten : (int * int) * (int * int) -> int * int *)
let chuten pair = match pair with
  ((x1, y1), (x2, y2)) -> ((x1 + x2) / 2, (y1 + y2) / 2)

(* テスト *)
let test1 = chuten ((1, 2), (3, 4)) = (2, 3)
let test2 = chuten ((-1, -2), (-3, -4)) = (-2, -3)
let test3 = chuten ((7, -5), (-3, -3)) = (2, -4)
