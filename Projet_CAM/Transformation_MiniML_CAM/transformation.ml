open Ast 

type access_step = Car | Cdr
type env = (ident * access_step list) list

(* Cherche le chemin d'un identifiant dans l'environnement *)

let rec find_in_env x = function
  | [] -> failwith ("Unbound identifier: " ^ x)
  | (y, path) :: rest ->
      if x = y then path
      else find_in_env x rest


  
      let rec extend_env p env =
        match p with
        | IdentPat x ->
            let update (v, path) =
              if path = [Car] then (v, [Cdr])
              else (v, path)
            in
            (x, [Car]) :: List.map update env
        | Pairpat (p1, p2) ->
            (* Pour p2, on met à jour l'environnement en ajoutant un Cdr sur les bindings frais *)
            let update1 (v, path) = 
              if path = [Car] then (v, [Cdr])
              else (v, Cdr :: path)
            in
            let env' = List.map update1 env in
            let env'' = extend_env p2 env' in
            (* Pour p1, on ajoute un Car, en ne modifiant que ceux qui sont frais *)
            let update2 (v, path) =
              if path = [Car] then (v, [Car])
              else (v, Car :: path)
            in
            extend_env p1 (List.map update2 env'')
        | NullPat -> env

        
(* Calcule la position pour LetRec (simplifié) *)
let access_path rho p =
  match p with
  | IdentPat x -> 
      let rec loop idx = function
        | [] -> failwith "Identifier not found"
        | y :: rest -> if x = y then idx else loop (idx + 1) rest
      in
      loop 0 rho
  | _ -> failwith "Seuls les patterns simples (IdentPat) sont supportés"


(* Environnement initial avec opérateurs prédéfinis *)
let init_pat : env = 
  ["+", []; "-", []; "*", []; "/", []; "=", []; "<", []; ">", []]

 let path_to_coms path = 
  List.map (function Car -> Ast.Car | Cdr -> Ast.Cdr) path


(* La fonction compile reste identique à votre version originale *)
let rec compile (e : expr) (rho : env) : com list =
    match e with
    | Number n -> [Quote (Int n)]
    | True -> [Quote (Bool true)]
    | False -> [Quote (Bool false)]
    | Ident x -> path_to_coms (find_in_env x rho)
    | If(e1, e2, e3) ->
        [Push] @ compile e1 rho @ [Branch (compile e2 rho, compile e3 rho)]
    | Mlpair (e1, e2) -> 
        [Push] @ compile e1 rho @ [Swap] @ compile e2 rho @ [Cons]
    | Let (p, e1, e2) ->
        [Push] @ compile e1 rho @ [Cons] @ compile e2 (extend_env p rho)
        
    | LetRec(p, e1, e2) ->
        let rho' = extend_env p rho in
        let rho'_idents = List.map fst rho' in
        [Push; Quote (Int (access_path rho'_idents p)); Cons; Push] @ 
        compile e1 rho' @ [Swap; Rplac] @ 
        compile e2 rho'
    | Lambda(p, e) ->
        [Cur (compile e (extend_env p rho))]
    | Apply (e1, e2) ->
        match e1 with
        | Ident op when List.mem op ["+"; "-"; "*"; "/"; "=";"<";">"] ->
            (match e2 with
             | Mlpair(e_left, e_right) ->
                 let c_left = compile e_left rho in
                 let c_right = compile e_right rho in
                 c_left @ c_right @ [Op (match op with
                                      | "+" -> Add
                                      | "-" -> Sub
                                      | "*" -> Mult
                                      | "/" -> Div
                                      | "=" -> Equal
                                      | "<" -> Less
                                      | ">" -> Greater
                                      | _ -> failwith "Opérateur inconnu")]
             | _ -> failwith "Les opérateurs doivent être appliqués à une paire")
        | _ ->
            [Push] @ compile e1 rho @ [Swap] @ compile e2 rho @ [Cons; App]

  
(* Règle (1) : Compilation du programme complet *)
(* Définition du type program est déjà présente dans AST CAM (program = com list) *)
 
    (*Compiler un programme MiniML en un programme CAM*)
let compile_program (e : expr) : program =
  compile e init_pat

 
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


      

      
