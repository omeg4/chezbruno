function rbps -d "Switch mouse profiles for Logitech G502 with ratbagctl"
  set -l rbpn $argv[1]
  argparse --min-args=1 --name=rbps -- $argv
  or return

  set device (ratbagctl list | awk -F: '{ print $1 }')

  echo "$device -> Profile $rbpn"

  ratbagctl "$device" profile active set "$rbpn"
end
