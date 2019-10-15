#!/bin/bash
#set -x
echo "building newlisp..."
. ../setup_ndk.sh $1 $2 $3
cat configure
./configure --help
./configure --host=i686-linux-android # --without-readline -with-qt=no --without-cairo 
make -j 4 
ls -lrt 
cd src
ls -lrt
$STRIP newlisp
zip -u ../newlisp-$VERSION_NO-android-$COMPILER_TARGET-bin.zip newlisp
ls -lrt
#- ./newlisp -v
cd ..
