#!/bin/bash
a="h"
echo $a
if [ ! "$a" == "h" ]; then
  echo "a is not h"
elif [ "$a" == "h" ]; then
  echo "a is h"
else
  echo "weird"
fi
