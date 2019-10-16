#!/bin/bash
#set -x
echo "building ECL..."
. ../setup_ndk.sh $1 $2 $3
./configure
make 
ls -lrt 
$STRIP ecl
zip -u ecl-$VERSION_NO-android-$COMPILER_TARGET-bin.zip ecl
ls -lrt
#- ./ecl -v
cd ..
