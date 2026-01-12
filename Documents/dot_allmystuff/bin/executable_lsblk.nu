#!/bin/nu
#

# TODO: Add input flag to echo command

lsblk -lJo MODEL,FSTYPE,NAME,SIZE,MOUNTPOINT,LABEL,PARTLABEL,UUID |
from json |
get blockdevices |
sort-by 'name'

