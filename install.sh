#!/bin/bash

set -e

INSTALL_DIR='/usr/local'
PRELOAD_CFG='/etc/ld.so.preload'
LIB='libfsync-stub.so'

for arch in i386-linux-gnu x86_64-linux-gnu aarch64-linux-gnu; do
  file="$LIB.$arch"
  dest_dir="$INSTALL_DIR/lib/$arch"
  dest_file="$INSTALL_DIR/lib/$arch/$LIB"
  chmod 644 "$file"
  mkdir -p "$dest_dir"
  cp -f "$file" "${dest_file}.copy"
  mv -f "${dest_file}.copy" "$dest_file"
done

if ! [ -f "$PRELOAD_CFG" ] || ! grep -q "/$LIB" "$PRELOAD_CFG"; then
  echo >> "$PRELOAD_CFG"
  echo "$INSTALL_DIR/\$LIB/$LIB" >> "$PRELOAD_CFG"
  echo "Updated $PRELOAD_CFG"
fi
