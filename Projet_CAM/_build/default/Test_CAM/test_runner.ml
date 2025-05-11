(* test_cam.ml *)

(* 0. Ouvrir les modules *)
open Transformation_ml_cam
open Vm_cam

let run_test filename =
  (* 1. Lecture du fichier MiniML *)
  let program_text =
    In_channel.with_open_bin filename In_channel.input_all
  in

  (* 2. Parsing *)
  let ast =
    Parser.prog Lexer.token (Lexing.from_string program_text)
  in

  (* 3. Transformation en CAM *)
  let cam_code = Transformation.compile_program ast in

  (* 4. Exécution du code CAM *)
  let final_config = Vm.run_cam_program cam_code in

  (* 5. Affichage des résultats *)
  Printf.printf "=== Test: %s ===\n" filename;
  Printf.printf "Code CAM généré:\n";
  cam_code
  |> List.iter (fun instr ->
       Printf.printf "  %s\n" (Transformation.string_of_com instr)
     );

  (* 6. Récupération et affichage du résultat *)
  let result_value, _, _ = final_config in
  Printf.printf "Résultat d'exécution: %s\n\n"
    (Vm.string_of_vm_value !result_value)

let () =
  let dir = "Test_CAM/Samples/" in
  (* Lire tous les fichiers du dossier *)
  Sys.readdir dir
  |> Array.to_list
  |> List.filter (fun f -> Filename.check_suffix f ".ml")
  |> List.iter (fun f ->
      run_test (Filename.concat dir f)
    )
