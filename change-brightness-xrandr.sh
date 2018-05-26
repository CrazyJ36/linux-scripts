#!/bin/bash
c=$1

if [[ ! $c =~ [0-1][.][0-9] ]]; then

  printf "This changes the light filter brightness using xrandr\n"
  printf "Use ./program <0.0 to 1.0>\n"
else
  xrandr --output LVDS-1 --brightness $c
fi
