#!/bin/nu
#

# TODO: Add input flag to echo command

lsblk -lJo NAME,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT,LABEL,PARTLABEL,PARTUUID |
from json |
get blockdevices |
sort-by 'name'

