#!/bin/bash
#
# TODO: test non-premium downloads; replace pornhubpremium.com with pornhub.com to differentiate videos from pornhub.com with PREMIUM videos

cd /mnt/sgext/stuff
URL=$QUTE_URL

phprem () {
	/usr/bin/youtube-dl --verbose --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata -o "%(uploader)s__%(title)s__PHDL.%(ext)s" "${1/pornhubpremium/pornhub}" || /usr/bin/youtube-dl --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata -o "%(uploader)s__%(title)s__PHPDL.%(ext)s" "$1" || /usr/bin/youtube-dl --verbose --download-archive '/mnt/sgext/info/dlrx.txt' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched "$1"
}

ytprem () {
	/usr/bin/youtube-dl --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata -o "%(uploader)s__%(title)s__$1.%(ext)s" "$2"
}

sbdl () {
	/usr/bin/youtube-dl --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched --add-metadata -o "%(uploader)s__%(title)s_%(id)s__$1.%(ext)s" "$2"
}

testfull () {
	/usr/bin/youtube-dl --verbose --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched -o "%(uploader)s__%(title)s__PHPDL.%(ext)s" "$1"
}

testreplaceurl () {
	/usr/bin/youtube-dl --verbose --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched -o "%(uploader)s__%(title)s__PHDL.%(ext)s" "${1//pornhubpremium/pornhub}"
}

freenocookies () {
	/usr/bin/youtube-dl --verbose --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --retries='infinite' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime -c --no-progress --restrict-filenames --mark-watched -o "%(uploader)s__%(title)s__PHDL.%(ext)s" "${1//pornhubpremium/pornhub}"
}

testnotitle () {
	/usr/bin/youtube-dl --verbose --external-downloader axel --external-downloader-args '-n 10 -q' --download-archive '/mnt/sgext/info/dlrx.txt' --cookies '/mnt/sgext/info/cookies.txt' -u 'smutthrowaway1234' -p 'flcutters28' -f 'best[height=720]/best' --no-mtime --no-progress --restrict-filenames --mark-watched "$URL"
}

if [[ "$URL" == *"spankbang"* ]]; then
	sbdl SBDL "$URL"
elif [[ "$URL" == *"pornhubpremium.com"* ]]; then
	phprem "$URL"
	# testfull "$URL"
	# testreplaceurl "$URL"
	# freenocookies "$URL"
	# testnotitle "$URL"
elif [[ "$URL" == *"pornhub.com"* ]]; then
	ytprem PHDL "$URL"
elif [[ "$URL" == *"xvideos.com"* ]]; then
	ytprem XVDL "$URL"
elif [[ "$URL" == *"mydirtyhobby"* ]]; then
	ytprem MDHDL "$URL"
else
	ytprem RNDL "$URL"
fi
