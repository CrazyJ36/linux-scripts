#!/bin/bash

# Do something if command doesn't output any string, or vice-versa.
# Run with A directory as argument.

dir=$1

if [[ ! $(ls -A $1) ]]; then
  printf "No files.\n"
else
  printf "Found files.\n"
fi
