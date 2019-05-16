#!/bin/bash
# Sets up automatic pull of all your github.com or similar repos.

: "
multiline comment ( :' text ')
get number of repos from user
should simple use 'read -a NAME' which assigns all input to arary
or read -e to get the whole line(don't know what to do with that)
also array+=('item')
"


# get number of users repos
read -p "How many repos do you have?[number]: " numrepos

# set a var name to prepend to each out of numrepos as array
array=()

# get A variable name for the number of repos
for (( x=1; x <= $numrepos; x++ )) do
 array+=("repo$x")
done

printf "%s\n" "${array[@]}"


#repos=(numrepo numrepo)
: '
array2=()
read -p "Enter the names of your repos[name1 name2]" namerepos

for names in $namerepos
do
  array2+=("$namerepos")
done

printf "${array2[@]}"
'
exit