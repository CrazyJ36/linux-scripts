#!/bin/bash

# Makes A number of files with their own content.

# variable is initialized after for and is then available to the loop.

# for variable in sequence(seq) of 1 to 5;
for i in $(seq 1 5);
do echo "content $i" > note$i.txt;
done;

exit
