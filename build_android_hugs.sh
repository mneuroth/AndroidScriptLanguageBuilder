#!/bin/bash
#set -x
echo "building hugs98..."
. ../setup_ndk.sh $1 $2 $3
#export CFLAGS="-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -mstackrealign -fno-addrsig -fPIC "
./configure --help
./configure --host=$2 --build=i386-linux # --without-readline 
cat src/Makefile
make -j 4 || true   # ignore build error when cross compiling
ls -lrt 
cd src
ls -lrt
$STRIP hugs
$STRIP runhugs
zip -u ../../hugs98-plus-$VERSION_NO-android-$COMPILER_TARGET-bin.zip hugs runhugs
ls -lrt
#- ./hugs -v
cd .. 
ls -lrt