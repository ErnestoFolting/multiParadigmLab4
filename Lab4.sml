(*1*)
fun only_capitals(lst: string list)=
List.filter(fn str => Char.isUpper(String.sub(str,0))) lst;

(*2*)
fun longest_string1(lst: string list) = 
List.foldl(fn(str1,str2)=>if(String.size(str1)> String.size(str2))then str1 else str2) "" lst;

(*3*)
fun longest_string2(lst: string list) = 
List.foldl(fn(str1,str2)=>if(String.size(str1)>= String.size(str2))then str1 else str2) "" lst;

(*4*)
fun longest_string_helper f = 
List.foldl (fn(str1,str2) => if f(String.size(str1),String.size(str2)) then str1 else str2) "";

val longest_string3 = longest_string_helper(fn(str1,str2)=>if(str1>str2) then true else false);
val longest_string4 = longest_string_helper(fn(str1,str2)=>if(str1>=str2) then true else false);

(*5*)
val longest_capitalized = longest_string1 o only_capitals;

(*6*)
val rev_string = String.implode o rev o String.explode;

(*7*)
exception NoAnswer;
fun first_answer f lst = 
case lst of
    [] => raise NoAnswer
    |hd::tl => case f(hd) of
        NONE => first_answer f tl 
        |SOME x => x

(*8*)
fun all_answers f lst=
    let fun internal(acc,lst) = 
        case lst of 
            hd::tl => 
                (case f(hd) of   
                    SOME x => internal (acc @ x, tl) 
                    |NONE => NONE)
            |[] => SOME(acc)
    in 
    internal([],lst) 
    end; 

(*9*)
use "hw03.sml";

(*9a*)
fun count_wildcards(pat:pattern)= 
    g (fn _ => 1) (fn _ => 0) pat;

(*9b*)
fun count_wild_and_variable_lengths(pat:pattern)=
    g (fn _ => 1) (fn x => String.size x) pat;

(*9c*)
fun count_some_var(str : string, pat : pattern)=
    g (fn _ => 0) ( fn x => if x = str then 1 else 0) pat;

(*10*)
fun check_pat(pat: pattern)=
    let 
        fun getStrings(pat: pattern) = 
        case pat of
            Variable x => [x]
            |TupleP tuple=> List.foldl(fn(p,acc)=> getStrings(p) @ acc) [] tuple 
            |ConstructorP(_,p) => getStrings(p)
            | _ => []
        fun checkRep(lst: string list) = 
            case lst of
                [] => true
                |hd::tl => if (List.exists(fn el => el = hd) tl)
                        then false
                        else checkRep(tl)
        in 
            checkRep(getStrings(pat))
        end;
