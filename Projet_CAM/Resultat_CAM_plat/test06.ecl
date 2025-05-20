let code = create<18>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 211);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Push ());
  set(code,5,Quote_int 3);
  set(code,6,Swap ());
  set(code,7,Quote_int 4);
  set(code,8,Cons ());
  set(code,9,Cons ());
  set(code,10,Push ());
  set(code,11,Cdr ());
  set(code,12,Car ());
  set(code,13,Swap ());
  set(code,14,Cdr ());
  set(code,15,Cdr ());
  set(code,16,Cons ());
  set(code,17,Add ());;
