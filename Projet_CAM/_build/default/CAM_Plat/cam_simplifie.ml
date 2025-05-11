open Transformation_ml_cam


(* CAM Simplifie *)

(* Eclat ne supporte pas les listes d’instructions imbriquées :
 chaque instruction doit être un simple constructeur, éventuellement muni de petits champs (comme les indices pour Branch).
 On définit donc un type plat
*)

(* 
- Les opérations structurantes CAM (Cur, Branch) deviennent des cases qui portent des entiers (adresses) plutôt que des listes.
- Les instructions simples (Quote, Push, Car, etc.) restent mappées 1:1.
- F_Nop sert à pré-remplir le tableau avant qu’on ne remplace chaque case par sa vraie instruction.
*)
 
 (* 1. Types plats pour Eclat *)
type flat_instr =
| F_Quote of Ast.value            (* Quote immédiat *)
| F_Push                      (* Duplication *)
| F_Car                       (* extrait fst *)
| F_Cdr                       (* extrait snd *)
| F_Cons                      (* construit paire *)
| F_Swap                      (* échange 2 premiers *)
| F_App                       (* appel *)
| F_Rplac                     (* Wind *)
| F_Cur of int                (* adresse du code de la fermeture *)
| F_Branch of int * int       (* branchement vers deux adresses *)
| F_Op       of Ast.operator 
| F_Nop                       (* placeholder *)


(* Processus de aplatement *)

(*  étape 1: assigner à chaque fragment de CAM une adresse unique  *)
(* On parcourt le code CAM et on assigne une adresse unique à chaque fragment de code.
   On utilise une table de hachage pour stocker les adresses et un compteur pour suivre la prochaine adresse disponible. *)

(* Pourquoi ? 
Chaque fragment de CAM (la liste principale, chaque sous-liste sub d’un Cur, chaque paire (c1,c2) d’un Branch)
doit occuper un intervalle contigu d’adresses dans le tableau plat.
*)
(* étape 1: assigner à chaque fragment de CAM une adresse unique *)
(* assign_addresses : com list -> (com list,int) Hashtbl.t * int *)
let assign_addresses prog =
  let table     = Hashtbl.create 128 in
  let next_addr = ref 0 in
  let rec visit blk =
    if not (Hashtbl.mem table blk) then begin
      Hashtbl.add table blk !next_addr;
      next_addr := !next_addr + List.length blk;
      List.iter (function
        | Ast.Cur sub        -> visit sub (* La commande Cur contient des commandes donc on visite la corps de Cur *)
        | Ast.Branch(c1,c2)  -> visit c1; visit c2 (* La commande Branch contient deux commandes donc on visite les deux *)
        | _              -> () (*Le reste des commandes ne contient pas des commandes.  *)
      ) blk
    end
  in
  visit prog;
  (* Ici next_addr est la somme totale des longueurs *)
  (table, !next_addr)



