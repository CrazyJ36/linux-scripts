#!/bin/bash
# Example on how to use arrays in bash.

# TODO:

# - Show how to add to array using item +="${array}"
# - Broken
# May need commas between index arguments or only the
# 1st applies(due to a space). May depend on data type.
# I should research this to get truth or concept before
# screwing around with it and going insane.

# Array index items are sometimes called subscripts.

# There are some quick for acting upon all your array
# indexes:
# { array[@] } seems to mean all
# { #array[@] } returns the length of the current array.
# And take from this(accessing index var while looping):
# If the first character of parameter is an exclamation point (!),
# it introduces a level of variable indirection. Bash uses the value
# of the variable formed from the rest of parameter as the name of
# the variable; this variable is then expanded and that value is used
# in the rest of the substitution, rather than the value of parameter
# itself. This is known as indirect expansion. The exceptions to this
# are the expansions of ${!prefix*} and ${!name[@]} described below.
# The exclamation point must immediately follow the left brace in order
# to introduce indirection.

# Integer or int number array, can then be used in arithmetic functions
intArray=(1 2 3)
printf "%s\n"  $intArray

# Array of characters
charArray=('a' 'b' 'c')
printf "%s\n" $charArray

# Array of strings, prints first word
strArray=(hello world)
printf "%s\n" $strArray

# Array of strings, multiword items
strsArray=("good day" "how are you")
printf "%s\n" $strsArray

# Add items to array
printf "Add more examples."

exit
