#!/bin/bash
# Check battery level using system file on my nuvision tablet.

printf "Percentage: "
cat /sys/class/power_supply/axp288_fuel_gauge/capacity
printf "Status: "
cat /sys/class/power_supply/axp288_fuel_gauge/status
