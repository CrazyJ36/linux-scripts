#!/bin/bash
# Start VNC Graphics environment.

sudo startx
vncserver-virtual :0
export DISPLAY=":0"
fluxbox &
xterm &
