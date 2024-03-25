#!/bin/zsh
#

LIST="$1"

# ${ARRAY} to insert contents of array, space delimited
# ${ARRAY[n]} to print nth element of array

while IFS= read	-r LINE; do
	LINEARR=($(echo $LINE))

	SIZEA=$(ls -al ${LINEARR[1]} | awk '{ print $5 }')
	SIZEB=$(ls -al ${LINEARR[2]} | awk '{ print $5 }')
	echo "$SIZEA vs. $SIZEB"

	if [[ $SIZEA -eq $SIZEB ]]; then
		echo "files are identical"
	elif [[ $SIZEA -gt $SIZEB ]]; then
		echo "A bigger than B"
		mpv ${LINEARR[1]} ${LINEARR[2]} >/dev/null 2>&1
	elif [[ $SIZEA -lt $SIZEB ]]; then
		echo "B bigger than A"
		mpv ${LINEARR[2]} ${LINEARR[1]} >/dev/null 2>&1
	else
		echo "files are different"
		mpv ${LINEARR} >/dev/null 2>&1
	fi
done < $LIST
