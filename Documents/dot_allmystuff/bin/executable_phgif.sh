#!/bin/bash

WEBM_URL=$(python $HOME/.config/qutebrowser/userscripts/phgif.py $QUTE_URL)

FURL='https://dl.phncdn.com/pics/gifs/'$WEBM_URL

GURL='https://cl.phncdn.com/pics/gifs/'$WEBM_URL

youtube-dl -f 'best' -o '/mnt/sgext/stuff/phgifs/%(uploader)s__%(title)s.%(ext)s' --no-progress --restrict-filenames --no-mtime $FURL || youtube-dl -f 'best' -o '/mnt/sgext/stuff/phgifs/%(uploader)s__%(title)s.%(ext)s' --no-progress --restrict-filenames --no-mtime $GURL
