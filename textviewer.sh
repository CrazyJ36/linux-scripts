#!/bin/bash
echo "This script shows file contexts one at a time."
echo "Enter the number of the file to show, ctrl-c to quit:"
select FILENAME in *;
do
     echo "showing $FILENAME ($REPLY):"
     echo "\n"
     cat "$FILENAME"
done
