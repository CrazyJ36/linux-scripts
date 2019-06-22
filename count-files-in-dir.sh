#!/bin/bash

# Shows the number of files in current directory,
# good for counting how many programs you've written.

# We'll use 'ls -l' command to list all files
# one file per line, the 'wc -l' to word-count
# but we're counting lines

ls -1 | wc -l

exit
