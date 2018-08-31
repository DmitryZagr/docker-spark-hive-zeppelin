#!/bin/bash

test_file=test_file

execute_dd_command() {
    echo $1$2 count=$3
    dd if=/dev/zero of=$test_file bs=$1$2 count=$3;
}

rm_test_file() {
    rm -f $test_file;
}

test_write_1kb_file() {
    
}

rm_test_file

execute_dd_command 1 KB 2

rm_test_file

execute_dd_command 1 MB 2