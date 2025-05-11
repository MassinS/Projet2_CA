(* vm_cam.ml *)

open Transformation_ml_cam.Ast

(* Stack element *)
type stackelem =
  | Val of value
  | Code of coms

type stack = stackelem list  

(* Un état de la machine : (registre courant, code restant, pile) *)
type config = value ref * coms * stack

let eval_operator op v1 v2 =
  match op, v1, v2 with
  | Add, Int a, Int b     -> Int (a + b)
  | Sub, Int a, Int b     -> Int (a - b)
  | Mult, Int a, Int b    -> Int (a * b)
  | Div, Int a, Int b     -> Int (a / b)
  | Equal, Int a, Int b   -> Bool (a = b)
  | Less,  Int a, Int b   -> Bool (a < b)
  | Greater, Int a, Int b -> Bool (a > b)
  | _ -> failwith "vm_cam: invalid operands for Op"

(* Exécution d’un pas de la machine CAM *)
let rec exec : config -> config = fun (r, code, stk) ->
  match code, stk with
  (* destructuration d’une paire dans r *)
  | (Car :: c'), _ ->
      (match !r with Pair(v1, _) -> exec (ref v1, c', stk)
                     | _ -> failwith "vm_cam: Car on non-pair")

  | (Cdr :: c'), _ ->
      (match !r with Pair(_, v2) -> exec (ref v2, c', stk)
                     | _ -> failwith "vm_cam: Cdr on non-pair")

  (* construction d’une paire (cons) *)
  | (Cons :: c'), Val y :: stk' ->
      exec (ref (Pair(y, !r)), c', stk')

  (* sauvegarde du registre sur la pile *)
  | (Push :: c'), _ ->
      exec (ref !r, c', Val !r :: stk)

  (* échange registre / sommet de pile *)
  | (Swap :: c'), Val y :: stk' ->
      exec (ref y, c', Val !r :: stk')

  (* quotation *)
  | (Quote v :: c'), _ ->
      exec (ref v, c', stk)

  (* application *)
  | (App :: c'), _ ->
      (match !r with
       | Pair (Closure(code_fun, env_val), arg_env) ->
           (* On exécute code_fun, et on empile la continuation c' *)
           exec (ref (Pair(env_val, arg_env)), code_fun, Code c' :: stk)
       | _ -> failwith "vm_cam: App on non-closure")

  | (Branch (c_then, c_else) :: c'), stk ->
      (match !r with
       | Bool b ->
           let next = if b then c_then else c_else in
           (* on empile la continuation, mais on NE DÉPILE PAS la pile d'origine *)
           exec (r, next, Code c' :: stk)
       | _ -> failwith "vm_cam: Branch on non-bool")



  (* opération binaire générique *)
  | (Op op :: c'), stk ->
    begin
      match op, !r, stk with
      (* 1) cas “pair” : le registre est une paire (venant d’un Cons) *)
      | Add,   Pair(Int m, Int n), _ ->
          exec (ref (Int (m + n)), c', stk)
      | Sub,   Pair(Int m, Int n), _ ->
          exec (ref (Int (m - n)), c', stk)
      | Mult,  Pair(Int m, Int n), _ ->
          exec (ref (Int (m * n)), c', stk)
      | Div,   Pair(Int m, Int n), _ ->
          exec (ref (Int (m / n)), c', stk)
      | Equal, Pair(Int m, Int n), _ ->
          exec (ref (Bool (m = n)),  c', stk)
      | Less,  Pair(Int m, Int n), _ ->
          exec (ref (Bool (m < n)),  c', stk)
      | Greater, Pair(Int m, Int n), _ ->
          exec (ref (Bool (m > n)),  c', stk)

      (* 2) cas “pile” : deux Val sur la pile *)
      | _, _, Val v2 :: Val v1 :: stk' ->
          let r' = eval_operator op v1 v2 in
          exec (ref r', c', stk')

      (* 3) sinon, erreur *)
      | _ ->
          failwith "vm_cam: Op, pile et registre malformés"
    end

  | (Rplac :: c'), Val newcar :: stk' ->
    (match !r with
     | Pair(_, cdr) ->
       r := Pair(newcar, cdr);
       exec (r, c', stk')
     | _ ->
       failwith "vm_cam: Rplac sur non-pair")


  (* création de fonction (closure) *)
  | (Cur code_fun :: c'), _ ->
      (* Il faut capturer l'environnement courant dans la closure *)
      exec (ref (Closure(code_fun, !r)), c', stk)

  (* retour après App ou Branch : on dépile la continuation *)
  | (_, Code cont :: stk') ->
      exec (r, cont, stk')

  (* fin de programme *)
  | ([], _) ->
      (r, [], stk)

  | instrs, _ ->
      failwith ("vm_cam: impossible d'exécuter, reste " ^
                string_of_int (List.length instrs) ^ " instructions")

(* Lance un programme CAM depuis l'état initial *)
let run_cam_program (code : coms) : config =
  exec (ref NullValue, code, [])

(* Récupère la valeur finale sur la pile *)
let result_of (r, _code, stk) =
  match stk with
  | Val v :: _ -> v
  | [] -> !r       (* si la pile est vide, on retourne le registre *)
  | _ -> failwith "vm_cam: état inattendu dans result_of"
  
(* Convertit une valeur VM en chaîne *)
let string_of_vm_value = function
  | Int n -> string_of_int n
  | Bool b -> string_of_bool b
  | NullValue -> "NullValue"
  | Pair _ -> "<pair>"
  | Closure _ -> "<closure>"
