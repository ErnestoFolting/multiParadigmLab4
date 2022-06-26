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