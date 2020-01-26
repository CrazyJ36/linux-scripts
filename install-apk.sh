#!/bin/bash
# Installs apk file on adb connected Android device.

usage="Usage: install-apk.sh DEVICE_SERIAL APK\n"
device=$1
apk_dir=$2

if [ "$device" == "-h" ] || [ "$device" == "--help" ] || [ -z $device ] || [ -z $apk_dir ]
  then
    printf "$usage"
    exit
fi

adb -s $device install -r $apk_dir
