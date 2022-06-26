(*1*)
fun only_capitals(lst: string list)=
List.filter(fn str => Char.isUpper(String.sub(str,0))) lst;

val test1 = only_capitals(["Check2","check1","check3"])

(*2*)
fun longest_string1(lst: string list) = 
List.foldl(fn(str1,str2)=>if(String.size(str1)> String.size(str2))then str1 else str2) "" lst;

val test2 = longest_string1(["check123","check124","check3"])
