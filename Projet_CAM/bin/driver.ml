(* driver.ml *)
open Transformation_ml_cam

let () =
  (* Étape 1 : Lecture du programme source *)
  let input = 
    if Array.length Sys.argv > 1 then
      let ic = open_in Sys.argv.(1) in
      let content = really_input_string ic (in_channel_length ic) in
      close_in ic;
      content
    else
      (print_string "Entrez un programme MiniML:\n";
      read_line())
  in

  (* Étape 2 : Lexing + Parsing *)
  let lexbuf = Lexing.from_string input in
  let program = 
    try Parser.prog Lexer.token lexbuf 
    with _ ->
      let pos = lexbuf.lex_curr_p in
      Printf.eprintf "Erreur de parsing à ligne %d, colonne %d\n"
        pos.pos_lnum (pos.pos_cnum - pos.pos_bol);
      exit 1
  in

  (* Étape 3 : Transformation en CAM *)
  let cam_code = Transformation.compile_program program in
  Transformation.print_cam_code cam_code;
  