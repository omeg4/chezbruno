#!/bin/zsh
#

NOTCH=""

for ARG in "$@"; do
	case $ARG in
		-n=*)
			NVIDS=${ARG#*=}
			;;
		-N)
			NOTCH="-iname \"*notch*\""
			;;
		-r=*)
			RANK=${ARG#*=}
			RANK=${RANK//d/(god)}
			RANKARG="-iname \"*[$RANK]tier*\""
			;;
		-h)
			ARARG="-iname \"*land*\""
			;;
		-v)
			ARARG="-iname \"*vert*\""
			;;
	esac
done

# 1: aspect ratio
# 2: tier
# 3: notch?
findcmd () {
	# find /mnt/sgext/allpics/scmd -maxdepth 1 -type f $1 $2 $3 -exec mpv --profile=pron {} + > /dev/null 2>&1 &
	# find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iname "*vert*" -iname "*[s(god)]tier*" -exec mpv --profile=pron {} + > /dev/null 2>&1 &
	find /mnt/sgext/allpics/scmd -maxdepth 1 -type f $ARARG $RANKARG $NOTCH -exec mpv --profile=pron {} + > /dev/null 2>&1 &
}

FVCMD='find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iname "*vert*" '$NOTCH' '$RANKARG' -exec mpv --profile=pron {} + > /dev/null 2>&1 &'
FLCMD='find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iname \"*land*\" $NOTCH $RANKARG -exec mpv --profile=pron {} + > /dev/null 2>&1 &'

# echo $ARARG $RANKARG $NOTCH
# echo $(findcmd $ARARG $RANKARG $NOTCH)
alias findcmd
for i in {1..$NVIDS}; do
	findcmd
done
