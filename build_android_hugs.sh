#!/bin/bash
#set -x
echo "building hugs98..."
. ../setup_ndk.sh $1 $2 $3
#export CFLAGS="-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -mstackrealign -fno-addrsig -fPIC "
#./configure --help
#./configure --host=arm-linux-eabi --build=i686-pc-linux # --without-readline 
echo "============================"
cat src/Makefile
echo "============================"
cat src/config.h
# after building for the host, patch sources for android
sed -i 's/CC		= gcc/#CC		= gcc/g' src/Makefile
sed -i 's/CC		= gcc/#CC		= gcc/g' src/Makefile
sed -i 's/LD		= ld/#LD		= ld/g' src/Makefile
sed -i 's/#define HAVE_FTIME 1/#define HAVE_FTIME 0/g' src/config.h
sed -i 's/#define HAVE_SYS_TIMEB_H 1/#define HAVE_SYS_TIMEB_H 0/g' src/config.h
sed -i 's/S_IREAD /S_IRUSR/g' src/machdep.c
echo "============================"
cat src/config.h
make -j 4 # || true   # ignore build error when cross compiling
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