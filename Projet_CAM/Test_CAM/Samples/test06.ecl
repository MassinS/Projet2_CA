let code = create<13>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Quote_int 3);
  set(code,5,Cons ());
  set(code,6,Push ());
  set(code,7,Car ());
  set(code,8,Cdr ());
  set(code,9,Swap ());
  set(code,10,Cdr ());
  set(code,11,Cons ());
  set(code,12,Add ());;
