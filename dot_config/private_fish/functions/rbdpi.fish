function rbd
  set -l rbdpi $argv[1]
  argparse --min-args=1 --name=rbdpi -- $argv
  or return

  set device (ratbagctl list | awk -F: '{ print $1 }' )
  echo "$device: DPI -> $rbdpi"
  ratbagctl "$device" dpi set "$rbdpi"
end
