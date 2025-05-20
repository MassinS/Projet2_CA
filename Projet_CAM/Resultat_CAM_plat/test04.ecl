let code = create<24>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Cdr ());
  set(code,5,Swap ());
  set(code,6,Push ());
  set(code,7,Push ());
  set(code,8,Quote_int 2);
  set(code,9,Swap ());
  set(code,10,Quote_int 2);
  set(code,11,Cons ());
  set(code,12,Div ());
  set(code,13,Swap ());
  set(code,14,Push ());
  set(code,15,Quote_int 1);
  set(code,16,Swap ());
  set(code,17,Quote_int 4);
  set(code,18,Cons ());
  set(code,19,Sub ());
  set(code,20,Cons ());
  set(code,21,Mul ());
  set(code,22,Cons ());
  set(code,23,Add ());;
