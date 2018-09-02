#!/bin/bash
# This script builds native optimized c code for toshiba.

# TODO add check to make sure that '.c' was not typed at end of argument.

DEBIAN_BUILDARCH=pentium
DEBIAN_GCCVER=7
name=$1
builder-cc -march=i686 -mtune=native -O3 -o $name $name.c
mv $name /home/thomas/development/c/executables/linux/86
exit
