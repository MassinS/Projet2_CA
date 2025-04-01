open Ast 



type env_path =
  | Top                    (* La variable est en haut de la pile *)
  | Left of env_path       (* Pour accéder à la variable, on effectue un Car, puis on suit le chemin *)
  | Right of env_path      (* Pour accéder à la variable, on effectue un Cdr, puis on suit le chemin *)


(* On peut utiliser une association (string * env_path) list *)
type env = (string * env_path) list


let rec find_in_env (x : string) (env : env) : env_path =
  match env with
  | [] -> failwith ("Variable non définie: " ^ x)
  | (y, path) :: rest ->
      if x = y then path
      else
        (* Pour les variables qui ne sont pas trouvées en tête, on doit
           "descendre" d'un niveau. Ici, on considère que l'ajout d'une nouvelle liaison
           décale toutes les anciennes vers la droite. *)
        find_in_env x (List.map (fun (v, p) -> (v, Right p)) rest)



let rec path_to_coms (p : env_path) : com list =
  match p with
  | Top -> []    (* Pas besoin d'instructions si la variable est au sommet *)
  | Left rest -> Car :: path_to_coms rest
  | Right rest -> Cdr :: path_to_coms rest

          
          
let rec compile (e : expr) (rho : env) : com list =
    match e with
    | Number n -> [Quote (Int n)]
    | True -> [Quote (Bool true)]
    | False -> [Quote (Bool false)]
    | Ident x ->
        let p = find_in_env x rho in
        path_to_coms p
    |  If(e1, e2, e3) ->
      [Push] @ compile e1 rho @ [Branch (compile e2 rho, compile e3 rho)]
      
    | _ -> failwith "More instruction soooon ........"
        
        