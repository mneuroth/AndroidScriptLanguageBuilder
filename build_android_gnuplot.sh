#!/bin/sh

export PATH="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
export COMPILER_TARGET=$1
export TOOLS_TARGET=$2
export CC=$COMPILER_TARGET"26-clang"
export LD=$TOOLS_TARGET"-ld"
export AR=$TOOLS_TARGET"-ar rcu"
export RANLIB=$TOOLS_TARGET"-ranlib"
export STRIP=$TOOLS_TARGET"-strip"
export MYCFLAGS="-fPIC"
export MYLDFLAGS="-pie"
export CFLAGS="-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -mstackrealign -fno-addrsig -fPIC "
./configure --host=i686-linux-android --without-readline -with-qt=no --without-cairo 
make -j 4 || true   # ignore build error when cross compiling
ls -lrt 
cd src
ls -lrt
$STRIP gnuplot
cp ../../gnuplot.gih .
zip -u ../gnuplot-android-$COMPILER_TARGET-bin.zip gnuplot gnuplot.gih
ls -lrt
#- ./gnuplot -v
cd ..
