#!/bin/bash

# Examples for printing formatted text to sdtout(terminal).

: "
  The following statement means that we're telling the computer
that it should use the systems' built-in 
'printf'-ing(formattedly print...) function
to print something to your computers standard-output location(stdout),
that being the terminals' screen.
"

# Here's the code form: "format" "text":
printf "%s\n" "hello world"


: "
  The string "hello world", and A new-line('\n' escape sequence) 
in the form of the string data type(meant by '%s'), are the exact
pieces of text we want to print so they are surrounded in double-qoutes.

  The new line statement must be before the text declaration or
the new line won't work in bash.
"

# Tell the computers' shell to exit from processing this file commands.
exit