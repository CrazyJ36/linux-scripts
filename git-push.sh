#!/bin/bash
message=$1
function main {
if [ "$message" == "-h" ] || [ "$message" == "--help" ] || [ "$message" == "help" ] || [ "$message" == "h" ] || [ "$message" == "?" ] || [ -z "$message" ]
then
help
exit
else
printf "Commiting changes in:\n"
pwd
git add .
printf "with message:\n$message"
git commit -m "$message"
printf "Pushing to your remote repo.\n"
git push
printf "done\n"
exit
fi
}

function help {
  printf 'This script can make pushing your local\ngit, bitbucket, etc. changes easy by running it in\nthe desired git directory and entering\nyour message as an argument.\n'
}
main "$@"
