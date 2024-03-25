#!/bin/sh
#

PTRN='-iregex ".*vert.*" \( -regex ".*tag.*" -o -iregex ".*godtier.*" -o -iregex ".*stier.*" \) \( -iregex ".*jpg" -o -iregex ".*png" \)'

for n in {1..4}; do
  eval "find /mnt/sgext/allpics/scmd/ -maxdepth 1 -type f $PTRN -exec feh -Tslides {} +" > /dev/null 2>&1 &
done
eval "find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iregex \".*notch.*\" $PTRN -exec feh -Tslides {} +" > /dev/null 2>&1 &
