#!/bin/bash
yes="y"
read response
if [ response == "y" ]; then
 echo "continue"
elif [ response == "n" ]; then
 echo "exit"
else
 echo "unknown response, abort"
fi
