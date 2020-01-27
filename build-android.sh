#!/bin/bash

# File edited to suit by CrazyJ36
# using method from http://www.hanshq.net/command-line-android.html

# Instructions: The common JAVA_HOME in linux is: /usr/lib/jvm/.../
# this should of course be set.
# appname argument should be the same as in ./java/com/crazyj36/name

# adding libs like support libraries seems possible after "javac -cp ${PLATFORM}/android.jar:${PLATFORM}/android-support-v4.jar"
# and "aapt -j ${PATH}/to/android-support-v4.jar"
# But this caused crash in app as 'NoClassDefError' for this lib. My error, probably didn't have the lib downloaded.

# You should set the directory where your android development keystore file is.
# TODO: catch any problems before any command finishes.

printf "This expects to be run in A directory that has Android source of: AndroidManifest.xml res/ java/\n"
printf "\nRun this program as:\nbuild-android.sh AppName KeyStorePass DeviceSerial\n"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  printf "Wrong number of arguments.\n"
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
  printf "\nbuild directories created...\n"

  "${BUILD_TOOLS}/aapt" package -f -m -J ./build/gen/ -S ./res \
  -M ./AndroidManifest.xml -I "${PLATFORM}/android.jar"
  printf "aapt ok...\n"

  javac -source 1.7 -target 1.7 -bootclasspath "${JAVA_HOME}/jre/lib/rt.jar" \
  -classpath "${PLATFORM}/android.jar" -Xlint:all -d ./build/obj \
  ./build/gen/com/crazyj36/$appname/R.java ./java/com/crazyj36/$appname/*.java

  if [ ! $? == 0 ]; then
    printf "Couldn't build java source files.\n"
    exit
  else
    printf "java ok...\n"

    "${BUILD_TOOLS}/dx" --dex --output=./build/apk/classes.dex ./build/obj/
    printf "dex done\n"

    "${BUILD_TOOLS}/aapt" package -f -M ./AndroidManifest.xml -S ./res/ -I "${PLATFORM}/android.jar" \
    -F ./build/$appname-packaged.apk ./build/apk/
    printf "apk built...\n"

    "${BUILD_TOOLS}/apksigner" sign --v1-signing-enabled true --v2-signing-enabled false \
    --ks $jks_dir \
    --ks-key-alias CrazyJ36DevKey --ks-pass pass:$mpass --key-pass pass:$mpass \
    --out ./build/$appname-signed.apk ./build/$appname-packaged.apk

    #jarsigner -keystore $HOME/development/android/devkey/keystore.jks \
    #-storepass $mpass -keypass $mpass ./build/$appname.aligned.apk CrazyJ36DevKey
    printf "apk signed...\n"

    "${BUILD_TOOLS}/zipalign" -f 4 ./build/$appname-signed.apk ./build/$appname.apk
    printf "zipaligned apk...\n"

    # adb -s $device uses your device serial number. You can set this to variable in ~/.profile.
    "${PLATFORM_TOOLS}/adb" -s $device install -r ./build/$appname.apk
    printf "apk installed...\n"

    "${PLATFORM_TOOLS}/adb"  -s $device shell am start -n com.crazyj36.$appname/.MainActivity
    printf "app started on device\n"

    printf "cleaning build directories\n"
    rm ./build/$appname-packaged.apk ./build/$appname-signed.apk
    rm -rf ./build/apk/ ./build/obj/ ./build/gen/

    printf "done\n"
  fi

fi

