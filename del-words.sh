#!/bin/bash
# usage:
# del-words.sh word file
word=$1
file=$2

echo "Use as: $ del-word.sh word file"
read -p "Deleting all instances of: [$word] from $file! Continue? Options: [y, n] " response
if [[ $response == "y" ]]; then
 echo "Working.."
 sed -i "s/$word//g" $file
 echo "Done."
elif [[ $response == "n" ]]; then
 echo "No changes were made to $file! Exiting"
 exit
else
 echo "Unknown response, abort.."
fi
