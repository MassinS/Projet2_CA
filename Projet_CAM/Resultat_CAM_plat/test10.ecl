let code = create<5>() ;;

let load_code () =

  set(code,0,Push ());
  set(code,1,Quote_bool true);
  set(code,2,Branch(3,4));
  set(code,3,Quote_int 100);
  set(code,4,Quote_int 200);;
