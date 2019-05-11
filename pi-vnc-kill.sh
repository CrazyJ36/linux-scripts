#!/bin/bash
# do whatever needed to kill running graphical processes
# try systemctl stop vncserver-virtuald
vncserver-virtual -kill :1
vncserver-virtual :1
export DISPLAY=""
pkill -STOP fluxbox
killall -STOP fluxbox
