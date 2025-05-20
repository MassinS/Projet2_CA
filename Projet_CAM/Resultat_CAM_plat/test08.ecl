let code = create<9>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Push ());
  set(code,2,Quote_int 1);
  set(code,3,Swap ());
  set(code,4,Quote_int 2);
  set(code,5,Cons ());
  set(code,6,Cons ());
  set(code,7,Cdr ());
  set(code,8,Cdr ());;
