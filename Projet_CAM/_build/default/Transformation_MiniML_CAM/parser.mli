type token =
  | LET
  | IN
  | IF
  | THEN
  | ELSE
  | FUN
  | EQ
  | CHAR of (
# 7 "parser.mly"
        char
# 13 "parser.mli"
)
  | INT of (
# 8 "parser.mly"
        int
# 18 "parser.mli"
)
  | IDENT of (
# 9 "parser.mly"
        string
# 23 "parser.mli"
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
