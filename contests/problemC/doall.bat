rem   *** validation ***
call scripts\run-validator-tests.bat
call scripts\run-checker-tests.bat

rem    *** subtask3 ***
md subtask3
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 26" "subtask3\01" 1
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 27" "subtask3\02" 2
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 28" "subtask3\03" 3
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 29" "subtask3\04" 4
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 30" "subtask3\05" 5
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 31" "subtask3\06" 6
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 32" "subtask3\07" 7
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 33" "subtask3\08" 8
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 34" "subtask3\09" 9
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 35" "subtask3\10" 10
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 36" "subtask3\11" 11
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 37" "subtask3\12" 12
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 38" "subtask3\13" 13
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 39" "subtask3\14" 14
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 40" "subtask3\15" 15
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 41" "subtask3\16" 16
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 42" "subtask3\17" 17
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 43" "subtask3\18" 18
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 44" "subtask3\19" 19
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --seed 45" "subtask3\20" 20
call scripts\gen-answer.bat subtask3\01 subtask3\01.a "subtask3" ""
call scripts\gen-answer.bat subtask3\02 subtask3\02.a "subtask3" ""
call scripts\gen-answer.bat subtask3\03 subtask3\03.a "subtask3" ""
call scripts\gen-answer.bat subtask3\04 subtask3\04.a "subtask3" ""
call scripts\gen-answer.bat subtask3\05 subtask3\05.a "subtask3" ""
call scripts\gen-answer.bat subtask3\06 subtask3\06.a "subtask3" ""
call scripts\gen-answer.bat subtask3\07 subtask3\07.a "subtask3" ""
call scripts\gen-answer.bat subtask3\08 subtask3\08.a "subtask3" ""
call scripts\gen-answer.bat subtask3\09 subtask3\09.a "subtask3" ""
call scripts\gen-answer.bat subtask3\10 subtask3\10.a "subtask3" ""
call scripts\gen-answer.bat subtask3\11 subtask3\11.a "subtask3" ""
call scripts\gen-answer.bat subtask3\12 subtask3\12.a "subtask3" ""
call scripts\gen-answer.bat subtask3\13 subtask3\13.a "subtask3" ""
call scripts\gen-answer.bat subtask3\14 subtask3\14.a "subtask3" ""
call scripts\gen-answer.bat subtask3\15 subtask3\15.a "subtask3" ""
call scripts\gen-answer.bat subtask3\16 subtask3\16.a "subtask3" ""
call scripts\gen-answer.bat subtask3\17 subtask3\17.a "subtask3" ""
call scripts\gen-answer.bat subtask3\18 subtask3\18.a "subtask3" ""
call scripts\gen-answer.bat subtask3\19 subtask3\19.a "subtask3" ""
call scripts\gen-answer.bat subtask3\20 subtask3\20.a "subtask3" ""

rem    *** subtask1 ***
md subtask1
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 1" "subtask1\01" 1
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 2" "subtask1\02" 2
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 3" "subtask1\03" 3
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 4" "subtask1\04" 4
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 5" "subtask1\05" 5
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 6" "subtask1\06" 6
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 7" "subtask1\07" 7
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 8" "subtask1\08" 8
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 9" "subtask1\09" 9
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --seed 10" "subtask1\10" 10
call scripts\gen-answer.bat subtask1\01 subtask1\01.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\02 subtask1\02.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\03 subtask1\03.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\04 subtask1\04.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\05 subtask1\05.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\06 subtask1\06.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\07 subtask1\07.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\08 subtask1\08.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\09 subtask1\09.a "subtask1" "subtask1"
call scripts\gen-answer.bat subtask1\10 subtask1\10.a "subtask1" "subtask1"

rem    *** subtask2 ***
md subtask2
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 11" "subtask2\01" 1
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 12" "subtask2\02" 2
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 13" "subtask2\03" 3
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 14" "subtask2\04" 4
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 15" "subtask2\05" 5
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 16" "subtask2\06" 6
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 17" "subtask2\07" 7
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 18" "subtask2\08" 8
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 19" "subtask2\09" 9
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 20" "subtask2\10" 10
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 21" "subtask2\11" 11
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 22" "subtask2\12" 12
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 23" "subtask2\13" 13
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 24" "subtask2\14" 14
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --seed 25" "subtask2\15" 15
call scripts\gen-answer.bat subtask2\01 subtask2\01.a "subtask2" ""
call scripts\gen-answer.bat subtask2\02 subtask2\02.a "subtask2" ""
call scripts\gen-answer.bat subtask2\03 subtask2\03.a "subtask2" ""
call scripts\gen-answer.bat subtask2\04 subtask2\04.a "subtask2" ""
call scripts\gen-answer.bat subtask2\05 subtask2\05.a "subtask2" ""
call scripts\gen-answer.bat subtask2\06 subtask2\06.a "subtask2" ""
call scripts\gen-answer.bat subtask2\07 subtask2\07.a "subtask2" ""
call scripts\gen-answer.bat subtask2\08 subtask2\08.a "subtask2" ""
call scripts\gen-answer.bat subtask2\09 subtask2\09.a "subtask2" ""
call scripts\gen-answer.bat subtask2\10 subtask2\10.a "subtask2" ""
call scripts\gen-answer.bat subtask2\11 subtask2\11.a "subtask2" ""
call scripts\gen-answer.bat subtask2\12 subtask2\12.a "subtask2" ""
call scripts\gen-answer.bat subtask2\13 subtask2\13.a "subtask2" ""
call scripts\gen-answer.bat subtask2\14 subtask2\14.a "subtask2" ""
call scripts\gen-answer.bat subtask2\15 subtask2\15.a "subtask2" ""

