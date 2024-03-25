#!/bin/sh -e

# https://git.dec05eba.com/gpu-screen-recorder/tree/scripts/save-replay.sh
killall -SIGUSR1 gpu-screen-recorder
notify-send -t 5000 -u low -- "GPU Screen Recorder" "Replay saved"

