#!/bin/bash
#

INP="fdsa"
JNP="tfia"
FLG=true
FLH=false

for ARG in "$@"; do
	case $ARG in
		-i=*)
			INP=${ARG#*=}
			;;
		-j=*)
			JNP=${ARG#*=}
			;;
		-x)
			FLG=false
			;;
		-y)
			FLH=true
	esac
done

$FLG &&
	echo "variable X was true" &&
	XCODE=true ||
		XCODE=false &&
		echo "variable X was false" &&
		$FLH &&
		echo "variable Y was true"

echo "\$XCODE is $XCODE"
