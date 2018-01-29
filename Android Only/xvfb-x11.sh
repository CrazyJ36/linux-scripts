#!/bin/bash
# Easily connect within  Android using bvnc
export DISPLAY=:1
Xvfb :1 -screen 0 1920x1080x32 &
blackbox &
x11vnc -display :1 -bg -nopw -listen localhost -xkb
