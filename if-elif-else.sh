#!/bin/bash

a="a"

if [ "$a" == "a" ]; then
  echo "a is a"
elif [ "$a" == "b" ]; then
  echo "a is somehow b"
else
  echo "weird"
fi
