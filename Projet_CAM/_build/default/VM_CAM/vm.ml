open Transformation_ml_cam.Ast

type vm_value =
  | Val of value
  | Closure of closure
  | Pair of vm_value * vm_value


and closure = {
    code : com list;
    env : env;
  }
 
and env_value =
  | V of vm_value
  | Cl of closure
  (*| RecRef *)

and env = (string * env_value) list

type state = {
  code : com list;
  stack : vm_value list;  (* Pile ne contient que des valeurs *)
  env : env;           (* Environnement séparé *)
}


let string_of_vm_value = function
  | Val (Int n) -> string_of_int n
  | Val (Bool b) -> string_of_bool b
  | Val NullValue -> "null"
  | Closure _ -> "<closure>"
  | Pair _ -> "<pair>"
  
let rec eval (st : state) : state =
  match st.code with
  | [] -> st   (*La règle 2 de la figure 8*)
  | instr :: rest ->
      let new_state =
        match instr with
        | Quote v -> { st with code = rest; stack = Val v :: st.stack }
        | Push -> 
            (match st.stack with
            | v :: tail -> { st with code = rest; stack = v :: v :: tail }
            | _ -> failwith "Push: pile vide")
        | Car -> 
            (match st.stack with
            | Pair (v1, _) :: tail -> { st with code = rest; stack = v1 :: tail }
            | _ -> failwith "Car: pile incorrecte")
        | Cdr -> 
            (match st.stack with
            | Pair (_, v2) :: tail -> { st with code = rest; stack = v2 :: tail }
            | _ -> failwith "Cdr: pile incorrecte")
        | Cons -> 
            (match st.stack with
            | v2 :: v1 :: tail -> { st with code = rest; stack = Pair (v1, v2) :: tail }
            | _ -> failwith "Cons: pile incorrecte")
        | Swap -> 
            (match st.stack with
            | v1 :: v2 :: tail -> { st with  code = rest; stack = v2 :: v1 :: tail }
            | _ -> failwith "Swap: pile incorrecte")
        | App ->
             ( match st.stack with
              | Closure { code; env } :: arg :: tail ->
                  let new_env = ("arg", V arg) :: env in
                  eval { 
                    code = code; 
                    stack = tail;  (* Conserve le reste de la pile *)
                    env = new_env 
                  }
              | _ -> failwith "App: closure et argument attendus")
        | Rplac ->
                (match st.env with
                | ("current_closure", Cl c) :: _ ->
                    let rec recursive_env = 
                      ("self", Cl { c with env = recursive_env }) :: c.env in
                    { st with code = rest; env = recursive_env }
                | _ -> failwith "Rplac: closure courante manquante")

        | Cur code_sub ->
            let new_closure = {
            code = code_sub;
            env = st.env  (* Capture TOUT l'environnement courant *)
            } in
            { st with code = rest; stack = Closure new_closure :: st.stack }  

        | Branch (code_true, code_false) -> 
            (match st.stack with
            | Val (Bool true) :: tail -> { st with code = code_true @ rest; stack = tail }
            | Val (Bool false) :: tail -> { st with code = code_false @ rest; stack = tail }
            | _ -> failwith "Branch: condition non booléenne")
        | Op op -> 
            (match st.stack with
            | Val (Int n2) :: Val (Int n1) :: tail -> 
                let res = match op with
                  | Add -> n1 + n2
                  | Sub -> n1 - n2
                  | Mult -> n1 * n2
                in { st with code = rest; stack = Val (Int res) :: tail }
            | _ -> failwith "Op: pile incorrecte")
      in
      eval new_state


      let run_cam_program cam_code =
        let initial_state = {
          code = cam_code;
          stack = [Pair(Closure {code=[]; env=[]}, Val NullValue)]; (* Environnement initial structuré *)
          env = [];
        } in
        eval initial_state