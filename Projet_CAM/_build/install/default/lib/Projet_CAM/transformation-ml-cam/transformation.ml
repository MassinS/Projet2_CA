open Ast 

type env_path =
  | Top                    (* La variable est en haut de la pile *)
  | Left of env_path       (* Pour accéder à la variable, on effectue un Car, puis on suit le chemin *)
  | Right of env_path      (* Pour accéder à la variable, on effectue un Cdr, puis on suit le chemin *)


(* On peut utiliser une association (string * env_path) list *)
type env = (string * env_path) list

(* Fonction qui permet de chercher la valeur d'un identifiant dans l'env *)
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



let rec path_to_coms = function
| Top -> [Car]
| Left p -> Car :: path_to_coms p
| Right p -> Cdr :: path_to_coms p

         
  
  (*Fonction pour étendre l'env *)
  (*
  - Si p est un identifiant simple (IdentPat x), on l’ajoute directement.
  - Si p est une paire (Pairpat(p1, p2)), on ajoute p1 et p2 en décalant la pile.
  *) 
let rec extend_env (p : pat) (rho : env) : env =
    match p with
    | IdentPat x -> (x, Top) :: List.map (fun (v, p) -> (v, Right p)) rho
    | Pairpat (p1, p2) ->
        let rho1 = extend_env p1 rho in
        let rho2 = extend_env p2 (List.map (fun (v, p) -> (v, Right p)) rho1) in
        rho2
    | NullPat -> rho  (* Pas de nouvelle liaison *)

    

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
    
    | Mlpair (e1, e2) ->
      compile e1 rho @ [Push] @ compile e2 rho @ [Swap; Cons]
      
    | Let (p, e1, e2) ->
      let c1 = compile e1 rho in
      let rho' = extend_env p rho in  
      let c2 = compile e2 rho' in
      [Push] @ c1  @ c2 @ [Cons]

    | LetRec(p,e1,e2) -> 
      let rho1 = extend_env p rho in
      let c1 = compile e1 rho1 in
      let c2 = compile e2 rho1 in
      [Quote NullValue] @ [Cons; Push] @ c1 @ [Swap; Rplac] @ c2
    | Lambda (p, e) ->
        let rho' = extend_env p rho in
        let c = compile e rho' in
        [Cur c]
    | Apply (e1, e2) ->
    compile e1 rho @ [Swap] @ compile e2 rho @ [Cons; App]


(* Règle (1) : Compilation du programme complet *)
(* Définition du type program est déjà présente dans AST CAM (program = com list) *)
    let init_pat : env = []
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
      print_endline "\n=== Code CAM ===";
      List.iter (fun c -> print_endline (string_of_com c)) cam_code
      