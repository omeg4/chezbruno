#! /bin/bash
#

feh -. -L '%w %h %f' '*{'"$1"'}*' | awk '{ if ($1 > $2) { print $0 } }' | cut -d ' ' -f 3- | feh Tslides -f -
