(*1*)

fun only_capitals(lst: string list)=
List.filter(fn str => Char.isUpper(String.sub(str,0)))