(*1*)
fun only_capitals(lst: string list)=
List.filter(fn str => Char.isUpper(String.sub(str,0))) lst;

val test1 = only_capitals(["Check2","check1","check3"])

(*2*)
fun longest_string1(lst: string list) = 
List.foldl(fn(str1,str2)=>if(String.size(str1)> String.size(str2))then str1 else str2) "" lst;

val test2 = longest_string1(["check123","check124","check3"])

(*3*)
fun longest_string2(lst: string list) = 
List.foldl(fn(str1,str2)=>if(String.size(str1)>= String.size(str2))then str1 else str2) "" lst;

val test3 = longest_string2(["check123","check124","check3"])

(*4*)
fun longest_string_helper f = 
List.foldl (fn(str1,str2) => if f(String.size(str1),String.size(str2)) then str1 else str2) "";

val longest_string3 = longest_string_helper(fn(str1,str2)=>if(str1>str2) then true else false);
val longest_string4 = longest_string_helper(fn(str1,str2)=>if(str1>=str2) then true else false);

val test4a = (longest_string3(["check123","check124","check3"]));
val test4b = (longest_string4(["check123","check124","check3"]));

(*5*)
val longest_capitalized = longest_string1 o only_capitals;

val test5 =  longest_capitalized(["Check123","Check124","check3"]);

(*6*)
val rev_string = String.implode o rev o String.explode;

val test6 = rev_string("check1")

(*7*)
exception NoAnswer;
fun first_answer f lst = 
case lst of
    [] => raise NoAnswer
    |hd::tl => case f(hd) of
        NONE => first_answer f tl 
        |SOME x => x

val test7 = first_answer (fn el => if Char.isUpper(String.sub(el,0))then SOME el else NONE)["Check123","Check124","check3"]

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

val test8 = all_answers(fn el => if Char.isUpper(String.sub(el,0))then SOME [el] else NONE)["Check123","Check124","Check3"]
