#!/bin/bash
#set -x
echo "building tcl..."
. ../setup_ndk.sh $1 $2 $3
./configure --help
echo "============================"
#./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
./configure --host=$2 --build=i686-pc-linux
echo "============================"
#sed -i 's/CC = gcc/#CC = gcc/g' Makefile
#sed -i 's/LD = gcc/#LD = gcc/g' Makefile
#sed -i 's/-shared  -rdynamic/-shared /g' Makefile
#sed -i 's/LIBS = -lnsl -ldl -lm/LIBS = -ldl -lm/g' Makefile 
cat Makefile
make -j 4 || true   # ignore build error when cross compiling
ls -lrt
$STRIP tcl
ls -lrt
zip -u ../tc-$lVERSION_NO-android-$COMPILER_TARGET-bin.zip tcl
ls -lrt
#- ./tcl
cd .. 
