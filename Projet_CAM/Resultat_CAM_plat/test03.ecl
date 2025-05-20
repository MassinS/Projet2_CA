let code = create<4>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Cdr ());;
