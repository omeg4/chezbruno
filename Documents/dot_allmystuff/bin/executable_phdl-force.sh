#!/bin/bash

/usr/bin/youtube-dl --external-downloader axel --external-downloader-args '-n 10 -q' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' -o '/mnt/sgext/stuff/%(uploader)s__%(title)s__PHPDL.%(ext)s' --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata "$QUTE_URL"
