#!/bin/bash
# show how to fix what happens when using single quotes in a statement.
echo "hello world hello" > junk.txt
file=junk.txt
word="hello"

cat junk.txt
#normally variables can't be used in seds' single quotes
# eg:
## sed -i 's/$word/ /g' text
# would not work as the '$word' variable is swallowed into a string, not available to sed.

# use double quotes around a section of regex to include variables:
sed -i "s/$word/ /g" $file # this function help: sed -i 's/string-to-replace/replacement-string/g'
cat $file
rm junk.txt
exit
