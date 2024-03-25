#!/bin/bash
#

trap printout SIGINT
printout() {
	echo "stopping downscale!"
	exit 2
}

# Default argument values
NVIDS=10
DDIR="/mnt/sgext/stuff/"
APND=""
KEEP=false
CPUPCT=1000
i=1

for ARG in "$@"; do
	case $ARG in
		-n=*)
			NVIDS=${ARG#*=}
			;;
		-d=*)
			DDIR=${ARG#*=}
			;;
		-a=*)
			APND="_${ARG#*=}"
			;;
		-k)
			KEEP=true
			;;
    -l=*)
      CPUPCT=${ARG#*=}
      ;;
	esac
done

# parse args for either an explicit list of files or to just loop for all in directory
# RUNTYPE="$1"
# case $RUNTYPE in
#     -f)

# esac
DIR=$(pwd)
echo "Shrinking $NVIDS videos in $DIR"

echo "DDIR=$DDIR"
echo "APND=$APND"
echo "KEEP=$KEEP"

# find $DIR -type f -not -iregex ".*shrink.*" -exec ls -S {} | head -n 10
for vidin in $(ls -S | grep -v "_shrink" | head -$NVIDS); do
	# store the 1080p file size
	OLDSIZE=$(du -hcx "$vidin" | awk ' { print $1 } ' | head -n 1)

	# Parse file resolution and bitrate
	VIDINFO=$(mediainfo --Output="Video;%Width%:%Height%:%BitRate%:%BitRate_Minimum%:%BitRate_Maximum%" "$vidin")
	VINFARR=(${VIDINFO//:/ })

	# Split the file name at the extension for renaming
	filebase="$(basename $vidin)"
	filebase="${filebase//1080p_/}" # Handles any filename
	fnme="${filebase:0:-4}"
	# fnme="${filebase:6:-4}"
	fext="${filebase: -4}"

	# Known location of input file
	vidloc="$vidin"

	# Full path of output file
	vidout="$fnme""$APND"'_shrink.mp4'

	# echo "IN:  $vidin"
	# echo "OUT: $vidout"
	echo "! ================================================================================"
	echo "Shrinking video file $i of $NVIDS: $vidin"

	if [ ${VINFARR[0]} -gt ${VINFARR[1]} ]; then
		echo "landscape"
		cpulimit -l $CPUPCT ffmpeg -loglevel error -i "$vidloc" -vf scale=-2:540 -b:v 1.5M -maxrate 1.5M -bufsize 500k "$vidout" &&
			NEWSIZE=$(du -hcx "$vidout" | awk ' { print $1 } ' | head -n 1) &&
			echo "$vidin"	"$OLDSIZE"	"$NEWSIZE" >> /mnt/sgext/crops/vid-shrink-log.txt &&
			echo "downscale successful, deleting original file $vidloc" >> /mnt/sgext/crops/vid-shrink-log.txt &&
			# echo "moving file $vidout to $DDIR" &&
			mv "$vidout" "$DDIR$vidout" &&
			echo "OLDSIZE: $OLDSIZE -- NEWSIZE: $NEWSIZE" &&
			$KEEP || rm -f "$vidin"
	else
		echo "portrait"
		cpulimit -l $CPUPCT ffmpeg -loglevel error -i "$vidloc" -vf scale=540:-2 -b:v 1.5M -maxrate 1.5M -bufsize 500k "$vidout" &&
			NEWSIZE=$(du -hcx "$vidout" | awk ' { print $1 } ' | head -n 1) &&
			echo "$vidin"	"$OLDSIZE"	"$NEWSIZE" >> /mnt/sgext/crops/vid-shrink-log.txt &&
			echo "downscale successful, deleting original file $vidloc" >> /mnt/sgext/crops/vid-shrink-log.txt &&
			# echo "moving file $vidout to $DDIR" &&
			mv "$vidout" "$DDIR$vidout" &&
			echo "OLDSIZE: $OLDSIZE -- NEWSIZE: $NEWSIZE" &&
			$KEEP || rm -f "$vidin"
	fi

	((i++))
	sleep 5
done

