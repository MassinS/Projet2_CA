let twice = fun f -> fun x -> f (f x) in
let inc = fun y -> y + 1 in
twice inc 3