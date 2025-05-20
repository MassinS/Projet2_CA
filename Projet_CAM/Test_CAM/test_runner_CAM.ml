(* test_cam.ml *)

(* 0. Ouvrir les modules *)
open Transformation_ml_cam
open Vm_cam

(* Modules système *)
open Sys

let ensure_dir dir =
  if not (file_exists dir) then mkdir dir 0o755

let run_test dir_samples dir_results filename =
  (* Préparer les chemins *)
  let src_path = Filename.concat dir_samples filename in
  let base = Filename.chop_suffix filename ".ml" in
  let out_file = Filename.concat dir_results (base ^ ".txt") in

  (* Lire le contenu du fichier MiniML *)
  let program_text =
    In_channel.with_open_bin src_path In_channel.input_all
  in

  (* Parsing *)
  let ast = Parser.prog Lexer.token (Lexing.from_string program_text) in

  (* Transformation en CAM *)
  let cam_code = Transformation.compile_program ast in

  (* Exécution du code CAM *)
  let final_config = Vm.run_cam_program cam_code in

  (* Écriture des résultats dans out_file *)
  Out_channel.with_open_text out_file (fun oc ->
    Printf.fprintf oc "=== Test : %s ===\n" filename;
    Printf.fprintf oc "Code CAM généré :\n";
    List.iter (fun instr ->
      Printf.fprintf oc "  %s\n" (Transformation.string_of_com instr)
    ) cam_code;

    let result_value, _, _ = final_config in
    Printf.fprintf oc "\nRésultat d'exécution : %s\n" 
      (Vm.string_of_vm_value !result_value)
  )

let () =
  let dir_samples = "./Samples" in
  let dir_results = "Resultat_CAM" in

  (* Créer les dossiers si nécessaire *)
  ensure_dir dir_samples;
  ensure_dir dir_results;

  (* Lister et filtrer les fichiers .ml dans Samples *)
  Array.to_list (readdir dir_samples)
  |> List.filter (fun f -> Filename.check_suffix f ".ml")
  |> List.iter (fun f -> run_test dir_samples dir_results f)
