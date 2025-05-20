let code = create<21>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 5);
  set(code,2,Swap ());
  set(code,3,Push ());
  set(code,4,Quote_int 5);
  set(code,5,Swap ());
  set(code,6,Push ());
  set(code,7,Quote_int 44);
  set(code,8,Swap ());
  set(code,9,Push ());
  set(code,10,Quote_int 2);
  set(code,11,Swap ());
  set(code,12,Quote_int 7);
  set(code,13,Cons ());
  set(code,14,Div ());
  set(code,15,Cons ());
  set(code,16,Sub ());
  set(code,17,Cons ());
  set(code,18,Mul ());
  set(code,19,Cons ());
  set(code,20,Add ());;
