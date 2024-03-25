#!/bin/bash

function run {
  if ! pgrep -ai $1 ;
  then
    $@&
  fi
}
# run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
# run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
# run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# run xrandr \
# 	--output DP-2 --mode 2560x1440 --pos 1920x0 --rate 143.96 --primary \
# 	--output DP-0 --mode 1920x1080 --pos 0x360 --rate 60.00
#autorandr horizontal

# run nm-applet
#run caffeine
# run pamac-tray
# run xfce4-power-manager
# run blueberry-tray
# run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# run numlockx on
# run volumeicon
#run nitrogen --restore
# run conky -c $HOME/.config/awesome/system-overview

#you can set wallpapers in themes as well
# run variety
# feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop

##########################################################
# my run statements
run echo "awesome autostart.sh" > /home/bruno/awm_boottest.sh
run source $HOME/.profile
run picom --conf $HOME/.config/awesome/picom.conf
run solaar -w hide
run bitwarden-desktop
run blueman-applet
run surfshark
run discord

#fix stupid apple keyb default
#sudo modprobe -rv hid_apple && sudo modprobe -v hid_apple fnmode=2
