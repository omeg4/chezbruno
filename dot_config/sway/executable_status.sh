#!/bin/bash
#

# https://unix.stackexchange.com/questions/473788/simple-swaybar-example
uptime_formatted=$(uptime | cut -d ',' -f1 | cut -d ' ' -f4,5)

date_formatted=$(date "+%a %F %H:%M")

linux_version=$(uname -r | cut -d '-' -f1)

battery_status=$(cat /sys/class/power_supply/BAT1/status)
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo $uptime_formatted ↑ $linux_version 🐧 $battery_status: $battery_level"%" 🔋 $date_formatted

