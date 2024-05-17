#!/bin/nu
#

lsblk -lJo NAME,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT,LABEL,PARTLABEL,PARTUUID |
from json |
get blockdevices

