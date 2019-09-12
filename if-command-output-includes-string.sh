#!/bin/bash

# Check wether A commands output contains A specific string

if [[ $(ls | grep pi) ]]; then
  printf "directory has filenames relating to raspberry pi\n"
fi
