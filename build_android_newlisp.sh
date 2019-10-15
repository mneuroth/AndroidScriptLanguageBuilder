#!/bin/bash
#set -x
echo "building newlisp..."
. ../setup_ndk.sh $1 $2 $3
cat configure
cat makefile_linux
./configure
make -j 4 
ls -lrt 
$STRIP newlisp
zip -u newlisp-$VERSION_NO-android-$COMPILER_TARGET-bin.zip newlisp
ls -lrt
#- ./newlisp -v
cd ..