rem    *** tests ***
md tests
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 1" "tests\02" 2
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 2" "tests\03" 3
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 3" "tests\04" 4
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 4" "tests\05" 5
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 5" "tests\06" 6
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 6" "tests\07" 7
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 7" "tests\08" 8
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 8" "tests\09" 9
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 9" "tests\10" 10
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 1 --randomize-n --seed 10" "tests\11" 11
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 11" "tests\12" 12
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 12" "tests\13" 13
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 13" "tests\14" 14
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 14" "tests\15" 15
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 15" "tests\16" 16
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 16" "tests\17" 17
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 17" "tests\18" 18
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 18" "tests\19" 19
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 19" "tests\20" 20
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 20" "tests\21" 21
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 21" "tests\22" 22
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 22" "tests\23" 23
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 23" "tests\24" 24
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 24" "tests\25" 25
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 2 --randomize-n --seed 25" "tests\26" 26
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 26" "tests\27" 27
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 27" "tests\28" 28
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 28" "tests\29" 29
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 29" "tests\30" 30
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 30" "tests\31" 31
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 31" "tests\32" 32
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 32" "tests\33" 33
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 33" "tests\34" 34
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 34" "tests\35" 35
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 35" "tests\36" 36
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 36" "tests\37" 37
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 37" "tests\38" 38
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 38" "tests\39" 39
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 39" "tests\40" 40
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 40" "tests\41" 41
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 41" "tests\42" 42
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 42" "tests\43" 43
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 43" "tests\44" 44
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 44" "tests\45" 45
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 45" "tests\46" 46
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 46" "tests\47" 47
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 47" "tests\48" 48
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 48" "tests\49" 49
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 49" "tests\50" 50
call scripts\gen-input-via-stdout.bat "files\gen.exe --subtask 3 --randomize-n --seed 50" "tests\51" 51
call scripts\gen-answer.bat tests\01 tests\01.a "tests" ""
call scripts\gen-answer.bat tests\02 tests\02.a "tests" ""
call scripts\gen-answer.bat tests\03 tests\03.a "tests" ""
call scripts\gen-answer.bat tests\04 tests\04.a "tests" ""
call scripts\gen-answer.bat tests\05 tests\05.a "tests" ""
call scripts\gen-answer.bat tests\06 tests\06.a "tests" ""
call scripts\gen-answer.bat tests\07 tests\07.a "tests" ""
call scripts\gen-answer.bat tests\08 tests\08.a "tests" ""
call scripts\gen-answer.bat tests\09 tests\09.a "tests" ""
call scripts\gen-answer.bat tests\10 tests\10.a "tests" ""
call scripts\gen-answer.bat tests\11 tests\11.a "tests" ""
call scripts\gen-answer.bat tests\12 tests\12.a "tests" ""
call scripts\gen-answer.bat tests\13 tests\13.a "tests" ""
call scripts\gen-answer.bat tests\14 tests\14.a "tests" ""
call scripts\gen-answer.bat tests\15 tests\15.a "tests" ""
call scripts\gen-answer.bat tests\16 tests\16.a "tests" ""
call scripts\gen-answer.bat tests\17 tests\17.a "tests" ""
call scripts\gen-answer.bat tests\18 tests\18.a "tests" ""
call scripts\gen-answer.bat tests\19 tests\19.a "tests" ""
call scripts\gen-answer.bat tests\20 tests\20.a "tests" ""
call scripts\gen-answer.bat tests\21 tests\21.a "tests" ""
call scripts\gen-answer.bat tests\22 tests\22.a "tests" ""
call scripts\gen-answer.bat tests\23 tests\23.a "tests" ""
call scripts\gen-answer.bat tests\24 tests\24.a "tests" ""
call scripts\gen-answer.bat tests\25 tests\25.a "tests" ""
call scripts\gen-answer.bat tests\26 tests\26.a "tests" ""
call scripts\gen-answer.bat tests\27 tests\27.a "tests" ""
call scripts\gen-answer.bat tests\28 tests\28.a "tests" ""
call scripts\gen-answer.bat tests\29 tests\29.a "tests" ""
call scripts\gen-answer.bat tests\30 tests\30.a "tests" ""
call scripts\gen-answer.bat tests\31 tests\31.a "tests" ""
call scripts\gen-answer.bat tests\32 tests\32.a "tests" ""
call scripts\gen-answer.bat tests\33 tests\33.a "tests" ""
call scripts\gen-answer.bat tests\34 tests\34.a "tests" ""
call scripts\gen-answer.bat tests\35 tests\35.a "tests" ""
call scripts\gen-answer.bat tests\36 tests\36.a "tests" ""
call scripts\gen-answer.bat tests\37 tests\37.a "tests" ""
call scripts\gen-answer.bat tests\38 tests\38.a "tests" ""
call scripts\gen-answer.bat tests\39 tests\39.a "tests" ""
call scripts\gen-answer.bat tests\40 tests\40.a "tests" ""
call scripts\gen-answer.bat tests\41 tests\41.a "tests" ""
call scripts\gen-answer.bat tests\42 tests\42.a "tests" ""
call scripts\gen-answer.bat tests\43 tests\43.a "tests" ""
call scripts\gen-answer.bat tests\44 tests\44.a "tests" ""
call scripts\gen-answer.bat tests\45 tests\45.a "tests" ""
call scripts\gen-answer.bat tests\46 tests\46.a "tests" ""
call scripts\gen-answer.bat tests\47 tests\47.a "tests" ""
call scripts\gen-answer.bat tests\48 tests\48.a "tests" ""
call scripts\gen-answer.bat tests\49 tests\49.a "tests" ""
call scripts\gen-answer.bat tests\50 tests\50.a "tests" ""
call scripts\gen-answer.bat tests\51 tests\51.a "tests" ""

