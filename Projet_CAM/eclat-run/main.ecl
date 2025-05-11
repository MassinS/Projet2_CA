
type command =
    Quote_int   of int
  | Quote_bool  of bool
  | Quote_null  of unit
  | Push  of unit
  | Cons      of unit
  | Car      of unit
  | Cdr      of unit
  | Swap     of unit
  | App      of unit
  | Rplac    of unit
  | Cur      of int
  | Add      of unit
  | Sub      of unit
  | Mul      of unit
  | Div      of unit
  | Equal    of unit
  | Less     of unit
  | Greater  of unit 
  | Branch   of int * int
  | Nop      of unit 
;;

let counter () = reg (fun c -> c + 1) init 0 ;;

let code  = create<1024>() ;;

let rec run_interp () = 
  
   let stack = create<256>() in
   let rec step (pc, sp, r) =
    if pc >= 1024 then ()
    else

     match get(code, pc) with
   | Quote_int v ->
      (* charger v dans r et avancer PC *)
      step ((pc + 1) ,sp, v)

   | Quote_bool b ->
          (* true -> 1, false -> 0 *)
          step (pc+1, sp, if b then 1 else 0)

   | Quote_null () ->
          (* convention : null -> 0 *)
          step (pc+1, sp, 0)

   | Add () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = x + y in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Sub () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = x - y in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Mul () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = x * y in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Div () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = x / y in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Equal () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = if x = y then 1 else 0 in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Less () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = if x < y then 1 else 0 in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Greater () ->
    let y = get(stack, sp-1) in
    let x = get(stack, sp-2) in
    let res = if x > y then 1 else 0 in
    let _ = set(stack, sp-2, res) in
    step (pc+1, sp-1, res)

  | Push () ->
          (* empiler r dans stack *)
        let _ = set(stack, sp, r) in
        step ((pc + 1), (sp + 1), r)

  | Cons () ->
          (* dépiler deux éléments et cons trivial *)
          let y = get(stack, sp - 1) in
          let x = get(stack, sp - 2) in
          let _ = set(stack, sp - 2, x * 16 + y) in
        step ((pc + 1), (sp - 1), r)

 | Car () ->
          (* tête du pair codé en x*16+y *)
          let v = get(stack, sp-1) in
          let x = v / 16 in
          step (pc+1, sp, x)

  | Cdr () ->
          let v = get(stack, sp-1) in
          let y = v mod 16 in
          step (pc+1, sp, y)

  | Branch (t, f) ->
          if r <> 0 then step (t, sp, r) else step (f, sp, r)

  | Cur n ->
          step (pc+1, sp, n)

  | Swap () ->
          (* échange les deux éléments du haut de pile *)
          let a = get(stack, sp-1) in
          let b = get(stack, sp-2) in
          let _ = set(stack, sp-1, b) in
          let _ = set(stack, sp-2, a) in
          step (pc+1, sp, r)

  | App () ->
    (* on suppose : stack.(sp-2) = closure_code_ptr, stack.(sp-1) = argument *)

    let arg = get(stack, sp-1) in
    let code_ptr = get(stack, sp-2) in
    (* on peut remettre env en sp-2, etc. puis sauter à code_ptr *)
    step (code_ptr, sp-2, arg)

  | Nop () ->
      step ((pc + 1),sp,r)

   | _ ->
     step ((pc + 1) ,sp ,r)

    in 
    step (0, 0, 0)

;;


let main (bouton : bool) =
  let cy = counter () in
  let (v, rdy) = exec
    (* initialisation du bytecode *)
    load_code ();

    print_string "début\n";
    run_interp ();
    print_string "fin\n";
    42                (* valeur renvoyee quand c"est fini *)
  default 0 in
  (* sortie réactive : par exemple on allume la LED tant que ce n’est pas fini *)
  not rdy
;;
