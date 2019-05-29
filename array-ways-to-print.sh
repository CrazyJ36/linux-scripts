#!/bin/bash

# A few different ways to print an array.
# Array init format may be specific to data type. 
my_array=(a b c d)

# one way
printf "%s\n" "${my_array[@]}"

# another way
for i in "${my_array[@]}"
do
  printf $i
done
printf "\n"
printf "Program Exiting.."
exit