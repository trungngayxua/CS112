#!/usr/bin/env bash
#   *** validation ***
scripts/run-validator-tests.sh
scripts/run-checker-tests.sh

#    *** subtask3 ***
mkdir -p subtask3
echo "Generating test #1"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 26" "subtask3/01" 1
echo "Generating test #2"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 27" "subtask3/02" 2
echo "Generating test #3"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 28" "subtask3/03" 3
echo "Generating test #4"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 29" "subtask3/04" 4
echo "Generating test #5"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 30" "subtask3/05" 5
echo "Generating test #6"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 31" "subtask3/06" 6
echo "Generating test #7"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 32" "subtask3/07" 7
echo "Generating test #8"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 33" "subtask3/08" 8
echo "Generating test #9"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 34" "subtask3/09" 9
echo "Generating test #10"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 35" "subtask3/10" 10
echo "Generating test #11"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 36" "subtask3/11" 11
echo "Generating test #12"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 37" "subtask3/12" 12
echo "Generating test #13"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 38" "subtask3/13" 13
echo "Generating test #14"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 39" "subtask3/14" 14
echo "Generating test #15"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 40" "subtask3/15" 15
echo "Generating test #16"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 41" "subtask3/16" 16
echo "Generating test #17"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 42" "subtask3/17" 17
echo "Generating test #18"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 43" "subtask3/18" 18
echo "Generating test #19"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 44" "subtask3/19" 19
echo "Generating test #20"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --seed 45" "subtask3/20" 20
echo ""
echo "Generating answer for test #1"
scripts/gen-answer.sh subtask3/01 subtask3/01.a "subtask3" ""
echo ""
echo "Generating answer for test #2"
scripts/gen-answer.sh subtask3/02 subtask3/02.a "subtask3" ""
echo ""
echo "Generating answer for test #3"
scripts/gen-answer.sh subtask3/03 subtask3/03.a "subtask3" ""
echo ""
echo "Generating answer for test #4"
scripts/gen-answer.sh subtask3/04 subtask3/04.a "subtask3" ""
echo ""
echo "Generating answer for test #5"
scripts/gen-answer.sh subtask3/05 subtask3/05.a "subtask3" ""
echo ""
echo "Generating answer for test #6"
scripts/gen-answer.sh subtask3/06 subtask3/06.a "subtask3" ""
echo ""
echo "Generating answer for test #7"
scripts/gen-answer.sh subtask3/07 subtask3/07.a "subtask3" ""
echo ""
echo "Generating answer for test #8"
scripts/gen-answer.sh subtask3/08 subtask3/08.a "subtask3" ""
echo ""
echo "Generating answer for test #9"
scripts/gen-answer.sh subtask3/09 subtask3/09.a "subtask3" ""
echo ""
echo "Generating answer for test #10"
scripts/gen-answer.sh subtask3/10 subtask3/10.a "subtask3" ""
echo ""
echo "Generating answer for test #11"
scripts/gen-answer.sh subtask3/11 subtask3/11.a "subtask3" ""
echo ""
echo "Generating answer for test #12"
scripts/gen-answer.sh subtask3/12 subtask3/12.a "subtask3" ""
echo ""
echo "Generating answer for test #13"
scripts/gen-answer.sh subtask3/13 subtask3/13.a "subtask3" ""
echo ""
echo "Generating answer for test #14"
scripts/gen-answer.sh subtask3/14 subtask3/14.a "subtask3" ""
echo ""
echo "Generating answer for test #15"
scripts/gen-answer.sh subtask3/15 subtask3/15.a "subtask3" ""
echo ""
echo "Generating answer for test #16"
scripts/gen-answer.sh subtask3/16 subtask3/16.a "subtask3" ""
echo ""
echo "Generating answer for test #17"
scripts/gen-answer.sh subtask3/17 subtask3/17.a "subtask3" ""
echo ""
echo "Generating answer for test #18"
scripts/gen-answer.sh subtask3/18 subtask3/18.a "subtask3" ""
echo ""
echo "Generating answer for test #19"
scripts/gen-answer.sh subtask3/19 subtask3/19.a "subtask3" ""
echo ""
echo "Generating answer for test #20"
scripts/gen-answer.sh subtask3/20 subtask3/20.a "subtask3" ""
echo ""

