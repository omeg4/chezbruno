#!/bin/bash
#

# see also ~/.config/yt-dlp/config

URL=${QUTE_URL:=$1}

if [[ "$URL" == *"spankbang"* ]]; then
	DLARG='SBDL_PROAM'
elif [[ "$URL" == *"pornhubpremium.com"* ]]; then
	DLARG='PHPDL'
elif [[ "$URL" == *"pornhub.com"* ]]; then
	DLARG='PHDL_PROAM'
elif [[ "$URL" == *"xvideos.com"* ]]; then
	DLARG='XVDL_PROAM'
elif [[ "$URL" == *"porntrex"* ]]; then
	DLARG='PTXDL_PROAM'
elif [[ "$URL" == *"xhamster.com"* ]]; then
	DLARG='XHAMDL_PROAM'
elif [[ "$URL" == *"mydirtyhobby"* ]]; then
	DLARG='MDHDL_PROAM'
else
	DLARG='RNDL'
fi

yt-dlp --verbose --qutecook --mark-watched --argfmt="$DLARG" "$URL"
