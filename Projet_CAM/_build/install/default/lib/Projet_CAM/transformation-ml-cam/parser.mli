type token =
  | LET
  | IN
  | IF
  | THEN
  | ELSE
  | FUN
  | EQ
  | PLUS
  | MINUS
  | MULT
  | DIV
  | LESS
  | CHAR of (
# 7 "parser.mly"
        char
# 18 "parser.mli"
)
  | INT of (
# 8 "parser.mly"
        int
# 23 "parser.mli"
)
  | IDENT of (
# 9 "parser.mly"
        string
# 28 "parser.mli"
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
