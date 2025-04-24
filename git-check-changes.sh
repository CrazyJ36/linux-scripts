#!/bin/bash

# TODO: optional show git diff, auto add/commmit/push/

# This script shows when local git changes are detected in A pretty format.
# by changing directory to desired repo, then running 'git status'.


# Edit all your default system Git account repos(matching repo top directory names) here:
repos=(
 android
 assembly
 c
 crazyj36.rocks
 docs
 html
 java
 js
 linux-scripts
 music-production
 paid-apps
 python
 windows-scripts
 )
# Edit here to point to the directory where your git repos' are located in file-system:
directory=~/development


function git_status {
  chosen_repo=$1
  printf "Checking $chosen_repo..\n"
  cd $directory/$chosen_repo

  if [[ $(git status --porcelain) ]];
  then
    printf "\n"
    git status -s
    printf "\n"
  fi

}


for i in "${repos[@]}"
do
  git_status $i
done

exit


