let file = "/usr/share/dict/words"
type mutable_ans = {mutable ans: string};;
let a = {ans = ""};;
             
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) [];;

let implode l =
  let res = Bytes.create (List.length l) in
  let rec imp i = function
    | [] -> res
    | c :: l -> Bytes.set res i c; imp (i + 1) l in
  imp 0 l;;
  
let rec partition n a b = function
  [] -> (a, b)
| x::xs -> if x < n then partition n (x::a) b xs
              else partition n a (x::b) xs

let rec qs = function
  [] -> []
| x::xs ->
    let (m, n) = partition x [] [] xs in
    qs m @ (x :: qs n)

        
let solve dic_list str_list =
  let str = implode str_list in
  let rec solve_sub n l =
    match l with
      [] -> 0
     |h::r->
       let pos = String.index_from str n h in
       solve_sub (pos+1) r
  in
  try solve_sub 0 dic_list with Not_found -> -1
          
let main =
  let str = String.lowercase_ascii (read_line()) in
  let str_sort = qs (explode str) in
  let ic = open_in file in
  let rec cat_sub() =
    let line = String.lowercase_ascii (input_line ic) in
    let line_sort = qs (explode line) in
    if solve line_sort str_sort == 0 && String.length line > String.length a.ans
    then a.ans <- line ;
    cat_sub()                           
  in
  try cat_sub() with End_of_file -> close_in ic;;
  print_string a.ans;
  print_newline();;
