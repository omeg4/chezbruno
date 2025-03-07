#!/bin/zsh
#
# -d=[svrm] -s=[12] -[vha] -f=[(notch)(gate)(fl){etc}]

trap printout SIGINT
printout() {
	echo "stopping auto montage"
	break
}

ARARG=""
TIMER=10

for ARG in "$@"; do
	case $ARG in
		-d=*)
			DIR=${ARG#*=}
			case $DIR in
				s)
					PDIR='/mnt/sgext/allpics/scmd/'
					;;
				v)
					PDIR='/mnt/sgext/allpics/vgcaps/'
					;;
				r)
					PDIR='/mnt/sgext/allpics/rdt/'
					;;
				m)
					PDIR='/mnt/sgext/allpics/mdls/'
					;;
			esac
			echo "Directory set to $PDIR"
			;;
		-s=*)
			SCRN=${ARG#*=}
			case $SCRN in
        1)
          WIDTH=3840
          HEIGHT=1600
          ;;
				2)
					WIDTH=2560
					HEIGHT=1440
					;;
				3)
					WIDTH=1920
					HEIGHT=1080
					;;
			esac
			echo "Screen resolution set to $WIDTH x $HEIGHT"
			;;
		-f=*)
			FILTER=${ARG#*=}
			echo "Filtering for files containing $FILTER"
			;;
		-v)
			NXPIC=6
			NYPIC=2
			ARARG="-iregex '.*ar-vert.*'"
			echo "Filtering files with aspect ratio $ARARG; Montage will be a $NXPIC x $NYPIC grid"
			;;
		-h)
			NXPIC=4
			NYPIC=3
			ARARG="-iregex '.*ar-land.*'"
			echo "Filtering files with aspect ratio $ARARG; Montage will be a $NXPIC x $NYPIC grid"
			;;
		-a)
			NXPIC=5
			NYPIC=2
			ARARG=""
			echo "Filtering files with aspect ratio $ARARG; Montage will be a $NXPIC x $NYPIC grid"
			;;
		-t=*)
			TIMER=${ARG#*=}
			;;
	esac
done

FILTARG=${FILTER//,/.*"'" -o -iregex "'".*}
FILTARG=${FILTARG//+/.*"'" -iregex "'".*}
FILTARG='-iregex ".*$FILTARG.*"'

PICY=$(($HEIGHT / $NYPIC - 5))
PICX=$(($WIDTH / $NXPIC))

FINDCMD_OLD="find $PDIR -type f \( $FILTARG \) $ARARG -exec feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY -j ../montages/ --stretch {} +"
FINDCMD="feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY -j ../montages/ --stretch $(find $PDIR -type f \( $FILTARG \) $ARARG)"

cd $PDIR

echo "$FINDCMD"

while true; do
	eval "$FINDCMD" & ; sleep $TIMER
	# sleep $TIMER
	killall feh
done


