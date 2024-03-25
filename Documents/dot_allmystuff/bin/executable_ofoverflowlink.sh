#!/bin/bash
#

OFVV="/home/bruno/ofverflow/OnlyFans/Images"
OFDV="/mnt/sgext/OnlyFans/.sites/OnlyFans/Images"

for vidfile in $(find . -type f); do

	viddir=$(dirname $vidfile)
	vidreldir=${viddir##*.}
	vidname=$(basename $vidfile)

	ovrdir="$OFVV$vidreldir"
	linkdest="$ovrdir/$vidname"

	# echo $ovrdir
	# echo $vidfile
	# echo $linkdest
	# echo '==='
	mkdir -p $ovrdir
	ln -s $vidfile $linkdest
done

