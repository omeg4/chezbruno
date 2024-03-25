#!/bin/bash
#
# TODO: test non-premium downloads; replace pornhubpremium.com with pornhub.com to differentiate videos from pornhub.com with PREMIUM videos

URL=$QUTE_URL
if [[ "$URL" == *"spankbang"* ]]; then
	SRC='SBDL'
elif [[ "$URL" == *"pornhubpremium"* ]]; then
	SRC='PHPDL'
elif [[ "$URL" == *"pornhub"* ]]; then
	SRC='PHDL'
fi
cd /mnt/sgext/stuff
youtube-dl --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' -o "%(uploader)s__%(title)s__$SRC.%(ext)s" --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata "$URL"
