#!/bin/bash
#set -x
echo "building hugs98..."
. ../setup_ndk.sh $1 $2 $3
#export CFLAGS="-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -mstackrealign -fno-addrsig -fPIC "
./configure --help
./configure --help --host
./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
cat src/Makefile
# after building for the host, patch sources for android
sed -i 's/CC		= gcc/#CC		= gcc/g' src/Makefile
sed -i 's/CC		= gcc/#CC		= gcc/g' src/Makefile
sed -i 's/LD		= ld/#LD		= ld/g' src/Makefile
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