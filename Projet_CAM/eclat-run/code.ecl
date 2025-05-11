let code = create<15>() ;;

let load_code () =

  set(code,0,Push ());;
  set(code,1,Cur 9);;
  set(code,2,Cons ());;
  set(code,3,Push ());;
  set(code,4,Cdr ());;
  set(code,5,Swap ());;
  set(code,6,Quote_int 6);;
  set(code,7,Cons ());;
  set(code,8,App ());;
  set(code,9,Push ());;
  set(code,10,Cdr ());;
  set(code,11,Swap ());;
  set(code,12,Cdr ());;
  set(code,13,Cons ());;
  set(code,14,Nop ());;
