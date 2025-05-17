

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

let stack = create<256>();;

let rec vm (pc, sp ,acc) =
  if pc >= code.length then
    (* condition d’arrêt : on renvoie l’accumulateur final *)
    acc
  else
    match get(code, pc) with
    | Quote_int v ->
         set(stack, sp, v);
         vm ((pc + 1), (sp + 1), v)
     | Quote_bool b ->
          (* true -> 1, false -> 0 *)
          vm (pc+1, sp, if b then 1 else 0)
    | Push () ->
        set(stack, sp, acc);
         vm ((pc + 1), (sp + 1), acc)

    | Add ()  ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = x2 + x1 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)
    | Sub ()  ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = x2 - x1 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)
    | Mul ()  ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = x2 * x1 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)
    | Div ()  ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = x2 / x1 in
        set(stack, sp - 2, r);
        vm ((pc + 1), (sp - 1), r)
    | Equal () ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = if x2 = x1 then 1 else 0 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)
    | Less () ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = if x2 < x1 then 1 else 0 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)
    | Greater () ->
        let x1 = get(stack, sp - 1) in
        let x2 = get(stack, sp - 2) in
        let r  = if x2 > x1 then 1 else 0 in
        set(stack, sp - 2, r);
         vm ((pc + 1), (sp - 1), r)

     | Cons () ->
    (* on a sp >= 2 forcément *)
    let v = get(stack, sp-1) in
    let u = get(stack, sp-2) in
    (* on réécrit la même zone : deux cases for the pair *)
    set(stack, sp-2, u);
    set(stack, sp-1, v);
    (* sp reste identique *)
    vm (pc+1, sp, acc)

    | Swap () ->
          (* échange les deux éléments du haut de pile *)
          let a = get(stack, sp-1) in
          let b = get(stack, sp-2) in
          let _ = set(stack, sp-1, b) in
          let _ = set(stack, sp-2, a) in
          vm (pc+1, sp, acc)

    | Car () ->
    (* tête = entrée-2 *)
    let u = get(stack, sp-2) in
    vm (pc+1, sp, u)

    | Cdr () ->
    (* queue = entrée-1 *)
    let v = get(stack, sp-1) in
    vm (pc+1, sp, v)
    
    | Cur n ->
          vm (pc+1, sp, n)
    
    | App () ->
    (* on suppose : stack.(sp-2) = closure_code_ptr, stack.(sp-1) = argument *)

    let arg = get(stack, sp-1) in
    let code_ptr = get(stack, sp-2) in
    (* on peut remettre env en sp-2, etc. puis sauter à code_ptr *)
    vm (code_ptr, sp-2, arg)
    | _ ->
       vm ((pc + 1), sp , acc)

;;

let counter () = reg (fun c -> c + 1) init 0 ;;

let main (bouton : bool) =
  let cy = counter () in
  let (v, rdy) = exec
    (* initialisation du bytecode *)
    load_code ();

    print_string "debut \n";
    let acc_final = vm( 0, 0, 0) in

    print_string "Résultat = "; print_int (acc_final-1); print_newline ();


    print_string "fin \n";
    42                (* valeur renvoyee quand c"est fini *)
  default 0 in
  (* sortie réactive : par exemple on allume la LED tant que ce n’est pas fini *)
  not rdy
;;
