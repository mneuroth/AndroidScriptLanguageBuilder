#!/bin/bash
#set -x
echo "building ECL..."
. ../setup_ndk.sh $1 $2 $3
export LDFLAGS="--sysroot=${SYSROOT} -D__ANDROID_API__=26 -fuse-ld=bfd"
export CPPFLAGS="--sysroot=${SYSROOT} -D__ANDROID_API__=26 -isystem ${SYSROOT}/usr/include/arm-linux-androideabi"
./configure --host=arm-linux-androideabi --prefix=`pwd`/ecl-android --disable-c99complex --with-cross-config=`pwd`/src/util/android-arm.cross_config
make 
ls -lrt
ls -lrt build
ls -lrt src
$STRIP build/ecl
cd build
zip -u ecl-$VERSION_NO-android-$COMPILER_TARGET-bin.zip ecl
ls -lrt
#- ./ecl -v
cd ..
cd ..
