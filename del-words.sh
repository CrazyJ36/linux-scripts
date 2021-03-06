#!/bin/bash

# This would delete snyyhing between any perenthesis:
# "s/[(][^)]*[)]/()/g"
# You can run A sed test, not changing the file
# by leaving out '-i'

# usage:
# del-words.sh word file
word=$1
file=$2

echo "Use as: $ del-word.sh word file"
read -p "Deleting all instances of: [$word] from $file! Continue? Options: [y, n] " response
if [[ $response == "y" ]]; then
 echo "Working.."
# explaination: substitute/text/replacement/globally-in-file
 sed -i "s/$word//g" $file
 echo "Done."
elif [[ $response == "n" ]]; then
 echo "No changes were made to $file! Exiting"
 exit
else
 echo "Unknown response, abort.."
fi
