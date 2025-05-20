let code = create<25>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Cur 14);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Push ());
  set(code,5,Cdr ());
  set(code,6,Swap ());
  set(code,7,Quote_int 2);
  set(code,8,Cons ());
  set(code,9,App ());
  set(code,10,Swap ());
  set(code,11,Quote_int 77);
  set(code,12,Cons ());
  set(code,13,App ());
  set(code,14,Push ());
  set(code,15,Cur 18);
  set(code,16,Cons ());
  set(code,17,Cdr ());
  set(code,18,Push ());
  set(code,19,Car ());
  set(code,20,Cdr ());
  set(code,21,Swap ());
  set(code,22,Cdr ());
  set(code,23,Cons ());
  set(code,24,Add ());;
