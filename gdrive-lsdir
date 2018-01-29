#!/bin/bash
# This is an addon for gdrive making it easier to kist directories.
# Just type ./gdrive-lsdir <id>
# The dir <id> is gotten from 'gdrive list'
id=$1
echo $id
gdrive list --query " '$id' in parents "
