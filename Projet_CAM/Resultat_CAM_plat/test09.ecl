let code = create<20>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Cur 13);
  set(code,2,Cons ());
  set(code,3,Push ());
  set(code,4,Cdr ());
  set(code,5,Swap ());
  set(code,6,Push ());
  set(code,7,Quote_int 5);
  set(code,8,Swap ());
  set(code,9,Quote_int 9);
  set(code,10,Cons ());
  set(code,11,Cons ());
  set(code,12,App ());
  set(code,13,Push ());
  set(code,14,Cdr ());
  set(code,15,Cdr ());
  set(code,16,Swap ());
  set(code,17,Cdr ());
  set(code,18,Car ());
  set(code,19,Cons ());;
