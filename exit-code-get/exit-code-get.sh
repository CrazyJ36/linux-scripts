#!/bin/bash

cat test.txt

if [ $? -eq 0 ]; then
  echo "File found and script ran ok. Try 'echo \$?' now"
  exit 0

else
  echo "test.txt doesn't exist. Try 'echo \$?' now"
  exit 1
fi
