#!/bin/zsh
#
# -d=[svrm] -s=[12] -[vha] -f=[(notch)(gate)(fl){etc}]

trap printout SIGINT
printout() {
	echo "stopping auto montage"
	break
}

ARARG=""
DEPTHARG=""
FILTARG=""
TIMER=10

for ARG in "$@"; do
	case $ARG in
		-d=*)
			DIR=${ARG#*=}
			case $DIR in
				s)
					PDIR='/mnt/sgext/allpics/scmd'
					DEPTHARG='-maxdepth 1'
					;;
				v)
					PDIR='/mnt/sgext/allpics/vgcaps/'
					;;
				p)
					PDIR='/mnt/sgext/allpics/'
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
					WIDTH=2560
					HEIGHT=1440
					;;
				2)
					WIDTH=1920
					HEIGHT=1080
					;;
			esac
			echo "Screen resolution set to $WIDTH x $HEIGHT"
			;;
		-f=*)
			FILTER=${ARG#*=}
			echo "Filtering for files containing $FILTER"
			FILTARG=${FILTER//,/.*"'" -o -iregex "'".*}
			FILTARG=${FILTARG//+/.*"'" -iregex "'".*}
			FILTARG="\( -iregex '.*$FILTARG.*' \)"
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

PICY=$(($HEIGHT / $NYPIC - 5))
PICX=$(($WIDTH / $NXPIC))

NPICS=$(($NXPIC * $NYPIC))

cd $PDIR

echo "NPICS = $NPICS"

echo "================================================================================"
echo "Executing the following command:"
echo "feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest1.png "'$('"find $PDIR -maxdepth 1 -type f "$FILTARG" $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS"')'
echo "================================================================================"
echo "generating montage 1"
feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest1.png $(find . -maxdepth 1 -type f "$FILTARG" "$ARARG" -exec lsd --classic {} + | sort -R | head -n $NPICS)
echo "================================================================================"
echo "generating montage 2"
feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest2.png $(find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS)
echo "================================================================================"
echo "generating montage 3"
feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest3.png $(find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS)
echo "================================================================================"
echo "opening feh slideshow and beginning background loop"

feh -F -D 15 -j ../montages mntgtest*.png

while true; do
	echo "mntg 1"
	feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest1.png $(find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS)
	sleep 15
	echo "mntg 2"
	feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest2.png $(find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS)
	sleep 15
	echo "mntg 3"
	feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY --stretch -O mntgtest3.png $(find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS)
	sleep 15
	echo "loop completed"
done

# FINDCMD="find $PDIR -type f \( $FILTARG \) $ARARG -exec feh -F -z -m -W $WIDTH -H $HEIGHT -y $PICX -E $PICY -j ../montages/ --stretch {} +"
# FINDCMD="find $PDIR -maxdepth 1 -type f $FILTARG $ARARG -exec lsd --classic {} + | sort -R | head -n $NPICS"
# echo "$FINDCMD"
# eval "$FINDCMD"

# feh -F -D 15 mntg*.png

# while true; do
#     eval "$FINDCMD"
#     sleep 15
#     eval "$FINDCMD2"
#     sleep 15
#     eval "$FINDCMD3"
#     sleep 15
# done


