#!/bin/bash
val=1.2
echo $val

if [[ ! $val =~ [0-9][.][0-9] ]]; then

  echo "val is now float"
else
  echo "val is float"
fi
