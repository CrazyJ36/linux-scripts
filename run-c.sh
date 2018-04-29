#!/bin/bash

# this enables compiling/running a c file temporarily then deleting the bin.
# useful if you want to test c program without organizing by arch.
read -p "Type filename, without extention, to run for this platform: " file
cc -o $file $file.c
./$file
rm $file
exit
