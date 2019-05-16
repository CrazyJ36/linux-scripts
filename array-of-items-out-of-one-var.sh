#!/bin/bash

# Example showing how you can add many array items
# representing versions of one word, int or variable

# get number of users repos
read -p "How many copies of variable do you want?[number > 1]: " vars

# set a variable to prepend sorting to A word as an array
array=()

# get A variable name for the number of repos
for (( x=1; x <= $vars; x++ )) do
 array+=("${x}item")
done

# Could put these next two statements on one line:
# insert both strings at the first 'format argument to printf("%s\n")
printf "%s\n" "Whole array: "
printf "%s\n" "${array[@]}" # could insert text into the around the {array} statement

printf "\n%s\n" "Array item at index 1(not 0):  ${array[1]}  "


##echo "Program Exiting..."
#echo "done"
exit