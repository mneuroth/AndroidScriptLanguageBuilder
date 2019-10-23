#!/bin/bash
#set -x
echo "building scheme48..."
. ../setup_ndk.sh $1 $2 $3
./configure --help
echo "============================"
#./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
./configure --host=arm-linux-eabi --build=i686-pc-linux
echo "============================"
sed -i 's/CC = gcc/#CC = gcc/g' Makefile
sed -i 's/LD = gcc/#LD = gcc/g' Makefile
sed -i 's/-shared  -rdynamic/-shared /g' Makefile
cat Makefile
make -j 4 # || true   # ignore build error when cross compiling
ls -lrt
$STRIP scheme48vm
ls -lrt
zip -u ../scheme48-$VERSION_NO-android-$COMPILER_TARGET-bin.zip scheme48vm scheme48.image
ls -lrt
#- ./scheme48
cd .. 
