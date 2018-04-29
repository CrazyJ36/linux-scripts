#!/bin/bash

# this enables compiling/running a c file temporarily then deleting the bin.
# useful if you want to test c program without organizing by arch.
echo "only type filename (no extention) as argument. continue? y,n: "
wait=read
if [wait

cfile=$1.c
filename=$1

cc -o $filename $cfile
./filename
