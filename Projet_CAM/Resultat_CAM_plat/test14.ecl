let code = create<16>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Cur 6);
  set(code,2,Swap ());
  set(code,3,Quote_int 0);
  set(code,4,Cons ());
  set(code,5,App ());
  set(code,6,Push ());
  set(code,7,Push ());
  set(code,8,Cdr ());
  set(code,9,Swap ());
  set(code,10,Quote_int 0);
  set(code,11,Cons ());
  set(code,12,Equal ());
  set(code,13,Branch(14,15));
  set(code,14,Quote_int 42);
  set(code,15,Cdr ());;
