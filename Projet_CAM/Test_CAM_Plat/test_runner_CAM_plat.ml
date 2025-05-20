(* test_cam_simplifie.ml *)

(* 0. Ouvrir le module de transformation *)
open Transformation_ml_cam
open Cam_simplifie

(* Modules système *)
open Sys

(* Chemins statiques *)
let samples_dir = "Samples"
let results_dir = "Resultat_CAM_plat"

(* Crée un dossier s'il n'existe pas *)
let ensure_dir dir =
  if not (file_exists dir) then mkdir dir 0o755

let run_test filename =
  (* Préparer les chemins *)
  let src = Filename.concat samples_dir filename in
  let base = Filename.chop_suffix filename ".ml" in
  let out_ecl = Filename.concat results_dir (base ^ ".ecl") in

  (* Lecture + parsing *)
  let ch = open_in src in
  let lexbuf = Lexing.from_channel ch in
  let ast = Parser.prog Lexer.token lexbuf in
  close_in ch;

  (* Transformation Mini-ML -> CAM *)
  let cam_code = Transformation.compile_program ast in

  (* Assignation d’adresses et aplatissement *)
  let flat = flatten_code cam_code in

  (* Génération du fichier .ecl *)
  dump_ecl out_ecl flat

let () =
  (* Préparer les dossiers *)
  ensure_dir samples_dir;
  ensure_dir results_dir;

  (* Parcourir les fichiers .ml dans Samples *)
  Sys.readdir samples_dir
  |> Array.to_list
  |> List.filter (fun f -> Filename.check_suffix f ".ml")
  |> List.iter run_test
