#!/bin/bash

set -e -x

gcc -fPIC -nodefaultlibs -shared -o libfsync-stub.so.i386-linux-gnu fsync-stub.c
gcc -m32 -fPIC -nodefaultlibs -shared -o libfsync-stub.so.x86_64-linux-gnu fsync-stub.c
gcc -Wall -o fsync-test fsync-test.c

LD_PRELOAD=`pwd`/libfsync-stub.so.'$LIB' ./fsync-test && echo Ok
