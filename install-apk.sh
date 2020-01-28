#!/bin/bash
# Installs apk file on adb connected Android device.

usage="Usage: install-apk.sh APK DEVICE_SERIAL\n"
device=$2
apk_dir=$1

if [ "$device" == "-h" ] || [ "$device" == "--help" ] || [ -z $device ] || [ -z $apk_dir ]
  then
    printf "$usage"
    exit
fi

adb -s $device install -r $apk_dir
