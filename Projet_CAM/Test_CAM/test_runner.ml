(* Charge les modules nécessaires *)
open Transformation_ml_cam
(*open Vm_cam.Vm
*)


let run_test filename =
  (* 1. Lecture du fichier MiniML *)
  let program = In_channel.with_open_bin filename In_channel.input_all in
  
  (* 2. Parsing *)
  let ast = Parser.prog Lexer.token (Lexing.from_string program) in
  
  (* 3. Transformation en CAM *)
  let cam_code = Transformation.compile_program ast in
  
  
  
  (* 4. Exécution 
  let final_state = run_cam_program cam_code in
*)
  (* 5. Affichage des résultats *)
  Printf.printf "=== Test: %s ===\n" filename;
  Printf.printf "Code CAM généré:\n";
  List.iter (fun instr -> Printf.printf "%s\n" (Transformation.string_of_com instr)) cam_code;;
  (*
  match final_state.stack with
  | result::_ -> 
      Printf.printf "\nRésultat d'exécution: %s\n" (string_of_vm_value result)
  | [] -> 
      Printf.printf "\nAucun résultat sur la pile\n"
*)
(* Exemple d'utilisation *)
let () =
  run_test "Test_CAM/Samples/identity.ml";