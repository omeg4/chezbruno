#!/bin/zsh
#

# For each sub dir in AUTOLINK, search for files ending in 001.--H

AUTOROOT="$HOME/datadrop/autolink"
cd $AUTOROOT

# TODO: MAKE SURE ALL FILES ARE IN BASE CHAR DIR! NO COSTUME SUBDIRS TO START! DONE
for COSDIR in $(find . -type d -iregex "./[A-Z]+/[0-9][0-9]" -not -empty | sort); do
	cd "$AUTOROOT/$COSDIR"
	mv * ..
done

cd $AUTOROOT
find . -type f -iregex ".*001.--H" | sort > $AUTOROOT/modlist.txt

# cat $HOME/modlist.txt

while read FILENAME; do
	FPATH=$(dirname $FILENAME)
	FNAME=$(basename $FILENAME)

	# Cut filename extension to get 'modname'
	MODNAME=${FNAME:0:-8}
	# echo "finding files for "$MODNAME" in dir "$FPATH

	# Determine how many variants for each mod
	NVARS=$(find "$FPATH" -type f -iregex ".*$MODNAME.*--H" | wc -l)
	echo "there are $NVARS variants of $MODNAME"
	# find "$FPATH" -type f -iregex ".*$MODNAME.*" | sort
	# copy general files (.TMC, .TMCL, --P, ---C) into folders 01-0{$NVARS}
	# move specific variant files (.--H, .--HL) into folders
	for i in {1..$NVARS}; do
		DIRN="0$i"
		DIRN=${DIRN: -2}
		echo "moving variants of $MODNAME into $DIRN"
		find "$FPATH" -type f -iregex ".*$MODNAME.*" -not -iregex ".*.--HL?" -exec cp -t $FPATH/$DIRN {} +
		find "$FPATH" -type f -iregex ".*$MODNAME.*$DIRN.--HL?" -exec mv -t $FPATH/$DIRN {} +
		# sleep 0.5
	done
	# sleep 1
done < modlist.txt
