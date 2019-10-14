#!/bin/bash
source ./setup_ndk.sh $1 $2 $3 $4 $5
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
zip -u ../lua-$VERSION_NO-android-$COMPILER_TARGET-bin.zip lua luac
ls -lrt
#- ./lua -v
cd ..
