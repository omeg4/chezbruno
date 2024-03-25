#!/bin/zsh
#

sudo mount -t cifs -o username=Matt,workgroup=WORKGROUP,password=flcutters28,dir_mode=0777,file_mode=0777,uid=1000,gid=1001 //BRUNDOWS/AutoLink $HOME/autolink
sudo mount -t cifs -o username=Matt,workgroup=WORKGROUP,password=flcutters28,dir_mode=0777,file_mode=0777,uid=1000,gid=1001 //BRUNDOWS/winc $HOME/winc
sudo mount -t cifs -o username=Matt,workgroup=WORKGROUP,password=flcutters28,dir_mode=0777,file_mode=0777,uid=1000,gid=1001 //BRUNDOWS/jumboSHRIMP $HOME/jumboSHRIMP