#    *** subtask1 ***
mkdir -p subtask1
echo "Generating test #1"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 1" "subtask1/01" 1
echo "Generating test #2"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 2" "subtask1/02" 2
echo "Generating test #3"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 3" "subtask1/03" 3
echo "Generating test #4"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 4" "subtask1/04" 4
echo "Generating test #5"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 5" "subtask1/05" 5
echo "Generating test #6"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 6" "subtask1/06" 6
echo "Generating test #7"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 7" "subtask1/07" 7
echo "Generating test #8"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 8" "subtask1/08" 8
echo "Generating test #9"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 9" "subtask1/09" 9
echo "Generating test #10"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --seed 10" "subtask1/10" 10
echo ""
echo "Generating answer for test #1"
scripts/gen-answer.sh subtask1/01 subtask1/01.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #2"
scripts/gen-answer.sh subtask1/02 subtask1/02.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #3"
scripts/gen-answer.sh subtask1/03 subtask1/03.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #4"
scripts/gen-answer.sh subtask1/04 subtask1/04.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #5"
scripts/gen-answer.sh subtask1/05 subtask1/05.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #6"
scripts/gen-answer.sh subtask1/06 subtask1/06.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #7"
scripts/gen-answer.sh subtask1/07 subtask1/07.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #8"
scripts/gen-answer.sh subtask1/08 subtask1/08.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #9"
scripts/gen-answer.sh subtask1/09 subtask1/09.a "subtask1" "subtask1"
echo ""
echo "Generating answer for test #10"
scripts/gen-answer.sh subtask1/10 subtask1/10.a "subtask1" "subtask1"
echo ""

#    *** subtask2 ***
mkdir -p subtask2
echo "Generating test #1"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 11" "subtask2/01" 1
echo "Generating test #2"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 12" "subtask2/02" 2
echo "Generating test #3"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 13" "subtask2/03" 3
echo "Generating test #4"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 14" "subtask2/04" 4
echo "Generating test #5"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 15" "subtask2/05" 5
echo "Generating test #6"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 16" "subtask2/06" 6
echo "Generating test #7"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 17" "subtask2/07" 7
echo "Generating test #8"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 18" "subtask2/08" 8
echo "Generating test #9"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 19" "subtask2/09" 9
echo "Generating test #10"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 20" "subtask2/10" 10
echo "Generating test #11"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 21" "subtask2/11" 11
echo "Generating test #12"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 22" "subtask2/12" 12
echo "Generating test #13"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 23" "subtask2/13" 13
echo "Generating test #14"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 24" "subtask2/14" 14
echo "Generating test #15"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --seed 25" "subtask2/15" 15
echo ""
echo "Generating answer for test #1"
scripts/gen-answer.sh subtask2/01 subtask2/01.a "subtask2" ""
echo ""
echo "Generating answer for test #2"
scripts/gen-answer.sh subtask2/02 subtask2/02.a "subtask2" ""
echo ""
echo "Generating answer for test #3"
scripts/gen-answer.sh subtask2/03 subtask2/03.a "subtask2" ""
echo ""
echo "Generating answer for test #4"
scripts/gen-answer.sh subtask2/04 subtask2/04.a "subtask2" ""
echo ""
echo "Generating answer for test #5"
scripts/gen-answer.sh subtask2/05 subtask2/05.a "subtask2" ""
echo ""
echo "Generating answer for test #6"
scripts/gen-answer.sh subtask2/06 subtask2/06.a "subtask2" ""
echo ""
echo "Generating answer for test #7"
scripts/gen-answer.sh subtask2/07 subtask2/07.a "subtask2" ""
echo ""
echo "Generating answer for test #8"
scripts/gen-answer.sh subtask2/08 subtask2/08.a "subtask2" ""
echo ""
echo "Generating answer for test #9"
scripts/gen-answer.sh subtask2/09 subtask2/09.a "subtask2" ""
echo ""
echo "Generating answer for test #10"
scripts/gen-answer.sh subtask2/10 subtask2/10.a "subtask2" ""
echo ""
echo "Generating answer for test #11"
scripts/gen-answer.sh subtask2/11 subtask2/11.a "subtask2" ""
echo ""
echo "Generating answer for test #12"
scripts/gen-answer.sh subtask2/12 subtask2/12.a "subtask2" ""
echo ""
echo "Generating answer for test #13"
scripts/gen-answer.sh subtask2/13 subtask2/13.a "subtask2" ""
echo ""
echo "Generating answer for test #14"
scripts/gen-answer.sh subtask2/14 subtask2/14.a "subtask2" ""
echo ""
echo "Generating answer for test #15"
scripts/gen-answer.sh subtask2/15 subtask2/15.a "subtask2" ""
echo ""

