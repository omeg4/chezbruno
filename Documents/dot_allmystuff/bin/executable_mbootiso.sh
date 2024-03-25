#!/bin/zsh
#

read -e -p "Enter the path to the ISO:" ISOPATH
read -e -p "Enter the USB device path (i.e. /dev/sdXY):" USBDEV

echo "Running `sudo dd` to create a bootable USB drive from the specified ISO file."
echo "PLEASE double check that the following information is correct"
echo "ISO File: $ISOPATH"
echo "Location of USB Drive: $USBDEV"
read -e -p "LAST CHANCE: Confirm execution of `dd` command? (y/n):" CONF

case $CONF in
	*"n"*)
		echo "Script aborted by user, quitting."
		exit
		;;
	*"y"*)
		echo "Okay bud, let's do it"
		sudo dd status=progress if=$ISOPATH of=$USBDEV conv=fdatasync
		;;
	*)
		echo "Unrecognized confirmation response, quitting."
		exit
		;;
esac
