#!/bin/bash
#
# run script to:
#	1) replace all spaces in filenames with underscore
# 	2) label aspect ratios of pictures
#	3) process videos w/ certain keywords in filename
#		3a)	ROTATEME = rotate 90 degrees
#		3b) SHRINKME = downscale video to 720p
#		3c) CROPMEWIDE/CROPMETALL = crop to 9:16 or 1:2 aspect ratio, respectively

# assume that any files w/ space in the name needs to be processed
IFS=$'\n'
TMP=($(ls | grep ' '))
unset IFS

# decide what processing to do right in this loop.
# replace spaces w/ _ then do whatever
# i guess for now just hard code each option but ideally we'd have dedicated scripts to do each thing once.
for FILE in "${TMP[@]}"; do
	NEWFILE="${FILE// /_}"
	mv -v --backup=t "$FILE" "$NEWFILE"
	case $NEWFILE in
		*jpg|*png)
			echo "this is a picture file. optimizing quality and labeling aspect ratio"
			# optipng -o 1 -log optiproc.log $NEWFILE
			optipng -zc 9 -zm 8 -zs 1 -f 5 -log optiproc.log $NEWFILE
			printf -v IAR "%.2f" $(identify -format "%[fx:w/h]" "$NEWFILE")
			FNAME="${NEWFILE:0:-4}"
			FEXT="${NEWFILE: -4}"
			if [[ $IAR < 0.57 ]]; then
				mv -v --backup=t $NEWFILE $FNAME'__ar-vert-sshot'$FEXT
			elif [[ $IAR > 0.56 ]] && [[ $IAR < 0.90 ]]; then
				mv -v --backup=t $NEWFILE $FNAME'__ar-vert'$FEXT
			elif [[ $IAR > 0.89 ]] && [[ $IAR < 1.1 ]]; then
				if [[ $IAR = 1.00 ]]; then
					mv -v --backup=t $NEWFILE $FNAME'__ar-insta-square'$FEXT
				else
					mv -v --backup=t $NEWFILE $FNAME'__ar-square'$FEXT
				fi
			elif [[ $IAR > 1.09 ]]; then
				mv -v --backup=t $NEWFILE $FNAME'__ar-landscape'$FEXT
			fi
			;;
		*mp4)
			echo "video file"
			case $NEWFILE in
				*ROTATEME*)
					# rotate video file
					echo "rotating video"
					ffmpeg -i $NEWFILE -vf "transpose=1" -c:v libx264 -crf 18 -an "${NEWFILE//ROTATEME/rotated_vert-vid}" && mv -v --backup=t "$NEWFILE" "${NEWFILE//ROTATEME/DELETEME}"
					;;
				*ROTATELEFT*)
					# rotate video file
					echo "rotating video"
					ffmpeg -i $NEWFILE -vf "transpose=2" -c:v libx264 -crf 18 -an "${NEWFILE//ROTATELEFT/rotated_vert-vid}" && mv -v --backup=t "$NEWFILE" "${NEWFILE//ROTATELEFT/DELETEME}"
					;;
				*SHRINKME*)
					# downscale video to 720p
					echo "downscaling video"
					# NOTE: check if video is vertical or horizontal before shrinking!
					mv $NEWFILE "1080p_$NEWFILE"
					;;
				*CROPMEWIDE*)
					# wide crop command
					echo "cropping wide"
					WID=$(mediainfo --Output="Video;%Width%" "$NEWFILE")
					HIG=$(mediainfo --Output="Video;%Height%" "$NEWFILE")

					# CROPWIDTH = $HEIGHT * (3/4)
					CROPWID=$(echo "$HIG*3/4" | bc -l)
					CROPWID=${CROPWID%.*}

					# CROPXPOS = ($WIDTH - $CROPWIDTH) / 2
					CROPXPOS=$(echo "(($WID - $CROPWID)/2)" | bc -l)
					CROPXPOS=${CROPXPOS%.*}

					# echo "crop=$CROPWID:$HIG:$CROPXPOS:0"

					ffmpeg -i "$NEWFILE" -filter:v "crop=$CROPWID:$HIG:$CROPXPOS:0" -an "${NEWFILE//CROPMEWIDE/cropped_vert-vid}" && mv -v --backup=t "$NEWFILE" "${NEWFILE//CROPMEWIDE/DELETEME}"
					;;
				*CROPMETALL*)
					# tall crop command
					echo "cropping tall"
					WID=$(mediainfo --Output="Video;%Width%" "$NEWFILE")
					HIG=$(mediainfo --Output="Video;%Height%" "$NEWFILE")

					# CROPWIDTH = $HEIGHT * (3/4)
					CROPWID=$(echo "$HIG/2" | bc -l)
					CROPWID=${CROPWID%.*}

					# CROPXPOS = ($WIDTH - $CROPWIDTH) / 2
					CROPXPOS=$(echo "($WID - $CROPWID)/2" | bc -l)
					CROPXPOS=${CROPXPOS%.*}

					# echo "crop=$CROPWID:$HIG:$CROPXPOS:0"
					ffmpeg -i "$NEWFILE" -filter:v "crop=$CROPWID:$HIG:$CROPXPOS:0" -an "${NEWFILE//CROPMETALL/cropped_vert-vid}" && mv -v --backup=t "$NEWFILE" "${NEWFILE//CROPMETALL/DELETEME}"
					;;
				*PROCME*)
					ffmpeg -i "$NEWFILE" -an "QUIET_$NEWFILE" && mv -v --backup=t "$NEWFILE" "DELETEME_$NEWFILE"
					;;
			esac
	esac
done

vid-shrink.sh
