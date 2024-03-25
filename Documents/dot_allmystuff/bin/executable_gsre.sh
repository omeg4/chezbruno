#!/bin/sh -e

# https://git.dec05eba.com/gpu-screen-recorder/tree/scripts/replay.sh
[ "$#" -ne 4 ] && echo "usage: replay.sh <window_id> <fps> <replay_time_sec> <output_directory>" && exit 1
active_sink="$(pactl get-default-sink).monitor"
mkdir -p "$4"
gpu-screen-recorder -w "$1" -c mp4 -f "$2" -a "$active_sink" -r "$3" -o "$4"
