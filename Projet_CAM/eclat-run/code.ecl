let code = create<9>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Cdr ());
  set(code,5,Swap ());
  set(code,6,Quote_int 55);
  set(code,7,Cons ());
  set(code,8,Add ());;