(* 3. Traduction d'une instruction CAM en flat_instr sans indices *)

(* J'ai ajouté cette fonction pour les instructions non-structurantes 
(celles qui n’introduisent pas de listes imbriquées), on les mappe directement en flat_instr.
*)

  let translate_op = function
| Ast.Quote v   -> F_Quote v
| Ast.Push      -> F_Push
| Ast.Car       -> F_Car
| Ast.Cdr       -> F_Cdr
| Ast.Cons      -> F_Cons
| Ast.Swap      -> F_Swap
| Ast.App       -> F_App
| Ast.Rplac     -> F_Rplac
| Ast.Fst       -> F_Car  (* Handle Fst case *)
| Ast.Snd       -> F_Cdr  (* Handle Snd case *)
 | Ast.Op op     -> F_Op op 
| Ast.Cur _ | Branch _  -> F_Nop (* ces instructions sont traitées par flatten_code *)



(* 4. Passe 2: linéariser en utilisant la table d'adresses *)
(** flatten_code : com list -> flat_instr array *)
let flatten_code prog =
  let (table, total) = assign_addresses prog in
  let flat = Array.make total F_Nop in
  let rec emit blk =
    let base = Hashtbl.find table blk in
    List.iteri (fun i instr ->
      let idx = base + i in
      let f = match instr with
        | Ast.Branch(c1,c2) ->
            let a1 = Hashtbl.find table c1 in
            let a2 = Hashtbl.find table c2 in
            F_Branch(a1,a2)
        | Ast.Cur sub ->
            let a = Hashtbl.find table sub in
            F_Cur a
        | _ ->
            translate_op instr
      in
      flat.(idx) <- f
    ) blk;
    List.iter (function
      | Ast.Cur sub       -> emit sub
      | Ast.Branch(c1,c2) -> emit c1; emit c2
      | _             -> ()
    ) blk
  in
  emit prog;
  flat


  
  

 (* 5. Génération du fichier code.ecl *)
let dump_ecl filename (flat : flat_instr array) : unit =
  let oc = open_out filename in
  (* création du tableau en Eclat *)
  Printf.fprintf oc "let code = create<%d>() ;;\n\n" (Array.length flat);
  Printf.fprintf oc "let load_code () =\n\n";
  
  Array.iteri (fun k instr ->
    let line =
      match instr with
      | F_Quote v ->
          (match v with
           | Int n    ->
               Printf.sprintf "  set(code,%d,Quote_int %d);;" k n
           | Bool true    ->
               Printf.sprintf "  set(code,%d,Quote_bool true);;" k
           | Bool false   ->
               Printf.sprintf "  set(code,%d,Quote_bool false);;" k
           | NullValue    ->
               Printf.sprintf "  set(code,%d,Quote_null ());;" k
           | Pair _ | Closure _ ->
               (* devraient déjà avoir été éliminés en amont *)
               failwith "Unexpected Pair/Closure in dump_ecl")
      | F_Push ->
          Printf.sprintf "  set(code,%d,Push ());;" k
      | F_Car ->
          Printf.sprintf "  set(code,%d,Car ());;" k
      | F_Cdr ->
          Printf.sprintf "  set(code,%d,Cdr ());;" k
      | F_Cons ->
          Printf.sprintf "  set(code,%d,Cons ());;" k
      | F_Swap ->
          Printf.sprintf "  set(code,%d,Swap ());;" k
      | F_App ->
          Printf.sprintf "  set(code,%d,App ());;" k
      | F_Rplac ->
          Printf.sprintf "  set(code,%d,Rplac ());;" k
      | F_Cur a ->
          Printf.sprintf "  set(code,%d,Cur %d);;" k a
      | F_Branch(a,b)   -> Printf.sprintf "set(code,%d,Branch(%d,%d));;" k a b
      | F_Op op ->
    let s = match op with
      | Ast.Add     -> "Add"
      | Ast.Sub     -> "Sub"
      | Ast.Mult    -> "Mult"
      | Ast.Div     -> "Div"
      | Ast.Equal   -> "Equal"
      | Ast.Less    -> "Less"
      | Ast.Greater -> "Greater"
    in
    Printf.sprintf "  set(code,%d, %s);;" k s

      | F_Nop ->
          Printf.sprintf "  set(code,%d,Nop ());;" k
    in
    output_string oc (line ^ "\n")
  ) flat;

  close_out oc
;;






(* Phase de test *)
let () =
  if Array.length Sys.argv <> 2 then begin
    prerr_endline "Usage: flatten <fichier>.ml";
    exit 1
  end;
  let filename = Sys.argv.(1) in

  (* 1. Lecture + parsing *)
  let ch = open_in filename in
  let lexbuf = Lexing.from_channel ch in
  let ast   = Parser.prog Lexer.token lexbuf in
  close_in ch;

  (* 2. Transformation Mini-ML -> CAM *)
  let cam_code = Transformation.compile_program ast in

  (* 3. Assignation d’adresses et aplatissement *)
  let (_, total) = assign_addresses cam_code in
  let flat = flatten_code cam_code in

  (* 4. Affichage à la console *)
  Printf.printf "=== flatten %s (total instr = %d) ===\n"
    filename total;
  Array.iteri (fun i instr ->
    let s = match instr with
      | F_Quote v      -> "F_Quote " ^ (match v with
                                | Int n         -> string_of_int n
                                | Bool b        -> string_of_bool b
                                | Pair (_, _)   -> "Pair"
                                | Closure (_, _) -> "Closure"
                                | NullValue     -> "Null"
                             )
      | F_Op op        -> "F_Op " ^ (match op with
                                | Ast.Add     -> "Add"
                                | Ast.Sub     -> "Sub"
                                | Ast.Mult    -> "Mult"
                                | Ast.Div     -> "Div"
                                | Ast.Equal   -> "Equal"
                                | Ast.Less    -> "Less"
                                | Ast.Greater -> "Greater")
      | F_Push         -> "F_Push"
      | F_Car          -> "F_Car"
      | F_Cdr          -> "F_Cdr"
      | F_Cons         -> "F_Cons"
      | F_Swap         -> "F_Swap"
      | F_App          -> "F_App"
      | F_Rplac        -> "F_Rplac"
      | F_Cur a        -> "F_Cur " ^ string_of_int a
      | F_Branch(a,b)  -> "F_Branch(" ^ string_of_int a ^ "," ^ string_of_int b ^ ")"
      | F_Nop          -> "F_Nop"
    in
    Printf.printf "%4d: %s\n" i s
  ) flat;

  (* 5. (Optionnel) Génère le fichier code.ecl *)
  let out_ecl = Filename.remove_extension filename ^ ".ecl" in
  dump_ecl out_ecl flat;
  Printf.printf "  -> dumped Eclat code to %s\n" out_ecl



  