#!/bin/bash

num=(1)

ls ~/junk | while read -r file;do

  mv $file $num-$file
  num=$((num+1))

done
