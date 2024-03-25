#!/bin/bash
#

SRC_DIR='/mnt/sgext/mv2piext'
DEST_DIR='/mnt/piext/stuff/sgextoverflow/'

rsync -avz --progress --remove-source-files "$SRC_DIR/*" "$DEST_DIR"
