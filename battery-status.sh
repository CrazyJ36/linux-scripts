#!/bin/bash

# Probably not for chroot stuff like Linux in Android

echo "Battery Percentage:"
cat /sys/class/power_supply/BAT1/capacity
echo "Charging/Discharging/Unknown if full:"
cat /sys/class/power_supply/BAT1/status
