#!/bin/bash

set -e -x

gcc -fPIC -nodefaultlibs -shared -o libfsync-stub.so fsync-stub.c
gcc -Wall -o fsync-test fsync-test.c
LD_PRELOAD=`pwd`/libfsync-stub.so ./fsync-test && echo Ok

