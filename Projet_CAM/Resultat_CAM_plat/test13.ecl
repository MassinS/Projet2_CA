let code = create<25>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Cur 17);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Push ());
  set(code,5,Cdr ());
  set(code,6,Swap ());
  set(code,7,Quote_int 1);
  set(code,8,Cons ());
  set(code,9,App ());
  set(code,10,Cons ());
  set(code,11,Push ());
  set(code,12,Cdr ());
  set(code,13,Swap ());
  set(code,14,Quote_int 5);
  set(code,15,Cons ());
  set(code,16,App ());
  set(code,17,Cur 18);
  set(code,18,Push ());
  set(code,19,Car ());
  set(code,20,Cdr ());
  set(code,21,Swap ());
  set(code,22,Cdr ());
  set(code,23,Cons ());
  set(code,24,Add ());;
