let code = create<6>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 5);
  set(code,2,Swap ());
  set(code,3,Quote_int 2);
  set(code,4,Cons ());
  set(code,5,Add ());;
