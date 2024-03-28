if status is-interactive
  # Commands to run in interactive sessions can go here

  # 12/29/23 Update $PATH from ~/.zshrc
  fish_add_path -U "$HOME/.local/share/applications" "$HOME/Documents/.allmystuff/bin" "$HOME/perl5/bin" "$HOME/.luarocks/bin" "$HOME/.local/share/bob/nvim-bin" "$HOME/.pyenv"

  # `pj` plugin config - define project directories
  set -U PROJECT_PATHS "HOME/poedev" "HOME/poedev/DashOfExile/" "HOME/Documents/.allmystuff/bin/" "HOME/.config/awesome" "HOME/.config/fish" "HOME/.config/nvim" "HOME/.config/wezterm/"

  # Trick to expand abbreviations w/o trailing space
  bind " " expand-abbr or self-insert

  source "$HOME/.config/fish/abbr.fish"
  source "$HOME/.config/fish/.secrets.fish"

end

# https://devhints.io/fish-shell

# Replaced starship with tide, i.e. `fisher install IlanCosman/tide@v6`
# starship init fish | source

zoxide init fish | source

source "$HOME/.asdf/asdf.fish"
