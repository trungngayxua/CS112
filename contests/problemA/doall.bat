rem   *** validation ***
call scripts\run-validator-tests.bat
call scripts\run-checker-tests.bat

rem    *** tests ***
md tests
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1003" "tests\02" 2
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1004" "tests\03" 3
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1005" "tests\04" 4
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1006" "tests\05" 5
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1007" "tests\06" 6
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1008" "tests\07" 7
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1009" "tests\08" 8
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1010" "tests\09" 9
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1011" "tests\10" 10
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1012" "tests\11" 11
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1013" "tests\12" 12
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 1 1014" "tests\13" 13
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2001" "tests\14" 14
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2002" "tests\15" 15
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2003" "tests\16" 16
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2004" "tests\17" 17
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2005" "tests\18" 18
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2006" "tests\19" 19
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2007" "tests\20" 20
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2008" "tests\21" 21
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2009" "tests\22" 22
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2010" "tests\23" 23
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2011" "tests\24" 24
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2012" "tests\25" 25
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 2 2013" "tests\26" 26
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3001" "tests\27" 27
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3002" "tests\28" 28
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3003" "tests\29" 29
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3004" "tests\30" 30
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3005" "tests\31" 31
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3006" "tests\32" 32
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3007" "tests\33" 33
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3008" "tests\34" 34
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3009" "tests\35" 35
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3010" "tests\36" 36
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3011" "tests\37" 37
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 3 3012" "tests\38" 38
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4001" "tests\39" 39
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4002" "tests\40" 40
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4003" "tests\41" 41
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4004" "tests\42" 42
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4005" "tests\43" 43
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4006" "tests\44" 44
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4007" "tests\45" 45
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4008" "tests\46" 46
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4009" "tests\47" 47
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4010" "tests\48" 48
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4011" "tests\49" 49
call scripts\gen-input-via-stdout.bat "files\gen_sub1.exe 4 4012" "tests\50" 50
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5001" "tests\51" 51
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5002" "tests\52" 52
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5003" "tests\53" 53
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5004" "tests\54" 54
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5005" "tests\55" 55
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5006" "tests\56" 56
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5007" "tests\57" 57
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5008" "tests\58" 58
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5009" "tests\59" 59
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5010" "tests\60" 60
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5011" "tests\61" 61
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5012" "tests\62" 62
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 1 5013" "tests\63" 63
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6001" "tests\64" 64
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6002" "tests\65" 65
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6003" "tests\66" 66
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6004" "tests\67" 67
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6005" "tests\68" 68
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6006" "tests\69" 69
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6007" "tests\70" 70
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6008" "tests\71" 71
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6009" "tests\72" 72
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6010" "tests\73" 73
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6011" "tests\74" 74
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6012" "tests\75" 75
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 2 6013" "tests\76" 76
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7001" "tests\77" 77
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7002" "tests\78" 78
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7003" "tests\79" 79
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7004" "tests\80" 80
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7005" "tests\81" 81
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7006" "tests\82" 82
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7007" "tests\83" 83
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7008" "tests\84" 84
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7009" "tests\85" 85
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7010" "tests\86" 86
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7011" "tests\87" 87
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 3 7012" "tests\88" 88
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8001" "tests\89" 89
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8002" "tests\90" 90
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8003" "tests\91" 91
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8004" "tests\92" 92
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8005" "tests\93" 93
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8006" "tests\94" 94
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8007" "tests\95" 95
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8008" "tests\96" 96
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8009" "tests\97" 97
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8010" "tests\98" 98
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8011" "tests\99" 99
call scripts\gen-input-via-stdout.bat "files\gen_sub2.exe 4 8012" "tests\100" 100
call scripts\gen-answer.bat tests\01 tests\01.a "tests" "1"
call scripts\gen-answer.bat tests\02 tests\02.a "tests" "1"
call scripts\gen-answer.bat tests\03 tests\03.a "tests" "1"
call scripts\gen-answer.bat tests\04 tests\04.a "tests" "1"
call scripts\gen-answer.bat tests\05 tests\05.a "tests" "1"
call scripts\gen-answer.bat tests\06 tests\06.a "tests" "1"
call scripts\gen-answer.bat tests\07 tests\07.a "tests" "1"
call scripts\gen-answer.bat tests\08 tests\08.a "tests" "1"
call scripts\gen-answer.bat tests\09 tests\09.a "tests" "1"
call scripts\gen-answer.bat tests\10 tests\10.a "tests" "1"
call scripts\gen-answer.bat tests\11 tests\11.a "tests" "1"
call scripts\gen-answer.bat tests\12 tests\12.a "tests" "1"
call scripts\gen-answer.bat tests\13 tests\13.a "tests" "1"
call scripts\gen-answer.bat tests\14 tests\14.a "tests" "1"
call scripts\gen-answer.bat tests\15 tests\15.a "tests" "1"
call scripts\gen-answer.bat tests\16 tests\16.a "tests" "1"
call scripts\gen-answer.bat tests\17 tests\17.a "tests" "1"
call scripts\gen-answer.bat tests\18 tests\18.a "tests" "1"
call scripts\gen-answer.bat tests\19 tests\19.a "tests" "1"
call scripts\gen-answer.bat tests\20 tests\20.a "tests" "1"
call scripts\gen-answer.bat tests\21 tests\21.a "tests" "1"
call scripts\gen-answer.bat tests\22 tests\22.a "tests" "1"
call scripts\gen-answer.bat tests\23 tests\23.a "tests" "1"
call scripts\gen-answer.bat tests\24 tests\24.a "tests" "1"
call scripts\gen-answer.bat tests\25 tests\25.a "tests" "1"
call scripts\gen-answer.bat tests\26 tests\26.a "tests" "1"
call scripts\gen-answer.bat tests\27 tests\27.a "tests" "1"
call scripts\gen-answer.bat tests\28 tests\28.a "tests" "1"
call scripts\gen-answer.bat tests\29 tests\29.a "tests" "1"
call scripts\gen-answer.bat tests\30 tests\30.a "tests" "1"
call scripts\gen-answer.bat tests\31 tests\31.a "tests" "1"
call scripts\gen-answer.bat tests\32 tests\32.a "tests" "1"
call scripts\gen-answer.bat tests\33 tests\33.a "tests" "1"
call scripts\gen-answer.bat tests\34 tests\34.a "tests" "1"
call scripts\gen-answer.bat tests\35 tests\35.a "tests" "1"
call scripts\gen-answer.bat tests\36 tests\36.a "tests" "1"
call scripts\gen-answer.bat tests\37 tests\37.a "tests" "1"
call scripts\gen-answer.bat tests\38 tests\38.a "tests" "1"
call scripts\gen-answer.bat tests\39 tests\39.a "tests" "1"
call scripts\gen-answer.bat tests\40 tests\40.a "tests" "1"
call scripts\gen-answer.bat tests\41 tests\41.a "tests" "1"
call scripts\gen-answer.bat tests\42 tests\42.a "tests" "1"
call scripts\gen-answer.bat tests\43 tests\43.a "tests" "1"
call scripts\gen-answer.bat tests\44 tests\44.a "tests" "1"
call scripts\gen-answer.bat tests\45 tests\45.a "tests" "1"
call scripts\gen-answer.bat tests\46 tests\46.a "tests" "1"
call scripts\gen-answer.bat tests\47 tests\47.a "tests" "1"
call scripts\gen-answer.bat tests\48 tests\48.a "tests" "1"
call scripts\gen-answer.bat tests\49 tests\49.a "tests" "1"
call scripts\gen-answer.bat tests\50 tests\50.a "tests" "1"
call scripts\gen-answer.bat tests\51 tests\51.a "tests" "2"
call scripts\gen-answer.bat tests\52 tests\52.a "tests" "2"
call scripts\gen-answer.bat tests\53 tests\53.a "tests" "2"
call scripts\gen-answer.bat tests\54 tests\54.a "tests" "2"
call scripts\gen-answer.bat tests\55 tests\55.a "tests" "2"
call scripts\gen-answer.bat tests\56 tests\56.a "tests" "2"
call scripts\gen-answer.bat tests\57 tests\57.a "tests" "2"
call scripts\gen-answer.bat tests\58 tests\58.a "tests" "2"
call scripts\gen-answer.bat tests\59 tests\59.a "tests" "2"
call scripts\gen-answer.bat tests\60 tests\60.a "tests" "2"
call scripts\gen-answer.bat tests\61 tests\61.a "tests" "2"
call scripts\gen-answer.bat tests\62 tests\62.a "tests" "2"
call scripts\gen-answer.bat tests\63 tests\63.a "tests" "2"
call scripts\gen-answer.bat tests\64 tests\64.a "tests" "2"
call scripts\gen-answer.bat tests\65 tests\65.a "tests" "2"
call scripts\gen-answer.bat tests\66 tests\66.a "tests" "2"
call scripts\gen-answer.bat tests\67 tests\67.a "tests" "2"
call scripts\gen-answer.bat tests\68 tests\68.a "tests" "2"
call scripts\gen-answer.bat tests\69 tests\69.a "tests" "2"
call scripts\gen-answer.bat tests\70 tests\70.a "tests" "2"
call scripts\gen-answer.bat tests\71 tests\71.a "tests" "2"
call scripts\gen-answer.bat tests\72 tests\72.a "tests" "2"
call scripts\gen-answer.bat tests\73 tests\73.a "tests" "2"
call scripts\gen-answer.bat tests\74 tests\74.a "tests" "2"
call scripts\gen-answer.bat tests\75 tests\75.a "tests" "2"
call scripts\gen-answer.bat tests\76 tests\76.a "tests" "2"
call scripts\gen-answer.bat tests\77 tests\77.a "tests" "2"
call scripts\gen-answer.bat tests\78 tests\78.a "tests" "2"
call scripts\gen-answer.bat tests\79 tests\79.a "tests" "2"
call scripts\gen-answer.bat tests\80 tests\80.a "tests" "2"
call scripts\gen-answer.bat tests\81 tests\81.a "tests" "2"
call scripts\gen-answer.bat tests\82 tests\82.a "tests" "2"
call scripts\gen-answer.bat tests\83 tests\83.a "tests" "2"
call scripts\gen-answer.bat tests\84 tests\84.a "tests" "2"
call scripts\gen-answer.bat tests\85 tests\85.a "tests" "2"
call scripts\gen-answer.bat tests\86 tests\86.a "tests" "2"
call scripts\gen-answer.bat tests\87 tests\87.a "tests" "2"
call scripts\gen-answer.bat tests\88 tests\88.a "tests" "2"
call scripts\gen-answer.bat tests\89 tests\89.a "tests" "2"
call scripts\gen-answer.bat tests\90 tests\90.a "tests" "2"
call scripts\gen-answer.bat tests\91 tests\91.a "tests" "2"
call scripts\gen-answer.bat tests\92 tests\92.a "tests" "2"
call scripts\gen-answer.bat tests\93 tests\93.a "tests" "2"
call scripts\gen-answer.bat tests\94 tests\94.a "tests" "2"
call scripts\gen-answer.bat tests\95 tests\95.a "tests" "2"
call scripts\gen-answer.bat tests\96 tests\96.a "tests" "2"
call scripts\gen-answer.bat tests\97 tests\97.a "tests" "2"
call scripts\gen-answer.bat tests\98 tests\98.a "tests" "2"
call scripts\gen-answer.bat tests\99 tests\99.a "tests" "2"
call scripts\gen-answer.bat tests\100 tests\100.a "tests" "2"

