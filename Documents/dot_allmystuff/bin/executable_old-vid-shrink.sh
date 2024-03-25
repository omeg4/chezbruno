#!/bin/bash
#

trap printout SIGINT
printout() {
	echo "stopping downscale!"
	exit 2
}

# parse args for either an explicit list of files or to just loop for all in directory
# RUNTYPE="$1"
# case $RUNTYPE in
#     -f)

# esac
DIR=$(pwd)
echo $DIR

for vidin in $(find $DIR -type f -iregex ".*/1080p_.*" -not -iregex ".*_720p.*" -exec ls -S {} + ;); do
	echo "================================================================================"
	echo 'Shrinking video file '$vidin
	echo "================================================================================"
	# store the 1080p file size
	OLDSIZE=$(du -hcx "$vidin" | awk ' { print $1 } ' | head -n 1)
	# Split the file name at the extension for renaming
	filebase=$(basename $vidin)
	fnme="${filebase:6:-4}"
	fext="${filebase: -4}"

	# Known location of input file
	vidloc=$vidin

	# Full path of output file
	vidout=$fnme'_720p'$fext

	# ffmpeg -i "$vidloc" -vf scale=-1:720 -c:v libx264 -crf 18 -c:a copy "$vidout"
	ffmpeg -i "$vidloc" -vf scale=-1:720 -c:v libx264 -c:a copy "$vidout"
	if [ $? -ne 0 ]; then
		echo "downscale failed, deleting output file $vidout" >> /mnt/sgext/crops/vid-shrink-log.txt
		rm -v -f "$vidout"
		break
	else
		NEWSIZE=$(du -hcx "$vidout" | awk ' { print $1 } ' | head -n 1)
		echo "$vidin"	"$OLDSIZE"	"$NEWSIZE" >> /mnt/sgext/crops/vid-shrink-log.txt
		echo "downscale successful, deleting original file $vidloc" >> /mnt/sgext/crops/vid-shrink-log.txt
		rm -v -f "$vidloc"
	fi
	# awesome-client 'require("naughty").notify({ title = "Video downscale complete!", timeout = 30, ontop = true, border_color = "#FF0000", width = 300, height = 150, screen = 1 })'
	sleep 30
done
