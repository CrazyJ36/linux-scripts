#!/bin/bash

# try to grep output of git status to detect when changed
# print only changed.
# this script shows when git pull or push is needed.

(cd ~/development/android && printf "\n#ANDROID:";git status&&\
cd ~/development/bash && printf "\n#BASH:";git status&&\
cd ~/development/bat && printf "\n#BAT:";git status&&\
cd ~/development/c && printf "\n#C:";git status&&\
cd ~/development/cpp && printf "\n#CPP:";git status&&\
cd ~/development/configs && printf "\n#CONFIG:";git status&&\
cd ~/development/cs && printf "\n#CS:";git status&&\
cd ~/development/docs && printf "\n#DOCS:";git status&&\
cd ~/development/gitbook && printf "\n#GITBOOK:";git status&&\
cd ~/development/html && printf "\n#HTML:";git status&&\
cd ~/development/java && printf "\n#JAVA:";git status&&\
cd ~/development/kotlin && printf "\n#KOTLIN:";git status&&\
cd ~/development/python&& printf "\n#PYTHON:";git status&&\
cd ~/development/termux && printf "\n#TERMUX:";git status)
