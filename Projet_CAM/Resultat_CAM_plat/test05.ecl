let code = create<28>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_int 2);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Quote_int 3);
  set(code,5,Cons ());
  set(code,6,Push ());
  set(code,7,Quote_int 4);
  set(code,8,Cons ());
  set(code,9,Push ());
  set(code,10,Car ());
  set(code,11,Car ());
  set(code,12,Cdr ());
  set(code,13,Swap ());
  set(code,14,Push ());
  set(code,15,Car ());
  set(code,16,Cdr ());
  set(code,17,Swap ());
  set(code,18,Push ());
  set(code,19,Cdr ());
  set(code,20,Swap ());
  set(code,21,Quote_int 1);
  set(code,22,Cons ());
  set(code,23,Sub ());
  set(code,24,Cons ());
  set(code,25,Mul ());
  set(code,26,Cons ());
  set(code,27,Add ());;
