#!/bin/nu
#

lsblk -lJo NAME,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT,LABEL,PARTLABEL |
from json |
get blockdevices

