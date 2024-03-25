#!/bin/bash
#

DEVICE=$(ratbagctl list | grep -oP '^\S+')

PROFILE=$(ratbagctl booming-agouti profile active get)
RESO=$(ratbagctl booming-agouti resolution active get)
DPI=$(ratbagctl booming-agouti dpi get)
RATE=$(ratbagctl booming-agouti rate get)

echo "Device:     $DEVICE"
echo "Profile:    $PROFILE"
echo "Resolution: $RESO"
echo "DPI:        $DPI"
echo "Rate:       $RATE"
