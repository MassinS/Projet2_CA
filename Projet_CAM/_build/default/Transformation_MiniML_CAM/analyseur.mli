type token =
  | LET
  | IN
  | IF
  | THEN
  | ELSE
  | FUN
  | EQ
  | CHAR of (
# 7 "analyseur.mly"
        char
# 13 "analyseur.mli"
)
  | INT of (
# 8 "analyseur.mly"
        int
# 18 "analyseur.mli"
)
  | IDENT of (
# 9 "analyseur.mly"
        string
# 23 "analyseur.mli"
)
  | TRUE
  | FALSE
  | REC
  | EOF
  | LPAREN
  | RPAREN
  | COMMA
  | RIGHT_ARROW

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr
