(* Abstract Syntax of Mini-ML (Figure 1, page 14) *)

type ident = string

(*Motif*)

type pat =
  | Pairpat of pat * pat
  | IdentPat of ident
  | NullPat

  type expr =
  | Ident of ident
  | Number of int
  | False
  | True
  | Apply of expr * expr
  | Mlpair of expr * expr
  | Lambda of pat * expr
  | Let of pat * expr * expr
  | LetRec of pat * expr * expr
  | If of expr * expr * expr
  | MLfst
  | MLsnd


  
(* Abstract Syntax of CAM code (Figure 7, page 21) *)
type program = coms
and coms = com list
and com =
  | Quote of value
  | Op of operator
  | Car
  | Cdr
  | Cons
  | Push
  | Swap
  | App
  | Rplac
  | Cur of coms
  | Branch of coms * coms
  | Fst
  | Snd

and value =
  | Int of int
  | Bool of bool
  | NullValue
  | Pair of value * value
  | Closure of coms * value

and operator = Add | Sub | Mult | Div | Equal | Less | Greater

(* Environnement pour la compilation *)

(* Environnement pour la transformation *) 

