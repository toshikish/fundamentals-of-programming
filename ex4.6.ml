(* 目的：鶴の数から足の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2

(* テスト *)
let test1 = tsuru_no_ashi 0 = 0
let test2 = tsuru_no_ashi 1 = 2
let test3 = tsuru_no_ashi 32768 = 65536

(* 目的：亀の数から足の本数を返す *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4

(* テスト *)
let test4 = kame_no_ashi 0 = 0
let test5 = kame_no_ashi 1 = 4
let test6 = kame_no_ashi 32768 = 131072
