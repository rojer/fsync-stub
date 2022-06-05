#!/bin/bash

set -e -x

ARCH=`gcc -print-multiarch`
gcc -fPIC -nodefaultlibs -shared -o libfsync-stub.so.$ARCH fsync-stub.c
# gcc docker does not support i386
# if [ $ARCH = "x86_64-linux-gnu" ]; then 
#   gcc -m32 -fPIC -nodefaultlibs -shared -o libfsync-stub.so.i386-linux-gnu fsync-stub.c
# fi
gcc -Wall -o fsync-test fsync-test.c

LD_PRELOAD=`pwd`/libfsync-stub.so.$ARCH ./fsync-test && echo Ok
