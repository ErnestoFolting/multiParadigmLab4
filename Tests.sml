use "Lab4.sml";
(*1*)
val test1 = only_capitals(["Check2","check1","check3"]); (*["Check2"]*)
val test2 = only_capitals(["check2","check1","check3"]); (*[]*)

(*2*)
val test3 = longest_string1(["check123","check124","check3"]); (*"check123"*)
val test4 = longest_string1([]); (*""*)

(*3*)
val test5 = longest_string2(["check123","check124","check3"]); (*"check124"*)

(*4*)
val test6 = (longest_string3(["check123","check124","check3"])); (*"check123"*)
val test7 = (longest_string3([])); (*""*)
val test8 = (longest_string4(["check123","check124","check3"])); (*"check124"*)
val test9 = (longest_string4([])); (*""*)

(*5*)
val test10 =  longest_capitalized(["Check123","Check124","check3"]); (*"Check123"*)
val test11 =  longest_capitalized([]); (*""*)

(*6*)
val test12 = rev_string("check1"); (*"1kcehc"*)
val test13 = rev_string("");

(*7*)
val test14 = first_answer (fn el => if Char.isUpper(String.sub(el,0))then SOME el else NONE)["Check123","Check124","check3"]; (*"Check123"*)

(*8*)
val test15 = all_answers(fn el => if Char.isUpper(String.sub(el,0))then SOME [el] else NONE)["Check123","Check124","Check3"]; (*SOME ["Check123","Check124","Check3"]*)
val test16 = all_answers(fn el => if Char.isUpper(String.sub(el,0))then SOME [el] else NONE)["Check123","сheck124","Check3"]; (*NONE*)


(*9*)
val test17 = count_wildcards(TupleP[Wildcard,Wildcard]); (*2*)
val test18 = count_wildcards(TupleP[Wildcard,Wildcard, TupleP[Wildcard,Wildcard,Wildcard]]); (*5*)
val test19 = count_wild_and_variable_lengths(TupleP[Wildcard,Wildcard,Variable "check"]); (*7*)
val test20 = count_wild_and_variable_lengths(Variable ""); (*0*)
val test21 = count_some_var("check",TupleP[Wildcard,Wildcard,Variable "check",Variable "check2",Variable "check"]); (*2*)
val test22 = count_some_var("check3",TupleP[Wildcard,Wildcard,Variable "check",Variable "check2",Variable "check"]); (*0*)

(*10*)
val test23 = check_pat(TupleP [Variable "check", Wildcard]); (*true*)
val test24 = check_pat(TupleP [Variable "check", Wildcard, TupleP[Variable "check"]]); (*false*)
val test25 = check_pat(TupleP [Wildcard,Wildcard, TupleP[Wildcard,Wildcard,Wildcard]]); (*true*)