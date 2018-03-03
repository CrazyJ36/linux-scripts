#!/bin/bash

# Functions-----------
function showHelp {
    printf "\n"
    echo "usage: log-apt (-hc) <install, remove, search etc..> <someapp> <optional:dir>"
    echo "                 -h show this help"
    echo "                 -c [directory]    save log text file to the given directory"
    printf "\n"
    echo "Use the program as if: apt <any argument> oprogram and shows progress"
    echo "on the terminal, and saves apt ouput from the whole install process from std out to a text file."
    printf "\n"
}

function custDir {
    sudo apt $fun $app | tee $dir/install-$app.txt
}

function myDir {
    sudo apt $fun $app | tee /home/thomas/documents/log-apt/install-$app.txt
}

# Code------------
fun=$1
app=$2
dir=$4

if [ "$1" = "-h" ]; then
    showHelp

elif [ "$1" = "-c" ]; then
    fun=$2
    app=$3
    custDir

else
    myDir

fi
