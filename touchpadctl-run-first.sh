#!/bin/bash
printf "Turn touchpad off or on.\nTo turn it off type: 1\nTo turn it on type: 0\nType now: " 
read choice
synclient TouchpadOff=$choice
