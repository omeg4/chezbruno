#!/bin/zsh
#

find /mnt/sgext/OnlyFans/.sites/OnlyFans/Videos -type f -iname "*mp4" -exec ln -s {} /mnt/sgext/stuff/oflinks \; NUL

find /mnt/sgext/OnlyFans/.sites/OnlyFans/Videos -type f -iname "*paid*" -exec ln -s {} /mnt/sgext/stuff/oflinks/all_paid \; NUL

find /mnt/sgext/OnlyFans/.sites/OnlyFans/Videos -type f -iname "*mp4" -exec ln -s {} /mnt/sgext/stuff/oflinks \; NUL
