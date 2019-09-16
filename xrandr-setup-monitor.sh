#!/bin/sh
xrandr --newmode "720" 85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode VGA1 720

# May need to set with:
xrandr --output VGA1 --mode 720

# Also, if you can't change brightness on your monitor, you'll want to do:
xrandr --output VGA1 --brightness 0.3
