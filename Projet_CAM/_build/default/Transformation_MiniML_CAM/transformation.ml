open Ast

(* Nouveau type pour le chemin d'accès *)
type env_path = Car | Cdr
type env = (ident * env_path list) list

(* Environnement initial avec opérateurs prédéfinis *)
let init_env : env = 
  ["car", [];      (* fst -> car *)
   "cdr", [];      (* snd -> cdr *)
   "+", []; 
   "-", []; 
   "*", []; 
   "/", []; 
   "<", []; 
   ">", []; 
   "=", [];
   "cons", [];     (* pour construire des paires *)
   "swap", [];     (* pour échanger des valeurs *)
   "app", []]      (* application de fonction *)

   
(* Cherche le chemin d'accès d'un identifiant dans l'environnement *)
let rec access x env =
  match env with
  | [] -> failwith ("Unbound identifier: " ^ x)
  | (y, path) :: rest ->
      if x = y then path
      else access x rest



let rec pattern_vars = function
  | IdentPat x -> [x]
  | Pairpat (p1, p2) -> pattern_vars p1 @ pattern_vars p2
  | NullPat -> []



(* Étend l'environnement avec un nouveau pattern *)
let extend_env (p : pat) (env : env) : env =
  match p with
  | IdentPat x ->
      (x, [Cdr]) :: List.map (fun (y, path) -> (y, Car :: path)) env
  
  | Pairpat (p1, p2) ->
      let vars_p1 = pattern_vars p1 in
      let vars_p2 = pattern_vars p2 in
      
      (* Étape 1: Ajouter les variables de p1 avec [Cdr; Car] *)
      let env_after_p1 = 
        List.fold_right (fun x env -> (x, [Cdr; Car]) :: env) vars_p1 env
      in
      
      (* Étape 2: Ajouter les variables de p2 avec [Cdr; Cdr] *)
      let env_after_p2 = 
        List.fold_right (fun y env -> (y, [Cdr; Cdr]) :: env) vars_p2 env_after_p1
      in
      
      (* Étape 3: Préfixer les variables existantes avec Car *)
      let old_vars = List.filter (fun (y,_) -> not (List.mem y (vars_p1 @ vars_p2))) env in
      let prefixed_old_vars = List.map (fun (y, path) -> (y, Car :: path)) old_vars in
      
      env_after_p2 @ prefixed_old_vars
  
  | NullPat -> env



  
  (* Calcule la position pour LetRec *)
let access_path env x =
  let rec aux env x n =
    match env with
    | [] -> failwith ("Unbound identifier: " ^ x)
    | (y, _) :: ys -> if x = y then n else aux ys x (n + 1)
  in aux env x 0

  
  let path_to_coms path = 
    List.map (function Car -> Ast.Car | Cdr -> Ast.Cdr) path


(* La fonction compile reste presque identique, seul le type de env change *)
let rec compile (env : env) (e : expr) : coms =
  match e with
  | Number n -> [Quote (Int n)]
  | True -> [Quote (Bool true)]
  | False -> [Quote (Bool false)]
  | Ident x -> 
    (match access x env with
     | [] -> 
         (* Cas des opérateurs prédéfinis *)
         (match x with
          | "fst" -> [Car]
          | "snd" -> [Cdr] 
          | "+" -> [Op Add]
          | "-" -> [Op Sub]
          | "*" -> [Op Mult]
          | "/" -> [Op Div]
          | "<" -> [Op Less]
          | ">" -> [Op Greater]
          | "=" -> [Op Equal]
          | _ -> failwith ("Unknown operator or unbound identifier: " ^ x))
     | path -> path_to_coms path )
  
  | If (e1, e2, e3) ->
      let c1 = compile env e1 in
      let c2 = compile env e2 in
      let c3 = compile env e3 in
      [Push] @ c1 @ [Branch (c2, c3)]
  
  | Mlpair (e1, e2) ->
      let c1 = compile env e1 in
      let c2 = compile env e2 in
      [Push] @ c1 @ [Swap] @ c2 @ [Cons]
  
  | Let (p, e1, e2) ->
      let c1 = compile env e1 in
      let c2 = compile (extend_env p env) e2 in
      [Push] @ c1 @ [Cons] @ c2
  
  | LetRec (p, e1, e2) ->
      let env' = extend_env p env in
      let c1 = compile env' e1 in
      let c2 = compile env' e2 in
      (match p with
        | IdentPat x -> [Push; Quote (Int (access_path env' x)); Cons; Push] @ c1 @ [Swap; Rplac] @ c2
        | _ -> failwith "LetRec only supports IdentPat")
  
  | Lambda (p, e) ->
      let env' = extend_env p env in
      let c = compile env' e in
      [Cur c]
  
    | Apply (Apply (Ident op, e1), e2) when List.mem op ["+";"-";"*";"/";"<";">";"="] ->
        [Push] @ compile env e1 @ [Swap] @ compile env e2 @ [Cons; App]
    | Apply (Ident "fst", e) -> compile env e @ [Car]
    | Apply (Ident "snd", e) -> compile env e @ [Cdr]
    | Apply (e1, e2) ->
        [Push] @ compile env e1 @ [Swap] @ compile env e2 @ [Cons; App]
(* Fonction pour compiler un programme complet *)
let compile_program (e : expr) : program =
  compile init_env e


 
let rec string_of_com com =
  match com with
  | Quote (Int n) -> Printf.sprintf "Quote(Int %d)" n
  | Quote (Bool true) -> "Quote(Bool true)"
  | Quote (Bool false) -> "Quote(Bool false)"
  | Quote NullValue -> "Quote(Null)"
  | Op Add -> "Op(Add)"
  | Op Sub -> "Op(Sub)" 
  | Op Mult -> "Op(Mult)"
  | Op Div -> "Op(Div)"
  | Op Equal -> "Op(Equal)"
  | Op Less -> "Op(Less)"
  | Op Greater -> "Op(Greater)"
  | Car -> "Car"
  | Cdr -> "Cdr"
  | Cons -> "Cons"
  | Push -> "Push"
  | Swap -> "Swap"
  | App -> "App"
  | Rplac -> "Rplac"
  | Cur code -> "Cur[" ^ (string_of_cam_code code) ^ "]"
  | Branch (code1, code2) -> "Branch(" ^ (string_of_cam_code code1) ^ ", " ^ (string_of_cam_code code2) ^ ")"

and string_of_cam_code code =
  String.concat "; " (List.map string_of_com code)

        
let print_cam_code cam_code =
print_endline "=== Code CAM ===";
List.iter (fun c -> print_endline (string_of_com c)) cam_code


      

      