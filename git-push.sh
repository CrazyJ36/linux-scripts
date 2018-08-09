#!/bin/bash
message=$1
function main {
if [ "$message" == "-h" ] || [ "$message" == "--help" ] || [ "$message" == "help" ] || [ "$message" == "h" ] || [ "$message" == "?" ] || [ -z "$message" ]
 then
  help
  exit
else
 pushOrNot
fi
}

function pushOrNot {
printf "Commiting changes in:\n"
pwd
printf "with message:\n$message\n"
read -p "Continue? (y,n) " x
if [ "$x" == "y" ]
 then
  git add .
  git commit -m "$message"
  printf "Pushing to your remote repo.\n"
  git push
  printf "Done\n"
  exit
else
 printf "Cancelled\n"
fi
}

function help {
 printf "Usage: git-push.sh 'commit message'\nThis script can make pushing your local git changes\neasy by running it in the desired git directory\nand entering your message as an argument.\n"
}
main "$@"
