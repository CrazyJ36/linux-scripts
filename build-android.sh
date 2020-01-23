#!/bin/bash

# File edited to suit by CrazyJ36
# using method from http://www.hanshq.net/command-line-android.html

# Instructions: common java_home in linux: /usr/lib/jvm/.../
# appname (second argument) should be the same as in ./java/com/crazyj36/name

# adding libs like support libraries seems possible after "javac -cp ${PLATFORM}/android.jar:${PLATFORM}/android-support-v4.jar"
# and "aapt -j ${PATH}/to/android-support-v4.jar"
# But this caused crash in app as 'NoClassDefError' for this lib. My error, probably didn't have the lib downloaded.

# Ideas: catch any problems before script gets to "success.."

printf "This expects to be run in A directory that has Android source of: AndroidManifest.xml res/ java/\n"
printf "\nRun this program as:\nbuild-android.sh SourceDir AppName KeyStorePass DeviceSerial\n"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  printf "Wrong number of arguments.\n"
  exit
else

  workdir=$1
  appname=$2
  mpass=$3
  device=$4

  jks_dir="$HOME/downloads/keystore.jks"
  JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  SDK="${HOME}/development/android/cli-build/aapt-build/sdk"
  BUILD_TOOLS="${SDK}/build-tools"
  PLATFORM="${SDK}/platforms/"
  PLATFORM_TOOLS="${SDK}/platform-tools"

  mkdir -p $workdir/build/gen $workdir/build/obj $workdir/build/apk
  printf "\nbuild directories created...\n"

  "${BUILD_TOOLS}/aapt" package -f -m -J $workdir/build/gen/ -S $workdir/res \
  -M $workdir/AndroidManifest.xml -I "${PLATFORM}/android.jar"
  printf "aapt ok...\n"

  javac -source 1.7 -target 1.7 -bootclasspath "${JAVA_HOME}/jre/lib/rt.jar" \
  -classpath "${PLATFORM}/android.jar" -Xlint:all -d $workdir/build/obj \
  $workdir/build/gen/com/crazyj36/$appname/R.java $workdir/java/com/crazyj36/$appname/*.java

  if [ ! $? == 0 ]; then
    printf "Couldn't build java source files.\n"
    exit
  else
    printf "java ok...\n"

    "${BUILD_TOOLS}/dx" --dex --output=$workdir/build/apk/classes.dex $workdir/build/obj/
    printf "dex done\n"

    "${BUILD_TOOLS}/aapt" package -f -M $workdir/AndroidManifest.xml -S $workdir/res/ -I "${PLATFORM}/android.jar" \
    -F $workdir/build/$appname-packaged.apk $workdir/build/apk/
    printf "apk built...\n"

    "${BUILD_TOOLS}/apksigner" sign --v1-signing-enabled true --v2-signing-enabled false \
    --ks $jks_dir \
    --ks-key-alias CrazyJ36DevKey --ks-pass pass:$mpass --key-pass pass:$mpass \
    --out $workdir/build/$appname-signed.apk $workdir/build/$appname-packaged.apk

    #jarsigner -keystore $HOME/development/android/devkey/keystore.jks \
    #-storepass $mpass -keypass $mpass $workdir/build/$appname.aligned.apk CrazyJ36DevKey
    printf "apk signed...\n"

    "${BUILD_TOOLS}/zipalign" -f 4 $workdir/build/$appname-signed.apk $workdir/build/$appname.apk
    printf "zipaligned apk...\n"

    # adb -s $device uses your device serial number. You can set this to variable in ~/.profile.
    "${PLATFORM_TOOLS}/adb" -s $device install -r $workdir/build/$appname.apk
    printf "apk installed...\n"

    "${PLATFORM_TOOLS}/adb"  -s $device shell am start -n com.crazyj36.$appname/.MainActivity
    printf "app started on device\n"

    printf "cleaning build directories\n"
    rm $workdir/build/$appname-packaged.apk $workdir/build/$appname-signed.apk
    rm -rf $workdir/build/apk/ $workdir/build/obj/ $workdir/build/gen/

    printf "done\n"
  fi

fi

