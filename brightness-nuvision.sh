#!/bin/bash
# run ./change-brightness.sh (0-100)

num=$1
echo $num | sudo tee /sys/class/backlight/intel_backlight/brightness
