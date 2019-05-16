#!/bin/bash

# this script shows when git add, commit, then push is needed.

# try to grep output of git status to detect when changed.
# auto push/pull from there.

(cd ~/development/android && printf "\n#ANDROID: ";git status&&\
cd ~/development/assembly && printf "\n#ASSEMBLY: ";git status&&\
cd ~/development/bash-scripts && printf "\n#BASH-SCRIPTS: ";git status&&\
cd ~/development/c && printf "\n#C: ";git status&&\
cd ~/development/docs && printf "\n#DOCS: ";git status&&\
cd ~/development/html && printf "\n#HTML: ";git status&&\
cd ~/development/java && printf "\n#JAVA: ";git status&&\
cd ~/development/js && printf "\n#JS: ";git status&&\
cd ~/development/kotlin && printf "\n#KOTLIN: ";git status&&\
cd ~/development/python&& printf "\n#PYTHON: ";git status&&\
cd ~/development/windows-scripts && printf "#WINDOWS-SCRIPTS: ";git status)