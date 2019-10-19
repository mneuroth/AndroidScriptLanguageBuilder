#!/bin/bash
#set -x
echo "building ECL..."
. ../setup_ndk.sh $1 $2 $3
export AR=$2"-ar"
export LDFLAGS="--sysroot=${SYSROOT} -D__ANDROID_API__=26 -fuse-ld=bfd"
export CPPFLAGS="--sysroot=${SYSROOT} -D__ANDROID_API__=26 -isystem ${SYSROOT}/usr/include/arm-linux-androideabi"
./configure --host=$2 --prefix=`pwd`/ecl-android --disable-c99complex --with-cross-config=`pwd`/src/util/android-arm.cross_config
make -j 4
ls -lrt
ls -lrt build
ls -lrt build/bin
ls -lrt build/ecl
cd build/bin
$STRIP ecl
zip -u ../../../ecl-$VERSION_NO-android-$COMPILER_TARGET-bin.zip ecl
cd ..
zip -u ../../ecl-$VERSION_NO-android-$COMPILER_TARGET-bin.zip *.so
#- ./ecl -v
cd ..
cd ..
