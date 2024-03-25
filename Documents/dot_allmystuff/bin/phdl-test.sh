#!/bin/bash
#

cd /mnt/sgext/stuff

XDL=""
LOGIN=""
COOKIES=""

for ARG in "$@"; do
	case $ARG in
		-u=*)
			URL=${ARG#*=}
			FURL=${URL//pornhubpremium/pornhub}
			;;
		-x)
			XDL="--external-downloader axel --external-downloader-args '-n 10 -q'"
			;;
		-l)
			LOGIN="-u 'smutthrowaway1234' -p 'flcutters28'"
			;;
		-c)
			COOKIES="--cookies '/mnt/sgext/info/cookies.txt'"
			;;
		-f)
			FLGS="-c --restrict-filenames --mark-watched"
			;;
		-m)
			META="--add-metadata"
			;;
		-o=*)
			OUTARG=${ARG#*=}
			case $OUTARG in
				n)
					FOUT="%(uploader)s__%(title)s__PHDL.%(ext)s"
					;;
			esac
	esac
done

FCMD="youtube-dl $XDL --download-archive '/mnt/sgext/info/dlrx.txt' $LOGIN $COOKIES -f 'best[height=720]/best' --no-mtime --no-progress --restrict-filenames $FLGS $META -o $FOUT $URL > /dev/null 2>&1 &"
echo "$FCMD" && eval $FCMD
if [ $? -ne 0 ]; then echo "full premium command successful!"; else echo "full premium command failed!"; fi
FFCMD="youtube-dl $XDL --download-archive '/mnt/sgext/info/dlrx.txt' $LOGIN $COOKIES -f 'best[height=720]/best' --no-mtime --no-progress --restrict-filenames $FLGS $META -o $FOUT $FURL > /dev/null 2>&1 &"
SHCMD="youtube-dl $XDL --download-archive '/mnt/sgext/info/dlrx.txt' $LOGIN $COOKIES -f 'best[height=720]/best' --no-mtime --no-progress --restrict-filenames $FLGS $META -o $FOUT $URL > /dev/null 2>&1 &"
