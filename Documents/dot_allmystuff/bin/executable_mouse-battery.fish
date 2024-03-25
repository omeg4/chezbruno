#!/usr/bin/fish
#

set BATT (solaar show | grep -aiE -A 1 -e 'battery voltage' | awk -F' ' '/Battery: [0-9]{2,3}%/ { print "BATT: ", $2 }')

echo $BATT
