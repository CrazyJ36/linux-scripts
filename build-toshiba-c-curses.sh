#!/bin/bash
# This builds toshiba optimized curses code
DEBIAN_BUILDARCH=pentium
DEBIAN_GCCVER=7
name=$1
builder-cc -march=i686 -mtune=native -O3 -o $name $name.c -lncurses
mv $name /home/thomas/development/c/executables/linux/86
