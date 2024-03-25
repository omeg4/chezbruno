#!/bin/nu
#

lsblk -o NAME,SIZE,MODEL,FSTYPE,UUID,MOUNTPOINT,LABEL,PARTLABEL -J | from json | get blockdevices | get children

