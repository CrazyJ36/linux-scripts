#!/bin/bash

# this enables compiling/running a c file temporarily then deleting the bin.
# useful if you want to test c program without organizing by arch.
# don't type extension when running ex: ./run-c.sh ctitle
file=$1
cc -o $file $file.c
./$file
rm $file
exit
