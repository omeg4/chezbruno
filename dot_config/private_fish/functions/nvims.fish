function nvims
  # No one else seems to do this but it *feels* like we should prepend "default" to this list of options idk?
  set items default (find $HOME/.config -type d -iname "nvim-*" -printf "%f\n")
  set config (printf "%s\n" $items | fzf --prompt="Neovim Config: " --height=~50% --layout=reverse --border --exit-0)
  if [ -z $config ]
    echo "Nothing selected"
    return 0
  else if [ $config = "default" ]
    set config ""
  end
  env NVIM_APPNAME=$config nvim $argv
end
