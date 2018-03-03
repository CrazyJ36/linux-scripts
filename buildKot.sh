#!/bin/bash
file=$1
kotlinc $file.kt -include-runtime -d $file.jar
