#!/bin/bash
function main {
c=$1
if [ "$c" == "on" ]; then
  synclient TouchpadOff=0
elif [ "$c" == "off" ]; then
  synclient TouchpadOff=1
elif [ -z "$c" ]; then
  usage
  exit
else
  usage
  exit
fi
}

function usage {
printf "Unchanged!\nUsage:\n./touchpadctl.sh <on|off>\n"
}

main "$@"
