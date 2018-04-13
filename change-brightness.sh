#!/bin/bash
# run ./change-brightness.sh (1-8)

num=$1
echo $num | sudo tee /sys/class/backlight/acpi_video0/brightness
