#!/bin/bash

(cd ~/development/android && printf "\nANDROID:";git status&&\
cd ~/development/bash && printf "\nBASH:";git status&&\
cd ~/development/bat && printf "\bBAT:";git status&&\
cd ~/development/c && printf "\nC:";git status&&\
cd ~/development/cpp && printf "\nCPP:";git status&&\
cd ~/development/configs && printf "\nCONFIG:";git status&\
cd ~/development/cs && printf "\nCS:";git status&&\
cd ~/development/docs && printf "\nDOCS:";git status&&\
cd ~/development/gitbook && printf "\nGITBOOK:";git status&&\
cd ~/development/java && printf "\nJAVA:";git status&&\
cd ~/development/kotlin && printf "\nKOTLIN:";git status&&\
cd ~/development/python&& printf "\nPYTHON:";git status&&\
cd ~/development/termux && printf "\nTERMUX:";git status)
