#!/bin/bash
#set -x
echo "building swipl..."
. ../../setup_ndk.sh $1 $2 $3
#export AR=$2"-ar"
#./configure --host=$2 --build=i686-pc-linux # --disable-shared
#echo "============================"
cmake  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake -DANDROID_ABI=$1 -DINSTALL_DOCUMENTATION=OFF -DUSE_GMP=ON -DSWIPL_INSTALL_IN_LIB=ON -DSWIPL_PACKAGES_BDB=OFF -DSWIPL_PACKAGES_ODBC=OFF -DSWIPL_PACKAGES_QT=OFF -DSWIPL_PACKAGES_X=OFF ..
make -j 4 # || true   # ignore build error when cross compiling
ls -lrt
cd src
ls -lrt 
$STRIP swipl
ls -lrt
zip -u ../../swipl-$VERSION_NO-android-$COMPILER_TARGET-bin.zip swipl libswipl.so.$3
ls -lrt
#./swipl
cd ..
