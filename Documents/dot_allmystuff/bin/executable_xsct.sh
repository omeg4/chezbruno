#!/bin/zsh
#

for num in {1..4}; do
	for ar in 'vert' 'land'; do
		find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iname "*$ar*" \( -iname "*godtier*" -o -iname "*stier*" \) -exec mpv --profile=pron {} + > /dev/null 2>&1 &
		sleep 0.5
	done
done
