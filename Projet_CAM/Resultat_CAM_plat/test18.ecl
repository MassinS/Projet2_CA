let code = create<24>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Cur 18);
  set(code,5,Cons ());
  set(code,6,Push ());
  set(code,7,Cdr ());
  set(code,8,Swap ());
  set(code,9,Push ());
  set(code,10,Car ());
  set(code,11,Cdr ());
  set(code,12,Swap ());
  set(code,13,Quote_int 3);
  set(code,14,Cons ());
  set(code,15,Add ());
  set(code,16,Cons ());
  set(code,17,App ());
  set(code,18,Push ());
  set(code,19,Cdr ());
  set(code,20,Swap ());
  set(code,21,Cdr ());
  set(code,22,Cons ());
  set(code,23,Mul ());;
