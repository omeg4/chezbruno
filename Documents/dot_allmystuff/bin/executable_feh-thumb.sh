#! /bin/bash
#

for ARG in "$@"; do
	case $ARG in
		-nf=*)
			INF=${ARG#*=}
			;;
		-ty=*)
			ITY=${ARG#*=}
			;;
		-tx=*)
			ITX=${ARG#*=}
			;;
		-wx=*)
			IWX=${ARG#*=}
			;;
		-xs=*)
			IXS=${ARG#*=}
			;;
		-or=*)
			IOR=${ARG#*=}
			;;
	esac
done

ANF=${INF:-100}
ATY=${ITY:-420}
ATX=${ITX:-420}
AWX=${IWX:-1280}
AXS=${IXS:-godtier}
AOR=${IOR:-vert}

feh --thumbnail -Z -. -x -E "$ATY" -y "$ATX" -W "$AWX" --index-info '' `find . -maxdepth 1 -type f -iregex ".*$AXS.*" -iregex ".*$AOR.*" \( -iregex ".*jpe?g.*" -o -iregex ".*png.*" \) | sort -R | head -"$ANF" | sed -e :a -e '$!N; s/\n/ /; ta'`
