#!/bin/bash

# add options for dimensions
vncserver-virtual -kill :1
vncserver-virtual :1
export DISPLAY=":1"
pkill -STOP fluxbox
killall -STOP fluxbox
fluxbox &
