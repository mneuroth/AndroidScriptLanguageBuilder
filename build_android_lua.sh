#!/bin/sh

export PATH="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
export COMPILER_TARGET=$1
export CC=$COMPILER_TARGET"26-clang"
export LD=$COMPILER_TARGET"-ld"
export AR=$COMPILER_TARGET"-ar rcu"
export RANLIB=$COMPILER_TARGET"-ranlib"
export STRIP=$COMPILER_TARGET"-strip"
export MYCFLAGS="-fPIC"
export MYLDFLAGS="-pie"
#echo $COMPILER_TARGET
#echo $SYSCFLAGS 
#echo $MYCFLAGS
make echo
make posix 
ls -l 
cd src
make echo
#- cat Makefile
ls -l
$STRIP lua 
$STRIP luac 
zip -u ../lua-android-$COMPILER_TARGET-bin.zip lua luac
ls -l
#- ./lua -v
cd ..
