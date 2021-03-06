#!/bin/bash
echo "SETUP_NDK now..."
export PATH="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
export COMPILER_TARGET=$1
export TOOLS_TARGET=$2
export VERSION_NO=$3
export CC=$COMPILER_TARGET"26-clang"
export LD=$TOOLS_TARGET"-ld"
export AR=$TOOLS_TARGET"-ar rcu"
export RANLIB=$TOOLS_TARGET"-ranlib"
export STRIP=$TOOLS_TARGET"-strip"
export MYCFLAGS="-fPIC"
export MYLDFLAGS="-pie"
echo "SETUP_NDK done."
