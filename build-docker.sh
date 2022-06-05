#!/bin/bash

set -e -x

for arch in amd64 arm64 
do
  docker run --platform linux/$arch --rm -it \
           -v $PWD:/code \
           gcc \
           bash -c "cd /code; ./build.sh"
done
