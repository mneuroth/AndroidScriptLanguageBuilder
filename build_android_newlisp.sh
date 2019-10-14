#!/bin/bash
#set -x
echo "building newlisp..."
. /home/travis/build/mneuroth/AndroidScriptLanguageBuilder/setup_ndk.sh $1 $2 $3
#export CFLAGS="-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -mstackrealign -fno-addrsig -fPIC "
./configure # --host=i686-linux-android --without-readline -with-qt=no --without-cairo 
make -j 4 
ls -lrt 
cd src
ls -lrt
$STRIP newlisp
zip -u ../newlisp-$VERSION_NO-android-$COMPILER_TARGET-bin.zip newlisp
ls -lrt
#- ./newlisp -v
cd ..
