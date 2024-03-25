#!/bin/sh

# https://git.dec05eba.com/gpu-screen-recorder/tree/scripts/start-replay.sh
video_path="$HOME/Videos"
mkdir -p "$video_path"
gpu-screen-recorder -w screen -f 60 -a "$(pactl get-default-sink).monitor" -c mp4 -r 30 -o "$video_path"

