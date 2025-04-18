open Transformation_ml_cam.Ast

type vm_value =
  | Val of value
  | Closure of closure
  | Pair of vm_value * vm_value

and closure = {
    code : com list;
    env : vm_value;  (* L'environnement est maintenant une valeur vm_value *)
  }

type state = {
  code : com list;
  stack : vm_value list;
}

let string_of_vm_value = function
  | Val (Int n) -> string_of_int n
  | Val (Bool b) -> string_of_bool b
  | Val NullValue -> "null"
  | Closure _ -> "<closure>"
  | Pair _ -> "<pair>"

  let print_state st =
    Printf.printf "=== State ===\n";
    Printf.printf "Code restant: %d instructions\n" (List.length st.code);
    Printf.printf "Stack (%d elements):\n" (List.length st.stack);
    List.iteri (fun i v -> Printf.printf "  %d: %s\n" i (string_of_vm_value v)) st.stack;
    Printf.printf "=============\n"

    let  string_of_com = function
  | Quote v -> "Quote " ^ string_of_vm_value (Val v)
  | Push -> "Push"
  | Car -> "Car"
  | Cdr -> "Cdr"
  | Cons -> "Cons"
  | Swap -> "Swap"
  | App -> "App"
  | Rplac -> "Rplac"
  | Cur _ -> "Cur [code]"
  | Branch (_, _) -> "Branch"
  | Op op -> "Op " ^ (match op with Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/" 
                      | Equal -> "=" | Less -> "<" | Greater -> ">")
         
                      

let rec eval (st : state) : state =
  let () = Printf.printf "Instruction: %s\n" (match st.code with [] -> "[]" | hd::_ -> string_of_com hd) in
  let () = Printf.printf "Stack: [%s]\n" (String.concat "; " (List.map string_of_vm_value st.stack)) in

  match st.code with
  | [] -> let () = Printf.printf "Fin d'exécution\n" in
      st
  | instr :: rest ->
    let () = Printf.printf "Exécution: %s\n" (string_of_com instr) in
      let new_state =
        match instr with
        | Quote v -> {  code = rest; stack = Val v :: st.stack }
        | Push -> 
          { 
            code = rest; 
            stack = (match st.stack with
                    | v :: tail -> v :: v :: tail  (* Duplique le top si existe *)
                    | [] -> failwith "Push: pile vide" 
            )
          }

        | Car -> 
            (match st.stack with
            | Pair (v1, _) :: tail -> {  code = rest; stack = v1 :: tail }
            | _ -> failwith "Car: pile incorrecte")
        | Cdr -> 
              (match st.stack with
              | Pair (_, v2) :: tail -> {  code = rest; stack = v2 :: tail }
              | _ -> failwith "Cdr: la pile doit contenir une paire")
        | Cons -> 
            (match st.stack with
            | v1 :: v2 :: tail -> {  code = rest; stack = Pair (v2, v1) :: tail }
            | v1 :: [] -> {  code = rest; stack = Pair (v1, Val NullValue) :: [] } (* Si la pile a un seul élément, le duplique *)
            | _ -> failwith "Cons: pile incorrecte")
        | Swap -> 
          ( match st.stack with
            | v1 :: v2 :: tail -> { code = rest; stack = v2 :: v1 :: tail }
            | _ -> failwith "Swap: pile incorrecte")
        | App ->
              (match st.stack with
              | Closure { code; env } :: arg :: tail ->
                  (* Conforme à la règle 16 : (closure, arg) devient (env, arg) *)
                  let new_stack = Pair (arg, env) :: tail in
                  { 
                      code = code;
                      stack = new_stack;
                  } |> eval
              | _ -> failwith "App: closure et argument attendus dans le bon ordre")

       | Rplac ->
                (match st.stack with
                | new_env :: Closure c :: tail ->
                    let recursive_closure = { c with env = new_env } in
                    { code = rest; stack = Closure recursive_closure :: tail }
                | _ -> failwith "Rplac: closure et env attendus")

                
        | Cur code_sub ->
                  (match st.stack with
                  | env :: tail ->
                      let new_closure = {
                          code = code_sub;
                          env = env; 
                      } in
                      { code = rest; stack = Closure new_closure :: tail }
                  | [] -> failwith "Cur: pile vide, environnement attendu")


        | Branch (code_true, code_false) -> 
                    (match st.stack with
                    | Val (Bool true) :: tail -> 
                        {  code = code_true @ rest; stack = tail }
                    | Val (Bool false) :: tail -> 
                        {  code = code_false @ rest; stack = tail }
                    | top :: _ -> 
                        let top_str = string_of_vm_value top in
                        failwith (Printf.sprintf "Branch: condition non booléenne (trouvé: %s)" top_str)
                    | [] -> 
                        failwith "Branch: pile vide")
        | Op op -> 
                  (match st.stack with
                  (* Cas où les opérandes sont dans une Paire (ex: (3,5) *)
                  | Pair(Val (Int n1), Val (Int n2)) :: tail ->
                      Printf.printf "Op: %d %s %d (from pair)\n" n1 (string_of_com instr) n2;
                      let res = match op with
                        | Add -> Val (Int (n1 + n2))
                        | Sub -> Val (Int (n1 - n2))
                        | Mult -> Val (Int (n1 * n2))
                        | Div -> if n2 = 0 then raise Division_by_zero else Val (Int (n1 / n2))
                        | Equal -> Val (Bool (n1 = n2))
                        | Less -> Val (Bool (n1 < n2))
                        | Greater -> Val (Bool (n1 > n2))
                      in { code = rest; stack = res :: tail }
                  
                  (* Cas classique avec deux entiers empilés *)
                  | Val (Int n2) :: Val (Int n1) :: tail -> 
                      Printf.printf "Op: %d %s %d\n" n1 (string_of_com instr) n2;
                      let res = match op with
                        | Add -> Val (Int (n1 + n2))
                        | Sub -> Val (Int (n1 - n2))
                        | Mult -> Val (Int (n1 * n2))
                        | Div -> if n2 = 0 then raise Division_by_zero else Val (Int (n1 / n2))
                        | Equal -> Val (Bool (n1 = n2))
                        | Less -> Val (Bool (n1 < n2))
                        | Greater -> Val (Bool (n1 > n2))
                      in { code = rest; stack = res :: tail }
                  
                  | _ -> failwith "Op: pile incorrecte")
                          
      in
      let () = Printf.printf "=== Après exécution ===\n" in
      let () = print_state new_state in
      eval new_state
    
      let run_cam_program cam_code =
        (* Fermetures prédéfinies pour les opérateurs *)
        let init_stack = [
          Closure {  (* Fermeture pour '+' *)
            code = [Cdr; Car; Op Add]; (* Extrait la paire et applique l'opération *)
            env = Val (Int 0)
          };
          Closure {  (* Fermeture pour '-' *)
            code = [Cdr; Car; Op Sub];
            env = Val (Int 0)
          };
          Closure {  (* Fermeture pour 'car' *)
            code = [Car];
            env = Val (Int 0)
          }
        ] in
        
        let initial_state = {
          code = cam_code;
          stack = init_stack; (* Stack initial avec opérateurs *)
        } in
              
        eval initial_state
        