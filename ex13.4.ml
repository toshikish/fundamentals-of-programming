let compose f g =
  let h x = f (g x) in
  h

let add3 x = x + 3

let time2 x = x * 2

let test = (compose time2 add3) 4 = 14
