#!/bin/bash

YAP=../../../arch/bin/yap
YAPTEST=$YAP
# YAPTEST=../../../../yap-6.3-btree/arch/bin/yap

for testfile in ptests/*.yap; do
    OUT=${testfile%%.yap}
    OUT=${OUT##ptests/}

    for dataset in data/*.yap; do
        DATA=${dataset%%.yap}
        DATA=${DATA##data/}
        if [ ! -f poutput/${OUT}_${DATA} ]; then
            echo "Creating prolog base for: $testfile $dataset"
            $YAPTEST -l base.yap -h 1024000 -s 1024000 2> /dev/null <<EOF
['$testfile'].
['$dataset'].
x('poutput/${OUT}_${DATA}').
EOF
        fi
    done
done

# for testfile in tests/*.yap; do
#     OUT=${testfile%%.yap}
#     OUT=${OUT##tests/}

#     for dataset in data/*.yap; do
#         DATA=${dataset%%.yap}
#         DATA=${DATA##data/}
#         if [ ! -f boutput/${OUT}_${DATA} ]; then
#             echo "Creating base for: $testfile $dataset"
#             $YAPTEST -l base.yap -h 1024000 -s 1024000 2> /dev/null <<EOF
# ['$testfile'].
# ['$dataset'].
# x('boutput/${OUT}_${DATA}').
# EOF
#         fi
#     done
# done

for testfile in tests/*.yap; do
    OUT=${testfile%%.yap}
    OUT=${OUT##tests/}

    for dataset in data/*.yap; do
        DATA=${dataset%%.yap}
        DATA=${DATA##data/}

        echo -n "Running $testfile $dataset: "

        $YAP -l base.yap -h 1024000 -s 1024000 2> /dev/null <<EOF
['$testfile'].
['$dataset'].
x('output/${OUT}_${DATA}').
EOF

        diff -q <(sort poutput/${OUT}_${DATA}) <(sort output/${OUT}_${DATA}) > /dev/null
        if [ $? -eq 0 ]; then
            echo $(tput setaf 2) "OK" $(tput sgr0)
        else
            p=`wc -l < poutput/${OUT}_${DATA}`
            t=`wc -l < output/${OUT}_${DATA}`
            echo $(tput setaf 1) "FAIL" $(tput sgr0) $p $t
        fi

        # diff -q <(sort boutput/${OUT}_${DATA}) <(sort output/${OUT}_${DATA}) > /dev/null
        # if [ $? -eq 0 ]; then
        #     echo " " $(tput setaf 2) "OK" $(tput sgr0)
        # else
        #     echo " " $(tput setaf 1) "FAIL" $(tput sgr0)
        # fi
    done
done
