#!/bin/bash
# Bash example of promting user for yes or no response to continue
read -p "Continue? Options: [y, n] " response
if [[ $response == "y" ]]; then
 echo "continue"
elif [[ $response == "n" ]]; then
 echo "exit"
else
 echo "unknown response, abort"
fi
