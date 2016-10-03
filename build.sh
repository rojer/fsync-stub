#!/bin/bash

set -e -x

gcc -fPIC -nodefaultlibs -shared -o libfsync-stub.so.x86_64 fsync-stub.c
gcc -m32 -fPIC -nodefaultlibs -shared -o libfsync-stub.so.i686 fsync-stub.c
gcc -Wall -o fsync-test fsync-test.c

LD_PRELOAD=`pwd`/libfsync-stub.so.x86_64 ./fsync-test && echo Ok
