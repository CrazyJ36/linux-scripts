#!/bin/bash

# This prints all output from git status on all repos.
# For A more pretty alternative, use 'git-status-script.sh'

(cd ~/development/android && printf "\n#ANDROID: ";git status&&\
cd ~/development/assembly && printf "\n#ASSEMBLY: ";git status&&\
cd ~/development/c && printf "\n#C: ";git status&&\
cd ~/development/docs && printf "\n#DOCS: ";git status&&\
cd ~/development/html && printf "\n#HTML: ";git status&&\
cd ~/development/java && printf "\n#JAVA: ";git status&&\
cd ~/development/js && printf "\n#JS: ";git status&&\
cd ~/development/kotlin && printf "\n#KOTLIN: ";git status&&\
cd ~/development/linux-scripts && printf "\n#LINUX-SCRIPTS: ";git status&&\
cd ~/development/python&& printf "\n#PYTHON: ";git status&&\
cd ~/development/windows-scripts && printf "\n#WINDOWS-SCRIPTS: ";git status)

exit