#    *** tests ***
mkdir -p tests
echo "Generating test #2"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 1" "tests/02" 2
echo "Generating test #3"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 2" "tests/03" 3
echo "Generating test #4"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 3" "tests/04" 4
echo "Generating test #5"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 4" "tests/05" 5
echo "Generating test #6"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 5" "tests/06" 6
echo "Generating test #7"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 6" "tests/07" 7
echo "Generating test #8"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 7" "tests/08" 8
echo "Generating test #9"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 8" "tests/09" 9
echo "Generating test #10"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 9" "tests/10" 10
echo "Generating test #11"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 1 --randomize-n --seed 10" "tests/11" 11
echo "Generating test #12"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 11" "tests/12" 12
echo "Generating test #13"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 12" "tests/13" 13
echo "Generating test #14"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 13" "tests/14" 14
echo "Generating test #15"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 14" "tests/15" 15
echo "Generating test #16"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 15" "tests/16" 16
echo "Generating test #17"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 16" "tests/17" 17
echo "Generating test #18"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 17" "tests/18" 18
echo "Generating test #19"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 18" "tests/19" 19
echo "Generating test #20"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 19" "tests/20" 20
echo "Generating test #21"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 20" "tests/21" 21
echo "Generating test #22"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 21" "tests/22" 22
echo "Generating test #23"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 22" "tests/23" 23
echo "Generating test #24"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 23" "tests/24" 24
echo "Generating test #25"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 24" "tests/25" 25
echo "Generating test #26"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 2 --randomize-n --seed 25" "tests/26" 26
echo "Generating test #27"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 26" "tests/27" 27
echo "Generating test #28"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 27" "tests/28" 28
echo "Generating test #29"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 28" "tests/29" 29
echo "Generating test #30"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 29" "tests/30" 30
echo "Generating test #31"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 30" "tests/31" 31
echo "Generating test #32"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 31" "tests/32" 32
echo "Generating test #33"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 32" "tests/33" 33
echo "Generating test #34"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 33" "tests/34" 34
echo "Generating test #35"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 34" "tests/35" 35
echo "Generating test #36"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 35" "tests/36" 36
echo "Generating test #37"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 36" "tests/37" 37
echo "Generating test #38"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 37" "tests/38" 38
echo "Generating test #39"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 38" "tests/39" 39
echo "Generating test #40"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 39" "tests/40" 40
echo "Generating test #41"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 40" "tests/41" 41
echo "Generating test #42"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 41" "tests/42" 42
echo "Generating test #43"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 42" "tests/43" 43
echo "Generating test #44"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 43" "tests/44" 44
echo "Generating test #45"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 44" "tests/45" 45
echo "Generating test #46"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 45" "tests/46" 46
echo "Generating test #47"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 46" "tests/47" 47
echo "Generating test #48"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 47" "tests/48" 48
echo "Generating test #49"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 48" "tests/49" 49
echo "Generating test #50"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 49" "tests/50" 50
echo "Generating test #51"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --subtask 3 --randomize-n --seed 50" "tests/51" 51
echo ""
echo "Generating answer for test #1"
scripts/gen-answer.sh tests/01 tests/01.a "tests" ""
echo ""
echo "Generating answer for test #2"
scripts/gen-answer.sh tests/02 tests/02.a "tests" ""
echo ""
echo "Generating answer for test #3"
scripts/gen-answer.sh tests/03 tests/03.a "tests" ""
echo ""
echo "Generating answer for test #4"
scripts/gen-answer.sh tests/04 tests/04.a "tests" ""
echo ""
echo "Generating answer for test #5"
scripts/gen-answer.sh tests/05 tests/05.a "tests" ""
echo ""
echo "Generating answer for test #6"
scripts/gen-answer.sh tests/06 tests/06.a "tests" ""
echo ""
echo "Generating answer for test #7"
scripts/gen-answer.sh tests/07 tests/07.a "tests" ""
echo ""
echo "Generating answer for test #8"
scripts/gen-answer.sh tests/08 tests/08.a "tests" ""
echo ""
echo "Generating answer for test #9"
scripts/gen-answer.sh tests/09 tests/09.a "tests" ""
echo ""
echo "Generating answer for test #10"
scripts/gen-answer.sh tests/10 tests/10.a "tests" ""
echo ""
echo "Generating answer for test #11"
scripts/gen-answer.sh tests/11 tests/11.a "tests" ""
echo ""
echo "Generating answer for test #12"
scripts/gen-answer.sh tests/12 tests/12.a "tests" ""
echo ""
echo "Generating answer for test #13"
scripts/gen-answer.sh tests/13 tests/13.a "tests" ""
echo ""
echo "Generating answer for test #14"
scripts/gen-answer.sh tests/14 tests/14.a "tests" ""
echo ""
echo "Generating answer for test #15"
scripts/gen-answer.sh tests/15 tests/15.a "tests" ""
echo ""
echo "Generating answer for test #16"
scripts/gen-answer.sh tests/16 tests/16.a "tests" ""
echo ""
echo "Generating answer for test #17"
scripts/gen-answer.sh tests/17 tests/17.a "tests" ""
echo ""
echo "Generating answer for test #18"
scripts/gen-answer.sh tests/18 tests/18.a "tests" ""
echo ""
echo "Generating answer for test #19"
scripts/gen-answer.sh tests/19 tests/19.a "tests" ""
echo ""
echo "Generating answer for test #20"
scripts/gen-answer.sh tests/20 tests/20.a "tests" ""
echo ""
echo "Generating answer for test #21"
scripts/gen-answer.sh tests/21 tests/21.a "tests" ""
echo ""
echo "Generating answer for test #22"
scripts/gen-answer.sh tests/22 tests/22.a "tests" ""
echo ""
echo "Generating answer for test #23"
scripts/gen-answer.sh tests/23 tests/23.a "tests" ""
echo ""
echo "Generating answer for test #24"
scripts/gen-answer.sh tests/24 tests/24.a "tests" ""
echo ""
echo "Generating answer for test #25"
scripts/gen-answer.sh tests/25 tests/25.a "tests" ""
echo ""
echo "Generating answer for test #26"
scripts/gen-answer.sh tests/26 tests/26.a "tests" ""
echo ""
echo "Generating answer for test #27"
scripts/gen-answer.sh tests/27 tests/27.a "tests" ""
echo ""
echo "Generating answer for test #28"
scripts/gen-answer.sh tests/28 tests/28.a "tests" ""
echo ""
echo "Generating answer for test #29"
scripts/gen-answer.sh tests/29 tests/29.a "tests" ""
echo ""
echo "Generating answer for test #30"
scripts/gen-answer.sh tests/30 tests/30.a "tests" ""
echo ""
echo "Generating answer for test #31"
scripts/gen-answer.sh tests/31 tests/31.a "tests" ""
echo ""
echo "Generating answer for test #32"
scripts/gen-answer.sh tests/32 tests/32.a "tests" ""
echo ""
echo "Generating answer for test #33"
scripts/gen-answer.sh tests/33 tests/33.a "tests" ""
echo ""
echo "Generating answer for test #34"
scripts/gen-answer.sh tests/34 tests/34.a "tests" ""
echo ""
echo "Generating answer for test #35"
scripts/gen-answer.sh tests/35 tests/35.a "tests" ""
echo ""
echo "Generating answer for test #36"
scripts/gen-answer.sh tests/36 tests/36.a "tests" ""
echo ""
echo "Generating answer for test #37"
scripts/gen-answer.sh tests/37 tests/37.a "tests" ""
echo ""
echo "Generating answer for test #38"
scripts/gen-answer.sh tests/38 tests/38.a "tests" ""
echo ""
echo "Generating answer for test #39"
scripts/gen-answer.sh tests/39 tests/39.a "tests" ""
echo ""
echo "Generating answer for test #40"
scripts/gen-answer.sh tests/40 tests/40.a "tests" ""
echo ""
echo "Generating answer for test #41"
scripts/gen-answer.sh tests/41 tests/41.a "tests" ""
echo ""
echo "Generating answer for test #42"
scripts/gen-answer.sh tests/42 tests/42.a "tests" ""
echo ""
echo "Generating answer for test #43"
scripts/gen-answer.sh tests/43 tests/43.a "tests" ""
echo ""
echo "Generating answer for test #44"
scripts/gen-answer.sh tests/44 tests/44.a "tests" ""
echo ""
echo "Generating answer for test #45"
scripts/gen-answer.sh tests/45 tests/45.a "tests" ""
echo ""
echo "Generating answer for test #46"
scripts/gen-answer.sh tests/46 tests/46.a "tests" ""
echo ""
echo "Generating answer for test #47"
scripts/gen-answer.sh tests/47 tests/47.a "tests" ""
echo ""
echo "Generating answer for test #48"
scripts/gen-answer.sh tests/48 tests/48.a "tests" ""
echo ""
echo "Generating answer for test #49"
scripts/gen-answer.sh tests/49 tests/49.a "tests" ""
echo ""
echo "Generating answer for test #50"
scripts/gen-answer.sh tests/50 tests/50.a "tests" ""
echo ""
echo "Generating answer for test #51"
scripts/gen-answer.sh tests/51 tests/51.a "tests" ""
echo ""

