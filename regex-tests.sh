#!/bin/bash
a="1.4"
b="1"
echo "float example"
if [[ $a =~ [0-9][.][0-9] ]]; then
  printf "$a is float, verified through regex.\n"
else
  printf "weird"
fi
echo "int example"
if [[ $b =~ [1-5] ]]; then
  printf "$b is 1 - 5 , verified through regex.\n"
else
  printf "weird.\n"
fi
