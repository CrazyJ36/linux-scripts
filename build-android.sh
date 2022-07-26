#!/bin/bash

# File edited to suit by CrazyJ36
# using method from http://www.hanshq.net/command-line-android.html

# Instructions: The common JAVA_HOME in linux is: /usr/lib/jvm/.../
# this should of course be set.
# appname argument should be the same as in ./java/com/crazyj36/name

# Downloading build-tools, platform-tools and platforms:
# $ wget https://dl.google.com/android/repository/platform-R_r02.zip
# tool names can be found in https://dl.google.com/android/repository/repository-12.xml

# adding libs like support libraries seems possible after "javac -cp ${PLATFORM}/android.jar:${PLATFORM}/android-support-v4.jar"
# and "aapt -j ${PATH}/to/android-support-v4.jar"
# But this caused crash in app as 'NoClassDefError' for this lib. My error, probably didn't have the lib downloaded.

# You should set the directory where your android development keystore file is.
# TODO: catch any problems before any command finishes.

function deleteDirs {
rm -rf ./build/gen/ ./build/obj/ ./build/apk/
}

printf "\nRun this program as:\n$ build-android.sh app_name dev_keystore_pass device_serial\n\n"
printf "It expects to be run in A directory that contains:\n"
printf "AndroidManifest.xml res/ java/...\n"
printf "with A com/dev/appname/MainActivity.java in 'java/'\n"
printf "and an adb device connected.\n\n"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  printf "wrong execution arguments.\n"
  exit
else

  appname=$1
  mpass=$2
  device=$3

  jks_dir="$HOME/downloads/keystore.jks"
  JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  SDK="${HOME}/development/android/aapt-build/sdk"
  BUILD_TOOLS="${SDK}/build-tools"
  PLATFORM="${SDK}/platforms/"
  PLATFORM_TOOLS="${SDK}/platform-tools"

  mkdir -p ./build/gen ./build/obj ./build/apk
  printf "created build directories...\n"

  "${BUILD_TOOLS}/aapt" package -f -m -J ./build/gen/ -S ./res \
  -M ./AndroidManifest.xml -I "${PLATFORM}/android.jar"
  if [ ! $? = 0 ]; then
    printf "\naapt error, cleaning...\n"
    deleteDirs
    exit
  else
    printf "manifest and res ok...\n"
  fi

  javac -source 1.8 -target 1.8 -bootclasspath "${JAVA_HOME}/jre/lib/rt.jar" \
  -classpath "${PLATFORM}android.jar" -Xlint:all -d ./build/obj \
  ./build/gen/com/crazyj36/$appname/R.java ./java/com/crazyj36/$appname/*.java
  if [ ! $? == 0 ]; then
    printf "\njava error, cleaning...\n"
    deleteDirs
    exit
  else
    printf "java ok...\n"
  fi

  "${BUILD_TOOLS}/dx" --dex --output=./build/apk/classes.dex ./build/obj/

  "${BUILD_TOOLS}/aapt" package -f -M ./AndroidManifest.xml -S ./res/ -I "${PLATFORM}/android.jar" \
  -F ./build/$appname-packaged.apk ./build/apk/
  if [ ! $? == 0 ]; then
    printf "\naapt error, cleaning...\n"
    rm ./build/$appname-packaged.apk
    deleteDirs
    exit
  fi

  "${BUILD_TOOLS}/zipalign" -f 4 ./build/$appname-packaged.apk ./build/$appname-aligned.apk
  if [ ! $? == 0 ]; then
    printf "zipalign error, cleaning...\n"
    rm .build/$appname-packaged.apk ./build/$appname-aligned.apk
    deleteDirs
    exit
  fi

  "${BUILD_TOOLS}/apksigner" sign --v1-signing-enabled true --v2-signing-enabled false \
  --ks $jks_dir \
  --ks-key-alias CrazyJ36DevKey --ks-pass pass:$mpass --key-pass pass:$mpass \
  --out ./build/$appname.apk ./build/$appname-aligned.apk
  if [ ! $? == 0 ]; then
    printf "apksigner error, cleaning...\n"
    rm ./build/$appname-packaged.apk ./build/$appname.apk ./build/$appname-aligned.apk
    deleteDirs
    exit
  else
    printf "new apk ready at ./build/...\n"
  fi

  # adb -s $device uses your device serial number. You can set this to variable in ~/.profile.
  "${PLATFORM_TOOLS}/adb" -s $device install -r ./build/$appname.apk
  if [ ! $? == 0 ]; then
    printf "apk not installed. connect a device and try again, or install from build directory manually. cleaning...\n"
    rm ./build/$appname-packaged.apk ./build/$appname-aligned.apk
    deleteDirs
    exit
  fi

  "${PLATFORM_TOOLS}/adb"  -s $device shell am start -n com.crazyj36.$appname/.MainActivity
  if [ ! $? == 0 ]; then
    printf "'$ adb shell am start' failed, cleaning...\n"
    rm ./build/$appname-packaged.apk ./build/$appname-aligned.apk
    deleteDirs
    exit
  else
    rm ./build/$appname-packaged.apk ./build/$appname-aligned.apk
    deleteDirs
    printf "started MainActivity.java on connected device, cleaned files.\n"

  fi

fi
exit
