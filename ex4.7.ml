(* 目的：鶴の数と亀の数から足の数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame

(* テスト *)
let test7 = tsurukame_no_ashi 0 0 = 0
let test8 = tsurukame_no_ashi 1 2 = 10
let test9 = tsurukame_no_ashi 13 21 = 110
