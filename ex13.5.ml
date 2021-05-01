let twice f =
  let g x = f (f x) in
  g

let g = twice twice

let h x = (twice twice) x
