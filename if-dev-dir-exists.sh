#!/bin/bash

dir="$HOME/development" # wouldn't work with single-quotes

if [[ -d $dir ]]; then
  echo "development directory exists"
else
  echo  "no development directory"
fi
