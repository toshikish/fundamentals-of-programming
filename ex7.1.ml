(* 目的：5教科の点数から合計点と平均点の組を返す *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> (int, float) *)
let goukei_to_heikin a b c d e = a + b + c + d + e, (float a +. float b +. float c +. float d +. float e) /. 5.0

(* テスト *)
let test1 = goukei_to_heikin 10 20 30 40 50 = (150, 30.0)
