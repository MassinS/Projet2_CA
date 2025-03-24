let rec compile (e: expr,rho: env) : coms =
  match e with
  | Integer n -> Quote (Int n)  
  | Bool true -> Quote (Bool true)  
  | Bool false -> Quote (Bool false) 
  | Ident x ->  
    (try [Access (List.assoc x rho)]  
     with Not_found -> failwith ("variable non definie: " ^ x))

  | _ -> failwith "todo"