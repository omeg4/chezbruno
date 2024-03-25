#!/usr/bin/fish
#

set -l rbpn $argv[1..] 
argparse --min-args=1 --name=my_rbps -- $argv
or return

set DEVICE (ratbagctl list | awk -F: '{ print $1 }')

echo "$DEVICE -> profile $rbpn"

ratbagctl "$DEVICE" profile active set "$rbpn"
