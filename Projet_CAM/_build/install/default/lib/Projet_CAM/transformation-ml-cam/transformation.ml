open Ast

let rec access : string -> pat -> coms = fun id w ->
  match w with
  | NullPat -> failwith "Nullpat"
  | (IdentPat x) -> if x = id then [] else failwith "x /= id"
  | (Pairpat (x1,x2)) -> try (Cdr::(access id x2)) with Failure(_) -> (Car :: (access id x1));;

let rec compile : pat -> expr -> coms = fun pat w ->
  match w with
  | (Number n) -> [Quote (Int n)]
  | (False) -> [Quote (Bool false)]
  | (True) -> [Quote (Bool true)]
  | (Ident v) -> access v pat
  | (If(e1,e2,e3)) ->
     [Push] @ (compile pat e1) @
       [Branch((compile pat e2) , (compile pat e3) )]
  | (Mlpair(e1,e2)) ->
     [Push] @ (compile pat e1) @ [Swap] @ (compile pat e2) @ [Cons]
  | (Let(p,e1,e2))  -> let pat' = Pairpat(pat,p) in
     [Push] @ (compile pat e1) @ [Cons] @ (compile pat' e2)

  | (LetRec(p,e1,e2)) -> let pat' = Pairpat(pat,p) in
     [Push; Quote NullValue; Cons; Push] @ (compile pat' e1) @
       [Swap; Rplac] @ (compile pat' e2)
  | (Lambda(p,e)) -> let pat' = Pairpat(pat,p) in
     [Cur ((compile pat' e) )]
  | (Apply(e1,e2)) ->
     if is_constant e1 then (compile pat e2) @ (trans_constant e1)
     else [Push] @ (compile pat e1) @ [Swap] @ (compile pat e2) @ [Cons; App]
  | e ->
     if is_constant e then [Cur (Snd :: trans_constant e)] else failwith "compile"


and is_constant = function
     | Ident "+"  | Ident "-" | Ident "*" | Ident "/" | Ident "="  | Ident "<" | Ident ">" -> true
     | Ident "fst" | Ident "snd" -> true
     | MLfst | MLsnd -> true
     | _ -> false
   

and trans_constant = function
     | Ident "+" -> [Op Add]
     | Ident "-" -> [Op Sub]
     | Ident "*" -> [Op Mult]
     | Ident "/" -> [Op Div]
     | Ident "=" -> [Op Equal]
     | Ident "<" -> [Op Less]
     | Ident ">" -> [Op Greater]
     | Ident "fst" | MLfst -> [Car]
     | Ident "snd" | MLsnd -> [Cdr]
     | _ -> failwith "trans_constant"
   

     

  let compile_program (e : expr) : program =
    compile NullPat e
  
  let rec string_of_com = function
    | Quote v -> "Quote " ^ (string_of_value v)
    | Push -> "Push"
    | Swap -> "Swap"
    | Cons -> "Cons"
    | App -> "App"
    | Cur _ -> "Cur <function>"
    | Branch _ -> "Branch <branches>"
    | Rplac -> "Rplac"
    | Op Add  -> "Plus"
    | Op Sub  -> "Minus"
    | Op Mult -> "Mult"
    | Op Div  -> "Div"
    | Op Less -> "Less"
    | Op Greater -> "Greater"
    | Op Equal -> "Equal"
    | Car -> "Car"
    | Cdr -> "Cdr"
    | _ -> "Unknown command"
  
  and string_of_value = function
    | Int n -> string_of_int n
    | Bool b -> string_of_bool b
    | NullValue -> "NullValue"
    | Pair _ -> "<pair>"
    | Closure _ -> "<closure>"   
  