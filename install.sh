#!/bin/bash

set -e

INSTALL_DIR='/usr/local/lib'
PRELOAD_CFG='/etc/ld.so.preload'
LIB='libfsync-stub.so'

[ -d "$INSTALL_DIR" ] || mkdir "$INSTALL_DIR"

for arch in x86_64 i686; do
  file="${LIB}.${arch}"
  dest_file="$INSTALL_DIR/$file"
  chmod 644 "$file"
  cp -v -f "$file" "${dest_file}.copy"
  mv -v -f "${dest_file}.copy" "$dest_file"
done

if ! [ -f "$PRELOAD_CFG" ] || ! grep -q "$INSTALL_DIR/$LIB.\$PLATFORM" "$PRELOAD_CFG"; then
  echo >> "$PRELOAD_CFG"
  echo "$INSTALL_DIR/$LIB.\$PLATFORM" >> "$PRELOAD_CFG"
  echo "Updated $PRELOAD_CFG"
fi
