#!/bin/bash
#set -x
echo "building newLISP..."
. ../setup_ndk.sh $1 $2 $3
cp ../newlisp.patch/makefile_android .
#ls -lrt
#cat configure
#cat makefile_linux
#./configure
make -f makefile_android
#ls -lrt 
#$STRIP newlisp
zip -u newlisp-$VERSION_NO-android-$COMPILER_TARGET-bin.zip newlisp
ls -lrt
#- ./newlisp -v
cd ..
