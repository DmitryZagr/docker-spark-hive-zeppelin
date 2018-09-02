#!/bin/bash

test_file=test_file
sleep_flag=1
sleep_def_time=1m

execute_dd_command() {
    echo "dd if=/dev/zero of=$test_file bs=$1$2 $3 $4;";
    dd if=/dev/zero of=$test_file bs=$1$2 $3 $4;
}

rm_test_file() {
    rm -f $test_file;
}

dd_test() {
    rm_test_file
    execute_dd_command $1 $2 $3 $4
    rm_test_file
}

execute_sleep() {
    if [[ 1 -eq $1 ]]; then
        echo "sleep $2"
        sleep $2
    fi
}

dd_test 128 MB count=1 oflag=dsync
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=2 oflag=dsync  #256Mb
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=4 oflag=dsync #512Mb
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=8 oflag=dsync #1G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=16 oflag=dsync #2G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=32 oflag=dsync #4G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=64 oflag=dsync #8G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=128 oflag=dsync #16G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=256 oflag=dsync #32G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=512 oflag=dsync #64G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=1024 oflag=dsync #128G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=2048 oflag=dsync #512G
execute_sleep $sleep_flag $sleep_def_time

dd_test 128 MB count=4096 oflag=dsync #1Tb
execute_sleep $sleep_flag $sleep_def_time
