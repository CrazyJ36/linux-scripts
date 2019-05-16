#/bin/bash

# Automatically changes to my repo directories,
# and runs 'git pull' from there.

# This runs in linux-like Operating Systems that can
# use the '~' for 'home directory' symbol. Or on
# Windows with Git Bash shell, Cygwin, etc...

cd ~/development/android;git pull;cd ../assembly;git pull;cd ../c;git pull;cd ../docs;git pull;cd ../html;git pull;cd ../java;git pull;cd ../js;git pull;cd ../kotlin;git pull;cd ../linux-scripts;git pull;cd ../python;git pull;cd ../windows-scripts;git pull;
