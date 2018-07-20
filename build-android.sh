#!/bin/bash

# File edited to suit by CrazyJ36
# using method from http://www.hanshq.net/command-line-android.html

# Instructions: this expects $JAVA_HOME to be set and the JDK tools to be in $PATH.
# appname (second argument) should be the same as in ./java/com/crazyj36/name

printf "remember this script can not compile multiple java activity files yet.\n\nRun this program as:\nbuild-android.sh SourceDir AppName KeyStorePass\n\n"

read -p "Continue? Options:[y,n] " response
if [[ $response == "n" ]]; then
  printf "Cancelled.\n"
  exit
elif [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  printf "Wrong number of arguments.\n"
  exit
elif [[ $response == "y" ]]; then

  workdir=$1
  appname=$2
  mpass=$3

  SDK="${HOME}/development/android/cli-build/86/android-sdk-linux_x86"
  BUILD_TOOLS="${SDK}/build-tools-21"
  PLATFORM="${SDK}/android-9"

  mkdir -p $workdir/build/gen $workdir/build/obj $workdir/build/apk
  printf "\nbuild directories created...\n"

  "${BUILD_TOOLS}/aapt" package -f -m -J $workdir/build/gen/ -S $workdir/res \
  -M $workdir/AndroidManifest.xml -I "${PLATFORM}/android.jar"
  printf "aapt success...\n"

  javac -source 1.7 -target 1.7 -bootclasspath "${JAVA_HOME}/jre/lib/rt.jar" \
  -classpath "${PLATFORM}/android.jar" -d $workdir/build/obj \
  $workdir/build/gen/com/crazyj36/$appname/R.java $workdir/java/com/crazyj36/$appname/MainActivity.java

  if [ ! $? == 0 ]; then
    printf "Couldn't build java source files.\n"
    exit
  else
    printf "javac R.java built...\n"

    "${BUILD_TOOLS}/dx" --dex --output=$workdir/build/apk/classes.dex $workdir/build/obj/
    printf "classes.dex built...\n"

    "${BUILD_TOOLS}/aapt" package -f -M $workdir/AndroidManifest.xml -S $workdir/res/ -I "${PLATFORM}/android.jar" \
    -F $workdir/build/$appname.unsigned.apk $workdir/build/apk/
    printf "aapt success...\n"

    "${BUILD_TOOLS}/zipalign" -f 4 $workdir/build/$appname.unsigned.apk $workdir/build/$appname.aligned.apk
    printf "zipalign success...\n"

    # apksigner should be available directly in newer sdks. If you have it use here "${BUILD_TOOLS}/apksigner" instead of "apksigner"
    "apksigner" sign --ks $HOME/development/android/keystore/keystore.jks \
    --ks-key-alias CrazyJ36DevKey --ks-pass pass:$mpass --out $workdir/build/$appname.apk \
    $workdir/build/$appname.aligned.apk
    printf "apk signed...\n"

    "${SDK}/platform-tools-21/adb" install -r $workdir/build/$appname.apk
    printf "apk installed...\n"

    "${SDK}/platform-tools-21/adb" shell am start -n com.crazyj36.$appname/.MainActivity
  fi
fi
