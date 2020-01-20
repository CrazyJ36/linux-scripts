#!/bin/bash
name=$1
gcc `pkg-config --cflags gtk+-3.0` \
-o $name $name.c \
`pkg-config --libs gtk+-3.0`
