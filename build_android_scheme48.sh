#!/bin/bash
#set -x
echo "building scheme48..."
. ../setup_ndk.sh $1 $2 $3
./configure --help
./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
echo "============================"
cat src/Makefile
make -j 4 # || true   # ignore build error when cross compiling
ls -lrt
$STRIP scheme48
zip -u ../../scheme48-$VERSION_NO-android-$COMPILER_TARGET-bin.zip scheme48 scheme48vm scheme48.image
ls -lrt
#- ./scheme48
cd .. 
