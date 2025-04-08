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

let rec eval (st : state) : state =
  match st.code with
  | [] -> st
  | instr :: rest ->
      let new_state =
        match instr with
        | Quote v -> {  code = rest; stack = Val v :: st.stack }
        | Push -> 
            (match st.stack with
            | v :: tail -> { code = rest; stack = v :: v :: tail }
            | _ -> failwith "Push: pile vide")
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
            | _ -> failwith "Cons: pile incorrecte")
        | Swap -> 
          ( match st.stack with
            | v1 :: v2 :: tail -> { code = rest; stack = v2 :: v1 :: tail }
            | _ -> failwith "Swap: pile incorrecte")
        | App ->
              (match st.stack with
              | Closure { code; env } :: arg :: tail ->
                  (* Conforme à la règle 16 : (closure, arg) devient (env, arg) *)
                  let new_stack = Pair (env, arg) :: tail in
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
              | Val (Int n2) :: Val (Int n1) :: tail -> 
                  let res = match op with
                    | Add -> Val (Int (n1 + n2))
                    | Sub -> Val (Int (n1 - n2))
                    | Mult -> Val (Int (n1 * n2))
                    | Div -> if n2 = 0 then raise Division_by_zero else Val (Int (n1 / n2))
                    | Equal -> Val (Bool (n1 = n2))
                    | Less -> Val (Bool (n1 < n2))
                    | Greater -> Val (Bool (n1 > n2))
                  in {  code = rest; stack = res :: tail }
              | _ -> failwith "Op: pile incorrecte")
      in
      eval new_state

let run_cam_program cam_code =
  let initial_state = {
    code = cam_code;
    stack = [
      Closure {code = [Op Add]; env = Val NullValue};
      Closure {code = [Op Sub]; env = Val NullValue};
      Closure {code = [Op Mult]; env = Val NullValue};
      Val NullValue
    ];
  } in
  eval initial_state