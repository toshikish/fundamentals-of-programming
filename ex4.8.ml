(* 目的：鶴と亀の数の合計と足の数の合計から鶴の数を返す *)
(* tsurukame : int -> int -> int *)
let tsurukame hiki hon = (4 * hiki - hon) / 2

(* テスト *)
let test1 = tsurukame 0 0 = 0
let test2 = tsurukame 4 8 = 4
let test3 = tsurukame 4 16 = 0

