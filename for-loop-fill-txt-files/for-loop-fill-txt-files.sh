#!/bin/bash

# One-liner makeing A number of files with their own content.

# VARIABLE is initialized after for and is then available to the loop.

# act on i up to 5 times
for i in {1..5};
do echo "content $i" > note$i.txt;
done;

exit
