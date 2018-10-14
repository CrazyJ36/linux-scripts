#!/bin/bash
printf "For directory: "
pwd

read -p "This will rename all files in this directory to: 1-name 2-name...etc!\nContinue? [y,n]: " x
if [ "$x" == "y" ]; then

  num=(1)

  ls | while read -r file;do

    mv $file $num-$file
    num=$((num+1))

    done

else
  printf "Cancelled\n"
fi
exit
