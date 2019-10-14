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
#echo $COMPILER_TARGET
#echo $SYSCFLAGS 
#echo $MYCFLAGS
#make echo
make posix 
ls -lrt 
cd src
#make echo
#- cat Makefile
ls -lrt
$STRIP lua 
$STRIP luac 
zip -u ../lua-android-$COMPILER_TARGET-bin.zip lua luac
ls -lrt
#- ./lua -v
cd ..
