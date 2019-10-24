#!/bin/bash
#set -x
echo "building tcl..."
. ../../setup_ndk.sh $1 $2 $3
export AR=$2"-ar"
./configure --host=$2 --build=i686-pc-linux # --disable-shared
echo "============================"
make -j 4 || true   # ignore build error when cross compiling
ls -lrt
$STRIP tclsh
ls -lrt
zip -u ../../tcl-$lVERSION_NO-android-$COMPILER_TARGET-bin.zip tclsh libtcl8.6.so
ls -lrt
#./tclsh
