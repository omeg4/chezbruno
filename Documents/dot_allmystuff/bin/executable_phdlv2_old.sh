#!/bin/bash
#

cd /mnt/sgext/stuff
URL=${QUTE_URL:=$1}

phpdl () {
	/usr/bin/yt-dlp --base --argfmt='PHPDL' "$1" || /usr/bin/yt-dlp --base --ofmt "$1"
}

phdl () {
	/usr/bin/yt-dlp --base --argfmt="$1" "$2"
}

phdlvrb () {
	/usr/bin/yt-dlp --bdbg --verbose --argfmt="$1" "$2"
}

sbdl () {
	/usr/bin/yt-dlp --spbg --argfmt="$1" "$2"
}

if [[ "$URL" == *"spankbang"* ]]; then
	sbdl "SBDL" "$URL"
	# echo "phdlvrb" && phdlvrb "SBDL" "$URL"
elif [[ "$URL" == *"pornhubpremium.com"* ]]; then
	phpdl "$URL"
elif [[ "$URL" == *"pornhub.com"* ]]; then
	phdl "PHDL" "$URL"
	# echo "DEBUG: phdlvrb" && phdlvrb "PHDL" "$URL"
elif [[ "$URL" == *"xvideos.com"* ]]; then
	phdl "XVDL" "$URL"
elif [[ "$URL" == *"porntrex"* ]]; then
	phdl "PTXDL" "$URL"
elif [[ "$URL" == *"xhamster.com"* ]]; then
	phdl "XHAMDL" "$URL"
elif [[ "$URL" == *"mydirtyhobby"* ]]; then
	phdl "MDHDL" "$URL"
else
	phdl "RNDL" "$URL"
fi
