#!/bin/bash

set -e -x

INSTALL_DIR='/usr/local/lib'
PRELOAD_CFG='/etc/ld.so.preload'
LIB='libfsync-stub.so'
DEST_FILE="$INSTALL_DIR/$LIB"

[ -d "$INSTALL_DIR" ] || mkdir "$INSTALL_DIR"

chmod 644 "$LIB"
cp -f "$LIB" "${DEST_FILE}.copy"
mv -f "${DEST_FILE}.copy" "$DEST_FILE"

if ! [ -f "$PRELOAD_CFG" ] || ! grep -q "$DEST_FILE" "$PRELOAD_CFG"; then
  echo >> "$PRELOAD_CFG"
  echo "$DEST_FILE" >> "$PRELOAD_CFG"
  echo "Installed"
else
  echo "Already installed"
fi
