#!/bin/bash
#set -x
echo "building tcl..."
. ../../setup_ndk.sh $1 $2 $3
export AR=$2"-ar"
#./configure --help
#echo "============================"
#./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
./configure --host=$2 --build=i686-pc-linux # --disable-shared
echo "============================"
#sed -i 's/CC = gcc/#CC = gcc/g' Makefile
#sed -i 's/LD = gcc/#LD = gcc/g' Makefile
#sed -i 's/-shared  -rdynamic/-shared /g' Makefile
#sed -i 's/LIBS = -lnsl -ldl -lm/LIBS = -ldl -lm/g' Makefile 
#cat Makefile
make -j 4 || true   # ignore build error when cross compiling
ls -lrt
$STRIP tclsh
ls -lrt
zip -u ../../tcl-$lVERSION_NO-android-$COMPILER_TARGET-bin.zip tclsh libtcl8.6.so
ls -lrt
#./tclsh
#cd .. 
