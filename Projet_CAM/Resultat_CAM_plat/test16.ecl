let code = create<22>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Cur 14);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Push ());
  set(code,5,Cdr ());
  set(code,6,Swap ());
  set(code,7,Quote_int 10);
  set(code,8,Cons ());
  set(code,9,App ());
  set(code,10,Swap ());
  set(code,11,Quote_int 3);
  set(code,12,Cons ());
  set(code,13,App ());
  set(code,14,Cur 15);
  set(code,15,Push ());
  set(code,16,Car ());
  set(code,17,Cdr ());
  set(code,18,Swap ());
  set(code,19,Cdr ());
  set(code,20,Cons ());
  set(code,21,Sub ());;
